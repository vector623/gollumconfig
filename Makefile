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

install: config.rb gollum.conf.nginx gollum.service
	mkdir -p /var/www/gollum/
	sudo cp config.rb /var/www/gollum/
	sudo cp gollum.conf.nginx /etc/nginx/conf.d/gollum.conf
	sudo cp gollum.service /etc/systemd/system/

clean:
	blackbox_shred_all_files
