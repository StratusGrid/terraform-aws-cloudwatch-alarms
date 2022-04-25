#!/usr/bin/python3.7
import os, sys
import logging
import urllib3 
import json

def config_logging():
    """This function will configure the logging system
    of the whole function
    """
    
    # Initial configuration of logging system
    logging.basicConfig(
        format="%(asctime)s [%(levelname)s] %(message)s",
        level=logging.INFO,
        stream=sys.stdout
    )

def send_message(http, url, msg):
    """Event Handler to send messages to different webhooks
    """

    # Init logging system
    config_logging()

    # We encode the message with UTF-8
    encoded_msg = json.dumps(msg).encode('utf-8')
    resp = http.request('POST',url, body=encoded_msg)

    logging.debug({
        "message": msg, 
        "status_code": resp.status, 
        "response": resp.data
        })

def lambda_handler(event, context):
    """Event Handler to configure the webhgook endpoints
    """

    http = urllib3.PoolManager() 

    # Init logging system
    config_logging()

    # Get values from INTEGRATION_SERVICE and WEBHOOK_ID
    INTEGRATION = os.environ.get('INTEGRATION_SERVICE')
    WEBHOOK_ID = os.environ.get('WEBHOOK_ID')

    # Validate if INTEGRATION has been declared or not
    if (INTEGRATION is None) or (INTEGRATION not in ["SLACK", "TEAMS", "CHIME"]):
        logging.error("No valid Integration defined. Aborting...")
        exit(1)

    # Validate if WEBHOOK_ID has been declared or not
    if WEBHOOK_ID is None:
        logging.error("No webhook ID defined. Aborting...")
        exit(1)

    # Integration with AWS Chime via Webhooks
    if INTEGRATION == "CHIME":
        logging.info("Start sending messages to AWS Chime")
        url = "https://hooks.chime.aws/incomingwebhooks/" + str(WEBHOOK_ID)
        msg = {
        "Content": event['Records'][0]['Sns']['Message']
        }

        # Encoding the message and sending it to Slack
        send_message(http=http, url=url, msg=msg)

    # Integration with Slack via Webhooks
    elif INTEGRATION == "SLACK":
        logging.info("Start sending messages to Slack")

        url = "https://hooks.slack.com/services/" + str(WEBHOOK_ID)
        msg = {
            "text": event['Records'][0]['Sns']['Message'],
            "icon_emoji": ""
        }
    
        # Encoding the message and sending it to Slack
        send_message(http=http, url=url, msg=msg)

    # Integration with Microsoft Teams via Webhooks
    elif INTEGRATION == "TEAMS":
        url = "https://outlook.office.com/webhook/" + str(WEBHOOK_ID)
        msg = {
        "text": event['Records'][0]['Sns']['Message']
        }
        
        # Encoding the message and sending it to Slack
        send_message(http=http, url=url, msg=msg)
