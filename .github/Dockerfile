FROM curlimages/curl:7.68.0

LABEL "com.github.actions.name"="Post Slack messages"
LABEL "com.github.actions.description"="Post Slack messages from your own bot"
LABEL "com.github.actions.icon"="hash"
LABEL "com.github.actions.color"="gray-dark"

LABEL version="1.0.5"
LABEL repository="http://github.com/shintana/progate-sample-html-css/"
LABEL homepage="http://github.com/shintana/progate-sample-html-css/"

ADD entrypoint.sh ./.github/entrypoint.sh
ENTRYPOINT ["./.github/entrypoint.sh"]
