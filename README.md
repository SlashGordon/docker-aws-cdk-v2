[![Release](https://github.com/SlashGordon/docker-aws-cdk-v2/actions/workflows/release.yaml/badge.svg)](https://github.com/SlashGordon/docker-aws-cdk-v2/actions/workflows/release.yaml)

# Docker AWS CDK
Containerised AWS CDK v2 to ensure consistent local development and simple CD pipelines.

## Usage
Run as a command using `cdk` as entrypoint:

    docker run --rm --entrypoint cdk slashgordon/aws-cdk-v2 --version

Run as a shell and mount `.aws` folder and current directory as volumes:

    docker run --rm -it -v ~/.aws:/root/.aws -v $(pwd):/opt/app slashgordon/aws-cdk-v2 bash

Using docker-compose:

    cdk:
        image: slashgordon/aws-cdk-v2
        env_file: .env
        entrypoint: aws
        working_dir: /opt/app
        volumes:
        - ~/.aws:/root/.aws
        - .:/opt/app:rw

And run `docker-compose run cdk --version`

## Language Support

CDK Supports different languages to define your (re)usable assets.

## Credits

Strongly inspired by[contino/docker-aws-cdk](https://github.com/contino/docker-aws-cdk) project.
