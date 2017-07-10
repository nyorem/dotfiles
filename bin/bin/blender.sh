#! /usr/bin/env bash

pkill blender

optirun blender -P $HOME/bin/blender-bootstrap-listening.py

