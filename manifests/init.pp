define shell_config($file, $key, $value, $ensure = 'present') {
  case $ensure {
    default: { err ( "unknown ensure value ${ensure}" ) }
    present: {
      augeas { "shell_config_$name":
        lens    => 'Shellvars.lns',
        incl    => $file,
        changes => "set /files/$file/$key '\"$value\"'",
      }
    }
    absent: {
      augeas { "shell_config_$name":
        lens    => 'Shellvars.lns',
        incl    => $file,
        changes => "remove /files/$file/$key",
      }
    }
  }
}

