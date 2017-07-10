import bpy, os, sys

# some script launching blender would run this first.
import addon_utils
addon_utils.enable("bpy_externall")
# addon_utils.enable("bpy_externall-master")  # if you installed from zip

# start listening
bpy.ops.wm.bpy_externall_server(speed=1, mode="start")
