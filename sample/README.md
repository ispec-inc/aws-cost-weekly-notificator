# Sample

With cfn

```bash
$ aws cloudformation deploy \
  --template cfn.yaml \
  --stack-name aws-cost-notif-stack \
  --capabilities CAPABILITY_NAMED_IAM
  --parameters \
    ParameterKey=SlackWebhookUrl,ParameterValue=$SLACK_WEBHOOK_URL \
    ParameterKey=SlackChannel,ParameterValue="#some-notif-channel" \
    ParameterKey=SlackUsername,ParameterValue="AWSコストお知らせくん" \
    ParameterKey=SlackIconEmoji,ParameterValue=":money_with_wings:"
```
