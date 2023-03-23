# encoding: utf-8

"""
Test module for ``ldpred2`` docker image
"""

import os
import subprocess


def test_R():
    call = 'docker run ldpred2 R --version'
    out = subprocess.run(call.split(' '))
    assert out.returncode == 0


def test_Rscript():
    call = 'docker run ldpred2 Rscript --version'
    out = subprocess.run(call.split(' '))
    assert out.returncode == 0


def test_R_packages():
    pwd = os.getcwd()
    call = f'docker run -i -t --mount type=bind,source=$PWD,target=/home ldpred2 Rscript /home/tests/import_libraries.R'
    out = subprocess.run(call.split(' '))
    assert out.returncode == 0


def test_plink():
    call = 'docker run ldpred2 plink --version'
    out = subprocess.run(call.split(' '))
    assert out.returncode == 0