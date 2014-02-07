PKG_NAME       = isd-django-oauth2-provider
PKG_VERSION    = $(shell python setup.py --version | sed s/-dev$//)
PKG_SUMMARY    = 'Provide OAuth2 access to your app'
PKG_DOCURI     = 'https://github.isg.apple.com/isd/packages/tree/master/isd-django-oauth2-provider'
PKG_MAINTAINER = 'ISG Delivery Foundations - <isgdf@group.apple.com>'
PKG_ARCH       = noarch
DIST_REPO      = isd
DIST_BRANCH    = test

ISD_REPOSITORY ?= git@github.isg.apple.com:isd/isd-django-oauth2-provider.git
ISD_REMOTE     ?= local
INSTALL_LIB_PREFIX = $(ROOT_PREFIX)/skycell/mvc

include /usr/local/isd/share/isd-build-cfg/cfg.mk

build:: compile

compile::
	$(ISD_PYTHON) setup.py build_py; \
	$(ISD_PYTHON) setup.py install --install-lib=$(INSTALL_LIB_PREFIX) --root=$(PKG_DIR)
	rm -rf $(PKG_DIR)/$(INSTALL_LIB_PREFIX)/*.egg-info

	# We will be providing our own urls.py
	rm -rf $(PKG_DIR)/$(INSTALL_LIB_PREFIX)/provider/urls.py*
