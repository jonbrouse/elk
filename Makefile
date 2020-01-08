.PHONY: build clean elastic kibana logstash

VERSION ?= "7.3.1"

.DEFAULT: help

help:
	@echo "Make Help"
	@echo ""
	@echo "make build 	runs \"docker-compose build\""
	@echo "make elastic 	runs \"docker-compose build elasticsearch\""
	@echo "make kibana 	runs \"docker-compose build kibana\""
	@echo "make logstash 	runs \"docker-compose build logstash\""

build:
	@VERSION=$(VERSION) docker-compose build

elastic:
	@VERSION=$(VERSION) docker-compose build elasticsearch

kibana:
	@VERSION=$(VERSION) docker-compose build elasticsearch

logstash:
	@VERSION=$(VERSION) docker-compose build elasticsearch

up:
	@VERSION=$(VERSION) docker-compose up -d
