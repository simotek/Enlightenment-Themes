EDJE_CC := edje_cc
INSTALL := install
PKG_CONFIG := pkg-config

SRCDIR := ./edje
BUILDDIR := ./edje
E_DESTDIR := $(shell $(PKG_CONFIG) --variable=prefix enlightenment)/share/enlightenment/data/themes
E_HOMEDIR := ~/.e/e/themes
ELM_DESTDIR := $(shell $(PKG_CONFIG) --variable=prefix elementary)/share/elementary/themes
ELM_HOMEDIR := ~/.elementary/themes

EDCS   := $(wildcard $(SRCDIR)/edc/*.edc)
IMAGES := $(wildcard $(SRCDIR)/img/*.png)

.PHONY: all clean install install-system install-home

all: $(BUILDDIR)/dark.edj

clean:
	rm -f $(BUILDDIR)/dark.edj


$(BUILDDIR)/dark.edj: $(EDCS) $(IMAGES) Makefile
	$(EDJE_CC) -id $(SRCDIR)/img/ \
                -sd $(SRCDIR)/snd/ \
		-fd $(SRCDIR)/fnt/ \
		$(SRCDIR)/dark.edc \
		$(BUILDDIR)/dark.edj

install:
	@echo "Choose install-system or install-home"

install-system: $(BUILDDIR)/dark.edj
	$(INSTALL) -D  -C -m 0644 -o root -g root \
		$(BUILDDIR)/dark.edj \
		$(E_DESTDIR)/dark.edj
	$(INSTALL) -D  -C -m 0644 -o root -g root \
		$(BUILDDIR)/dark.edj \
		$(ELM_DESTDIR)/dark.edj

install-home: $(BUILDDIR)/dark.edj
	$(INSTALL) -D  -C -m 0644 \
		$(BUILDDIR)/dark.edj \
		$(E_HOMEDIR)/dark.edj
	$(INSTALL) -D  -C -m 0644 \
		$(BUILDDIR)/dark.edj \
		$(ELM_HOMEDIR)/dark.edj
