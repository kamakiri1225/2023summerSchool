set terminal gif animate delay 4
set output "gif/animation_test.gif"
do for [i=1:50]{
t=0.2*i
plot sin(x-t)
}
unset output
set terminal qt 0
