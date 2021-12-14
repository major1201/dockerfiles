## Description

`systemd` could be used to run systemd in docker.

## Images

- major1201/debian:stretch-systemd
- major1201/debian:buster-systemd

## Example

```bash
docker run -d \
    --name debian \
    -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
    --tmpfs /run \
    --tmpfs /run/lock \
    --cap-add=SYS_ADMIN \
    --security-opt=seccomp:unconfined \
    major1201/debian:buster-systemd
```

## Sample Kubernetes Deployment

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: debian-systemd-demo
spec:
  replicas: 1
  selector:
    matchLabels:
      app.kubernetes.io/name: debian-systemd-demo
  template:
    metadata:
      name: debian
      labels:
        app.kubernetes.io/name: debian-systemd-demo
    spec:
      containers:
        - name: main
          image: major1201/debian:buster-systemd1
          volumeMounts:
            - name: sys-cgroup
              mountPath: /sys/fs/cgroup
              readOnly: true
            - name: sys-run
              mountPath: /run
            - name: sys-runlock
              mountPath: /run/lock
            - name: tmp
              mountPath: /tmp
      volumes:
        - name: sys-cgroup
          hostPath:
            path: /sys/fs/cgroup
        - name: sys-run
          emptyDir:
            medium: Memory
        - name: sys-runlock
          emptyDir:
            medium: Memory
        - name: tmp
          hostPath:
            path: /tmp
      terminationGracePeriodSeconds: 5
```
