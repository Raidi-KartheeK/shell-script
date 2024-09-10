#!/bin/bash

lss -ltr
if[$? -ne 0]; then 
echo "exit command is failure"
exit 1]
Fi

ls -ltr
if[$? -ne 0]; then 
echo "exit command is failure"
exit 1]
Fi
echo "program is sucess"