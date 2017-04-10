SYSTEM = nefariusmag
APP = jenkins
VERSION = 2.1
PORTS = 8000
USER = root

.PHONY: build run start exec stop rm

build:
	docker build -t $(SYSTEM)/$(APP):$(VERSION) .

run:
	docker run --rm --name $(APP)-$(VERSION) -it -p $(PORTS):8080 $(SYSTEM)/$(APP):$(VERSION)

start:
	docker run -d --name $(APP)-$(VERSION) -p $(PORTS):8080 $(SYSTEM)/$(APP):$(VERSION)

exec:
	docker exec --user $(USER) -it $(APP)-$(VERSION) /bin/bash

stop:
	docker stop $(APP)-$(VERSION)

rm:
	docker rm $(APP)-$(VERSION)

default: build
