#!/bin/bash -ex

APP_NAME="$1"
REMOTE_NAME="heroku-$APP_NAME"

heroku apps:create "$APP_NAME" --remote="$REMOTE_NAME"
git push $REMOTE_NAME master
heroku run -a "$APP_NAME" -r "$REMOTE_NAME" rake db:migrate
heroku ps:scale -a "$APP_NAME" -r "$REMOTE_NAME" web=1
