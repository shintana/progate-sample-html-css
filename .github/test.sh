#!/bin/sh
set -eu

if test -z "$SLACK_BOT_TOKEN"; then
  echo "Set the SLACK_BOT_TOKEN secret."
  exit 1
fi
# data='{"channel":"C02LV4R4X4Z","blocks":[{"type":"section","text":{"type":"mrkdwn","text":"${{ github.event.pull_request.title }} <@${{ steps.get-contributor-slack.outputs.contributorID }}>"}},{"type":"section","fields":[{"type":"mrkdwn","text":"*Reviewer*"},{"type":"mrkdwn","text":"<@${{ steps.get-reviewer-slack.outputs.reviewerID }}>"},{"type":"mrkdwn","text":"*Status*"},{"type":"mrkdwn","text":"`Need Approval`"}]},{"type":"section","text":{"type":"mrkdwn","text":"<${{ github.event.pull_request.html_url }} | View Pull Request>"}}]}'
data='{"channel":"C02LV4R4X4Z","blocks":[{"type":"section","text":{"type":"mrkdwn","text":"'$PR_TITLE' <@'$CONTRIBUTOR_ID'>"}},{"type":"section","fields":[{"type":"mrkdwn","text":"*Reviewer*"},{"type":"mrkdwn","text":"<@'$REVIEWER_ID'>"},{"type":"mrkdwn","text":"*Status*"},{"type":"mrkdwn","text":"`Need Approval`"}]},{"type":"section","text":{"type":"mrkdwn","text":"<'$PR_LINK' | View Pull Request>"}}]}'

curl -X POST \
     -H "Content-type: application/json" \
     -H "Authorization: Bearer $SLACK_BOT_TOKEN" \
     -d "$data" \
     https://slack.com/api/chat.postMessage
