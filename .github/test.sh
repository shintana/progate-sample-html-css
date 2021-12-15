generate_post_data()
{
  cat <<EOF
{
	"channel":"C02LV4R4X4Z",
	"blocks": [
		{
			"type": "section",
			"text": {
				"type": "mrkdwn",
				"text": "${{ github.event.pull_request.title }} <@${{ steps.get-contributor-slack.outputs.contributorID }}"
			}
		},
		{
			"type": "section",
			"fields": [
				{
					"type": "plain_text",
					"text": "*Reviewer*"
				},
				{
					"type": "plain_text",
					"text": "<@${{ steps.get-reviewer-slack.outputs.reviewerID }}>"
				},
				{
					"type": "plain_text",
					"text": "*Status*"
				},
				{
					"type": "plain_text",
					"text": "`Need Approval`"
				}
			]
		},
		{
			"type": "section",
			"text": {
				"type": "mrkdwn",
				"text": "<${{ github.event.pull_request.html_url }} | View Pull Request>"
			}
		}
	]
}
EOF
}
curl -i -H "Content-type:application/json" -H "Authorization: Bearer $SLACK_BOT_TOKEN" -X POST --data "$(generate_post_data)" "https://slack.com/api/chat.postMessage"

