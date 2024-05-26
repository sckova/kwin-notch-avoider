PKGFILE = notch.kwinscript

build: package
	(cd package && zip -r $(PKGFILE) ./*)
	(cd package && mv $(PKGFILE) ../)

install: build
	kpackagetool6 -t KWin/Script -s notch \
		&& kpackagetool6 -u $(PKGFILE) \
		|| kpackagetool6 -i $(PKGFILE)

uninstall:
	kpackagetool6 -t KWin/Script -r notch

clean:
	rm -f $(PKGFILE)
