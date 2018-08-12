#!make

SHELL := /bin/bash -c

requirements:
	sudo apt-get update
	sudo apt-get install ruby ruby-dev make zlib1g-dev libicu-dev build-essential git
	sudo gem install gollum
	sudo gem install omnigollum
	sudo gem install github-markup

config.rb:
	blackbox_decrypt_all_files

/etc/letsencrypt/live/gollum.xounges.net/fullchain.pem:

/etc/letsencrypt/live/gollum.xounges.net/privkey.pem:

/home/davidg/gits/seminarynotes:
	#setup bare repo here and clone existing seminarynotes repo into it

install: /etc/letsencrypt/live/gollum.xounges.net/fullchain.pem /etc/letsencrypt/live/gollum.xounges.net/privkey.pem /home/davidg/gits/seminarynotes config.rb gollum.conf.nginx gollum.service
	-sudo systemctl stop gollum
	sudo mkdir -p /var/www/gollum/
	sudo cp config.rb /var/www/gollum/
	sudo cp gollum.conf.nginx /etc/nginx/conf.d/gollum.conf
	sudo cp gollum.service /etc/systemd/system/
	sudo systemctl daemon-reload
	sudo systemctl restart gollum
	sudo systemctl restart nginx

clean:
	blackbox_shred_all_files
