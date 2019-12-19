$a = Read-Host -Prompt 'Introduce el primer numero'
$b = Read-Host -Prompt 'Introduce el segundo numero'
if($a > $b) {
   echo $b" es mayor que "$a;
}else {
   echo $a" es menor que "$b;
   $c=$a;
   $a=$b;
   $b=$c;
}
for($cont=1;$cont -lt 21;$cont++)
{     
    echo $b
    $c = ([int]$a) + ([int]$b)
    $a = $b
    $b = $c
}
