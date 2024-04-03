#!/bin/bash

set -x #to see debug how script executes

vault server -dev -dev-listen-address='0.0.0.0:8200' &> /home/ec2-user/log_vault_start.txt & 
#to get all vault server logs 



#export VAULT_ADDR='http://127.0.0.1:8200' # based on what is there in server start log
# Vault CLI determines which Vault servers to send requests using the VAULT_ADDR environment variable.


#vault status &> status_log.txt 
# Verify the Server is Running
