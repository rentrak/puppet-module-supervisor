define supervisor::group (
  $programs,
  $priority = 999,
)
{
  include supervisor

  file { "${supervisor::conf_dir}/${name}${supervisor::conf_ext}":
    ensure  => $config_ensure,
    content => template('supervisor/group.ini.erb'),
    notify  => Class['supervisor::update'],
  }
}
