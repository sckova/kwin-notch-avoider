PKGFILE = notch.kwinscript

build: package
	(cd package && zip -r $(PKGFILE) ./*)
	(cd package && mv $(PKGFILE) ../)

install: build
	kpackagetool6 -t KWin/Script -s notch \
		&& kpackagetool6 -t KWin/Script -u $(PKGFILE) \
		|| kpackagetool6 -t KWin/Script -i $(PKGFILE)

uninstall:
	kpackagetool6 -t KWin/Script -r notch

clean:
	rm -f $(PKGFILE)
