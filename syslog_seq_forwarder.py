#!/usr/bin/env python3
import json
import logging
import os
import socketserver
import seqlog


seq_server = os.environ['SEQ_SERVER']
seq_apikey = os.environ['SEQ_APIKEY']


class SyslogUDPHandler(socketserver.BaseRequestHandler):
    def handle(self):
        data = bytes.decode(self.request[0].strip())
        logging.info(data)


if __name__ == "__main__":
    seqlog.log_to_seq(
        server_url=seq_server,
        api_key=seq_apikey,
        level=logging.INFO,
        batch_size=10,
        auto_flush_timeout=10,
        override_root_logger=True)
    
    server = socketserver.ThreadingUDPServer(('127.0.0.1', 514), SyslogUDPHandler)
    server.serve_forever()
