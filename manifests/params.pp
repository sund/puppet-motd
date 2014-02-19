class motd::params {
  case $::osfamily {
    redhat, suse: {
      $motd_file = '/etc/motd'
      $motd_template = 'motd/motd.erb'
      $issue_file = '/etc/issue'
      $issue_template = 'motd/issue.erb'
    }
    ubuntu, Debian: {
      $motd_file = '/etc/motd.tail'
      $motd_template = 'motd/motd.erb'
      $issue_file = '/etc/issue'
      $issue_template = 'motd/issue.erb'
    }
    default: {
      case $::operatingsystem {
        gentoo: {
				$motd_file = '/etc/motd'
				$motd_template = 'motd/motd.erb'
				$issue_file = '/etc/issue'
				$issue_template = 'motd/issue.erb'   
        }
        default: {
          fail("The ${module_name} module is not supported on ${::osfamily}/${::operatingsystem}.")
        }
      }
    }
  }  
}