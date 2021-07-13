import logging
import logging.handlers
import time
import os

LOG_DATE_FORMAT = "%Y-%m-%d %H:%M:%S"


def init_logging(level=logging.INFO):
    """ Initialize logging to stdio """
    logger = logging.getLogger("SimpleReplayLogger")
    logger.setLevel(logging.DEBUG)
    logging.Formatter.converter = time.gmtime
    ch = logging.StreamHandler()
    ch.setLevel(level)
    ch.setFormatter(get_log_formatter())
    logger.addHandler(ch)
    return logger


def set_log_level(level):
    """ Change the log level for the default (stdio) logger. Logfile always logs DEBUG. """
    logger = logging.getLogger("SimpleReplayLogger")
    for handler in logger.handlers:
        if type(handler) == logging.StreamHandler:
            handler.setLevel(level)


def add_logfile(filename, dir="simplereplay_logs", level=logging.DEBUG, backup_count=2, preamble=''):
    """ Additionally log to a logfile """
    os.makedirs(dir, exist_ok=True)
    filename = f"{dir}/{filename}"
    file_exists = os.path.isfile(filename)
    fh = logging.handlers.RotatingFileHandler(filename, backupCount=backup_count)

    # if the file exists from a previous run, rotate it 
    if file_exists:
        fh.doRollover()

    # dump the preamble to the file first
    if preamble:
        with open(filename, "w") as fp:
            fp.write(preamble.rstrip() + '\n\n' + '-' * 40 + "\n")

    fh.setLevel(level)
    fh.setFormatter(get_log_formatter())
    logger = logging.getLogger("SimpleReplayLogger")
    logger.info(f"Logging to {filename}")
    logger.addHandler(fh)
    logger.debug("== Initializing logfile ==")


def get_log_formatter(process_idx=None, job_id=None):
    """ Define the log format, with the option to prepend process and job/thread to each message """
    format = "[%(levelname)s] %(asctime)s"
    if process_idx is not None:
        format += f" [{process_idx}]"
    if job_id is not None:
        format += " (%(threadName)s)"
    format += " %(message)s"
    formatter = logging.Formatter(format, datefmt=LOG_DATE_FORMAT)
    formatter.converter = time.gmtime
    return formatter


def prepend_ids_to_logs(process_idx=None, job_id=None):
    """ Update logging to prepend process_id and / or job_id to all emitted logs """
    logger = logging.getLogger("SimpleReplayLogger")
    for handler in logger.handlers:
        handler.setFormatter(get_log_formatter(process_idx, job_id))


def log_version():
    """ Read the VERSION file and log it """
    logger = logging.getLogger("SimpleReplayLogger")
    try:
        with open("VERSION", "r") as fp:
            logger.info(f"Version {fp.read().strip()}")
    except:
        logger.warning(f"Version unknown")
