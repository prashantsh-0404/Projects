const gremlin = require('gremlin');
const DriverRemoteConnection = gremlin.driver.DriverRemoteConnection;
const Graph = gremlin.structure.Graph;

exports.handler = (event, context, callback) => {
    dc = new DriverRemoteConnection('wss://np-vpc2-test-instance-1.ch8cuxkb0m2v.us-west-2.neptune.amazonaws.com:8182/gremlin',{});

    const graph = new Graph();
    const g = graph.traversal().withRemote(dc);

    g.V().limit(1).count().next().
        then(data => {
            console.log(data);
            dc.close();
            context.succeed(results);
        }).catch(error => {
            console.log('ERROR', error);
            dc.close();
            context.fail('Traversal failed: ' + err);
        });
}

