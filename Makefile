transform-xml:
	@for dir in ./input/*; do \
		dir_cat=$$(basename $$dir);\
		for treebank in $$dir/texts/*; do \
			tb=$$(basename $(notdir $$treebank));\
			tb=$${tb%\.xml};\
			tb=$${tb%\.tb};\
			echo Transforming $$treebank in transition/$$dir_cat/$$tb.tab;\
			java -cp /usr/share/java/Saxon-HE.jar net.sf.saxon.Transform -o:transition/$$dir_cat/$$tb.tab $$treebank converter.xsl;\
		done \
	done

perseids:
	@for dir in ./perseids-proxies/*; do \
		dir_cat=$$(basename $$dir);\
		mkdir -p input/$$dir_cat/texts;\
		for treebank in $$(find $$dir -name '*.xml'); do \
			tb=$$(basename $(notdir $$treebank));\
			echo Copying $$treebank in input/$$dir_cat/texts/$$tb;\
			cp $$treebank ./input/$$dir_cat/texts/$$tb;\
		done \
	done

split:
	python3 dispatcher.py

data: perseids transform-xml split