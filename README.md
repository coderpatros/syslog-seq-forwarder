# Syslog Seq Forwarder

A simple service which accepts syslog messages and sends them to a Seq server.

## But Seq can already accept syslog messages directly!

That is correct, I have seen [https://github.com/datalust/squiflog](https://github.com/datalust/squiflog).

The issue with using that is sending unencrypted syslog messages over untrusted networks.

This forwarder is designed to be run locally alongside whatever service supports syslog logging. This way the events can be sent to Seq over https.

## Configuration

You need to set two environment variables, `SEQ_SERVER` and `SEQ_API_KEY`.

`SEQ_SERVER` should include the scheme and ports (if using non-standard ports).

For example...  
`https://seq.example.com`  
`http://localhost:8080`