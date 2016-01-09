Bash Cloudflare DNS Updater
===

Requirements: 
- `curl`
- `dig`
- `jq` ([instructions](https://stedolan.github.io/jq/download/))

Installation:
=====
```bash
cd  ~
mkdir .cloudflare
cd .cloudflare
git clone https://github.com/Recon/cloudflare-dns-updater.git .
cp .conf.example .conf
dos2unix ./*
chmod u+x *.sh

# now you have to update the CFKEY (Cloudflare API Key), CFUSER (Cloudflare user/email), CFHOST (host) from .conf

./get-zones.sh
# You should receive some data in the following format:
# {
#   "name": "example1.com",
#   "id": "d41d8cd98f00b204e9800998ecf8427e"
# }
# {
#   "name": "example2.com",
#   "id": "d41d8cd98f00b204e9800998ecf8427e"
# }
#
# Now, update the ZONEID from .conf with appropriate id shown above

./get-records.sh
# You should receive some data in the following format:
# {
#   "name": "example.com",
#   "id": "d41d8cd98f00b204e9800998ecf8427e",
#   "zone_id": "d41d8cd98f00b204e9800998ecf8427e",
#   "zone_name": "example.com",
#   "content": "127.0.0.1",
#   "type": "A"
# }
#
# Now, update the DNSRECID from .conf with appropriate id shown above

# Call the updater script
./update-records.sh
```