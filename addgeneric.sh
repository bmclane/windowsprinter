#!/bin/bash
# Bryce McLane

while getopts n:ip: option
do
case "${option}"
in
n) PRINTER=${OPTARG};;
ip) IPADDRESS=${OPTARG};;
esac
done

echo "Printer: " +  $PRINTER
echo "IP address " + $IP
