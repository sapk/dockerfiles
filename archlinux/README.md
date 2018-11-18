A small Archlinux multi-arch build :latest and an automated build from latest root tar :root.x86_64

New version support building for various arch. (latest is multi-arch).
Each arch contain it own qemu-binary so it possible to run any arch by setting qemu binding before with:
`docker run --rm --privileged multiarch/qemu-user-static:register --reset`
New version is ultra small (under 100MB) because it is rebuild with minimal packages via a build stage.

Build commands:
```
docker build --build-arg ARCH="arm" --build-arg QEMU_ARCH="arm" --build-arg REPO="http://mirror.archlinuxarm.org/arm/\$repo" -f Dockerfile.multi -t sapk/archlinux:arm .
docker build --build-arg ARCH="aarch64" --build-arg QEMU_ARCH="aarch64" --build-arg REPO="http://mirror.archlinuxarm.org/aarch64/\$repo"  -f Dockerfile.multi -t sapk/archlinux:aarch64 .
docker build --build-arg ARCH="armv6h" --build-arg QEMU_ARCH="arm" --build-arg REPO="http://mirror.archlinuxarm.org/armv6h/\$repo"  -f Dockerfile.multi -t sapk/archlinux:armv6h .
docker build --build-arg ARCH="armv7h" --build-arg QEMU_ARCH="arm" --build-arg REPO="http://mirror.archlinuxarm.org/armv7h/\$repo"  -f Dockerfile.multi -t sapk/archlinux:armv7h .
docker build --build-arg ARCH="x86_64" --build-arg QEMU_ARCH="x86_64" --build-arg REPO="https://mirrors.kernel.org/archlinux/\$repo/os/x86_64"  -f Dockerfile.multi -t sapk/archlinux:x86_64 .
docker build --build-arg ARCH="i686" --build-arg QEMU_ARCH="i386" --build-arg REPO="https://mirror.archlinux32.org/i686/\$repo"  -f Dockerfile.multi -t sapk/archlinux:i686 .
```