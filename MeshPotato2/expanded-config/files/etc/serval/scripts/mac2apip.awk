BEGIN { FS = ":" }
{
 p5=("0x" substr($5,0,2))+0
 p6=("0x" substr($6,0,2))+0
 printf "%d.%d.1",p5,p6
}
