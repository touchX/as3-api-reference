ActionScript 3 (AS3) API Reference
==================================

Scripts developed by Gene Pavlovsky <gene.pavlovsky@gmail.com>

Description
-----------

`ActionScript 3 (AS3) API Reference` from [Adobe](http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/), suitable for offline access using [FlashDevelop](http://flashdevelop.org/) or a web browser.

Provides scripts for downloading and optimizing the latest reference, enabling offline usage, improving rendering speed and reducing clutter.  
Contains `TocGen` tool for generating the help TOC file suitable for use with [FlashDevelop](http://flashdevelop.org/) via [OpenTheDoc](http://www.flashdevelop.org/community/viewtopic.php?t=2318) plug-in.

Downloads
---------
Latest version: March 2016 (Flash 21.0, AIR 21.0)
[Complete ZIP of the repository](https://github.com/gene-pavlovsky/as3-api-reference/archive/master.zip)

Scripts usage
-------------

The scripts are written in `bash` and `awk` and should be able to run on `UNIX` or `Cygwin`.

1. Review `config.sh`. Any custom settings can be added to `config.local.sh`.
2. Run `scripts/fetch_src.sh` to download the AS3 API Reference from [Adobe](http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/) to `src/` using wget. This will take a long time.
3. (optional) Just in case, create an archive of `src/`.
4. Run `scripts/clean_src.sh` to move unwanted files from `src/` to `trash/`.
5. Run `scripts/make_doc.sh` to optimize the html files from `src/`, outputting into `doc/`. The optimizing itself is done by `scripts/make_doc.awk`. This will take a long time.
6. (optional) Run `scripts/verify_doc.sh` to make sure that every file in `src/` has a matching file in `doc/`. This will take a while.
7. Run `bin/TocGen.exe`, fill in the full path to the `doc/` directory, and click `Generate`. This will take a while.
8. (optional) Edit `config.sh`, set `prune_packages` to the list of packages you don't want, then run `scripts/prune_doc.sh` to remove them and update the TOC file.
9. Copy `doc/` wherever you want and use them with [FlashDevelop](http://flashdevelop.org/) via [OpenTheDoc](http://www.flashdevelop.org/community/viewtopic.php?t=2318) plug-in or a web browser.
