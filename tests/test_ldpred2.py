# encoding: utf-8

"""
Test module for ``ldpred2`` docker image
"""

import os
import subprocess
import socket


if socket.gethostname() == 'comorment':
    docker = 'sudo docker'
else:
    docker = 'docker'

def test_R():
    call = f'{docker} run ldpred2 R --version'
    out = subprocess.run(call.split(' '))
    assert out.returncode == 0


def test_Rscript():
    call = f'{docker} run ldpred2 Rscript --version'
    out = subprocess.run(call.split(' '))
    assert out.returncode == 0


def test_R_packages():
    pwd = os.getcwd()
    call = f'{docker} run -i --mount type=bind,source={os.getcwd()},target=/home ldpred2 Rscript /home/tests/import_libraries.R'
    out = subprocess.run(call.split(' '), capture_output=True)
    assert out.returncode == 0


def test_plink():
    call = f'{docker} run ldpred2 plink --version'
    out = subprocess.run(call.split(' '))
    assert out.returncode == 0