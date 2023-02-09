# ImNodes example for Dear ImGUI extension for Defold
This project is additional example for [Dear ImGUI](https://github.com/ocornut/imgui) in Defold [extension](https://github.com/britzl/extension-imgui) utilizing [ImNodes](https://github.com/Nelarius/imnodes) to show how to create Node/Flow Graphs.
Dear ImGUI is described as a "Bloat-free Graphical User interface for C++ with minimal dependencies". It is perfect for quickly creating a debug interface or for creation of in-game tools and settings.
ImNodes is described as "a small, dependency-free node editor extension for dear imgui."


ImNodes in Defold build:
![imnodes_in_defold](/example/bundle/images/imnodes_in_defold.png)


# Description for ImNodes example in Defold by Pawel Jarosz

## Purpose
Purpose of this project is to show how to use Dear ImGUI + ImNodes in Defold to create different Node/Flow based graphs.

## Overview
The project enhances Defold extension for Dear ImGUI with functions from ImNodes, hence both are joined here. Files for Imnodes are just added to imgui/src/imgui. Additional Lua bindings were added, but not fully covering Imnodes - all of them you can find in extension_imgui.cpp in section "Node Editor".

Example projects contains a folder with different Lua modules for making Imnodes handling easier - those could be find in imnodes catalog. The modules are used in example_imnodes.script.

Generally, this project is a little mess, but if you have power and knowledge to push it further, I would be glad.

## License
Do whatever you like, it's open-source, it's on MIT license, as well as Dear ImGUI extension, Dear ImGUI itself and ImNodes.

## Known Issues

- Saving/loading not completed, moreover loading causes a crash.
- Can't set any value persistently.
- Can't remove connected links.
- Generally needs a lot of refactor.


# Description for Dear ImGUI by Bjorn Ritzl

## Why no auto-generated bindings?
Projects such as [cimgui](https://github.com/cimgui/cimgui) offers Dear ImGUI bindings for a number of different languages, including Lua. It could be used  to generate the bindings for this extension, BUT I'm doing this as a way to learn more about the Dear ImGUI API and as such it makes more sense for me to write the bindings by hand.


## IMPORTANT
* The project currently only has bindings for a small subset of the Dear ImGUI API.
  * More bindings are added as I need them. Pull requests are accepted!
* The project is not cross-platform - See below for list of supported platforms
  * The current version uses the `imgui_impl_opengl3.cpp`


## Platforms support
The current state of platform support:

* macOS - supported
* Linux - supported
* Windows - supported
* Android - supported
* iOS - supported
* HTML5 - supported


## Usage
Refer to [example/example.script](/example/example.script) to learn how to use the extension. Also check the bindings in `LuaInit()` in `extension_imgui.cpp`.


### Input
You need to update the input state in Dear ImGUI each frame to accurately reflect user input:

* `imgui.set_key_down(key, pressed)` - Set the pressed state of a key. The key must be one of the `imgui.KEY_` constants
* `imgui.set_key_modifier_super(pressed)`
* `imgui.set_key_modifier_alt(pressed)`
* `imgui.set_key_modifier_ctrl(pressed)`
* `imgui.set_key_modifier_shift(pressed)`
* `imgui.add_input_character(text)` - Add keyboard input
* `imgui.set_mouse_input(x, y, left, right, middle, wheel)` - Set mouse state (position, buttons and wheel)

You can add the `imgui/imgui.script` to a game object and let that handle input for you (also make sure to use imgui/bindings/imgui.input_bindings).


### Display size
You need to let Dear ImGUI know of any changes to the window size by calling `imgui.set_display_size(w, h)` when the screen size changes.
