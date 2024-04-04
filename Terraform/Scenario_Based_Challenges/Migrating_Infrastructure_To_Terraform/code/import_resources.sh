#!/bin/bash

# Define resource IDs
INSTANCE_SYDNEY="i-0e86aeed9e9cb8a00"
INSTANCE_SINGAPORE="i-0446e1e85da0e33d4"
SECURITY_GROUP_SSH_SYDNEY="sg-0404d6c98b8fa07c9"
SECURITY_GROUP_SSH_SINGAPORE="sg-0c737fddaf68c4cd4"

# Import resources
terraform import aws_instance.ec2-sydney $INSTANCE_SYDNEY
terraform import aws_instance.ec2-singapore $INSTANCE_SINGAPORE
terraform import aws_security_group.ssh-sydney $SECURITY_GROUP_SSH_SYDNEY
terraform import aws_security_group.ssh-singapore $SECURITY_GROUP_SSH_SINGAPORE

