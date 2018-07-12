class profile::transmission {
  class { 'transmission':
    transuser    => 'systems',
    transgroup   => 'systems',
    rpc_enabled  => 'true',
    rpc_password => '$6$yshB3fNH$gNYCCumlYwENi31r/LYBe4jAqtLsXW1HnlaroUSJtgLK5nUAc8rXu2jdOAbUozuIjmJ2ZKv.N4S4.UwuftrQn/',
    rpc_port     => '9090',
  }
}
