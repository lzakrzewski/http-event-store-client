EVENT_STORE_IMAGE          = event-store
EVENT_STORE_CONTAINER_PORT = 2113
EVENT_STORE_EXPOSED_PORT   = 2113

setup-event-store: \
	tear-down-event-store \
	run-event-store

tear-down-event-store:
	-@docker rm -f $(EVENT_STORE_IMAGE) > /dev/null

run-event-store:
	@docker run --name $(EVENT_STORE_IMAGE) -d -p $(EVENT_STORE_EXPOSED_PORT):$(EVENT_STORE_CONTAINER_PORT) adbrowne/eventstore

event-store:
	@docker exec -it $(EVENT_STORE_IMAGE) /bin/bash