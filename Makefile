.PHONY: build
build:
	docker run --rm -ti \
		-v "/$(PWD)":/app \
		-v /$(PWD)/.m2/:/root/.m2/ \
		lsf-java-ci \
		bash -c "mvn package"

DEPLOY_DIR:=$(HOME)/repo/gitee/lsf/source/gb28181-client/app

.PHONY: deploy
deploy:
	@echo "copy jar binary file"
	-rm -rf $(DEPLOY_DIR) && mkdir -p $(DEPLOY_DIR)
	cp -f target/gb28181-client-1.0-SNAPSHOT.jar $(DEPLOY_DIR)