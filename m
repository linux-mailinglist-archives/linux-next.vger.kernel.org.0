Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A47DC233129
	for <lists+linux-next@lfdr.de>; Thu, 30 Jul 2020 13:47:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbgG3LrL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 30 Jul 2020 07:47:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727873AbgG3LrC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 30 Jul 2020 07:47:02 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F016EC061794;
        Thu, 30 Jul 2020 04:47:01 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BHTCm24gwz9sRN;
        Thu, 30 Jul 2020 21:47:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1596109620;
        bh=4m6VnT7BobJJoWJkYljTBu/EBnMmMjSbwm07TaFiBrM=;
        h=Date:From:To:Cc:Subject:From;
        b=RvfxAir4mCJnCVTzSFNA/8MwJJ1GoxbLCpOxj+tD4Q28FbKbMHuJ1AyxNsUx/Ys4l
         EuJG4VjUMhkveUvt/Ulb9AOAUhlBWIAHRFcoF9VJdzTB2MGtlpxkpqF5HpRDi0xpkL
         k45dE8eXSO2EfRRxv/KP4Vr3qpQ5xjT9HZht+r0wJqNMRWLGaWnyJ6yP5WIaI6jN7Y
         63CwC3aOddrZeqIuJY+QWdq9uucPpywA5y0FbHO0Ei9M4HqqtV9TGHTRwmnTgoaWIk
         oMQMEJscPdw4F7+h25drqsbqMphgkGvkaXmYSuK1pJxnhNegb24Pvr8Y3FEbAc8fzL
         qpVxIulDHPdJQ==
Date:   Thu, 30 Jul 2020 21:46:59 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jul 30
Message-ID: <20200730214659.0fbfdfc4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2wUp9x/p/pVdlnoIbMenKCJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/2wUp9x/p/pVdlnoIbMenKCJ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20200729:

My fixes tree contains:

  dbf24e30ce2e ("device_cgroup: Fix RCU list debugging warning")

Linus' tree gained a build failure for which I revertd a commit.

The vfs tree lost its build failure.

The printk tree lost its build failure.

The net-next tree lost its build failure.

The security tree still had its build failure for which I reverted
3 commits.

The iommu tree gained a conflict against the dma-mapping tree.

The tip tree still had its build failure for which I reverted a
commit.

The vhost tree lost its build failure but gained more for which I applied
a patch.

The hmm tree gained conflicts against the drm and kvm-ppc trees.

