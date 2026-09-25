install:
	@bash install.sh

run:
	@bash recon.sh $(target)

clean:
	@rm -rf results/

help:
	@echo "Usage:"
	@echo "  make install"
	@echo "  make run target=example.com"
