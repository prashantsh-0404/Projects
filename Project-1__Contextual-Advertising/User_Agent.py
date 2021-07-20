#!/usr/bin/python
 
  import sys
  import re
 
  for line in sys.stdin:
    user_agent, ad, clicked = line.strip().split('\t')
    components = re.split('[;/,\(\) ]', user_agent)
    for component in components:
      if len(component) != 0:
         print '\t'.join([component, ad, clicked])
