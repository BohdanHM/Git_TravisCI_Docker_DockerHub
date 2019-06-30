IMAGE := bohdanhm/git_zabbix_docker
VERSION:= latest

test:
	true

image:
	docker build -t ${IMAGE}:${VERSION} .

push-image:
	docker push ${IMAGE}


.PHONY: image push-image test
