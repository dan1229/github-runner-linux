# Github Runner Linux
Repo for config and files associated with my self hosted Linux GitHub Runners.

## How To Run
[Tutorial](https://testdriven.io/blog/github-actions-docker/)

The runners are currently split into two types - organization runners and repo runners.


### Organization
To run:

```
cd organization
docker build . --tag runner-image
docker run --detach --env ORGANIZATION=<ORGANIZATION> --env ACCESS_TOKEN=<ACCESS_TOKEN> --name github-runner runner-image
```

Where:
- `<ORGANIZATION>` is the organization you want to use this runner with
- `<ACCESS_TOKEN>` is an access token with appropriate permissions you created

### Repository
To run:

```
cd repository
docker build . --tag runner-image --build-arg REPO_NAME=<REPO_NAME>
docker run --detach -v /var/run/docker.sock:/var/run/docker.sock --env GIT_USER=<GIT_USER> --env REPO_NAME=<REPO_NAME> --env REG_TOKEN=$REG_TOKEN --name <CONTAINER_NAME> runner-image
```

Where:
- `<REPO_NAME>` is the repository name we want to use this runner for. This MUST match between the two commands above
- `<GIT_USER>` is the git user you are using
- `<REG_TOKEN>` is the token given in the repo settings when you visit the page to set up a new self hosted runner