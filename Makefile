all: run

clean:
	rm -f out/Main.jar out/TheAlgorithm.jar

out/Main.jar: out/parcs.jar src/Main.java src/Result.java
	@javac -cp out/parcs.jar src/Main.java src/Result.java
	@jar cf out/Main.jar -C src Main.class -C src Result.class
	@rm -f src/Main.class src/Result.class

out/TheAlgorithm.jar: out/parcs.jar src/TheAlgorithm.java src/Result.java
	@javac -cp out/parcs.jar src/TheAlgorithm.java src/Result.java
	@jar cf out/TheAlgorithm.jar -C src TheAlgorithm.class -C src Result.class
	@rm -f src/TheAlgorithm.class src/Result.class

build: out/Main.jar out/TheAlgorithm.jar

run: out/Main.jar out/TheAlgorithm.jar
	@cd out && java -cp 'parcs.jar:Main.jar' Main