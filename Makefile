GOPATH:=$(PWD):${GOPATH}
export GOPATH
export GO_EXTLINK_ENABLED=0
export CGO_ENABLED=0

all: build

build:
	go clean; rm -rf pkg; go build --ldflags '-extldflags "-static"'

build_all: build_osx build_linux build

build_osx:
	go clean; rm -rf pkg hey_osx; GOOS=darwin go build --ldflags '-extldflags "-static"'
	mv hey hey_osx

build_linux:
	go clean; rm -rf pkg hey_linux; GOOS=linux go build --ldflags '-extldflags "-static"'
	mv hey hey_linux

install:
	go install

clean:
	go clean; rm -rf pkg

test : test1

test1:
	cd test; go test
