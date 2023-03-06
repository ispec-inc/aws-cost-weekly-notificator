# aws-cost-notifier-lambda-layer

## Lambda Environment

| name              | description          | required | default    |
|-------------------|----------------------|----------|------------|
| SLACK_WEBHOOK_URL | Slack WebhookUrl     | true     |            |
| SLACK_CHANNEL     | Target Slack Channel | true     |            |
| SLACK_USERNAME    | bot name             | false    | "aws cost" |
| SLACK_ICON_EMOJI  | bot's icon emoji     | false    | ":ghost:"  |


## Development

```
$ zip -r layer.zip nodejs
$ aws lambda publish-layer-version \
  --layer-name aws-cost-notifier \
  --description "aws cost notifier" \
  --zip-file fileb://layer.zip \
  --compatible-runtimes nodejs
```
