Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE16F23D6BC
	for <lists+linux-next@lfdr.de>; Thu,  6 Aug 2020 08:21:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726149AbgHFGVU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 6 Aug 2020 02:21:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726051AbgHFGVT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 6 Aug 2020 02:21:19 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5AF0C061574;
        Wed,  5 Aug 2020 23:21:18 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BMdfh6CNWz9sSG;
        Thu,  6 Aug 2020 16:21:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1596694876;
        bh=tYlA+oKzbEndy10ckE8tmtEttgkcARim8RigdpBVQZw=;
        h=Date:From:To:Cc:Subject:From;
        b=M/6oKnh0fhWfO6wGV88AHvBqy+em/kO2SqfageAtBWdfL9+7qvtacZFUGLzhXQssE
         hgaXPJUBAuavMWk+QUZX9IXs/X6wqo82vgIc40yOWPzlhmEjxo2b487fbgkyzdZ0pl
         YbznBkOSvzKYpDjnNUx1WVYYXZOJQvoCuAW36Yj6yBTVWaIK8muxVUJiCMldFNxqkT
         PxaaZGp80lta8Fl6w63BDWbHcIk/Z8NvJInSQ2JfQ9rnm9rd2jubzQkt/QFUIIT9xO
         M/n1+ovxmnHCXb7qJOXOqn+nKaXGKlqfDbnsheUcC6MjuF1YDgWnl67YLd7UshL6gL
         BeGWTy4OXva2g==
Date:   Thu, 6 Aug 2020 16:21:16 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Aug 6
Message-ID: <20200806162116.1d033db0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ABqK4EJRkuCs=aaIZTZ18s2";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ABqK4EJRkuCs=aaIZTZ18s2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

News: The merge window has opened, so please do not add any v5.10
related material to your linux-next included branches until after the
merge window closes again.

Changes since 20200805:

My fixes tree contains:

  dbf24e30ce2e ("device_cgroup: Fix RCU list debugging warning")

