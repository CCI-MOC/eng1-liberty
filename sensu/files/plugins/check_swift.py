#!/usr/bin/env python

# Dependencies of this program
#       python module: python-swiftclient, cryptography, jsonpointer, functools32
import sys
import argparse
import logging
import json
import keystoneclient.v2_0.client as ksclient
import swiftclient as sfclient

STATE_OK = 0
STATE_WARNING = 1
STATE_CRITICAL = 2
STATE_UNKNOWN = 3

logging.basicConfig(level=logging.INFO)

parser = argparse.ArgumentParser(description='Check OpenStack Glance status')
parser.add_argument('--auth-url', metavar='URL', type=str,
                    required=True,
                    help='Keystone URL')
parser.add_argument('--username', metavar='username', type=str,
                    required=True,
                    help='username for authentication')
parser.add_argument('--password', metavar='password', type=str,
                    required=True,
                    help='password for authentication')
parser.add_argument('--tenant', metavar='tenant', type=str,
                    required=True,
                    help='tenant name for authentication')

args = parser.parse_args()

try:
    keystone = ksclient.Client(username=args.username,
                      tenant_name=args.tenant,
                      password=args.password,
                      auth_url=args.auth_url,
                      region_name=args.region_name,
                      endpoint_type="internalURL")

    print "Connected keystone!"

    swift_conn = sfclient.client.Connection(authurl=args.auth_url,
                                            user=args.username,
                                            key=args.password,
                                            tenant_name=args.tenant,
                                            auth_version='2.0')

    swif_capabilities = swift_conn.get_capabilities()

    print swif_capabilities
    

except Exception as e:
    print str(e)
    exit(STATE_CRITICAL)
exit_state = STATE_OK

exit(exit_state)

