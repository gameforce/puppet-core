# Add a custom fact to classify the server by subdomain
Facter.add(:servertype) do
    setcode "hostname -f | awk -v FS='.' '{print $2}'"
    end
  
  # Check if this is an atlassian server
  Facter.add(:servertype) do
    setcode do
      if File.directory? '/data/var/atlassian'
        'atlassian'
      end
    end
  end
  
  # if nothing above matches classify as a desktop
  Facter.add(:servertype) do
    setcode do
      'desktop'
    end
  end