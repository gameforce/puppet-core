#Facter.add(:group) do
# setcode do
#    if File.directory? '/data/var/atlassian/application-data/jira'
#      'atlassian'
#    else
#      'hostname -f | awk -v FS='.' '{print $2}''
#    end
#   end
#end