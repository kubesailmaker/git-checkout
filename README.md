# git-checkout
checks out git projects into chosen folder


### checkout instructions
```
docker run -v token:/tmp/secrets/token \
-e GIT_PROJECTS="kubernetes/test-infra,/tmp/gm,master kubernetes/website,/tmp/website" \
-e GIT_PROTOCOL="https" \
-e GIT_BASE="github.com" \
-e GIT_USER="$(whoami)" \
-e GIT_TOKEN_FILE="/tmp/secrets/token" \
--entrypoint '/opt/app/git-checkout.sh' \
-it kubesailmaker/git-checkout:0.5

```
