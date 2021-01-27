#!/usr/bin/env bash
#Unstruction from here are used: https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html#cliv2-linux-install

mkdir tmp
#Download the latest package
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o tmp/awscliv2.zip
unzip tmp/awscliv2.zip -d tmp/
sudo tmp/aws/install -i /usr/local/aws-cli -b /usr/local/bin
rm -rf tmp
