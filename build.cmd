@echo off
raco exe main.rkt
raco distribute out main.exe
del main.exe
