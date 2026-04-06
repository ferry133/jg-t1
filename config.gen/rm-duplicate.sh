#############
# Larry: under omni cluster,
# 1) no need to execute: "task bootstrap:talos"
# 2) before "task bootstrap:apps", need to kubectl delete all the coredns/flannel resources in kube-system,
#    including deployment, service, ServiceAccount and configmap.
# 3) search service cidr "10.43" which should be changed to 10.96.
helm uninstall coredns -n kube-system

kubectl delete deployment coredns -n kube-system
kubectl delete service kube-dns -n kube-system
kubectl delete serviceaccount coredns -n kube-system
kubectl delete configmap coredns -n kube-system

kubectl delete -f https://raw.githubusercontent.com/flannel-io/flannel/master/Documentation/kube-flannel.yml
kubectl delete daemonset kube-flannel  -n kube-system
kubectl delete configmap kube-flannel-cfg -n kube-system
kubectl delete serviceaccount flannel -n kube-system
kubectl delete ClusterRole/flannel

kubectl delete daemonset kube-proxy -n kube-system
kubectl delete configmap kube-proxy -n kube-system
kubectl delete serviceaccount kube-proxy -n kube-system



#. WARN File does not exist file="/Users/ferry133/coding/jg-t1/bootstrap/github-deploy-key.sops.yaml"
