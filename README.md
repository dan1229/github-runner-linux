# Github Runner Linux
Repo for config and files associated with my self hosted Linux GitHub Runners.

## How To Run
TODO
[Tutorial](https://testdriven.io/blog/github-actions-docker/)

To run:
`docker build --tag runner-image`

`docker run --detach --env ORGANIZATION=<YOUR-GITHUB-ORGANIZATION> --env ACCESS_TOKEN=<YOUR-GITHUB-ACCESS-TOKEN> --name runner runner-image`
