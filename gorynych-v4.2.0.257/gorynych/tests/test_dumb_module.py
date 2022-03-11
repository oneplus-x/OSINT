#!/usr/bin/python3

import pytest

import gorynych

from gorynych.modules.dumb_module import DumbModule

def test_dumb_module():
    dumb_module = DumbModule()
    dumb_module.run()