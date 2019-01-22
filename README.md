# OpenSSL - Transport Layer Security (TLS) protocol library

OpenSSL is a library implementing the Transport Layer Security (TLS) protocols (including SSLv3) as well as a full-strength general purpose cryptographic library.

OpenSSL descended from the SSLeay library developed by Eric A. Young and Tim J. Hudson.  The OpenSSL toolkit is licensed under a dual-license (the OpenSSL license plus the SSLeay license), which means that you are free to get and use it for commercial and non-commercial purposes as long as you fulfill the conditions of both licenses.


[Web site](https://www.openssl.org/)
 

This repository adds build scripts for Visual Studio for building OpenSSL on Windows. It also tracks the [upstream](https://github.com/openssl/openssl "https://github.com/openssl/openssl") repository.

### Usage

You will need perl and optionally nasm to be in the search PATH. Masm works also fine for Win64A builds.

1. Open the Visual Studio Command Prompt for Win32 or win64, as appropriate.
2. Make sure perl and optionally nasm can be invoked from the command box.
3. Run `prebuild.bat` once. `prebuild.bat` invokes the supplied perl scripts to generate the .c and .asm files needed for building the project. See available command line options below.

4. a) Open `projects/VS2017/openssl.sln` with the Visual Studio IDE to (re)build. Perl is not needed to rebuild the project from within the IDE.

	b) You can also build the project using `nmake`. Invoke the following command:

	`nmake PERL=no-perl`

	from within the `generated_*` directory.


If you work on the generated files, you may want to include `prebuild.bat` to be called automatically from the PreBuildEvent of the IDE.


### `prebuild.bat` options:

`prebuild [win32|win64] [nasm]`<br>
`prebuild [win64] masm`<br>

When invoking `prebuild.bat` without any parameters, the default configuration will be generated, which is win32 with no asm source files.

### Platforms and Configurations

* In this initial release, project files for VS2017 are provided.
* There are Debug and Release configurations. The Debug configuration creates a .pdb for symbols.
* Platforms supported are Win32 (32-bit x86) and Win64A (64-bit x86 with AMD64 instruction set. No assembly code is used; the corresponding C implementations are linked in.
* Both static libraries and dynamic-link libraries are produced. The static libraries carry no runtime and everything is 'exported'. The dynamic link libraries link to the **static runtime** ( /MT and /MTd switches were used ). You can change this from within the IDE if you don't like it. The dynamic link libraries expose the 'official' API are specified in the perl-generated .def files.
* Superfluous applink is not used. The static libs do not link to any runtime anyway. For the dynamic-link libraries, if you prefer to use that for some special reason, you will need to set one of the /MD, /MDd, /MT, or /MTd swithes correctly. *Please note, the the 'official' guys prefer the dynamic runtimes to be linked to, which makes perfect sense under nix, less so under win.*

### TODO
* Add additional configurations, that use nasm and/or masm:
	* WIN64A-masm
	* WIN32 nasm
	* WIN64A nasm
	* ...


See also the original [README](README) file.







