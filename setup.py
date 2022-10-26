import setuptools
from setuptools.command.develop import develop
from setuptools.command.install import install
from subprocess import check_call
from pathlib import Path
import os


class MyInstall(install):
    """Post-installation for installation mode."""
    def run(self):
        path = os.getcwd().replace(" ", "\ ").replace("(","\(").replace(")","\)")
        code_base_path = "/opt/bpctl"
        os.system("sudo cp -r " + path + " "+code_base_path)
        os.system("""sudo sh -c 'echo "#!/bin/bash" > /usr/bin/bpctl'""")
        suffix = '\$@'
        os.system(f"""sudo sh -c 'echo "python3 {code_base_path}/lib/bpctl/bpctl.py {suffix}" >> /usr/bin/bpctl'""")
        os.system("sudo chmod +x /usr/bin/bpctl")
        install.run(self)




with open('requirements.txt') as f:
    required = f.read().splitlines()


setuptools.setup(
    name="bpctl",
    version="1.0",
    author="Amit Kumar Tiwari",
    author_email="amit.tiwari@opstree.com",
    description="It is private package of bpctl",
    url="https://gitlab.com/ot-okts/base/bpctl",
    packages=setuptools.find_packages(),
    include_package_data=True,
    classifiers=[
        "Programming Language :: Python :: 3.6",
        "Operating System :: OS Independent",
    ],
    scripts=['script/install.sh'],
    cmdclass={
        'install': MyInstall,
    },
    python_requires='>=3.6',
    install_requires=required
)
