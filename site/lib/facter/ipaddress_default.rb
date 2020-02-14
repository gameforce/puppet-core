Facter.add(:ipaddress_default) do
  setcode "ip addr show | grep -E '^\s*inet' | grep -m1 global | awk '{ print $2 }' | sed 's|/.*||'"
end
