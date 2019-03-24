<h3 align="center">Jarred Vardy Curriculum Vitae</h3>
<p align="center"><i>Which is also a bootloader...</i></p>

----

## Compiling and running bootloader.

*Compile assembly file:*    
`nasm -f bin boot.asm -o boot.bin`

*Run bootloader:*    
`qemu-system-i386 -fda boot.bin`

> Requires nasm and qemu. To install on Mac:    
> `brew install nasm qemu`

## Loading binary into PDF

*Uncompress the CV (`CV.pdf`) with `qpdf`:*    
`qpdf --stream-data=uncompress --object-streams=disable CV.pdf uncompressed.pdf`

*Load the CV (`uncompressed.pdf`) with the bootloader (`boot.bin`):*    
`python3 loader.py`

*Run the final CV bootloader with QEMU:*    
`qemu-system-i386 -fda CV.pdf`


> Requires qpdf. To install on Mac:    
> brew install qpdf