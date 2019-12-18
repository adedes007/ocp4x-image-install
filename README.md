# Local OCP 4.2.x mirroring With NO internet access

There are cases where you will NOT be allowed to `oc adm mirror ,,,` the quay.io release images for a disconnected install.  If that is the case you will have to manually copy all release images onto a media drive or file from a host that has access to quay.io ( directly or via proxy ) and then copy them into the internal hosted non internet facing local v2 registry. 

## Getting Started

These instructions will get you started on a project that is running on the internet facing machine. Let us call it source machine. You will need to run the first script on the source machine. Then you need to copy all resulted images onto the internal host. Lets us call it target machine.  On the target machine run the second script that loads all images onto the internal repository one by one via skopeo. It is assumed that the target machine can reach the internal registry.

### Prerequisites

All you need is a standard RHEL installation and software.

```
Give examples
```

### Installing

First get on your source machine ( internet facing host ) and run the first script - ../source/01-grab-ocp-images.sh  - after you change the first 3 variables to match your own environment.

In this step you have copied all release images onto a directory from quay.io. The size of that directory is about 4.5 GB.5 GB.5 GB.5 GB.5 GB.

```
cd ~/git/ocp4x-image-install/source
./01-grab-ocp-images.sh
```


Second step is to move the images via sftp, scp or some other way to the target machine. The target machine can also be the registry machine.

```
cd /root/scripts/image-repo/4.2.2
scp -r * root@target.machine.com:/root/scripts/image-repo/4.2.2
```

Third and final step is to load the images onto your local registry by running the ../target/02-load-images-2local-registry.sh  - after you change the first 3 variables to match your own environment.

When this steps completes you will have copied all images onto your local registry manually one by one.

```
cd ~/git/ocp4x-image-install/target
./02-load-images-2local-registry.sh
```


## Running the installation

Finally you will need to run the installation using an install-config.yaml file. Please add the following lines from
ocp-4x-image-install/00-add-2extra-imageContentSources.txt to the end of your install-config.yaml file.

## Authors

* **Apostolos Dedes** - *Initial work* - [adedes](https://github.com/adedes007)


## Acknowledgments

* I read some of the emails that Clayton Coleman had send out during the 4.2 release cycle.
* As I understand 4.3 will have a way to do this automatically using the oc command line.

