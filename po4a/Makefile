PO4A_VERSION := .po4a-version

# About prerequisite record-po4a-version:
#   po4a version might be upgraded in the future,
#   so file task .po4a-version cannot be used here.
#   Command task record-po4a-version always run,
#   so current user's po4a version is tracked.
all: record-po4a-version
	po4a po4a.cfg
.PHONY: all

$(PO4A_VERSION): record-po4a-version

# Record po4a version, since its parser has improved in a way that PO files are affected.
record-po4a-version:
	po4a --version > $(PO4A_VERSION)
.PHONY: record-po4a-version

#
# Initialization purpose only
#

# First-time POT file initialization
po/goaccess.pot:
	touch $@

# First-time PO file initialization
po/ja.po: po/goaccess.pot
	msginit -i $< -o $@ --no-translator
