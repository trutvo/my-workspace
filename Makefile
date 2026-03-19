ISO_IMAGE=ubuntu-25.10-desktop-arm64.iso
EDK2_CODE=/opt/homebrew/share/qemu/edk2-aarch64-code.fd
IMAGE=ubuntu25.img
EDK2_VARS=edk2-aarch64-vars.fd

build: $(ISO_IMAGE) $(IMAGE) $(EDK2_VARS)
	./workspace -drive file=$(ISO_IMAGE),readonly=on,media=cdrom 

$(ISO_IMAGE):
	cp $(HOME)/$(ISO_IMAGE) .
	xattr -c $(ISO_IMAGE)

$(IMAGE):
	qemu-img create -f qcow2 ubuntu25.img 80G

$(EDK2_VARS):
	dd if=/dev/zero conv=sync bs=1m count=64 of=$(EDK2_VARS)

clean:
	rm -f $(IMAGE) $(EDK2_VARS)
