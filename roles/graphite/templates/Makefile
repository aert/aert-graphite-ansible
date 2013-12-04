CONF={{ app_home}}/graphite.conf.py
VENV={{ app_home}}/env

all: upgrade start

upgrade:
	. $(VENV)/bin/activate; graphite --config=$(CONF) upgrade --noinput
	. $(VENV)/bin/activate; graphite --config=$(CONF) loaddata initial_data_admin.json

start:
	. $(VENV)/bin/activate; graphite --config=$(CONF) start
