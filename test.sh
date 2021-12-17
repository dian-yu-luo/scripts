#!/bin/bash

read isCheck
if [ $isCheck = y ] || [ $isCheck = Y ]; then
    echo $isCheck
fi
