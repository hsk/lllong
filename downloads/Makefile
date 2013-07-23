ZIP=lllong-0.1.4.zip

all: scala type7.jar
	zip $(ZIP) type7.jar lib/* sample/* lllc lllc.bat
	rm -rf test
	mkdir test
	cd test;pwd;unzip ../$(ZIP)
	cd test/sample;sh mk.sh;./program
	# rm -rf test
type7.jar:
	cp -rf ../lib .
	cp -rf ../sample .
	cp -rf ../bin/type7 type7 
	jar cmf manifest.mf type7.jar type7 scala

scala:
	jar xvf /opt/local/share/scala-2.10/lib/scala-library.jar  
clean:
	rm -rf META-INF l0 l1 mqo type7.jar type7 sample lib scala test library.properties
