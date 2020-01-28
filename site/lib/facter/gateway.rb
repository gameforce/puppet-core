Facter.add(:gateway) do
  setcode "ip route | awk '/default/{print $3}'"
end
