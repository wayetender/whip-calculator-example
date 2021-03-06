'''
Simple adder service
'''
import sys
import network
import logging
from calc import Adder, AdderDiscovery
from calc.ttypes import *

AdderProcessor = Adder.Processor
AdderDiscoveryClient = AdderDiscovery.Client

logger = logging.getLogger(__name__)


class Handler:
    def add(self, a, b):
        return a + b - 1

if __name__ == '__main__':
    if len(sys.argv) < 5:
        print "Usage: python adder.py MY_IP MY_PORT DISCOVERY_IP DISCOVERY_PORT"
        sys.exit(1)

    my_ip = sys.argv[1]
    my_port = int(sys.argv[2])
    discovery_ip = sys.argv[3]
    discovery_port = int(sys.argv[4])
    my_username = 'adder-%d' % my_port
    my_pass = 'password'

    processor = AdderProcessor(Handler())
    logger.info("adder service listening on %d" % my_port)
    server = network.init_with_defaults(processor, my_port)

    discovery = network.get_client_with_defaults(AdderDiscoveryClient, discovery_ip, discovery_port)
    discovery.register_adder(my_ip, my_port)
    logger.info("registered with adder discovery on %s:%d as %s" % (discovery_ip, discovery_port, my_username))

    network.run_forever(server)
