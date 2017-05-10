'''
Simple adder discovery service
'''
import sys
import network
import logging
import random
from calc import AdderDiscovery
from calc.ttypes import *

AdderDiscoveryProcessor = AdderDiscovery.Processor

logger = logging.getLogger(__name__)


class Handler:
    def __init__(self):
        self.users = {}
        self.adders = []

    def register_adder(self, host, port):
        logger.debug("registering adder service %s:%d" % (host, port))
        self.adders.append(Hostinfo(host, port))

    def get_adder_info(self):
        return random.choice(self.adders)

if __name__ == '__main__':
    processor = AdderDiscoveryProcessor(Handler())
    port = int(sys.argv[1]) if len(sys.argv) > 1 else 38000
    logger.info("adder discovery service listening on %d" % port)
    network.init_with_defaults_and_run_forever(processor, port)
