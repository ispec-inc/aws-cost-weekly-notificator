# aws-cost-notifier-lambda-layer

# Apply

You should create slack IncomingWebhook
- [Slack IncomingWebhook](https://ispec.slack.com/apps/A0F7XDUAZ--incoming-webhook-?tab=more_info)

```bash
$ AWS_PROFILE="<your profile name>" \ 
ACCOUNT_NAME="<your awesome project>" \
SLACK_WEBHOOK_URL="https://hooks.slack.com/services/xxxx/yyyyyy/zzzzzzzz" \
SLACK_CHANNEL="#some-notif-channel" \
curl -s https://raw.githubusercontent.com/ispec-inc/aws-cost-weekly-notifier/master/install.sh | bash -
```

## Development

### Lambda Environment

| name              | description          | required | default    |
|-------------------|----------------------|----------|------------|
| ACCOUNT_NAME      | AWS Account Name     | true     |            |
| SLACK_WEBHOOK_URL | Slack WebhookUrl     | true     |            |
| SLACK_CHANNEL     | Target Slack Channel | true     |            |
| SLACK_USERNAME    | Bot name             | false    | "aws cost" |
| SLACK_ICON_EMOJI  | Bot's icon emoji     | false    | ":ghost:"  |

### Upload layer
```
$ zip -r layer.zip nodejs
$ aws lambda publish-layer-version \
  --layer-name aws-cost-notifier \
  --description "aws cost notifier" \
  --zip-file fileb://layer.zip \
  --compatible-runtimes nodejs
```
