
#*********************************************************
# Makefile for pySpline Library
# G. Kenway Feb 7, 2010
#*********************************************************

default: 
	@echo "Please select one of the following configurations"
	@echo "make intel       -> for linux pcs with intel compiler"
	@echo "make gfortran    -> for linux pcs with gfortran compiler"
	@echo "make scinet      -> for uoft scinet gpc cluster"
	@echo "make basalt      -> for sgi altix machine at utias"

intel:
	@echo "Linux - Intel"
	-rm common.mk
	cp ./config/config.LINUX_INTEL.mk ./common.mk
	( cd src && make) || exit 1; 

gfortran:
	@echo "Linux - Gfortran"
	-rm common.mk
	cp ./config/config.LINUX_GFORTRAN.mk ./common.mk
	( cd src && $(MAKE)) || exit 1; 
	-rm common.mk

g95:
	@echo "Linux - G95"
	-rm common.mk
	cp ./config/config.LINUX_G95.mk ./common.mk
	( cd src && $(MAKE)) || exit 1; 
	-rm common.mk
scinet:
	@echo "Scinet"
	-rm common.mk
	cp ./config/config.SCINET.mk ./common.mk
	( cd src && $(MAKE)) || exit 1; 
	-rm common.mk

basalt:
	@echo "Basalt"
	-rm common.mk
	cp ./config/config.BASALT.mk common.mk
	( cd src && $(MAKE)) || exit 1; 
	-rm common.mk


clean:
	-rm common.mk
	cp ./config/config.LINUX_INTEL.mk common.mk # Doesn't matter which 
	(cd src && $(MAKE) $@) || exit 1;
	-rm common.mk
# Note we have to copy a dummy config file to common.mk so it doesn't complain
# about the file not existing
