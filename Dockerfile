ARG ALPINE_VERSION=3.15

FROM alpine:${ALPINE_VERSION}

ARG AWS_CDK_VERSION
ENV CDK_VERSION ${AWS_CDK_VERSION}
RUN apk -v --no-cache --update add \
        nodejs \
        docker-cli \
        npm \
        python3 \
        py3-pip \
        ca-certificates \
        groff \
        less \
        bash \
        make \
        curl \
        wget \
        zip \
        git \
        && \
    update-ca-certificates && \
    npm install -g aws-cdk@${AWS_CDK_VERSION}

VOLUME [ "/root/.aws" ]
VOLUME [ "/opt/app" ]

# Allow for caching python modules
VOLUME ["/usr/lib/python3.8/site-packages/"]

WORKDIR /opt/app

RUN pip install --upgrade pip \
        aws-cdk-lib==${AWS_CDK_VERSION} \
        cdk-ecr-deployment==2.5.1 \
        "constructs>=10.0.0,<11.0.0"

CMD ["cdk", "--version"]
