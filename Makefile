all:
	pip install -r requirements-devel.txt
	pyflakes vagrant
	pep8 -r vagrant

TESTS=${:libcloudvagrant}

check: all

lint: all
	pylint vagrant

clean:
	-git clean -dfx

dist: clean
	python setup.py sdist

distcheck: dist
	sh distcheck.sh

PYPI=${:https://testpypi.python.org/pypi}

upload: dist
	python setup.py sdist upload -r $(PYPI)
