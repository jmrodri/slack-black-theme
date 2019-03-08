RPM_INSTALLED := $(shell rpm -q slack > /dev/null && echo "1")
FLATPAK_INSTALLED := $(shell flatpak list | grep -q slack && echo "1")

install:
ifeq ($(RPM_INSTALLED), 1)
	@sudo cp ssb-interop.js /usr/lib/slack/resources/app.asar.unpacked/src/static/ssb-interop.js
endif
ifeq ($(FLATPAK_INSTALLED), 1)
	@sudo cp ssb-interop.js /var/lib/flatpak/app/com.slack.Slack/x86_64/stable/active/files/extra/lib/slack/resources/app.asar.unpacked/src/static/ssb-interop.js
endif
