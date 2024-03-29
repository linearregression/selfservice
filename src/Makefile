DESTDIR=/

I18N_LANGUAGES = de
I18N_SRC := $(CURDIR)/linotpselfservice/i18n
I18N_JSON_DEST := $(CURDIR)/linotpselfservice/public/i18n
I18N_PO_FILES := $(foreach lang,$(I18N_LANGUAGES),$(I18N_SRC)/$(lang)/LC_MESSAGES/linotpselfservice.po)
I18N_JSON_FILES := $(foreach lang,$(I18N_LANGUAGES),$(I18N_JSON_DEST)/$(lang).json)


all:
	@echo "make create - Create the source packages"
	@echo "make install - Install on local system"
	@echo "make clean - Get rid of scratch and byte files"
	@echo "make translate"

extract:
	python setup.py extract_messages
	$(foreach lang, \
		$(I18N_LANGUAGES), \
		msgmerge -U $(I18N_SRC)/$(lang)/LC_MESSAGES/linotpselfservice.po $(I18N_SRC)/linotpselfservice.pot \
		;\
	)

$(I18N_SRC)/%/LC_MESSAGES/linotpselfservice.po: extract

translate:
	@echo "Execute translate-LANG (e.g. translate-de)"

translate-%: $(I18N_SRC)/%/LC_MESSAGES/linotpselfservice.po
	gtranslator $<
	make compile_catalog

# Compile a .po file to a .json file using the `pojson` tool.
$(I18N_JSON_DEST)/%.json: $(I18N_SRC)/%/LC_MESSAGES/linotpselfservice.po
	mkdir -p $(I18N_JSON_DEST)
	pojson -e utf-8 $< > $@

# Compile all .po files to .mo files using babel. As a dependency,
# the .po files are compiled to .json files. The order doesn't matter.
compile_catalog: $(I18N_JSON_FILES)
	python setup.py compile_catalog

buildtranslation: extract
	make compile_catalog

create:
	mkdir -p ../build
	make buildtranslation
	python setup.py sdist
	cp dist/*.tar* ../build/

install:
	python setup.py install --root $(DESTDIR)

clean:
	python setup.py clean
	rm -rf ../build/
	rm -rf dist/
	find . -name '*.pyc' -delete
	rm -f $(I18N_JSON_FILES)
	rm -rf LinOTPSelfservice.egg-info/
	rm -f linotpselfservice/i18n/de/LC_MESSAGES/linotpselfservice.mo
	rm -f linotpselfservice/i18n/linotpselfservice.pot
