echo -e "\e[1;33m[+]Finding IP's through ASN block's\e[0m"
asnip -t $1 -p 
cat ipfinder.txt cidrs.txt >> ~/recon/$1/$(date +"%d-%m-%Y")/tmp-ip.txt

echo -e "\e[1;33m[+]Finding IP's through DNS Buffer's\e[0m"
curl -s https://dns.bufferover.run/dns?q=$1 | grep $1 | grep -Eo '[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}' | sort -u >> ~/recon/$1/$(date +"%d-%m-%Y")/tmp-ip.txt

echo -e "\e[1;33m[+]Cleaning IP list 's\e[0m"
sort -u ~/recon/$1/$(date +"%d-%m-%Y")/tmp-ip.txt >> ~/recon/$1/$(date +"%d-%m-%Y")/cidr.txt
