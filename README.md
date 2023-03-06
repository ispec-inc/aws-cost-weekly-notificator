# aws-cost-notifier-lambda-layer

## 環境変数

| name              | description             | required | default    |
|-------------------|-------------------------|----------|------------|
| SLACK_WEBHOOK_URL | slackのwebhookのURL     | true     |            |
| SLACK_CHANNEL     | 投稿するslackチャンネル | true     |            |
| SLACK_USERNAME    | botの名前               | false    | "aws cost" |
| SLACK_ICON_EMOJI  | botのicon emoji         | false    | ":ghost:"  |


## Development

```
$ zip -r layer.zip nodejs
$ aws lambda publish-layer-version \
  --layer-name aws-cost-notifier \
  --description "aws cost notifier" \
  --zip-file fileb://layer.zip \
  --compatible-runtimes nodejs
```
