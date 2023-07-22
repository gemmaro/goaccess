VERSION := .po4a-version
HTML	:= ja/goaccess.1.html
MAN	:= ja/goaccess.1
STYLE	:= https://cdn.jsdelivr.net/npm/water.css@2/out/water.css

# About prerequisite record-po4a-version:
#   po4a version might be upgraded in the future,
#   so file task .po4a-version cannot be used here.
#   Command task record-po4a-version always run,
#   so current user's po4a version is tracked.
all: $(MAN) $(HTML)
.PHONY: all

clean:
	rm -r $(MAN) $(HTML)
.PHONY: clean

serve:
	ruby -run -e httpd ja
.PHONY: serve

$(MAN): record-po4a-version
	po4a po4a.cfg

$(VERSION): record-po4a-version

# Record po4a version, since its parser has improved in a way that PO files are affected.
record-po4a-version:
	po4a --version > $(VERSION)
.PHONY: record-po4a-version

$(HTML): ja/goaccess.1
	mandoc -Thtml -O toc -O style='$(STYLE)' $< > $@
