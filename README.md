# assembly

To create executables, use command - ml file_name.asm

To check assembly generated by msvc, use command - cl file_name.cpp /Fa

To compile and debug assembly in visual studio:
Add .sm files to project.
Project->BuildDependencies->BuildCustomizations, select masm
Right Click .asm file from Solution Explorer, Select Microsoft Macro Assembler under Item Type.
