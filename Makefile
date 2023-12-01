.SILENT:

build:
	echo "Building GORO"
	go build -o bin/goro main.go

testapp: build 

	echo "Deleting old testapp files"
	rm -rf ./example/testapp/internal/
	rm -rf ./example/testapp/config/
	rm -rf ./example/testapp/cmd/
	rm -rf ./example/testapp/pkg/
	rm ./example/testapp/main.go
	rm ./example/testapp/go.mod
	rm ./example/testapp/go.sum

	echo "Create new testapp"
	echo "./example/testapp/\n" | ./bin/goro init --config ./example/testapp/goro.yaml
