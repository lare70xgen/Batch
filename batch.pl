#!/usr/bin/perl
$command=$ARGV[0];
chomp $command;
if(!$command){&help();}
$params=$ARGV[2];
chomp $params;
open(FI,"$ARGV[1]")||die "Ei loydy $ARGV[1]\n";
while(<FI>){
        foreach $tmp($_){
                chomp $tmp;
                $cmmd=join("",$command,$tmp,$params);
                print "$tmp\n";
                print `$cmmd`;
                }
}
close FI;
sub help()
{
        print "USAGE:\t./batch.pl [command] [list] [params]\n";
        print "-"x80,"\n";
        print "command:\t what command is executed to each item of the list.\n";
        print "list:\t\t file contains list of machines, names only\n";
        print "params:\t\t is optional field, if command requires some paramaters after machine name\n";
        print "-"x80,"\n";
        print "EXAMPLE:\t./batch.pl \"wadminep \" list.txt \" view_version\"\n"; 
        print "EXAMPLE:\t./batch.pl \"wlssub -l \@Endpoint:\" customer.list\n";
        exit;
}
# ESIMERKKEJA KAYTOSTA HANKALAMMISSA TILANTEISSA:
# ./batch.pl "wlssub -l @Endpoint:" customer.list
# ./batch.pl "wadminep " customer.list " view_version" 
# ./btach.pl "wunsub @ProfileManager:CUSTOMERGROUP_W2K_PM @Endpoint: " customer.list

