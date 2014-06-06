if [ ! $(grep single-request-reopen /etc/sysconfig/network) ]; then
  echo RES_OPTIONS=single-request-reopen >> /etc/sysconfig/network && service network restart;
fi
echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf > /dev/null
yum update -y