Non-merge commits (relative to Linus' tree): 8844
 9336 files changed, 508184 insertions(+), 169064 deletions(-)

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
Merging origin/master (fffe3ae0ee84 Merge tag 'for-linus-hmm' of git://git.=
kernel.org/pub/scm/linux/kernel/git/rdma/rdma)
Merging fixes/master (dbf24e30ce2e device_cgroup: Fix RCU list debugging wa=
rning)
Merging kbuild-current/fixes (bcf876870b95 Linux 5.8)
Merging arc-current/for-curr (11ba468877bb Linux 5.8-rc5)
Merging arm-current/fixes (5c6360ee4a0e ARM: 8988/1: mmu: fix crash in EFI =
calls due to p4d typo in create_mapping_late())
Merging arm64-fixes/for-next/fixes (6a7389f0312f MAINTAINERS: Include drive=
rs subdirs for ARM PMU PROFILING AND DEBUGGING entry)
Merging arm-soc-fixes/arm/fixes (fe1d899f4212 ARM: dts: keystone-k2g-evm: f=
ix rgmii phy-mode for ksz9031 phy)
Merging uniphier-fixes/fixes (48778464bb7d Linux 5.8-rc2)
Merging drivers-memory-fixes/fixes (b3a9e3b9622a Linux 5.8-rc1)
Merging m68k-current/for-linus (382f429bb559 m68k: defconfig: Update defcon=
figs for v5.8-rc3)
Merging powerpc-fixes/fixes (bcf876870b95 Linux 5.8)
Merging s390-fixes/fixes (8e911bd8afe0 s390/test_unwind: fix possible memle=
ak in test_unwind())
Merging sparc/master (17ec0a17e90f sparc: Use fallthrough pseudo-keyword)
Merging fscrypt-current/for-stable (2b4eae95c736 fscrypt: don't evict dirty=
 inodes after removing key)
Merging net/master (ac3a0c847296 Merge git://git.kernel.org/pub/scm/linux/k=
ernel/git/netdev/net)
Merging bpf/master (ac3a0c847296 Merge git://git.kernel.org/pub/scm/linux/k=
ernel/git/netdev/net)
Merging ipsec/master (ac3a0c847296 Merge git://git.kernel.org/pub/scm/linux=
/kernel/git/netdev/net)
Merging netfilter/master (4203b19c2796 netfilter: flowtable: Set offload ti=
meout when adding flow)
Merging ipvs/master (eadede5f9362 Merge branch 'hns3-fixes')
Merging wireless-drivers/master (1cfd3426ef98 ath10k: Fix NULL pointer dere=
ference in AHB device probe)
Merging mac80211/master (ac3a0c847296 Merge git://git.kernel.org/pub/scm/li=
nux/kernel/git/netdev/net)
Merging rdma-fixes/for-rc (bcf876870b95 Linux 5.8)
Merging sound-current/for-linus (ed4d0a4aaf56 ALSA: hda/tegra: Add 100us dm=
a stop delay)
Merging sound-asoc-fixes/for-linus (68122177749a Merge remote-tracking bran=
ch 'asoc/for-5.9' into asoc-linus)
Merging regmap-fixes/for-linus (2b0f61e27f75 Merge remote-tracking branch '=
regmap/for-5.8' into regmap-linus)
Merging regulator-fixes/for-linus (e30c06f230a9 Merge remote-tracking branc=
h 'regulator/for-5.9' into regulator-linus)
Merging spi-fixes/for-linus (cdce7131f268 Merge remote-tracking branch 'spi=
/for-5.9' into spi-linus)
Merging pci-current/for-linus (b361663c5a40 PCI/ASPM: Disable ASPM on ASMed=
ia ASM1083/1085 PCIe-to-PCI bridge)
Merging driver-core.current/driver-core-linus (92ed30191993 Linux 5.8-rc7)
Merging tty.current/tty-linus (92ed30191993 Linux 5.8-rc7)
Merging usb.current/usb-linus (92ed30191993 Linux 5.8-rc7)
Merging usb-gadget-fixes/fixes (8778eb0927dd usb: gadget: function: fix mis=
sing spinlock in f_uac1_legacy)
Merging usb-serial-fixes/usb-linus (92ed30191993 Linux 5.8-rc7)
Merging usb-chipidea-fixes/ci-for-usb-stable (2d79b3360dcc usb: chipidea: c=
ore: add wakeup support for extcon)
Merging phy/fixes (e365831fbdd6 phy: qualcomm: fix return value check in qc=
om_ipq806x_usb_phy_probe())
Merging staging.current/staging-linus (92ed30191993 Linux 5.8-rc7)
Merging char-misc.current/char-misc-linus (92ed30191993 Linux 5.8-rc7)
Merging soundwire-fixes/fixes (bf6d6e68d202 soundwire: intel: fix memory le=
ak with devm_kasprintf)
Merging thunderbolt-fixes/fixes (ba47d845d715 Linux 5.8-rc6)
Merging input-current/for-linus (a50ca29523b1 Input: elan_i2c - add more ha=
rdware ID for Lenovo laptops)
Merging crypto-current/master (3cbfe80737c1 crypto: sa2ul - Fix inconsisten=
t IS_ERR and PTR_ERR)
Merging ide/master (6800cd8cbc6e ide-acpi: use %*ph to print small buffer)
Merging vfio-fixes/for-linus (b872d0640840 vfio/pci: fix racy on error and =
request eventfd ctx)
Merging kselftest-fixes/fixes (3c01655ac82e kselftest: ksft_test_num return=
 type should be unsigned)
Merging modules-fixes/modules-linus (57baec7b1b04 scripts/nsdeps: make sure=
 to pass all module source files to spatch)
Merging dmaengine-fixes/fixes (0b5ad7b9522e Merge branch 'for-linus' into f=
ixes)
CONFLICT (content): Merge conflict in MAINTAINERS
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
Merging kvm-fixes/master (830f01b089b1 KVM: SVM: Fix disable pause loop exi=
t/pause filtering capability on SVM)
Merging kvms390-fixes/master (774911290c58 KVM: s390: reduce number of IO p=
ins to 1)
Merging hwmon-fixes/hwmon (ba47d845d715 Linux 5.8-rc6)
Merging nvdimm-fixes/libnvdimm-fixes (543094e19c82 nvdimm/region: always sh=
ow the 'align' attribute)
Merging btrfs-fixes/next-fixes (061e532804fa Merge branch 'misc-5.8' into n=
ext-fixes)
Merging vfs-fixes/fixes (5fff09bc1415 xtensa: fix access check in csum_and_=
copy_from_user)
Merging dma-mapping-fixes/for-linus (1ec8cd744c0c Revert "dma-pool: do not =
allocate pool memory from CMA")
Merging i3c-fixes/master (6fbc7275c7a9 Linux 5.2-rc7)
Merging drivers-x86-fixes/fixes (bcf876870b95 Linux 5.8)
Merging samsung-krzk-fixes/fixes (b3a9e3b9622a Linux 5.8-rc1)
Merging pinctrl-samsung-fixes/pinctrl-fixes (b3a9e3b9622a Linux 5.8-rc1)
Merging devicetree-fixes/dt/linus (0115e6c98c22 dt-bindings: clock: imx: Fi=
x e-mail address)
Merging scsi-fixes/fixes (3f0dcfbcd2e1 scsi: core: Run queue in case of I/O=
 resource contention failure)
Merging drm-fixes/drm-fixes (887c909dd5d5 Merge tag 'amd-drm-fixes-5.8-2020=
-07-30' of git://people.freedesktop.org/~agd5f/linux into drm-fixes)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (bcf876870b95 Linux 5.8)
Merging mmc-fixes/fixes (ebd4050c6144 mmc: sdhci-of-aspeed: Fix clock divid=
er calculation)
Merging rtc-fixes/rtc-fixes (b3a9e3b9622a Linux 5.8-rc1)
Merging gnss-fixes/gnss-linus (48778464bb7d Linux 5.8-rc2)
Merging hyperv-fixes/hyperv-fixes (77b48bea2fee Drivers: hv: Change flag to=
 write log level in panic msg to false)
Merging soc-fsl-fixes/fix (fe8fe7723a3a soc: fsl: dpio: register dpio irq h=
andlers after dpio create)
Merging risc-v-fixes/fixes (1b4cab57f3ba riscv: disable stack-protector for=
 vDSO)
Merging pidfd-fixes/fixes (7665a47f70b3 signal: fix typo in dequeue_synchro=
nous_signal())
Merging fpga-fixes/fixes (8614afd689df fpga: dfl: fix bug in port reset han=
dshake)
Merging spdx/spdx-linus (3d77e6a8804a Linux 5.7)
Merging gpio-intel-fixes/fixes (bcf876870b95 Linux 5.8)
Merging pinctrl-intel-fixes/fixes (bcf876870b95 Linux 5.8)
Merging erofs-fixes/fixes (9ebcfadb0610 Linux 5.8-rc3)
Merging integrity-fixes/fixes (843385694721 evm: Fix a small race in init_d=
esc())
Merging kunit-fixes/kunit-fixes (c63d2dd7e134 Documentation: kunit: Add som=
e troubleshooting tips to the FAQ)
Merging ubifs-fixes/fixes (f37e99aca03f Merge tag 's390-5.8-6' of git://git=
.kernel.org/pub/scm/linux/kernel/git/s390/linux into master)
Merging drm-misc-fixes/for-linux-next-fixes (b5ac98cbb8e5 drm: Added orient=
ation quirk for ASUS tablet model T103HAF)
Merging kspp-gustavo/for-next/kspp (48778464bb7d Linux 5.8-rc2)
Merging kbuild/for-next (514bad879fdb Merge branch 'kconfig' into for-next)
Merging compiler-attributes/compiler-attributes (98d54f81e36b Linux 5.6-rc4)
Merging dma-mapping/for-next (274b3f7bf344 dma-contiguous: cleanup dma_allo=
c_contiguous)
Merging asm-generic/master (060dc911501f nds32: fix build failure caused by=
 page table folding updates)
Merging arc/for-next (def9d2780727 Linux 5.5-rc7)
Merging arm/for-next (4dffbda6a996 Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm64/for-next/core (0e4cd9f26549 Merge branch 'for-next/read-barri=
er-depends' into for-next/core)
Merging arm-perf/for-next/perf (55fdc1f44cd6 arm64: perf: Expose some new e=
vents via sysfs)
Merging arm-soc/for-next (e7e7df91deea soc: document merges)
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
Merging qcom/for-next (0854ab24c098 Merge branch 'arm64-defconfig-for-5.10'=
 into for-next)
Merging raspberrypi/for-next (25c6f3960764 ARM: dts: bcm2711: Add HDMI DVP)
Merging realtek/for-next (486f29df6941 Merge branch 'v5.8/dt' into next)
Merging renesas/next (467c08268168 Merge branch 'renesas-arm-dt-for-v5.9' i=
nto renesas-next)
Merging reset/reset/next (2983e2385ff6 reset: imx7: add the cm4 reset for i=
.MX8MQ)
Merging rockchip/for-next (088d74f51158 Merge branch 'v5.9-clk/next' into f=
or-next)
Merging samsung-krzk/for-next (3f61e08ac0be Merge branch 'next/memory-ctrl-=
drivers' into for-next)
Merging scmi/for-linux-next (bcf876870b95 Linux 5.8)
Merging sunxi/sunxi/for-next (9afd08499961 Merge branch 'sunxi/dt-for-5.9' =
into sunxi/for-next)
Merging tegra/for-next (8617339892a6 Merge branch for-5.9/arm64/dt into for=
-next)
Merging ti-k3/ti-k3-next (1e3d655fe7b4 Merge branch 'ti-k3-config-next' int=
o ti-k3-next)
Merging uniphier/for-next (4f8fb65af529 Merge branch 'dt64' into for-next)
Merging clk/clk-next (dd9c697a944a Merge branches 'clk-microchip', 'clk-mmp=
', 'clk-unused' and 'clk-at91' into clk-next)
Merging clk-samsung/for-next (3d77e6a8804a Linux 5.7)
Merging csky/linux-next (bdcd93ef9afb csky: Add context tracking support)
CONFLICT (content): Merge conflict in arch/csky/kernel/process.c
CONFLICT (content): Merge conflict in arch/csky/Kconfig
Merging h8300/h8300-next (9d48776fc609 Merge remote-tracking branch 'origin=
/master' into h8300-next)
Merging ia64/next (1a9d3c34c593 x86/cpu: Add Lakefield, Alder Lake and Rock=
et Lake to Intel family)
Merging m68k/for-next (382f429bb559 m68k: defconfig: Update defconfigs for =
v5.8-rc3)
Merging m68knommu/for-next (fde87ebf1daa m68k: stmark2: enable edma support=
 for dspi)
Merging microblaze/next (b3a9e3b9622a Linux 5.8-rc1)
Merging mips/mips-next (6c86a3029ce3 MIPS: SGI-IP27: always enable NUMA in =
Kconfig)
Merging nds32/next (0a2e478902c7 nds32: use get_kernel_nofault in dump_mem)
Merging nios2/for-next (6b57fa4d374b nios2: signal: Mark expected switch fa=
ll-through)
Merging openrisc/for-next (7a133acef90c openrisc: uaccess: Add user address=
 space check to access_ok)
Merging parisc-hd/for-next (bcf876870b95 Linux 5.8)
Merging powerpc/next (a7aaa2f26bfd selftests/powerpc: Fix pkey syscall rede=
finitions)
CONFLICT (content): Merge conflict in drivers/misc/ocxl/config.c
Merging fsl/next (a76bea0287ce powerpc/kmcent2: add ranges to the pci bridg=
es)
Merging soc-fsl/next (e9e4ef9116b1 soc: fsl: dpio: Remove unused inline fun=
ction qbman_write_eqcr_am_rt_register)
Merging risc-v/for-next (40284a072c42 riscv: disable stack-protector for vD=
SO)
CONFLICT (content): Merge conflict in arch/riscv/Kconfig
Merging s390/features (2baa85d6927d Merge tag 'acpi-5.9-rc1' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/rafael/linux-pm)
Merging sh/for-next (55b4ddbb7ee5 sh: bring syscall_set_return_value in lin=
e with other architectures)
CONFLICT (content): Merge conflict in tools/testing/selftests/seccomp/secco=
mp_bpf.c
CONFLICT (content): Merge conflict in arch/um/Kconfig
CONFLICT (content): Merge conflict in arch/sh/kernel/process_32.c
Merging sparc-next/master (dd0d718152e4 Merge tag 'spi-fix-v5.8-rc2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging uml/linux-next (f6e8c474390b um: virtio: Replace zero-length array =
with flexible-array)
Merging xtensa/xtensa-for-next (a0fc1436f1f4 xtensa: add missing exclusive =
access state management)
CONFLICT (content): Merge conflict in tools/testing/selftests/seccomp/secco=
mp_bpf.c
Merging fscrypt/master (55e32c54bbd5 fscrypt: don't load ->i_crypt_info bef=
ore it's known to be valid)
Merging afs/afs-next (8409f67b6437 afs: Adjust the fileserver rotation algo=
rithm to reprobe/retry more quickly)
Merging btrfs/for-next (cd37cdd68ef1 Merge branch 'for-next-current-v5.7-20=
200730' into for-next-20200730)
Merging ceph/master (02e37571f9e7 ceph: handle zero-length feature mask in =
session messages)
Merging cifs/for-next (7efd08158261 cifs: document and cleanup dfs mount)
Merging configfs/for-next (059ccbfff8a8 configfs: use flush file op to comm=
it writes to a binary file)
Merging ecryptfs/next (8b614cb8f1dc Merge tag '5.6-rc4-smb3-fixes' of git:/=
/git.samba.org/sfrench/cifs-2.6)
Merging erofs/dev (0e62ea33ac12 erofs: remove WQ_CPU_INTENSIVE flag from un=
bound wq's)
Merging exfat/dev (0bf2ab04a51c exfat: retain 'VolumeFlags' properly)
Merging ext3/for_next (de575ac602ab Pull reiserfs spelling fixes.)
Merging ext4/dev (43c18181b701 ext4: fix potential negative array index in =
do_split())
Merging f2fs/dev (828add774f0d f2fs: prepare a waiter before entering io_sc=
hedule)
CONFLICT (content): Merge conflict in Documentation/filesystems/f2fs.rst
Merging fsverity/fsverity (f3db0bed4583 fs-verity: use smp_load_acquire() f=
or ->i_verity_info)
Merging fuse/for-next (9e9e23bd2d36 fuse: update project homepage)
Merging jfs/jfs-next (7aba5dcc2346 jfs: Replace zero-length array with flex=
ible-array member)
Merging nfs/linux-next (7de62bc09fe6 SUNRPC dont update timeout value on co=
nnection reset)
Merging nfs-anna/linux-next (65caafd0d214 SUNRPC reverting d03727b248d0 ("N=
FSv4 fix CLOSE not waiting for direct IO compeletion"))
Merging nfsd/nfsd-next (b3a9e3b9622a Linux 5.8-rc1)
Merging orangefs/for-next (e848643b524b orangefs: remove unnecessary assign=
ment to variable ret)
Merging overlayfs/overlayfs-next (4518dfcf761e ovl: fix lookup of indexed h=
ardlinks with metacopy)
Merging ubifs/next (798b7347e4f2 jffs2: fix UAF problem)
Merging v9fs/9p-next (2ed0b7578170 9p: Remove unneeded cast from memory all=
ocation)
Merging xfs/for-next (818d5a91559f fs/xfs: Support that ioctl(SETXFLAGS/GET=
XFLAGS) can set/get inode DAX on XFS.)
Merging zonefs/for-next (2f4b7462d2fa zonefs: update documentation to refle=
ct zone size vs capacity)
Merging iomap/iomap-for-next (60263d5889e6 iomap: fall back to buffered wri=
tes for invalidation failures)
Merging djw-vfs/vfs-for-next (e4f9ba20d3b8 fs/xfs: Update xfs_ioctl_setattr=
_dax_invalidate())
Merging file-locks/locks-next (c0842fbc1b18 random32: move the pseudo-rando=
m 32-bit definitions to prandom.h)
Merging vfs/for-next (d7c9720ce664 Merge branches 'fixes' and 'hch.init_pat=
h' into for-next)
CONFLICT (content): Merge conflict in drivers/md/md.c
CONFLICT (content): Merge conflict in arch/x86/kernel/fpu/xstate.c
CONFLICT (content): Merge conflict in arch/x86/include/asm/fpu/xstate.h
CONFLICT (content): Merge conflict in arch/powerpc/kernel/ptrace/ptrace-vie=
w.c
Merging printk/for-next (a0ebfe187a25 Merge branch 'for-5.9' into for-next)
Merging pci/next (6f119ec8d9c8 Merge branch 'pci/irq-error')
Merging pstore/for-next/pstore (fd49e03280e5 pstore: Fix linking when crypt=
o API disabled)
Merging hid/for-next (bc12a7f8e273 Merge branch 'for-5.8/upstream-fixes' in=
to for-next)
Merging i2c/i2c/for-next (6dc8aec8efb5 Merge branch 'i2c/for-5.9' into i2c/=
for-next)
Merging i3c/i3c/next (b4203ce05563 i3c master: GETMRL's 3rd byte is optiona=
l even with BCR_IBI_PAYLOAD)
Merging dmi/dmi-for-next (a3d13a0a23ea Replace HTTP links with HTTPS ones: =
DMI/SMBIOS SUPPORT)
Merging hwmon-staging/hwmon-next (e2f75e6b5d76 hwmon: (adc128d818) Fix adva=
nced configuration register init)
Merging jc_docs/docs-next (2c12c8103d8f scripts/kernel-doc: optionally trea=
t warnings as errors)
Merging v4l-dvb/master (8f2a4a9d5ff5 media: dvbdev.h: keep * together with =
the type)
Merging v4l-dvb-next/master (0d6db85131e0 Revert "media: atomisp: keep the =
ISP powered on when setting it")
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (786b0c10be9a Merge branches 'pm-core' and 'pm-cpufre=
q' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (f259eab3ea0e cpufreq: make sche=
dutil the default for arm and arm64)
Merging cpupower/cpupower (fa0866a1d1be cpupower: Replace HTTP links with H=
TTPS ones)
Merging devfreq/devfreq-next (27a69714450f PM / devfreq: Fix the wrong end =
with semicolon)
Merging opp/opp/linux-next (06a8a059e88b opp: Allow disabled OPPs in dev_pm=
_opp_get_freq())
Merging thermal/thermal/linux-next (c569e805c7bc thermal: intel: intel_pch_=
thermal: Add Cannon Lake Low Power PCH support)
Merging thermal-rzhang/next (54ecb8f7028c Linux 5.4-rc1)
Merging thermal-soc/next (6c375eccded4 thermal: db8500: Rewrite to be a pur=
e OF sensor)
Merging ieee1394/for-next (67f8e65e4fc1 firewire: net: remove set but not u=
sed variable 'guid')
Merging dlm/next (fa601a9ebd49 fs: dlm: implement tcp graceful shutdown)
Merging swiotlb/linux-next (4cdfb27ba80d xen/swiotlb: remember having calle=
d xen_create_contiguous_region())
Merging rdma/for-next (76251e15ea73 RDMA/rxe: Remove pkey table)
CONFLICT (content): Merge conflict in drivers/infiniband/core/uverbs_cmd.c
Merging net-next/master (c1055b76ad00 net: thunderx: initialize VF's mailbo=
x mutex before first usage)
CONFLICT (content): Merge conflict in net/ipv6/ip6_flowlabel.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/sfc/efx.c
CONFLICT (content): Merge conflict in MAINTAINERS
Applying: fix up for "enum pci_channel_state" to "pci_channel_state_t" chan=
ge
Merging bpf-next/master (da7955405fb2 sfc: Fix build with CONFIG_RFS_ACCEL =
disabled.)
Merging ipsec-next/master (da7955405fb2 sfc: Fix build with CONFIG_RFS_ACCE=
L disabled.)
Merging mlx5-next/mlx5-next (042dd05bddbd RDMA/mlx5: ConnectX-7 new capabil=
ities to set relaxed ordering by UMR)
Merging netfilter-next/master (cabf06e5a275 Merge tag 'wireless-drivers-nex=
t-2020-08-04' of git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/wirele=
ss-drivers-next)
Merging ipvs-next/master (66846b7d058b Merge branch 'bnxt_en-Driver-update-=
for-net-next')
Merging wireless-drivers-next/master (3dc05ffb0443 brcmfmac: Set timeout va=
lue when configuring power save)
Merging bluetooth/master (3b799254cf6f Bluetooth: hci_uart: Cancel init wor=
k before unregistering)
Merging mac80211-next/master (4c900a6b4e05 farsync: switch from 'pci_' to '=
dma_' API)
Merging gfs2/for-next (c9dff08485a6 fs: Fix typo in comment)
Merging mtd/mtd/next (3d19792a7d72 mtd: rawnand: omap_elm: Replace HTTP lin=
ks with HTTPS ones)
CONFLICT (content): Merge conflict in drivers/memory/Makefile
CONFLICT (content): Merge conflict in drivers/memory/Kconfig
Merging nand/nand/next (da151e3458c8 dt-bindings: mtd: fsl-upm-nand: Deprec=
ate chip-delay and fsl, upm-wait-flags)
Merging spi-nor/spi-nor/next (e93a977367b2 mtd: revert "spi-nor: intel: pro=
vide a range for poll_timout")
Merging crypto/master (3cbfe80737c1 crypto: sa2ul - Fix inconsistent IS_ERR=
 and PTR_ERR)
Merging drm/drm-next (dc100bc8fae5 Merge tag 'drm-msm-next-2020-07-30' of h=
ttps://gitlab.freedesktop.org/drm/msm into drm-next)
CONFLICT (content): Merge conflict in include/linux/dmaengine.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/nouveau/nvkm/subdev/m=
mu/vmmgp100.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_gem.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_edid.c
CONFLICT (content): Merge conflict in MAINTAINERS
CONFLICT (content): Merge conflict in Documentation/driver-api/dmaengine/pr=
ovider.rst
CONFLICT (modify/delete): Documentation/devicetree/bindings/display/bridge/=
ti,sn65dsi86.txt deleted in drm/drm-next and modified in HEAD. Version HEAD=
 of Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.txt left =
in tree.
$ git rm -f Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.t=
xt
Merging amdgpu/drm-next (a9de18085aab drm/amd/powerplay: optimize the mclk =
dpm policy settings)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/amdgpu_dm=
/amdgpu_dm.c
Merging drm-intel/for-linux-next (6bd0b413618f drm/i915: Filter wake_flags =
passed to default_wake_function)
Merging drm-tegra/drm/tegra/for-next (4fba6d22ca9a drm/tegra: plane: Suppor=
t 180=C2=B0 rotation)
Merging drm-misc/for-linux-next (a34a0a632dd9 drm: fix drm_dp_mst_port refc=
ount leaks in drm_dp_mst_allocate_vcpi)
Merging drm-msm/msm-next (1041dee2178f drm/msm: use kthread_create_worker i=
nstead of kthread_run)
Merging mali-dp/for-upstream/mali-dp (f634c6a80287 dt/bindings: display: Ad=
d optional property node define for Mali DP500)
Merging imx-drm/imx-drm/next (408a85e31e3e drm/imx: imx-tve: Delete an erro=
r message in imx_tve_bind())
Merging etnaviv/etnaviv/next (c5d5a32ead1e drm/etnaviv: fix ref count leak =
via pm_runtime_get_sync)
Merging regmap/for-next (c9fadf212afd Merge remote-tracking branch 'regmap/=
for-5.9' into regmap-next)
Merging sound/for-next (ed4d0a4aaf56 ALSA: hda/tegra: Add 100us dma stop de=
lay)
Merging sound-asoc/for-next (68122177749a Merge remote-tracking branch 'aso=
c/for-5.9' into asoc-linus)
Merging modules/modules-next (262e6ae7081d modules: inherit TAINT_PROPRIETA=
RY_MODULE)
Merging input/next (873a3a14a47e Input: elan_i2c - add ic type 0x15)
Merging block/for-next (a42347183f79 Merge branch 'for-5.9/block-merge' int=
o for-next)
Merging device-mapper/for-next (a9cb9f4148ef dm: don't call report zones fo=
r more than the user requested)
CONFLICT (content): Merge conflict in drivers/md/dm-crypt.c
Merging pcmcia/pcmcia-next (46d079790663 pcmcia: make pccard_loop_tuple() s=
tatic)
Merging mmc/next (7f4bc2e8687e mmc: mediatek: make function msdc_cqe_disabl=
e() static)
Merging mfd/for-mfd-next (3ce0baa5b7d8 mfd: syscon: Use a unique name with =
regmap_config)
Merging backlight/for-backlight-next (7eb99a39ef76 video: backlight: cr_bll=
cd: Remove unused variable 'intensity')
Merging battery/for-next (46cbd0b05799 power: supply: wilco_ec: Add long li=
fe charging mode)
Merging regulator/for-next (e30c06f230a9 Merge remote-tracking branch 'regu=
lator/for-5.9' into regulator-linus)
Merging security/next-testing (084055f6de76 LSM: drop duplicated words in h=
eader file comments)
Merging apparmor/apparmor-next (e37986097ba6 apparmor: Use true and false f=
or bool variable)
Merging integrity/next-integrity (3db0d0c276a7 integrity: remove redundant =
initialization of variable ret)
Merging keys/keys-next (b6f61c314649 keys: Implement update for the big_key=
 type)
Merging safesetid/safesetid-next (02e316b088df LSM: SafeSetID: Add GID secu=
rity policy handling)
Merging selinux/next (54b27f9287a7 selinux: complete the inlining of hashta=
b functions)
Merging smack/next (42a2df3e829f Smack: prevent underflow in smk_set_cipso(=
))
Merging tomoyo/master (bcf876870b95 Linux 5.8)
Merging tpmdd/next (85467f63a05c tpm: Add support for event log pointer fou=
nd in TPM2 ACPI table)
Merging watchdog/master (d5b29c2c5ba2 watchdog: rti-wdt: balance pm runtime=
 enable calls)
Merging iommu/next (e46b3c0d011e Merge tag 'arm-smmu-updates' of git://git.=
kernel.org/pub/scm/linux/kernel/git/will/linux into next)
CONFLICT (content): Merge conflict in drivers/iommu/Kconfig
Applying: merge fix for "dma-mapping: make support for dma ops optional"
Merging vfio/next (ccd59dce1a21 vfio/type1: Refactor vfio_iommu_type1_ioctl=
())
Merging audit/next (b43870c74f3f audit: report audit wait metric in audit s=
tatus reply)
Merging devicetree/for-next (6f1188b4ac75 of: reserved-memory: remove dupli=
cated call to of_get_flat_dt_prop() for no-map node)
Applying: fix for "dt-bindings: drm/bridge: Replace HTTP links with HTTPS o=
nes"
Merging mailbox/mailbox-for-next (884996986347 mailbox: mediatek: cmdq: cle=
ar task in channel before shutdown)
Merging spi/for-next (cdce7131f268 Merge remote-tracking branch 'spi/for-5.=
9' into spi-linus)
Merging tip/auto-latest (90c808893b2a Merge branch 'locking/urgent')
CONFLICT (content): Merge conflict in drivers/gpu/drm/msm/msm_drv.c
Applying: Revert "sched: Remove sched_setscheduler*() EXPORTs"
Merging clockevents/timers/drivers/next (9fba22584e54 clocksource: Ingenic:=
 Add support for the Ingenic X1000 OST.)
Merging edac/edac-for-next (399cd3b33cef Merge branch 'edac-urgent' into ed=
ac-for-next)
Merging irqchip/irq/irqchip-next (ac62460c2412 irqchip/loongson-pch-pic: Fi=
x the misused irq flow handler)
Merging ftrace/for-next (c58b46cba717 Documentation: bootconfig: Add bootco=
nfig override operator)
Merging rcu/rcu/next (71e05e558a5f Merge branch 'kcsan.2020.06.29a' into HE=
AD)
Merging kvm/linux-next (f3633c268354 Merge tag 'kvm-s390-next-5.9-1' of git=
://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux into kvm-next-5.6)
CONFLICT (content): Merge conflict in arch/x86/kernel/kvm.c
Applying: fix up for idtentry_{enter,exit}_cond_rcu() renaming
Merging kvm-arm/next (16314874b12b Merge branch 'kvm-arm64/misc-5.9' into k=
vmarm-master/next)
CONFLICT (content): Merge conflict in arch/arm64/kvm/mmu.c
CONFLICT (content): Merge conflict in arch/arm64/kvm/handle_exit.c
CONFLICT (content): Merge conflict in arch/arm64/include/asm/kvm_coproc.h
Merging kvm-ppc/kvm-ppc-next (81ab595ddd3c KVM: PPC: Book3S HV: Rework secu=
re mem slot dropping)
CONFLICT (content): Merge conflict in arch/powerpc/kvm/book3s_hv_uvmem.c
Merging kvms390/next (23a60f834406 s390/kvm: diagnose 0x318 sync and reset)
Merging xen-tip/linux-next (ba8c42348897 xen/xenbus: Fix a double free in x=
enbus_map_ring_pv())
Merging percpu/for-next (4fa640dc5230 Merge tag 'vfio-v5.8-rc7' of git://gi=
thub.com/awilliam/linux-vfio into master)
Merging workqueues/for-next (10cdb1575954 workqueue: use BUILD_BUG_ON() for=
 compile time test instead of WARN_ON())
Merging drivers-x86/for-next (67186653c903 platform/x86: asus-nb-wmi: Drop =
duplicate DMI quirk structures)
Merging chrome-platform/for-next (fc8cacf3fc68 platform/chrome: cros_ec_pro=
to: check for missing EC_CMD_HOST_EVENT_GET_WAKE_MASK)
Merging hsi/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging leds/for-next (bba37471de2d MAINTAINERS: Remove myself as LED subsy=
stem maintainer)
Merging ipmi/for-next (634b06def11c ipmi/watchdog: add missing newlines whe=
n printing parameters by sysfs)
Merging driver-core/driver-core-next (76acb5ee76b1 drm/bridge: lvds-codec: =
simplify error handling)
Merging usb/usb-next (e3ee0e740c38 usb: common: usb-conn-gpio: Register cha=
rger)
Merging usb-gadget/next (f5e46aa4a124 usb: dwc3: gadget: when the started l=
ist is empty stop the active xfer)
Merging usb-serial/usb-next (d2a4309c1ab6 USB: serial: qcserial: add EM7305=
 QDL product ID)
Merging usb-chipidea-next/ci-for-usb-next (d6f93d21001e usb: chipidea: imx:=
 get available runtime dr mode for wakeup setting)
Merging phy-next/next (3d7b0ca5300b phy: qualcomm: fix setting of tx_deamp_=
3_5db when device property read fails)
Merging tty/tty-next (f6c6eb2fe822 MAINTAINERS: enlist Greg formally for co=
nsole stuff)
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
Merging staging/staging-next (5bbd90550da8 staging: most: fix up movement o=
f USB driver)
CONFLICT (add/add): Merge conflict in Documentation/devicetree/bindings/soc=
/microchip/atmel,at91rm9200-tcb.yaml
Merging mux/for-next (05f19f7f8944 mux: adgs1408: Add mod_devicetable.h and=
 remove of_match_ptr)
Merging icc/icc-next (12a400b016ab interconnect: Mark all dummy functions a=
s static inline)
Merging dmaengine/next (fe541ee394a7 Merge branch 'for-linus' into next)
Merging cgroup/for-next (936f2a70f207 cgroup: add cpu.stat file to root cgr=
oup)
Merging scsi/for-next (700f3d4333d9 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (7e0e8be3a1fd scsi: lpfc: Update lpfc version to =
12.8.0.3)
Merging vhost/linux-next (c84f91e26222 virtio_config: fix up warnings on pa=
risc)
Merging rpmsg/for-next (ca69dba7f13a Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (22cc422070d9 gpio: wcove: Request IRQ after all init=
ialisation done)
Merging gpio-brgl/gpio/for-next (df51f402e3b1 tools: gpio: fix spurious clo=
se warning in gpio-event-mon)
Merging gpio-intel/for-next (4941b8dedb3f gpio: sch: Add a blank line betwe=
en declaration and code)
Merging pinctrl/for-next (7ee193e2dda3 dt-bindings: pinctrl: add bindings f=
or MediaTek MT6779 SoC)
CONFLICT (content): Merge conflict in drivers/pinctrl/pinctrl-single.c
CONFLICT (content): Merge conflict in drivers/pinctrl/intel/pinctrl-baytrai=
l.c
Merging pinctrl-intel/for-next (b4f2fcb53487 pinctrl: intel: Add Intel Emmi=
tsburg pin controller support)
Merging pinctrl-samsung/for-next (b3a9e3b9622a Linux 5.8-rc1)
Merging pwm/for-next (6ced5ff0be8e pwm: bcm-iproc: handle clk_get_rate() re=
turn)
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
Merging rtc/rtc-next (9bf130625758 rtc: ds1307: provide an indication that =
the watchdog has fired)
Merging nvdimm/libnvdimm-for-next (03b68d5d7d4b Merge branch 'for-5.9/copy_=
mc' into libnvdimm-for-next)
Merging at24/at24/for-next (8f3d9f354286 Linux 5.7-rc1)
Merging ntb/ntb-next (b3a9e3b9622a Linux 5.8-rc1)
Merging seccomp/for-next/seccomp (fffe3ae0ee84 Merge tag 'for-linus-hmm' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma)
Merging kspp/for-next/kspp (fffe3ae0ee84 Merge tag 'for-linus-hmm' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma)
Merging gnss/gnss-next (48778464bb7d Linux 5.8-rc2)
Merging fsi/next (4ca8b73f16f0 fsi: aspeed: Support CFAM reset GPIO)
Merging slimbus/for-next (b3a9e3b9622a Linux 5.8-rc1)
Merging nvmem/for-next (a24ef5be460b nvmem: qcom-spmi-sdam: Enable multiple=
 devices)
Merging xarray/xarray (27586ca786a7 XArray: Handle retry entries within xas=
_find_marked)
Merging hyperv/hyperv-next (7deff7b5b439 hyperv: hyperv.h: drop a duplicate=
d word)
Merging auxdisplay/auxdisplay (3f03b6498172 auxdisplay: charlcd: Reuse hex_=
to_bin() instead of custom code)
Merging kgdb/kgdb/for-next (2c308ef41351 kgdb: Make "kgdbcon" work properly=
 with "kgdb_earlycon")
Merging pidfd/for-next (da83d0cb9237 Merge branch 'cap_checkpoint_restore' =
into for-next)
Merging hmm/hmm (7d17e83abec1 mm/hmm/test: use the new migration invalidati=
on)
Merging fpga/for-next (9ae43c58db00 MAINTAINERS: Add Tom Rix as fpga review=
er)
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
Merging notifications/notifications-pipe-core (841a0dfa5113 watch_queue: sa=
mple: Display mount tree change notifications)
Merging fsinfo/fsinfo-core (13917414b9cc fs: mount_notify.c: fix build with=
out CONFIG_FSINFO)
CONFLICT (content): Merge conflict in samples/vfs/Makefile
CONFLICT (content): Merge conflict in fs/internal.h
Merging memblock/for-next (3346dd99fb4c MAINTAINERS: remove "PKUNITY SOC DR=
IVERS" entry)
Merging set_fs/set_fs-rw (2750e3608b79 fs: don't allow splice read/write wi=
thout explicit ops)
CONFLICT (content): Merge conflict in lib/debugobjects.c
CONFLICT (content): Merge conflict in drivers/power/supply/da9030_battery.c
CONFLICT (content): Merge conflict in drivers/acpi/battery.c
CONFLICT (content): Merge conflict in arch/powerpc/mm/numa.c
Merging init/init-user-pointers (38b082236e77 initramfs: use vfs_utimes in =
do_copy)
Merging akpm-current/current (59b3299ce728 ipc/shm.c: Remove the superfluou=
s break)
CONFLICT (content): Merge conflict in net/sctp/socket.c
CONFLICT (content): Merge conflict in mm/cma.h
CONFLICT (content): Merge conflict in lib/cpumask.c
CONFLICT (content): Merge conflict in kernel/rcu/tree.c
CONFLICT (content): Merge conflict in fs/crypto/keysetup_v1.c
CONFLICT (content): Merge conflict in drivers/s390/crypto/ap_bus.h
CONFLICT (content): Merge conflict in drivers/crypto/mediatek/mtk-aes.c
CONFLICT (content): Merge conflict in arch/arm64/mm/init.c
CONFLICT (content): Merge conflict in Documentation/filesystems/proc.rst
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
Merging akpm/master (2174a96cf0e1 virtio: pci: constify ioreadX() iomem arg=
ument (as in generic implementation))

--Sig_/ABqK4EJRkuCs=aaIZTZ18s2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8roVwACgkQAVBC80lX
0GxI6Af9G8xbWkW4FkPyzJrgz0DsPWwxmBZmlXwJOb9g7LpHvD7XvRD68DMLQDco
mVsXTb/ATUP7lgKNmf8G1aFB5LIFROMQ8l7992/8H/O+UH8e5Ery9by0KcQa+J0I
9B4vNHRFZp+YMh+jwYTvSmIhGkD+508+WIBhHdLU3oopifCG6P51fa4/pJDtch40
twvaxdGcZmBP54ALypFEQEhfW+K12IPSBHoGBpr0ra1v1Bdk/REgSO5oZTuCl5os
/D5hcnxuQ1jhps1xbcA4tGdq4rWru/WWu1IPNr5e2GiMqWqFFkJ1Jv2ywX96c92P
M/EjOxlpGT+RY6rqAY2zes4yOnZpYg==
=+/lA
-----END PGP SIGNATURE-----

--Sig_/ABqK4EJRkuCs=aaIZTZ18s2--
