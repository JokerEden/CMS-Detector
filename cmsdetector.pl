#!/usr/bin/perl
# Codec By Codename
# Halo Kenapa Kesini ea :) Script Don't Change oke ;)
# Joker Eden < My Team Me Is Leader
# Blog : https://cruznos.blogspot.com
# Wordpress : https://nostalgiaxploit.wordpress.com

use Win32::Console::ANSI;
use Term::ANSIColor;
use LWP::UserAgent;
####################### Options O TERMINAL ############################################
system(($^O eq 'MSWin32') ? 'cls' : 'clear');
####################### Info ####################################################
$script = 'CMS Detector';
$author = 'Codename';
$version = '1.1';
$team = 'Codename';
$update = '29/10/2018';
$greetz = 'All Friends';
####################### MENCIPTAKAN DIREKTORI UNTUK MENYELAMATKAN.TXT ###############
$res="Result";
    if (-e $res) 
    {
    }
    else
    {
        mkdir $res or die "KAMI TIDAK BISA MENCIPTAKAN DIRECTORY: $res";
    }
################# Information  #############

print "\n";
print colored("         --=[ $script",'BOLD WHITE'),"\n";
print colored("         +---**---==[ Version: $version ",'BOLD GREEN'),"\n";
print colored("         +---**---==[ Author: $author  ",'BOLD WHITE'),"\n";
print colored("         +---**---==[ Update Date : $update ",'BOLD GREEN'),"\n";
print colored("         +---**---==[ Team: $team  ",'BOLD WHITE'),"\n";
print colored("         +---**---==[ Thanks To: $greetz  ",'BOLD GREEN'),"\n";
print "                           ";
print colored ("[ Start At $datetime ]",'white on_red'),"\n\n";


print colored("+------------------------------------------------------------------------+",'red'),"\n";
print colored("+------------------------------------------------------------------------+",'red'),"\n";

########## BAGIAN KERJA #################
print colored("[DAFTAR SITUS ANDA]: ",'BOLD WHITE');

$list=<STDIN>;
chomp($list);
open (list, "<$list") || die "\n [DAFTAR SITUS YANG TIDAK DIPILIH]";
my @lista = <list>;
close list;

foreach $site(@list) {

if($site !~ /http:\/\//) { $site = "http://$site/"; };
detect();
}
sub detect($site){
$ua = LWP::UserAgent->new(keep_alive => 1);
$ua->agent("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31");
$ua->timeout (8);

my $datetime    = localtime;

@months = qw(01 02 03 04 05 06 07 08 09 10 11 12);
($second, $minute, $hour, $dayOfMonth, $month, $yearOffset, $dayOfWeek, $dayOfYear, $daylightSavings) = localtime();
$year = 1900 + $yearOffset;
$month = "$months[$month]";

#################### Detector O WordPress ##################################
my $checar = $ua->get("$site")->content;
if($checar =~/wp-content/|wordpress|xmlrpc.php/) {
    print colored("[WORDPRESS]: $site",'WHITE ON_CYAN'),"\n";
open(save, '>>Result/Wordpress.txt');
    print save "$site\n";
    close(save);
}
#################### Detector O Joomla ##################################
elsif($checar =~/<script type=\"text\/javascript\" src=\"\/media\/system\/js\/mootools.js\"><\/script>| \/media\/system\/js\/|com_content|Joomla!/) {
    print colored("[JOOMLA]: $site",'WHITE ON_GREEN'),"\n";
open(save, '>>Result/Joomla.txt');
    print save "$site\n";   
    close(save);
    }
#################### Detector O CMS Prestashop ##################################
elsif($checar =~/Prestashop|prestashop/) {
    print colored("[PRESTASHOB]: $site",'WHITE ON_RED'),"\n";
open(save, '>>Result/Prestashob.txt'); 
    print save "$site\n";   
    close(save);
  }
#################### Detector O CMS DRUPAL ##################################
elsif($checar =~Drupal|drupal|sites\/all|drupal.org/) {
    print colored("[DRUPAL]: $site",'WHITE ON_BLUE'),"\n";
open(save, '>>Result/Drupal.txt'); 
    print save "$site\n";   
    close(save);
    }
#################### CMS TIDAK TERDETEKSI ##################################
else{
    print colored("[CMSTIDAKTERDETEKSI]: $site",'BOLD WHITE'),"\n";
    open(save, '>>Result/CMS_TIDAK_TERDETEKSI.txt');
    print save "$site\n";
    close(save);
}
}