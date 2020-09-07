# make folder in home directory:
cd ~/
mkdir .localhost-ssl

# create self-signed key:
sudo openssl genrsa -out ~/.localhost-ssl/localhost.key 2048

# create certificate (contains public key): (x509 = multi purpose certificate utility)
sudo openssl req -new -x509 -key ~/.localhost-ssl/localhost.key -out ~/.localhost-ssl/localhost.crt -days 3650 -subj /CN=localhost

# add certificate file to Keychain app:
sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain ~/.localhost-ssl/localhost.crt

# globally install http-server (later will start an httpS server):
npm install -g http-server || yarn add global http-server

# create bash CLI command "https-server" in .bash_profile:
# (it'll run the HTTPS server; --ssl or -s option makes it httpS instead of just http)
echo " 
function https-server() {
  http-server --ssl --cert ~/.localhost-ssl/localhost.crt --key ~/.localhost-ssl/localhost.key
}
" >> ~/.bash_profile
source ~/.bash_profile

echo ""
echo "You're ready to use https on localhost"
echo "Navigate to a project directory and run:"
echo ""
echo "https-server"

# References:
# https://medium.com/@jonsamp/how-to-set-up-https-on-localhost-for-macos-b597bcf935ee
# https://gist.github.com/jonsamp/587b78b7698be7c7fd570164a586e6b7
