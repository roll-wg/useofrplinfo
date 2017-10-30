VERSION=18
roll-useofrplinfo-${VERSION}.txt: roll-useofrplinfo.txt
	cp roll-useofrplinfo.txt roll-useofrplinfo-${VERSION}.txt

%.txt: %.xml
	unset DISPLAY; XML_LIBRARY=$(XML_LIBRARY):./src xml2rfc $? $@

%.html: %.xml
	unset DISPLAY; XML_LIBRARY=$(XML_LIBRARY):./src xml2rfc --html -o $@ $?

submit: roll-useofrplinfo.xml
	curl -S -F "user=mcr+ietf@sandelman.ca" -F "xml=@~/roll-useofrplinfo.xml" https://datatracker.ietf.org/api/submit

