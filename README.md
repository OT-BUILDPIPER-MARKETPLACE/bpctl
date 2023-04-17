# bpctl Install
```
pip install bpctl
```
# bpctl custom installation
1 clone package
```
#!/bin/bash
python3 <bpctl-package-path>lib/bpctl/bpctl.py "$@"
```
2 Put this content into `/bin/bpctl`
3 `chmod +x /bin/bpctl`

************************Imp Note***************************
Whenever any change made in bpctl follow below steps to Add it in PyPI repository.

1 . Make new git branch from latest branch (So that we can track code of each version)     using below command
        git checkout -b <new_branch or version >

2. Update version key in setup.py file new coming verison

3 Run ,  python setup.py sdist bdist_wheel

4 Install twine(if you dont have)
    pip install twine
5. Upload it to pypi
    twine upload dist/*
note:- Step 5 will ask you for username and password for pypi account 

6.Done you are good to go to install bpclt with pip.

