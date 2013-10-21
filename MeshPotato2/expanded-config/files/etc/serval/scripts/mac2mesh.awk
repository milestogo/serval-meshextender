BEGIN { FS = ":" }
{
 p4=("0x" substr($4,0,2))+0
 p5=("0x" substr($5,0,2))+0
 p6=("0x" substr($6,0,2))+0
 printf "%d.%d.%d",p4,p5,p6
}
