#Default recipe from where software will be copied and installed 
#This will be under attribute folder
#Nexus will be default path
default[:splunk][:install_dir]="/app/Splunk"
default[:splunk][:version]="6.6.5"
default[:splunk][:download_url]="nexus URL"