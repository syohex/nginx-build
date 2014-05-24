

nginx-build: *.go
	@echo $$'\e[1;32m'"Building nginx-build..."$$'\e[m'
	gom build

build-example: nginx-build
	./nginx-build -c config/configure.example -m config/modules.cfg.example -d work -clear

bundle:
	@echo $$'\e[1;32m'"Building dependencies for nginx-build..."$$'\e[m'
	gom install

clean:
	rm -rf nginx-build
