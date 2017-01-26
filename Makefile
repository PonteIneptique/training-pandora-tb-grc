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

split:
	python3 dispatcher.py

data: transform-xml split