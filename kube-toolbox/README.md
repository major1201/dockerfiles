## What's in the toolbox

- [kubectl](https://github.com/kubernetes/kubectl)
- [kubectx](https://github.com/ahmetb/kubectx)
- [kubens](https://github.com/ahmetb/kubectx)
- [helm](https://helm.sh/)
- [stern](https://github.com/wercker/stern)

## How to use?

Set alias

```bash
alias kubectl="docker run --rm -it -v ~/.kube:/root/.kube -v ~/.helm:/root/.helm major1201/kube-toolbox kubectl"
alias kubectx="docker run --rm -it -v ~/.kube:/root/.kube -v ~/.helm:/root/.helm major1201/kube-toolbox kubectx"
alias kubens="docker run --rm -it -v ~/.kube:/root/.kube -v ~/.helm:/root/.helm major1201/kube-toolbox kubens"
alias helm="docker run --rm -it -v ~/.kube:/root/.kube -v ~/.helm:/root/.helm major1201/kube-toolbox helm"
alias stern="docker run --rm -it -v ~/.kube:/root/.kube -v ~/.helm:/root/.helm major1201/kube-toolbox stern"
```

Make completion

```bash
# for zsh
source <(docker run --rm -v ~/.kube:/root/.kube -v ~/.helm:/root/.helm major1201/kube-toolbox completion zsh)

# for bash
source <(docker run --rm -v ~/.kube:/root/.kube -v ~/.helm:/root/.helm major1201/kube-toolbox completion bash)
```

Manage your Kubernetes cluster

```bash
kubectl get pods
helm list
stern my-pod
```
