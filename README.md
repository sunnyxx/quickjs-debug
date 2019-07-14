# quickjs-debug
`quickjs` is a lightweight jscore created by Fabrice Bellard
official website: [https://bellard.org/quickjs/](https://bellard.org/quickjs/)
this git embes quickjs source code (version 2019-07-09) in Xcode project, helps to debug and learn it.

# how to run
clone this git, open Xcode project
1. build `quick-debug` target to make executables and `.a`
2. build `xxxxxx-index` target to get symbols indexed (ignore build failed)
3. run `main` target
4. modify `main.m` to debug what you want to

# note
i386 arch has been removed from makefile