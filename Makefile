WAYLAND_PROTOCOLS=/usr/share/wayland-protocols

all: tinywl

tinywl: xdg-shell-protocol
	go build -o tinywl github.com/swaywm/go-wlroots/cmd/tinywl

xdg-shell-protocol:
	wayland-scanner private-code $(WAYLAND_PROTOCOLS)/stable/xdg-shell/xdg-shell.xml xdg-shell-protocol.c
	wayland-scanner server-header $(WAYLAND_PROTOCOLS)/stable/xdg-shell/xdg-shell.xml xdg-shell-protocol.h

clean:
	rm -rf xdg-shell-protocol.c xdg-shell-protocol.h

run: tinywl
	./tinywl