Non-merge commits (relative to Linus' tree): 11751
 12254 files changed, 603002 insertions(+), 226737 deletions(-)

----------------------------------------------------------------------------

I have created today's linux-next tree at
git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
(patches at http://www.kernel.org/pub/linux/kernel/next/ ).  If you
are tracking the linux-next tree using git, you should not use "git pull"
to do so as that will try to merge the new linux-next release with the
old one.  You should use "git fetch" and checkout or reset to the new
master.

You can see which trees have been included by looking in the Next/Trees
file in the source.  There are also quilt-import.log and merge.log
files in the Next directory.  Between each merge, the tree was built
with a ppc64_defconfig for powerpc, an allmodconfig for x86_64, a
multi_v7_defconfig for arm and a native build of tools/perf. After
the final fixups (if any), I do an x86_64 modules_install followed by
builds for x86_64 allnoconfig, powerpc allnoconfig (32 and 64 bit),
ppc44x_defconfig, allyesconfig and pseries_le_defconfig and i386, sparc
and sparc64 defconfig and htmldocs. And finally, a simple boot test
of the powerpc pseries_le_defconfig kernel in qemu (with and without
kvm enabled).

Below is a summary of the state of the merge.

I am currently merging 328 trees (counting Linus' and 85 trees of bug
fix patches pending for the current merge release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Status of my local build tests will be at
http://kisskb.ellerman.id.au/linux-next .  If maintainers want to give
advice about cross compilers/configs that work, we are always open to add
more builds.

Thanks to Randy Dunlap for doing many randconfig builds.  And to Paul
Gortmaker for triage and bug fixes.

--=20
Cheers,
Stephen Rothwell

$ git checkout master
$ git reset --hard stable
Merging origin/master (d3590ebf6f91 Merge tag 'audit-pr-20200729' of git://=
git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit)
Merging fixes/master (dbf24e30ce2e device_cgroup: Fix RCU list debugging wa=
rning)
Applying: Revert "random32: update the net random state on interrupt and ac=
tivity"
Merging kbuild-current/fixes (c2d714d56928 kconfig: qconf: use delete[] ins=
tead of delete to free array)
Merging arc-current/for-curr (11ba468877bb Linux 5.8-rc5)
Merging arm-current/fixes (5c6360ee4a0e ARM: 8988/1: mmu: fix crash in EFI =
calls due to p4d typo in create_mapping_late())
Merging arm64-fixes/for-next/fixes (7b7891c7bdfd arm64: vdso32: Fix '--pref=
ix=3D' value for newer versions of clang)
Merging arm-soc-fixes/arm/fixes (fe1d899f4212 ARM: dts: keystone-k2g-evm: f=
ix rgmii phy-mode for ksz9031 phy)
Merging uniphier-fixes/fixes (48778464bb7d Linux 5.8-rc2)
Merging drivers-memory-fixes/fixes (b3a9e3b9622a Linux 5.8-rc1)
Merging m68k-current/for-linus (3381df095419 m68k: tools: Replace zero-leng=
th array with flexible-array member)
Merging powerpc-fixes/fixes (909adfc66b9a powerpc/64s/hash: Fix hash_preloa=
d running with interrupts enabled)
Merging s390-fixes/fixes (92ed30191993 Linux 5.8-rc7)
Merging sparc/master (17ec0a17e90f sparc: Use fallthrough pseudo-keyword)
Merging fscrypt-current/for-stable (2b4eae95c736 fscrypt: don't evict dirty=
 inodes after removing key)
Merging net/master (27a2145d6f82 ibmvnic: Fix IRQ mapping disposal in error=
 path)
Merging bpf/master (5b801dfb7feb bpf: Fix NULL pointer dereference in __btf=
_resolve_helper_id())
Merging ipsec/master (d5dba1376e2b xfrm: esp6: fix the location of the tran=
sport header with encapsulation)
Merging netfilter/master (8e8135862ccb Merge git://git.kernel.org/pub/scm/l=
inux/kernel/git/pablo/nf)
Merging ipvs/master (eadede5f9362 Merge branch 'hns3-fixes')
Merging wireless-drivers/master (1cfd3426ef98 ath10k: Fix NULL pointer dere=
ference in AHB device probe)
Merging mac80211/master (8ff41cc21714 net: qrtr: Fix an out of bounds read =
qrtr_endpoint_post())
Merging rdma-fixes/for-rc (5351a56b1a4c RDMA/mlx5: Fix prefetch memory leak=
 if get_prefetchable_mr fails)
Merging sound-current/for-linus (7fcd9bb5acd0 ALSA: hda: fix NULL pointer d=
ereference during suspend)
Merging sound-asoc-fixes/for-linus (11b9fc4286b9 Merge remote-tracking bran=
ch 'asoc/for-5.8' into asoc-linus)
Merging regmap-fixes/for-linus (2b0f61e27f75 Merge remote-tracking branch '=
regmap/for-5.8' into regmap-linus)
Merging regulator-fixes/for-linus (92ed30191993 Linux 5.8-rc7)
Merging spi-fixes/for-linus (8ade0c2fabd3 Merge remote-tracking branch 'spi=
/for-5.8' into spi-linus)
Merging pci-current/for-linus (d08c30d7a0d1 Revert "PCI/PM: Assume ports wi=
thout DLL Link Active train links in 100 ms")
Merging driver-core.current/driver-core-linus (92ed30191993 Linux 5.8-rc7)
Merging tty.current/tty-linus (92ed30191993 Linux 5.8-rc7)
Merging usb.current/usb-linus (92ed30191993 Linux 5.8-rc7)
Merging usb-gadget-fixes/fixes (8778eb0927dd usb: gadget: function: fix mis=
sing spinlock in f_uac1_legacy)
Merging usb-serial-fixes/usb-linus (92ed30191993 Linux 5.8-rc7)
Merging usb-chipidea-fixes/ci-for-usb-stable (2d79b3360dcc usb: chipidea: c=
ore: add wakeup support for extcon)
Merging phy/fixes (38b1927e5bf9 phy: sun4i-usb: fix dereference of pointer =
phy0 before it is null checked)
Merging staging.current/staging-linus (92ed30191993 Linux 5.8-rc7)
Merging char-misc.current/char-misc-linus (92ed30191993 Linux 5.8-rc7)
Merging soundwire-fixes/fixes (bf6d6e68d202 soundwire: intel: fix memory le=
ak with devm_kasprintf)
Merging thunderbolt-fixes/fixes (ba47d845d715 Linux 5.8-rc6)
Merging input-current/for-linus (a50ca29523b1 Input: elan_i2c - add more ha=
rdware ID for Lenovo laptops)
Merging crypto-current/master (e04ec0de61c1 padata: upgrade smp_mb__after_a=
tomic to smp_mb in padata_do_serial)
Merging ide/master (b3a9e3b9622a Linux 5.8-rc1)
Merging vfio-fixes/for-linus (b872d0640840 vfio/pci: fix racy on error and =
request eventfd ctx)
Merging kselftest-fixes/fixes (3c01655ac82e kselftest: ksft_test_num return=
 type should be unsigned)
Merging modules-fixes/modules-linus (57baec7b1b04 scripts/nsdeps: make sure=
 to pass all module source files to spatch)
Merging dmaengine-fixes/fixes (87730ccbddcb dmaengine: ioat setting ioat ti=
meout as module parameter)
Merging backlight-fixes/for-backlight-fixes (219d54332a09 Linux 5.4)
Merging mtd-fixes/mtd/fixes (f7e6b19bc764 mtd: properly check all write ioc=
tls for permissions)
Merging mfd-fixes/for-mfd-fixes (603d9299da32 mfd: mt6397: Fix probe after =
changing mt6397-core)
Merging v4l-dvb-fixes/fixes (8f3d9f354286 Linux 5.7-rc1)
Merging reset-fixes/reset/fixes (b460e0a9e240 reset: intel: add unspecified=
 HAS_IOMEM dependency)
Merging mips-fixes/mips-fixes (5868347a192a MIPS: Do not use smp_processor_=
id() in preemptible code)
Merging at91-fixes/at91-fixes (54ecb8f7028c Linux 5.4-rc1)
Merging omap-fixes/fixes (2a4117df9b43 ARM: dts: Fix dcan driver probe fail=
ed on am437x platform)
Merging kvm-fixes/master (3d9fdc252b52 KVM: MIPS: Fix build errors for 32bi=
t kernel)
Merging kvms390-fixes/master (774911290c58 KVM: s390: reduce number of IO p=
ins to 1)
Merging hwmon-fixes/hwmon (ba47d845d715 Linux 5.8-rc6)
Merging nvdimm-fixes/libnvdimm-fixes (543094e19c82 nvdimm/region: always sh=
ow the 'align' attribute)
Merging btrfs-fixes/next-fixes (061e532804fa Merge branch 'misc-5.8' into n=
ext-fixes)
Merging vfs-fixes/fixes (5fff09bc1415 xtensa: fix access check in csum_and_=
copy_from_user)
Merging dma-mapping-fixes/for-linus (d9765e41d8e9 dma-pool: do not allocate=
 pool memory from CMA)
Merging i3c-fixes/master (6fbc7275c7a9 Linux 5.2-rc7)
Merging drivers-x86-fixes/fixes (92ed30191993 Linux 5.8-rc7)
Merging samsung-krzk-fixes/fixes (b3a9e3b9622a Linux 5.8-rc1)
Merging pinctrl-samsung-fixes/pinctrl-fixes (b3a9e3b9622a Linux 5.8-rc1)
Merging devicetree-fixes/dt/linus (0115e6c98c22 dt-bindings: clock: imx: Fi=
x e-mail address)
Merging scsi-fixes/fixes (3f0dcfbcd2e1 scsi: core: Run queue in case of I/O=
 resource contention failure)
Merging drm-fixes/drm-fixes (a4a2739beb89 Merge tag 'drm-misc-fixes-2020-07=
-28' of git://anongit.freedesktop.org/drm/drm-misc into drm-fixes)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (92ed30191993 Linux 5.8-rc7)
Merging mmc-fixes/fixes (ebd4050c6144 mmc: sdhci-of-aspeed: Fix clock divid=
er calculation)
Merging rtc-fixes/rtc-fixes (b3a9e3b9622a Linux 5.8-rc1)
Merging gnss-fixes/gnss-linus (48778464bb7d Linux 5.8-rc2)
Merging hyperv-fixes/hyperv-fixes (77b48bea2fee Drivers: hv: Change flag to=
 write log level in panic msg to false)
Merging soc-fsl-fixes/fix (fe8fe7723a3a soc: fsl: dpio: register dpio irq h=
andlers after dpio create)
Merging risc-v-fixes/fixes (fa5a19835905 riscv: Parse all memory blocks to =
remove unusable memory)
Merging pidfd-fixes/fixes (7665a47f70b3 signal: fix typo in dequeue_synchro=
nous_signal())
Merging fpga-fixes/fixes (8614afd689df fpga: dfl: fix bug in port reset han=
dshake)
Merging spdx/spdx-linus (3d77e6a8804a Linux 5.7)
Merging gpio-intel-fixes/fixes (b3a9e3b9622a Linux 5.8-rc1)
Merging pinctrl-intel-fixes/fixes (45c11a927606 pinctrl: baytrail: Fix pin =
being driven low for a while on gpiod_get(..., GPIOD_OUT_HIGH))
Merging erofs-fixes/fixes (9ebcfadb0610 Linux 5.8-rc3)
Merging integrity-fixes/fixes (843385694721 evm: Fix a small race in init_d=
esc())
Merging kunit-fixes/kunit-fixes (c63d2dd7e134 Documentation: kunit: Add som=
e troubleshooting tips to the FAQ)
Merging ubifs-fixes/fixes (f37e99aca03f Merge tag 's390-5.8-6' of git://git=
.kernel.org/pub/scm/linux/kernel/git/s390/linux into master)
Merging drm-misc-fixes/for-linux-next-fixes (f4a1692491b5 Merge remote-trac=
king branch 'drm/drm-fixes' into drm-misc-fixes)
Merging kspp-gustavo/for-next/kspp (48778464bb7d Linux 5.8-rc2)
Merging kbuild/for-next (71e6bc234960 Merge branch 'kconfig' into for-next)
Merging compiler-attributes/compiler-attributes (98d54f81e36b Linux 5.6-rc4)
Merging dma-mapping/for-next (274b3f7bf344 dma-contiguous: cleanup dma_allo=
c_contiguous)
Merging asm-generic/master (060dc911501f nds32: fix build failure caused by=
 page table folding updates)
Merging arc/for-next (def9d2780727 Linux 5.5-rc7)
Merging arm/for-next (4dffbda6a996 Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm64/for-next/core (9756a50690e3 Merge branch 'for-next/read-barri=
er-depends' into for-next/core)
CONFLICT (content): Merge conflict in arch/arm64/include/asm/vdso/compat_ge=
ttimeofday.h
Merging arm-perf/for-next/perf (55fdc1f44cd6 arm64: perf: Expose some new e=
vents via sysfs)
Merging arm-soc/for-next (2c8a870836e3 soc: document merges)
Merging amlogic/for-next (bef87d25eebf Merge branch 'v5.9/dt64' into tmp/am=
l-rebuild)
Merging aspeed/for-next (2c887638a5fa ARM: dts: Aspeed: tacoma: Enable EHCI=
 controller)
Merging at91/at91-next (ec539e70d882 Merge branches 'at91-soc', 'at91-dt' a=
nd 'at91-defconfig' into at91-next)
Merging drivers-memory/for-next (f046e4a3f0b9 memory: jz4780_nemc: Only req=
uest IO memory the driver will use)
Merging imx-mxs/for-next (3c1a41dab7b8 Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (50c950e2c8b6 Merge branch 'for_5.9/driver-soc' into =
next)
Merging mediatek/for-next (647a84d1e4dc Merge branch 'v5.8-next/soc' into f=
or-next)
Merging mvebu/for-next (29bd9d8c2ac1 Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (a5b4d0a1b174 Merge branch 'omap-for-v5.9/ti-sysc-dro=
p-pdata-take2' into for-next)
Merging qcom/for-next (8746b1314c2e Merge branches 'arm64-for-5.10', 'arm64=
-defconfig-for-5.10' and 'drivers-for-5.10' into for-next)
Merging raspberrypi/for-next (25c6f3960764 ARM: dts: bcm2711: Add HDMI DVP)
Merging realtek/for-next (486f29df6941 Merge branch 'v5.8/dt' into next)
Merging renesas/next (344cb4f80fba Merge branch 'renesas-arm-dt-for-v5.9' i=
nto renesas-next)
Merging reset/reset/next (dc76572330e3 reset: Fix and extend kerneldoc)
Merging rockchip/for-next (088d74f51158 Merge branch 'v5.9-clk/next' into f=
or-next)
Merging samsung-krzk/for-next (3f61e08ac0be Merge branch 'next/memory-ctrl-=
drivers' into for-next)
Merging scmi/for-linux-next (5714ee50bb43 copy_xstate_to_kernel: Fix typo w=
hich caused GDB regression)
Merging sunxi/sunxi/for-next (9afd08499961 Merge branch 'sunxi/dt-for-5.9' =
into sunxi/for-next)
Merging tegra/for-next (8617339892a6 Merge branch for-5.9/arm64/dt into for=
-next)
Merging ti-k3/ti-k3-next (1e3d655fe7b4 Merge branch 'ti-k3-config-next' int=
o ti-k3-next)
Merging uniphier/for-next (4f8fb65af529 Merge branch 'dt64' into for-next)
Merging clk/clk-next (3868afca01f0 Merge branch 'clk-microchip' into clk-ne=
xt)
Merging clk-samsung/for-next (3d77e6a8804a Linux 5.7)
Merging csky/linux-next (f4dd2edafba0 csky: add support for SECCOMP and SEC=
COMP_FILTER)
Merging h8300/h8300-next (9d48776fc609 Merge remote-tracking branch 'origin=
/master' into h8300-next)
Merging ia64/next (1a9d3c34c593 x86/cpu: Add Lakefield, Alder Lake and Rock=
et Lake to Intel family)
Merging m68k/for-next (382f429bb559 m68k: defconfig: Update defconfigs for =
v5.8-rc3)
Merging m68knommu/for-next (fde87ebf1daa m68k: stmark2: enable edma support=
 for dspi)
Merging microblaze/next (b3a9e3b9622a Linux 5.8-rc1)
Merging mips/mips-next (b91aff3b84c1 MIPS: Loongson64: Add ISA node for LS7=
A PCH)
Merging nds32/next (0a2e478902c7 nds32: use get_kernel_nofault in dump_mem)
Merging nios2/for-next (6b57fa4d374b nios2: signal: Mark expected switch fa=
ll-through)
Merging openrisc/for-next (b974d6482cc5 openrisc: Implement proper SMP tlb =
flushing)
Merging parisc-hd/for-next (e72b23dec1da parisc: Do not use an ordered stor=
e in pa_tlb_lock())
Merging powerpc/next (cf1ae052e073 powerpc/powernv/sriov: Remove unused but=
 set variable 'phb')
Merging fsl/next (a76bea0287ce powerpc/kmcent2: add ranges to the pci bridg=
es)
Merging soc-fsl/next (e9e4ef9116b1 soc: fsl: dpio: Remove unused inline fun=
ction qbman_write_eqcr_am_rt_register)
Merging risc-v/for-next (69373c718d8c riscv: Grab text_mutex before patchin=
g jump-labels)
Merging s390/features (9a996c67a65d s390/vmemmap: coding style updates)
Merging sh/for-next (55b4ddbb7ee5 sh: bring syscall_set_return_value in lin=
e with other architectures)
CONFLICT (content): Merge conflict in tools/testing/selftests/seccomp/secco=
mp_bpf.c
Merging sparc-next/master (dd0d718152e4 Merge tag 'spi-fix-v5.8-rc2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging uml/linux-next (f6e8c474390b um: virtio: Replace zero-length array =
with flexible-array)
Merging xtensa/xtensa-for-next (8824c1af3af2 xtensa: add boot subdirectorie=
s build artifacts to 'targets')
CONFLICT (content): Merge conflict in tools/testing/selftests/seccomp/secco=
mp_bpf.c
Merging fscrypt/master (880253eacd30 fscrypt: document inline encryption su=
pport)
Merging afs/afs-next (8409f67b6437 afs: Adjust the fileserver rotation algo=
rithm to reprobe/retry more quickly)
Merging btrfs/for-next (460d6d4557e9 Merge branch 'for-next-current-v5.7-20=
200729' into for-next-20200729)
Merging ceph/master (7ed286f3e061 libceph: don't omit used_replica in targe=
t_copy())
Merging cifs/for-next (94c31635d968 cifs: convert to use be32_add_cpu())
Merging configfs/for-next (059ccbfff8a8 configfs: use flush file op to comm=
it writes to a binary file)
Merging ecryptfs/next (8b614cb8f1dc Merge tag '5.6-rc4-smb3-fixes' of git:/=
/git.samba.org/sfrench/cifs-2.6)
Merging erofs/dev (b3a9e3b9622a Linux 5.8-rc1)
Merging exfat/dev (7c9d236387fa exfat: optimize exfat_zeroed_cluster())
Merging ext3/for_next (2a347b9461f0 Merge name event comparison fix.)
Merging ext4/dev (cdac93ee8a5c jbd2: make sure jh have b_transaction set in=
 refile/unfile_buffer)
Merging f2fs/dev (33ba0a4869d8 f2fs: compress: disable compression mount op=
tion if compression is off)
CONFLICT (content): Merge conflict in Documentation/filesystems/f2fs.rst
Merging fsverity/fsverity (f3db0bed4583 fs-verity: use smp_load_acquire() f=
or ->i_verity_info)
Merging fuse/for-next (31070f6ccec0 fuse: Fix parameter for FS_IOC_{GET,SET=
}FLAGS)
Merging jfs/jfs-next (7aba5dcc2346 jfs: Replace zero-length array with flex=
ible-array member)
Merging nfs/linux-next (dbc4fec6b6dd NFSv4.0 allow nconnect for v4.0)
Merging nfs-anna/linux-next (65caafd0d214 SUNRPC reverting d03727b248d0 ("N=
FSv4 fix CLOSE not waiting for direct IO compeletion"))
Merging nfsd/nfsd-next (b3a9e3b9622a Linux 5.8-rc1)
Merging orangefs/for-next (0df556457748 orangefs: convert get_user_pages() =
--> pin_user_pages())
Merging overlayfs/overlayfs-next (4518dfcf761e ovl: fix lookup of indexed h=
ardlinks with metacopy)
Merging ubifs/next (f37e99aca03f Merge tag 's390-5.8-6' of git://git.kernel=
.org/pub/scm/linux/kernel/git/s390/linux into master)
Merging v9fs/9p-next (aab6c873cf9b 9p: remove unused code in 9p)
Merging xfs/for-next (818d5a91559f fs/xfs: Support that ioctl(SETXFLAGS/GET=
XFLAGS) can set/get inode DAX on XFS.)
Merging zonefs/for-next (2f4b7462d2fa zonefs: update documentation to refle=
ct zone size vs capacity)
CONFLICT (content): Merge conflict in fs/buffer.c
Merging iomap/iomap-for-next (979045f83ced iomap: fall back to buffered wri=
tes for invalidation failures)
Merging djw-vfs/vfs-for-next (e4f9ba20d3b8 fs/xfs: Update xfs_ioctl_setattr=
_dax_invalidate())
Merging file-locks/locks-next (5ef159681309 locks: add locks_move_blocks in=
 posix_lock_inode)
Merging vfs/for-next (506674118072 Merge branches 'fixes' and 'work.quota-c=
ompat' into for-next)
CONFLICT (content): Merge conflict in arch/x86/kernel/fpu/xstate.c
CONFLICT (content): Merge conflict in arch/powerpc/kernel/ptrace/ptrace-vie=
w.c
Merging printk/for-next (22defd92a98c Merge remote-tracking branch 'tip/loc=
king/header' into for-next)
Merging pci/next (0c5192ef0f03 Merge branch 'remotes/lorenzo/pci/xilinx')
Merging pstore/for-next/pstore (fd49e03280e5 pstore: Fix linking when crypt=
o API disabled)
Merging hid/for-next (bc12a7f8e273 Merge branch 'for-5.8/upstream-fixes' in=
to for-next)
Merging i2c/i2c/for-next (5b2148773f50 Merge branch 'i2c/for-current' into =
i2c/for-next)
Merging i3c/i3c/next (b4203ce05563 i3c master: GETMRL's 3rd byte is optiona=
l even with BCR_IBI_PAYLOAD)
Merging dmi/dmi-for-next (a3d13a0a23ea Replace HTTP links with HTTPS ones: =
DMI/SMBIOS SUPPORT)
Merging hwmon-staging/hwmon-next (2fdf8f7f0867 hwmon: (sparx5) Make symbol =
's5_temp_match' static)
Merging jc_docs/docs-next (e210c66d567c doc/zh_CN: add cpu-load Chinese ver=
sion)
CONFLICT (content): Merge conflict in Documentation/filesystems/f2fs.rst
Merging v4l-dvb/master (8f2a4a9d5ff5 media: dvbdev.h: keep * together with =
the type)
Merging v4l-dvb-next/master (0d6db85131e0 Revert "media: atomisp: keep the =
ISP powered on when setting it")
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (78b38a56af0f Merge branch 'pm-cpuidle' into linux-ne=
xt)
Merging cpufreq-arm/cpufreq/arm/linux-next (887d5fc82cb4 cpufreq: Add Tegra=
194 cpufreq driver)
Merging cpupower/cpupower (fa0866a1d1be cpupower: Replace HTTP links with H=
TTPS ones)
Merging opp/opp/linux-next (06a8a059e88b opp: Allow disabled OPPs in dev_pm=
_opp_get_freq())
Merging thermal/thermal/linux-next (332bc8ebab2c thermal: qcom: tsens-v0_1:=
 Add support for MSM8939)
Merging thermal-rzhang/next (54ecb8f7028c Linux 5.4-rc1)
Merging thermal-soc/next (6c375eccded4 thermal: db8500: Rewrite to be a pur=
e OF sensor)
Merging ieee1394/for-next (67f8e65e4fc1 firewire: net: remove set but not u=
sed variable 'guid')
Merging dlm/next (fa601a9ebd49 fs: dlm: implement tcp graceful shutdown)
Merging swiotlb/linux-next (4cdfb27ba80d xen/swiotlb: remember having calle=
d xen_create_contiguous_region())
Merging rdma/for-next (71cab8ef5c9e RDMA/mlx5: Delete unreachable code)
Merging net-next/master (41d707b7332f fib: fix fib_rules_ops indirect calls=
 wrappers)
CONFLICT (content): Merge conflict in lib/Kconfig
CONFLICT (content): Merge conflict in kernel/bpf/btf.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/sfc/efx.c
Applying: fix up for "enum pci_channel_state" to "pci_channel_state_t" chan=
ge
Merging bpf-next/master (1c45746c4faf selftests/bpf: Don't destroy failed l=
ink)
Merging ipsec-next/master (b328ecc468f8 xfrm: Make the policy hold queue wo=
rk with VTI.)
Merging mlx5-next/mlx5-next (042dd05bddbd RDMA/mlx5: ConnectX-7 new capabil=
ities to set relaxed ordering by UMR)
Merging netfilter-next/master (42f36eba71c4 netfilter: ip6tables: Remove re=
dundant null checks)
Merging ipvs-next/master (66846b7d058b Merge branch 'bnxt_en-Driver-update-=
for-net-next')
Merging wireless-drivers-next/master (dfecd3e00cd3 Merge branch 'net-dsa-mv=
88e6xxx-port-mtu-support')
Merging bluetooth/master (58789a1990c1 Bluetooth: hci_qca: Stop collecting =
memdump again for command timeout during SSR)
Applying: Bluetooth: fix for introduction of sockptr_t
Merging mac80211-next/master (29a720c1042f Merge branch 'Marvell-mvpp2-impr=
ovements')
Merging gfs2/for-next (0d7853ebbba3 gfs2: Pass glock holder to gfs2_file_di=
rect_{read,write})
Merging mtd/mtd/next (fbd9b5437b66 mtd: rawnand: stm32_fmc2: get resources =
from parent node)
Merging nand/nand/next (da151e3458c8 dt-bindings: mtd: fsl-upm-nand: Deprec=
ate chip-delay and fsl, upm-wait-flags)
Merging spi-nor/spi-nor/next (e93a977367b2 mtd: revert "spi-nor: intel: pro=
vide a range for poll_timout")
Merging crypto/master (ef19f826ecea crypto: x86 - Put back integer parts of=
 include/asm/inst.h)
CONFLICT (content): Merge conflict in Documentation/crypto/api-intro.rst
Merging drm/drm-next (5de5b6ecf97a drm/ttm/nouveau: don't call tt destroy c=
allback on alloc failure.)
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_gem.c
Merging amdgpu/drm-next (5c3fb04a016c drm/amd/powerplay: optimize the mclk =
dpm policy settings)
Merging drm-intel/for-linux-next (6f4d0688f9ff drm/i915: Remove i915_reques=
t.lock requirement for execution callbacks)
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_probe_helper.c
Merging drm-tegra/drm/tegra/for-next (4fba6d22ca9a drm/tegra: plane: Suppor=
t 180=C2=B0 rotation)
Merging drm-misc/for-linux-next (2d889db7626d drm: xlnx: Fix typo in parame=
ter description)
Merging drm-msm/msm-next (00be2abf1413 drm/msm: use kthread_create_worker i=
nstead of kthread_run)
Merging mali-dp/for-upstream/mali-dp (f634c6a80287 dt/bindings: display: Ad=
d optional property node define for Mali DP500)
Merging imx-drm/imx-drm/next (408a85e31e3e drm/imx: imx-tve: Delete an erro=
r message in imx_tve_bind())
Merging etnaviv/etnaviv/next (c5d5a32ead1e drm/etnaviv: fix ref count leak =
via pm_runtime_get_sync)
Merging regmap/for-next (c9fadf212afd Merge remote-tracking branch 'regmap/=
for-5.9' into regmap-next)
Merging sound/for-next (2e5a8e1527a8 ALSA: usb-audio: endpoint : remove nee=
dless check before usb_free_coherent())
Merging sound-asoc/for-next (334a41f42832 Merge remote-tracking branch 'aso=
c/for-5.9' into asoc-next)
Merging modules/modules-next (c6a8b84da4c2 modules: linux/moduleparam.h: dr=
op duplicated word in a comment)
Merging input/next (74d905d2d38a Input: atmel_mxt_ts - only read messages i=
n mxt_acquire_irq() when necessary)
Merging block/for-next (c50b97835cbb Merge branch 'for-5.9/drivers' into fo=
r-next)
CONFLICT (content): Merge conflict in fs/btrfs/disk-io.c
Merging device-mapper/for-next (4861f596091f Merge branch 'dm-5.9' into for=
-next)
CONFLICT (content): Merge conflict in drivers/md/dm-crypt.c
Merging pcmcia/pcmcia-next (46d079790663 pcmcia: make pccard_loop_tuple() s=
tatic)
Merging mmc/next (ac42e4e906b6 dt-bindings: mmc: mediatek: Add document for=
 mt6779)
Merging mfd/for-mfd-next (5a0376e58b7f mfd: Replace HTTP links with HTTPS o=
nes)
Merging backlight/for-backlight-next (7eb99a39ef76 video: backlight: cr_bll=
cd: Remove unused variable 'intensity')
Merging battery/for-next (707d678a5c7c power: supply: bq27xxx_battery: Add =
the BQ28z610 Battery monitor)
Merging regulator/for-next (f4124acff8a9 Merge remote-tracking branch 'regu=
lator/for-5.9' into regulator-next)
Merging security/next-testing (8ca4a830cefa Merge branch 'next-general' int=
o next-testing)
Applying: Revert "Wire UFFD up to SELinux"
Applying: Revert "Teach SELinux about anonymous inodes"
Applying: Revert "Add a new LSM-supporting anonymous inode interface"
Merging apparmor/apparmor-next (e37986097ba6 apparmor: Use true and false f=
or bool variable)
Merging integrity/next-integrity (3db0d0c276a7 integrity: remove redundant =
initialization of variable ret)
Merging keys/keys-next (b6f61c314649 keys: Implement update for the big_key=
 type)
Merging safesetid/safesetid-next (4d63f7c2e382 security: Add LSM hooks to s=
et*gid syscalls)
Merging selinux/next (54b27f9287a7 selinux: complete the inlining of hashta=
b functions)
Merging smack/next (42a2df3e829f Smack: prevent underflow in smk_set_cipso(=
))
Merging tomoyo/master (ba47d845d715 Linux 5.8-rc6)
Merging tpmdd/next (85467f63a05c tpm: Add support for event log pointer fou=
nd in TPM2 ACPI table)
Merging watchdog/master (92ed30191993 Linux 5.8-rc7)
Merging iommu/next (e46b3c0d011e Merge tag 'arm-smmu-updates' of git://git.=
kernel.org/pub/scm/linux/kernel/git/will/linux into next)
CONFLICT (content): Merge conflict in drivers/iommu/Kconfig
Applying: merge fix for "dma-mapping: make support for dma ops optional"
Merging vfio/next (ccd59dce1a21 vfio/type1: Refactor vfio_iommu_type1_ioctl=
())
Merging audit/next (b43870c74f3f audit: report audit wait metric in audit s=
tatus reply)
Merging devicetree/for-next (fb820b494acb of: property: Add device link sup=
port for pinctrl-0 through pinctrl-8)
CONFLICT (modify/delete): Documentation/devicetree/bindings/display/bridge/=
ti,sn65dsi86.txt deleted in HEAD and modified in devicetree/for-next. Versi=
on devicetree/for-next of Documentation/devicetree/bindings/display/bridge/=
ti,sn65dsi86.txt left in tree.
$ git rm -f Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.t=
xt
Applying: fix for "dt-bindings: drm/bridge: Replace HTTP links with HTTPS o=
nes"
Merging mailbox/mailbox-for-next (e9f901dc05c0 mailbox: qcom: Add ipq6018 a=
pcs compatible)
Merging spi/for-next (11ba28229f82 Merge remote-tracking branch 'spi/for-5.=
9' into spi-next)
CONFLICT (content): Merge conflict in drivers/memory/Makefile
CONFLICT (content): Merge conflict in drivers/memory/Kconfig
Merging tip/auto-latest (4733c2b49742 Merge branch 'WIP.x86/entry')
CONFLICT (content): Merge conflict in drivers/spi/spi.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/msm/msm_drv.c
CONFLICT (content): Merge conflict in arch/x86/include/asm/inst.h
CONFLICT (content): Merge conflict in arch/x86/include/asm/fpu/xstate.h
Applying: Revert "sched: Remove sched_setscheduler*() EXPORTs"
Merging clockevents/timers/drivers/next (9fba22584e54 clocksource: Ingenic:=
 Add support for the Ingenic X1000 OST.)
Merging edac/edac-for-next (399cd3b33cef Merge branch 'edac-urgent' into ed=
ac-for-next)
Merging irqchip/irq/irqchip-next (bb403111e017 irqchip/imx-intmux: Implemen=
t intmux runtime power management)
Merging ftrace/for-next (29ce24519c06 ring-buffer: Do not trigger a WARN if=
 clock going backwards is detected)
Merging rcu/rcu/next (c86409b6f860 rcu: Move rcu_cpu_started per-CPU variab=
le to rcu_data)
CONFLICT (content): Merge conflict in arch/x86/entry/common.c
Merging kvm/linux-next (c34b26b98cac KVM: MIPS: clean up redundant 'kvm_run=
' parameters)
CONFLICT (content): Merge conflict in arch/x86/kernel/kvm.c
Applying: fix up for idtentry_{enter,exit}_cond_rcu() renaming
Merging kvm-arm/next (a394cf6e854d Merge branch 'kvm-arm64/misc-5.9' into k=
vmarm-master/next-WIP)
CONFLICT (content): Merge conflict in arch/arm64/kvm/mmu.c
CONFLICT (content): Merge conflict in arch/arm64/kvm/handle_exit.c
CONFLICT (content): Merge conflict in arch/arm64/include/asm/kvm_coproc.h
Merging kvm-ppc/kvm-ppc-next (81ab595ddd3c KVM: PPC: Book3S HV: Rework secu=
re mem slot dropping)
Merging kvms390/next (23a60f834406 s390/kvm: diagnose 0x318 sync and reset)
CONFLICT (content): Merge conflict in include/uapi/linux/kvm.h
Merging xen-tip/linux-next (ba8c42348897 xen/xenbus: Fix a double free in x=
enbus_map_ring_pv())
Merging percpu/for-next (4fa640dc5230 Merge tag 'vfio-v5.8-rc7' of git://gi=
thub.com/awilliam/linux-vfio into master)
Merging workqueues/for-next (10cdb1575954 workqueue: use BUILD_BUG_ON() for=
 compile time test instead of WARN_ON())
Merging drivers-x86/for-next (61781298521e platform/x86: thinkpad_acpi: add=
 documentation for battery charge control)
Merging chrome-platform/for-next (e48bc01ed5ad platform/chrome: cros_ec_sen=
sorhub: Fix EC timestamp overflow)
Merging hsi/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging leds/for-next (2742b4192a27 Make LEDS_LP55XX_COMMON depend on I2C t=
o fix build errors:)
Merging ipmi/for-next (634b06def11c ipmi/watchdog: add missing newlines whe=
n printing parameters by sysfs)
Merging driver-core/driver-core-next (eea2c51f81df Merge 5.8-rc7 into drive=
r-core-next)
CONFLICT (content): Merge conflict in include/linux/device.h
Merging usb/usb-next (ab4dc051d7b3 usb: mtu3: simplify mtu3_req_complete())
Merging usb-gadget/next (f5e46aa4a124 usb: dwc3: gadget: when the started l=
ist is empty stop the active xfer)
Merging usb-serial/usb-next (d2a4309c1ab6 USB: serial: qcserial: add EM7305=
 QDL product ID)
Merging usb-chipidea-next/ci-for-usb-next (d6f93d21001e usb: chipidea: imx:=
 get available runtime dr mode for wakeup setting)
Merging phy-next/next (3d7b0ca5300b phy: qualcomm: fix setting of tx_deamp_=
3_5db when device property read fails)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging tty/tty-next (cc816969d7b5 serial: 8250_dw: Fix common clocks usage=
 race condition)
CONFLICT (content): Merge conflict in drivers/video/fbdev/core/fbcon.c
CONFLICT (content): Merge conflict in drivers/tty/serial/qcom_geni_serial.c
Merging char-misc/char-misc-next (22362aa30bad habanalabs: remove unused bu=
t set variable 'ctx_asid')
Merging extcon/extcon-next (b3a9e3b9622a Linux 5.8-rc1)
Merging soundwire/next (a81844034e5b Soundwire: intel_init: save Slave(s) _=
ADR info in sdw_intel_ctx)
Merging thunderbolt/next (ef7e12078ab8 thunderbolt: Fix old style declarati=
on warning)
Applying: thunderbolt: merge fix for kunix_resource changes
Merging staging/staging-next (dbc676e722db drivers: staging: audio: Fix the=
 missing header file for helper file)
CONFLICT (add/add): Merge conflict in Documentation/devicetree/bindings/soc=
/microchip/atmel,at91rm9200-tcb.yaml
Merging mux/for-next (05f19f7f8944 mux: adgs1408: Add mod_devicetable.h and=
 remove of_match_ptr)
Merging icc/icc-next (12a400b016ab interconnect: Mark all dummy functions a=
s static inline)
Merging dmaengine/next (fe541ee394a7 Merge branch 'for-linus' into next)
CONFLICT (content): Merge conflict in drivers/dma/idxd/sysfs.c
CONFLICT (content): Merge conflict in MAINTAINERS
Merging cgroup/for-next (936f2a70f207 cgroup: add cpu.stat file to root cgr=
oup)
Merging scsi/for-next (75d9aff7fd8d Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (b12149f2698c scsi: virtio-scsi: Correctly handle=
 the case where all LUNs are unplugged)
Merging vhost/linux-next (97df218cd208 virtio_net: CTRL_GUEST_OFFLOADS depe=
nds on CTRL_VQ)
Applying: virtio_vdpa: fix legacy features handling
Merging rpmsg/for-next (f6cac270d142 Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (b470cef1ffac gpio: rcar: Use irqchip template)
Merging gpio-brgl/gpio/for-next (df51f402e3b1 tools: gpio: fix spurious clo=
se warning in gpio-event-mon)
Merging gpio-intel/for-next (4941b8dedb3f gpio: sch: Add a blank line betwe=
en declaration and code)
Merging pinctrl/for-next (43dd0f2fff0e Merge branch 'devel' into for-next)
CONFLICT (content): Merge conflict in drivers/pinctrl/pinctrl-single.c
CONFLICT (content): Merge conflict in drivers/pinctrl/intel/pinctrl-baytrai=
l.c
Merging pinctrl-intel/for-next (b4f2fcb53487 pinctrl: intel: Add Intel Emmi=
tsburg pin controller support)
Merging pinctrl-samsung/for-next (b3a9e3b9622a Linux 5.8-rc1)
Merging pwm/for-next (b8fb642afa02 pwm: iqs620a: Use lowercase hexadecimal =
literals for consistency)
Merging userns/for-next (7fce69dff8db Implement kernel_execve)
Merging ktest/for-next (3ff6685579ae ktest.pl: Add MAIL_MAX_SIZE to limit t=
he amount of log emailed)
Merging random/dev (ab9a7e27044b random: avoid warnings for !CONFIG_NUMA bu=
ilds)
Merging kselftest/next (850d0cc64c8e selftests/harness: Limit step counter =
reporting)
Merging y2038/y2038 (c4e71212a245 Revert "drm/etnaviv: reject timeouts with=
 tv_nsec >=3D NSEC_PER_SEC")
Merging livepatching/for-next (bf14b015bf51 Merge branch 'for-5.9/selftests=
-cleanup' into for-next)
Merging coresight/next (342c8a1d1d9e coresight: etm4x: Fix save/restore dur=
ing cpu idle)
Merging rtc/rtc-next (3d6cfb36ed71 rtc: ds1374: remove unused define)
Merging nvdimm/libnvdimm-for-next (cbeb0310cfda Merge branch 'for-5.9/firmw=
are-activate' into libnvdimm-for-next)
Merging at24/at24/for-next (8f3d9f354286 Linux 5.7-rc1)
Merging ntb/ntb-next (b3a9e3b9622a Linux 5.8-rc1)
Merging seccomp/for-next/seccomp (c97aedc52dce selftests/seccomp: Test SECC=
OMP_IOCTL_NOTIF_ADDFD)
CONFLICT (content): Merge conflict in tools/testing/selftests/seccomp/secco=
mp_bpf.c
Merging kspp/for-next/kspp (36f78758dca5 Merge branch 'kspp/tasklets/new-ap=
i/v1' into for-next/kspp)
CONFLICT (content): Merge conflict in net/ipv6/ip6_flowlabel.c
CONFLICT (content): Merge conflict in drivers/infiniband/core/uverbs_cmd.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_edid.c
Merging gnss/gnss-next (48778464bb7d Linux 5.8-rc2)
Merging fsi/next (e1059cacc408 fsi: aspeed: Support CFAM reset GPIO)
Merging slimbus/for-next (b3a9e3b9622a Linux 5.8-rc1)
Merging nvmem/for-next (a24ef5be460b nvmem: qcom-spmi-sdam: Enable multiple=
 devices)
Merging xarray/xarray (27586ca786a7 XArray: Handle retry entries within xas=
_find_marked)
Merging hyperv/hyperv-next (3245b7b959d5 hv_netvsc: Use vmbus_requestor to =
generate transaction IDs for VMBus hardening)
Merging auxdisplay/auxdisplay (3f03b6498172 auxdisplay: charlcd: Reuse hex_=
to_bin() instead of custom code)
Merging kgdb/kgdb/for-next (2c308ef41351 kgdb: Make "kgdbcon" work properly=
 with "kgdb_earlycon")
Merging pidfd/for-next (da83d0cb9237 Merge branch 'cap_checkpoint_restore' =
into for-next)
CONFLICT (content): Merge conflict in fs/file.c
CONFLICT (content): Merge conflict in arch/um/Kconfig
CONFLICT (content): Merge conflict in arch/sh/kernel/process_32.c
CONFLICT (content): Merge conflict in arch/riscv/Kconfig
CONFLICT (content): Merge conflict in arch/csky/kernel/process.c
CONFLICT (content): Merge conflict in arch/csky/Kconfig
Merging devfreq/devfreq-next (27a69714450f PM / devfreq: Fix the wrong end =
with semicolon)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging hmm/hmm (7d17e83abec1 mm/hmm/test: use the new migration invalidati=
on)
CONFLICT (content): Merge conflict in drivers/gpu/drm/nouveau/nvkm/subdev/m=
mu/vmmgp100.c
CONFLICT (content): Merge conflict in arch/powerpc/kvm/book3s_hv_uvmem.c
Merging fpga/for-next (eacfbf589c90 fpga: dfl: pci: add device id for Intel=
 FPGA PAC N3000)
Merging kunit/test (48778464bb7d Linux 5.8-rc2)
Merging cel/cel-next (0a8e7b7d0846 SUNRPC: Revert 241b1f419f0e ("SUNRPC: Re=
move xdr_buf_trim()"))
Merging generic-ioremap/for-next (4bdc0d676a64 remove ioremap_nocache and d=
evm_ioremap_nocache)
Merging cfi/cfi/next (11399346ac39 mtd: Replace zero-length array with flex=
ible-array)
Merging kunit-next/kunit (d43c7fb05765 kunit: tool: fix improper treatment =
of file location)
Merging trivial/for-next (c1a371cf80fb printk: fix global comment)
Merging zx2c4/for-next (16fbf79b0f83 Linux 5.6-rc7)
Merging mhi/mhi-next (d0dc371b39a7 bus: mhi: fix doubled words and struct i=
mage_info kernel-doc)
Merging notifications/notifications-pipe-core (55cfafc50262 watch_queue: sa=
mple: Display mount tree change notifications)
Merging fsinfo/fsinfo-core (4c5a79e9b772 samples: add error state informati=
on to test-fsinfo.c)
Merging memblock/for-next (3346dd99fb4c MAINTAINERS: remove "PKUNITY SOC DR=
IVERS" entry)
CONFLICT (modify/delete): arch/unicore32/kernel/process.c deleted in memblo=
ck/for-next and modified in HEAD. Version HEAD of arch/unicore32/kernel/pro=
cess.c left in tree.
$ git rm -f arch/unicore32/kernel/process.c
Merging set_fs/set_fs-rw (2750e3608b79 fs: don't allow splice read/write wi=
thout explicit ops)
CONFLICT (content): Merge conflict in lib/debugobjects.c
CONFLICT (content): Merge conflict in drivers/power/supply/da9030_battery.c
CONFLICT (content): Merge conflict in drivers/acpi/battery.c
CONFLICT (content): Merge conflict in arch/powerpc/mm/numa.c
Merging init/init-user-pointers (d95edd34a7ef initramfs: use vfs_utimes in =
do_copy)
CONFLICT (content): Merge conflict in drivers/md/md.c
Merging akpm-current/current (340456669d5a ipc/shm.c: Remove the superfluou=
s break)
CONFLICT (content): Merge conflict in net/sctp/socket.c
CONFLICT (content): Merge conflict in mm/cma.h
CONFLICT (content): Merge conflict in lib/cpumask.c
CONFLICT (content): Merge conflict in lib/Makefile
CONFLICT (content): Merge conflict in kernel/rcu/tree.c
CONFLICT (content): Merge conflict in fs/crypto/keysetup_v1.c
CONFLICT (content): Merge conflict in drivers/s390/crypto/ap_bus.h
CONFLICT (content): Merge conflict in drivers/crypto/mediatek/mtk-aes.c
CONFLICT (content): Merge conflict in arch/arm64/mm/init.c
CONFLICT (content): Merge conflict in Documentation/filesystems/proc.rst
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
Merging akpm/master (a6f7aeb7c083 virtio: pci: constify ioreadX() iomem arg=
ument (as in generic implementation))

--Sig_/2wUp9x/p/pVdlnoIbMenKCJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8iszMACgkQAVBC80lX
0GzrvQf/Z49pGBSZY4HNW544Fc5sjhh30bxP7lDe6EYI4NLEiE8MxYBkrrVKXz35
282nXL+BqsWI3zKeIum0n/BvYVaAY2IL9Ttwyv/HEIZ/d4SCZ2Rq1ZtKdsZrkDap
nfY/JIoXGbjansz+cGFT5G3Sw7jtKwyo9Tggwxg9t0IqDRPZWOY1V+aCLnZDBW4R
0kNHxfo0+IWJAthBNkbb61v9bYh3JWSKY+UJW8R7LKmaZB6eQlx3t+nN0VGHv+eX
YEyiV3EaYhDRrTo86NMLsmUMh9KtsZnJYNrAaGihOQSBnnfIW1S+z8D4pBeMEhv/
WrM2kBpyjMq8LG82ipcQz99s3c+uKQ==
=eRyS
-----END PGP SIGNATURE-----

--Sig_/2wUp9x/p/pVdlnoIbMenKCJ--
