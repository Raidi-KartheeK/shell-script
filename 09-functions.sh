#!/bin/bash

login(username, password){


	select * from user where user='username' and password='password'
	if ($? -eq 0 )
	then
		echo "login success"
	else
		echo "login failed"
	fi
}

