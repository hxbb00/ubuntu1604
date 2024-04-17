# Container image that runs your code
FROM ubuntu:16.04

# Copies your code file from your action repository to the filesystem path `/` of the container
RUN apt-get update -q -y \
            && apt-get install -q -y --no-install-recommends cmake make build-essential gdb git apt-utils curl unzip ca-certificates \
            && apt-get install -q -y --no-install-recommends ninja-build python3-dev wget sudo software-properties-common python-software-properties \
            && echo "Setup dotnet 8.0.x" \
            && wget https://dotnet.microsoft.com/download/dotnet/scripts/v1/dotnet-install.sh -O dotnet-install.sh \
            && sudo chmod +x ./dotnet-install.sh \
            && ./dotnet-install.sh --version 8.0.4 --install-dir /usr/share/dotnet \
            && ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet \
            && dotnet --version \
            && dotnet tool install --global nbgv

ENV PATH="/root/.dotnet/tools:${PATH}"
