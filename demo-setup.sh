oc new-project open5gsoperator-system

#Enable SCTP  load-sctp-module.yaml
# oc apply -f load-sctp-module.yaml 

#Add network attachment definition, while adding secondary interface check Openshift workers and identify interface name, and adjust with definition in network-attachment-definitions.yaml , ip address attached to secondary interface has to be reachable/routeable from primary interfaces, smf will be communicating with upf (secondary interface will be attached to upf cnf)
oc apply -f  network-attachment-definitions.yaml 

# enable SCC for open5gs #  admiting i am lazy i have not spend time for making it scc free
oc adm policy add-scc-to-user anyuid -z default
oc adm policy add-scc-to-user hostaccess -z default
oc adm policy add-scc-to-user hostmount-anyuid -z default
oc adm policy add-scc-to-user privileged -z  default
