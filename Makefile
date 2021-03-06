default:
	@cp coldkernel.config coldkernel.config.orig
	@bash build.sh
	@mv coldkernel.config.orig coldkernel.config

kvm-host:
	@cp coldkernel.config coldkernel.config.orig
	@patch <./virt/kvm/kvm-host.patch
	@bash build.sh
	@mv coldkernel.config.orig coldkernel.config

kvm-guest:
	@cp coldkernel.config coldkernel.config.orig
	@patch < ./virt/kvm/kvm-guest.patch
	@bash build.sh
	@mv coldkernel.config.orig coldkernel.config

xen-host:
	@cp coldkernel.config coldkernel.config.orig
	@patch < ./virt/xen/xen-host.patch
	@bash build.sh
	@mv coldkernel.config.orig coldkernel.config

xen-guest:
	@cp coldkernel.config coldkernel.config.orig
	@patch < ./virt/xen/xen-guest.patch
	@bash build.sh
	@mv coldkernel.config.orig coldkernel.config

virtualbox-host:
	@cp coldkernel.config coldkernel.config.orig
	@patch < ./virt/virtualbox/virtualbox-host.patch
	@bash build.sh
	@mv coldkernel.config.orig coldkernel.config

virtualbox-guest:
	@cp coldkernel.config coldkernel.config.orig
	@patch < ./virt/virtualbox/virtualbox-guest.patch
	@bash build.sh
	@mv coldkernel.config.orig coldkernel.config

vmware-host:
	@cp coldkernel.config coldkernel.config.orig
	@patch < ./virt/vmware/vmware-host.patch
	@bash build.sh
	@mv coldkernel.config.orig coldkernel.config

vmware-guest:
	@cp coldkernel.config coldkernel.config.orig
	@patch < ./virt/vmware/vmware-guest.patch
	@bash build.sh
	@mv coldkernel.config.orig coldkernel.config

hyperv-guest:
	@cp coldkernel.config coldkernel.config.orig
	@patch < ./virt/hyperv/hyperv-guest.patch
	@bash build.sh
	@mv coldkernel.config.orig coldkernel.config

qubes-guest:
	@cp coldkernel.config coldkernel.config.orig
	@patch < ./virt/qubes/qubes-guest.patch
	@bash build.sh
	@mv coldkernel.config.orig coldkernel.config

install-deb:
	@dpkg -i linux-headers*.deb
	@dpkg -i linux-image*.deb

install-rpm:
	@yum localinstall kernel-*

debug:
	@bash build.sh -v

clean:
	@rm -rv linux-*/ &
	@rm -rv *.tar &
	@rm -rv *-coldkernel-* &
	@rm -rv *_coldkernel_*

distclean:
	@rm -rv linux-* &
	@rm -rvf patches &
	@rm -rv kernel-*
