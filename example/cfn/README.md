# With cfn

```bash
$ aws cloudformation deploy \
  --template cfn.yaml \
  --stack-name aws-cost-notif-stack \
  --capabilities CAPABILITY_NAMED_IAM \
  --parameter-overrides \
    SlackWebhookUrl=$SLACK_WEBHOOK_URL \
    SlackChannel="#some-channel" \
    SlackUsername="AWSコストお知らせくん" \
    SlackIconEmoji=":money_with_wings:"
```
