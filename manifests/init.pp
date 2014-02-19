# Class: motd
#
# This module manages 'Message Of The Day'
# and the issue file
#
# Parameters:
#   [*ensure*]
#     Ensure if present or absent.
#     Default: present
#
#   [*motd_file*]
#     'Message Of The Day' file.
#     Only set this, if your platform is not supported or you know what you're doing.
#     Default: auto-set, platform specific
#
#   [*motd_template*]
#     Template file to use.
#     Only set this, if your platform is not supported or you know, what you're doing.
#     Default: auto-set, platform specific
#
#   [*issue_file*]
#     'Message Of The Day' file.
#     Only set this, if your platform is not supported or you know what you're doing.
#     Default: auto-set, platform specific
#
#   [*issue_template*]
#     Template file to use.
#     Only set this, if your platform is not supported or you know, what you're doing.
#     Default: auto-set, platform specific
#
# Actions:
#   Manages 'Message Of The Day' & /etc/issue content.
#
# Requires:
#   Nothing
#
# Sample Usage:
#   class { 'motd': }
#
###
class motd(
  # set local vars from params
  $ensure = 'present',
  $motd_file = $motd::params::motd_file,
  $motd_template = $motd::params::motd_template,
  $issue_file = $motd::params::issue_file,
  $issue_template = $motd::params::issue_template
  ) inherits motd::params {
  
  if $ensure == 'present' {
    $ensure_real = 'file'
  } else {
    $ensure_real = 'absent'
  }
  
  if $kernel == "Linux" {
    file { $motd_file:
      ensure  => $ensure_real,
      backup  => true,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => template("$motd_template"),
  }
 }
   if $kernel == "Linux" {
    file { $issue_file:
      ensure  => $ensure_real,
      backup  => true,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => template("$issue_template"),
  }
 }
 
 # if ubuntu or Debian, make sure /etc/motd is 
 # a symlink to /var/run/motd
 # preferred symlink syntax
 if $::osfamily == "Debian" {
	file { '/etc/motd':
	   ensure => 'link',
	   target => '/var/run/motd',
	}
 }
}
