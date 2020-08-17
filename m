Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6ECF245AA5
	for <lists+linux-next@lfdr.de>; Mon, 17 Aug 2020 04:16:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726707AbgHQCOH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 16 Aug 2020 22:14:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726697AbgHQCN6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 16 Aug 2020 22:13:58 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3CC3C061786;
        Sun, 16 Aug 2020 19:13:57 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BVHfD134Hz9sTK;
        Mon, 17 Aug 2020 12:13:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1597630436;
        bh=nrRY+Scc1k0/L8Klx+EmA9OxjbJxgkjt+tMcqer2+dc=;
        h=Date:From:To:Cc:Subject:From;
        b=GK+J2xhxPMxo9BkLM4qgtY20069N0aL+4LJMhogQP0eJ1SZGH9+APUKU9VHGhWVT1
         hrIcnc01DLVhl8/F99WqP0hfB+QN/peK0yGJVeUOk5pxT5iTFJxjqXQ/GOY445tQSK
         lz1wB4yqJZOa6yCXqeA/q5+rZe0KW6EG45nzaBSfX+E7yUHe/4dXmVGK2i0iO07tMF
         bmxjIHo77439VmULaHpxGnDxufn6cvhe2I08S0wkSrRmV4X+ame+EkmLvbl2Arg4Jg
         DaoV2Lth1my9rTMUMdIqj+btlaI6MFz4pxHR9DhqPKc2MqMt07kbYkBcF9pmYLGuKp
         40RhQZuHa7fQA==
Date:   Mon, 17 Aug 2020 12:13:55 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Aug 17
Message-ID: <20200817121355.317a96b9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/m3KnE/2VdzNgIckDAWjZaK/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/m3KnE/2VdzNgIckDAWjZaK/
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20200814:

New tree: memblock-fixes

My fixes tree contains:

  73c7adb54169 ("device_cgroup: Fix RCU list debugging warning")

Non-merge commits (relative to Linus' tree): 664
 760 files changed, 22791 insertions(+), 6127 deletions(-)

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

I am currently merging 328 trees (counting Linus' and 86 trees of bug
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
Merging origin/master (9123e3a74ec7 Linux 5.9-rc1)
Merging fixes/master (73c7adb54169 device_cgroup: Fix RCU list debugging wa=
rning)
Merging kbuild-current/fixes (06a81c1c7db9 Merge tag 'arm64-fixes' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/arm64/linux)
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
Merging powerpc-fixes/fixes (6553fb799f60 powerpc/pkeys: Fix boot failures =
with Nemo board (A-EON AmigaOne X1000))
Merging s390-fixes/fixes (00e4db51259a Merge tag 'perf-tools-2020-08-10' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/acme/linux)
Merging sparc/master (0a95a6d1a4cd sparc: use for_each_child_of_node() macr=
o)
Merging fscrypt-current/for-stable (2b4eae95c736 fscrypt: don't evict dirty=
 inodes after removing key)
Merging net/master (d0f5c7076e01 ipvlan: fix device features)
Merging bpf/master (4fccd2ff74fb selftests/bpf: Make test_varlen work with =
32-bit user-space arch)
Merging ipsec/master (61ee4137b574 ip_vti: Fix unused variable warning)
Merging netfilter/master (5c04da55c754 netfilter: ebtables: reject bogus ge=
topt len value)
Merging ipvs/master (7c7ab580db49 net: Convert to use the fallthrough macro)
Merging wireless-drivers/master (1cfd3426ef98 ath10k: Fix NULL pointer dere=
ference in AHB device probe)
Merging mac80211/master (9643609423c7 Revert "ipv4: tunnel: fix compilation=
 on ARCH=3Dum")
Merging rdma-fixes/for-rc (bcf876870b95 Linux 5.8)
Merging sound-current/for-linus (f5d0f820ff8a ALSA: isa: fix spelling mista=
kes in the comments)
Merging sound-asoc-fixes/for-linus (933cc41085d5 Merge remote-tracking bran=
ch 'asoc/for-5.9' into asoc-linus)
Merging regmap-fixes/for-linus (2b0f61e27f75 Merge remote-tracking branch '=
regmap/for-5.8' into regmap-linus)
Merging regulator-fixes/for-linus (75f4d068cb0d Merge remote-tracking branc=
h 'regulator/for-5.9' into regulator-linus)
Merging spi-fixes/for-linus (3ea884314328 Merge remote-tracking branch 'spi=
/for-5.9' into spi-linus)
Merging pci-current/for-linus (b361663c5a40 PCI/ASPM: Disable ASPM on ASMed=
ia ASM1083/1085 PCIe-to-PCI bridge)
Merging driver-core.current/driver-core-linus (a1d21081a60d Merge git://git=
.kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging tty.current/tty-linus (fc80c51fd4b2 Merge tag 'kbuild-v5.9' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild)
Merging usb.current/usb-linus (449dc8c97089 Merge tag 'for-v5.9' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-supply)
Merging usb-gadget-fixes/fixes (8778eb0927dd usb: gadget: function: fix mis=
sing spinlock in f_uac1_legacy)
Merging usb-serial-fixes/usb-linus (47ec5303d73e Merge git://git.kernel.org=
/pub/scm/linux/kernel/git/netdev/net-next)
Merging usb-chipidea-fixes/ci-for-usb-stable (2d79b3360dcc usb: chipidea: c=
ore: add wakeup support for extcon)
Merging phy/fixes (e365831fbdd6 phy: qualcomm: fix return value check in qc=
om_ipq806x_usb_phy_probe())
Merging staging.current/staging-linus (fc80c51fd4b2 Merge tag 'kbuild-v5.9'=
 of git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild)
Merging char-misc.current/char-misc-linus (00e4db51259a Merge tag 'perf-too=
ls-2020-08-10' of git://git.kernel.org/pub/scm/linux/kernel/git/acme/linux)
Merging soundwire-fixes/fixes (bf6d6e68d202 soundwire: intel: fix memory le=
ak with devm_kasprintf)
Merging thunderbolt-fixes/fixes (bcf876870b95 Linux 5.8)
Merging input-current/for-linus (9e8238020c5b Merge branch 'next' into for-=
linus)
Merging crypto-current/master (21dfbcd1f5cb crypto: algif_aead - fix uninit=
ialized ctx->init)
Merging ide/master (6800cd8cbc6e ide-acpi: use %*ph to print small buffer)
Merging vfio-fixes/for-linus (b872d0640840 vfio/pci: fix racy on error and =
request eventfd ctx)
Merging kselftest-fixes/fixes (3c01655ac82e kselftest: ksft_test_num return=
 type should be unsigned)
Merging modules-fixes/modules-linus (57baec7b1b04 scripts/nsdeps: make sure=
 to pass all module source files to spatch)
Merging dmaengine-fixes/fixes (00043a268923 Merge branch 'topic/xilinx' int=
o fixes)
Merging backlight-fixes/for-backlight-fixes (219d54332a09 Linux 5.4)
Merging mtd-fixes/mtd/fixes (f7e6b19bc764 mtd: properly check all write ioc=
tls for permissions)
Merging mfd-fixes/for-mfd-fixes (603d9299da32 mfd: mt6397: Fix probe after =
changing mt6397-core)
Merging v4l-dvb-fixes/fixes (0d6db85131e0 Revert "media: atomisp: keep the =
ISP powered on when setting it")
Merging reset-fixes/reset/fixes (b460e0a9e240 reset: intel: add unspecified=
 HAS_IOMEM dependency)
Merging mips-fixes/mips-fixes (5868347a192a MIPS: Do not use smp_processor_=
id() in preemptible code)
Merging at91-fixes/at91-fixes (54ecb8f7028c Linux 5.4-rc1)
Merging omap-fixes/fixes (2a4117df9b43 ARM: dts: Fix dcan driver probe fail=
ed on am437x platform)
Merging kvm-fixes/master (06a81c1c7db9 Merge tag 'arm64-fixes' of git://git=
.kernel.org/pub/scm/linux/kernel/git/arm64/linux)
Merging kvms390-fixes/master (774911290c58 KVM: s390: reduce number of IO p=
ins to 1)
Merging hwmon-fixes/hwmon (51fb91ed5a6f hwmon: (pmbus/isl68137) remove READ=
_TEMPERATURE_1 telemetry for RAA228228)
Merging nvdimm-fixes/libnvdimm-fixes (543094e19c82 nvdimm/region: always sh=
ow the 'align' attribute)
Merging btrfs-fixes/next-fixes (c9f8e44ec4a5 Merge branch 'misc-5.9' into n=
ext-fixes)
Merging vfs-fixes/fixes (bb1a773d5b6b kill unused dump_fpu() instances)
Merging dma-mapping-fixes/for-linus (7dc6fd0f3b84 Merge branch 'i2c/for-cur=
rent' of git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux)
Merging i3c-fixes/master (6fbc7275c7a9 Linux 5.2-rc7)
Merging drivers-x86-fixes/fixes (bcf876870b95 Linux 5.8)
Merging samsung-krzk-fixes/fixes (b3a9e3b9622a Linux 5.8-rc1)
Merging pinctrl-samsung-fixes/pinctrl-fixes (b3a9e3b9622a Linux 5.8-rc1)
Merging devicetree-fixes/dt/linus (5f0b06da5cde dt-bindings: Remove more ca=
ses of 'allOf' containing a '$ref')
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
Merging hyperv-fixes/hyperv-fixes (b9d8cf2eb3ce x86/hyperv: Make hv_setup_s=
ched_clock inline)
Merging soc-fsl-fixes/fix (fe8fe7723a3a soc: fsl: dpio: register dpio irq h=
andlers after dpio create)
Merging risc-v-fixes/fixes (76d4467a97bd riscv: Setup exception vector for =
nommu platform)
Merging pidfd-fixes/fixes (7665a47f70b3 signal: fix typo in dequeue_synchro=
nous_signal())
Merging fpga-fixes/fixes (8614afd689df fpga: dfl: fix bug in port reset han=
dshake)
Merging spdx/spdx-linus (00e4db51259a Merge tag 'perf-tools-2020-08-10' of =
git://git.kernel.org/pub/scm/linux/kernel/git/acme/linux)
Merging gpio-intel-fixes/fixes (bcf876870b95 Linux 5.8)
Merging pinctrl-intel-fixes/fixes (bcf876870b95 Linux 5.8)
Merging erofs-fixes/fixes (9ebcfadb0610 Linux 5.8-rc3)
Merging integrity-fixes/fixes (843385694721 evm: Fix a small race in init_d=
esc())
Merging kunit-fixes/kunit-fixes (c63d2dd7e134 Documentation: kunit: Add som=
e troubleshooting tips to the FAQ)
Merging ubifs-fixes/fixes (f37e99aca03f Merge tag 's390-5.8-6' of git://git=
.kernel.org/pub/scm/linux/kernel/git/s390/linux into master)
Merging memblock-fixes/fixes (762d4d1a174c arch/ia64: Restore arch-specific=
 pgd_offset_k implementation)
Merging drm-misc-fixes/for-linux-next-fixes (836b194d6578 drm/virtio: fix m=
emory leak in virtio_gpu_cleanup_object())
Merging kspp-gustavo/for-next/kspp (48778464bb7d Linux 5.8-rc2)
Merging kbuild/for-next (514bad879fdb Merge branch 'kconfig' into for-next)
CONFLICT (content): Merge conflict in scripts/kconfig/qconf.h
Merging compiler-attributes/compiler-attributes (98d54f81e36b Linux 5.6-rc4)
Merging dma-mapping/for-next (d7e673ec2c8e dma-pool: Only allocate from CMA=
 when in same memory zone)
Merging asm-generic/master (060dc911501f nds32: fix build failure caused by=
 page table folding updates)
Merging arc/for-next (def9d2780727 Linux 5.5-rc7)
Merging arm/for-next (4dffbda6a996 Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm64/for-next/core (3df14264ad99 recordmcount: Fix build failure o=
n non arm64)
Merging arm-perf/for-next/perf (55fdc1f44cd6 arm64: perf: Expose some new e=
vents via sysfs)
Merging arm-soc/for-next (e7e7df91deea soc: document merges)
Merging amlogic/for-next (e5b34acf7ab4 Merge branch 'v5.10/dt64' into tmp/a=
ml-rebuild)
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
Merging openrisc/for-next (55b2662ec665 openrisc: uaccess: Add user address=
 space check to access_ok)
Merging parisc-hd/for-next (bcf876870b95 Linux 5.8)
Merging powerpc/next (a7aaa2f26bfd selftests/powerpc: Fix pkey syscall rede=
finitions)
Merging fsl/next (a76bea0287ce powerpc/kmcent2: add ranges to the pci bridg=
es)
Merging soc-fsl/next (e9e4ef9116b1 soc: fsl: dpio: Remove unused inline fun=
ction qbman_write_eqcr_am_rt_register)
Merging risc-v/for-next (a407942f1825 Documentation/features: refresh RISC-=
V arch support files)
Merging s390/features (b450eeb0c973 s390/numa: move code to arch/s390/kerne=
l)
Merging sh/for-next (0c64a0dce51f sh: landisk: Add missing initialization o=
f sh_io_port_base)
Merging sparc-next/master (dd0d718152e4 Merge tag 'spi-fix-v5.8-rc2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging uml/linux-next (f6e8c474390b um: virtio: Replace zero-length array =
with flexible-array)
Merging xtensa/xtensa-for-next (a0fc1436f1f4 xtensa: add missing exclusive =
access state management)
Merging fscrypt/master (55e32c54bbd5 fscrypt: don't load ->i_crypt_info bef=
ore it's known to be valid)
Merging afs/afs-next (8409f67b6437 afs: Adjust the fileserver rotation algo=
rithm to reprobe/retry more quickly)
Merging btrfs/for-next (cd37cdd68ef1 Merge branch 'for-next-current-v5.7-20=
200730' into for-next-20200730)
CONFLICT (content): Merge conflict in fs/btrfs/super.c
Merging ceph/master (02e37571f9e7 ceph: handle zero-length feature mask in =
session messages)
Merging cifs/for-next (9123e3a74ec7 Linux 5.9-rc1)
Merging configfs/for-next (059ccbfff8a8 configfs: use flush file op to comm=
it writes to a binary file)
Merging ecryptfs/next (8b614cb8f1dc Merge tag '5.6-rc4-smb3-fixes' of git:/=
/git.samba.org/sfrench/cifs-2.6)
Merging erofs/dev (0e62ea33ac12 erofs: remove WQ_CPU_INTENSIVE flag from un=
bound wq's)
Merging exfat/dev (423da4f3023b exfat: fix misspellings using codespell too=
l)
Merging ext3/for_next (de575ac602ab Pull reiserfs spelling fixes.)
Merging ext4/dev (0f9be45c0814 ext4: correctly restore system zone info whe=
n remount fails)
Merging f2fs/dev (0fd9cc6b0c72 Merge tag 'modules-for-v5.9' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/jeyu/linux)
Merging fsverity/fsverity (f3db0bed4583 fs-verity: use smp_load_acquire() f=
or ->i_verity_info)
Merging fuse/for-next (9e9e23bd2d36 fuse: update project homepage)
Merging jfs/jfs-next (7aba5dcc2346 jfs: Replace zero-length array with flex=
ible-array member)
Merging nfs/linux-next (563c53e73b8b NFS: Fix flexfiles read failover)
Merging nfs-anna/linux-next (65caafd0d214 SUNRPC reverting d03727b248d0 ("N=
FSv4 fix CLOSE not waiting for direct IO compeletion"))
Merging nfsd/nfsd-next (b3a9e3b9622a Linux 5.8-rc1)
Merging cel/cel-next (cbd5b40a1919 nfsd: fix oops on mixed NFSv4/NFSv3 clie=
nt access)
Merging orangefs/for-next (e848643b524b orangefs: remove unnecessary assign=
ment to variable ret)
Merging overlayfs/overlayfs-next (4518dfcf761e ovl: fix lookup of indexed h=
ardlinks with metacopy)
Merging ubifs/next (798b7347e4f2 jffs2: fix UAF problem)
Merging v9fs/9p-next (2ed0b7578170 9p: Remove unneeded cast from memory all=
ocation)
Merging xfs/for-next (96cf2a2c7556 xfs: Fix UBSAN null-ptr-deref in xfs_sys=
fs_init)
Merging zonefs/for-next (2f4b7462d2fa zonefs: update documentation to refle=
ct zone size vs capacity)
Merging iomap/iomap-for-next (60263d5889e6 iomap: fall back to buffered wri=
tes for invalidation failures)
Merging djw-vfs/vfs-for-next (e4f9ba20d3b8 fs/xfs: Update xfs_ioctl_setattr=
_dax_invalidate())
Merging file-locks/locks-next (c0842fbc1b18 random32: move the pseudo-rando=
m 32-bit definitions to prandom.h)
Merging vfs/for-next (bcf876870b95 Linux 5.8)
Merging printk/for-next (4f910e587667 Merge branch 'printk-rework' into for=
-next)
Merging pci/next (6f119ec8d9c8 Merge branch 'pci/irq-error')
Merging pstore/for-next/pstore (137c6236aeec mailmap: Add WeiXiong Liao)
Merging hid/for-next (bc12a7f8e273 Merge branch 'for-5.8/upstream-fixes' in=
to for-next)
Merging i2c/i2c/for-next (8cd60a71c849 Merge branch 'i2c/for-5.9' into i2c/=
for-next)
Merging i3c/i3c/next (b4203ce05563 i3c master: GETMRL's 3rd byte is optiona=
l even with BCR_IBI_PAYLOAD)
Merging dmi/dmi-for-next (a3d13a0a23ea Replace HTTP links with HTTPS ones: =
DMI/SMBIOS SUPPORT)
Merging hwmon-staging/hwmon-next (4f31c8c48312 hwmon: (ltc2947) use simple =
i2c probe)
Merging jc_docs/docs-next (1edcd4675e44 Documentation/locking/locktypes: fi=
x the typo)
Merging v4l-dvb/master (f45882cfb152 media: camss: fix memory leaks on erro=
r handling paths in probe)
Merging v4l-dvb-next/master (0d6db85131e0 Revert "media: atomisp: keep the =
ISP powered on when setting it")
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (395313eda153 Merge branches 'acpi-soc' and 'pm-cpufr=
eq' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (f259eab3ea0e cpufreq: make sche=
dutil the default for arm and arm64)
Merging cpupower/cpupower (94bd8ea151da cpupowerutils: fix spelling mistake=
 "dependant" -> "dependent")
Merging devfreq/devfreq-next (d6efb3ac3e6c Merge tag 'tty-5.9-rc1' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty)
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
CONFLICT (content): Merge conflict in drivers/xen/swiotlb-xen.c
Merging rdma/for-next (23fcc7dee2c6 RDMA/mlx5: Fix flow destination setting=
 for RDMA TX flow table)
Merging net-next/master (7fca4dee610d Merge tag 'powerpc-5.9-2' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/powerpc/linux)
Merging bpf-next/master (bfdd5aaa54b0 Merge tag 'Smack-for-5.9' of git://gi=
thub.com/cschaufler/smack-next)
Merging ipsec-next/master (da7955405fb2 sfc: Fix build with CONFIG_RFS_ACCE=
L disabled.)
Merging mlx5-next/mlx5-next (042dd05bddbd RDMA/mlx5: ConnectX-7 new capabil=
ities to set relaxed ordering by UMR)
Merging netfilter-next/master (bfdd5aaa54b0 Merge tag 'Smack-for-5.9' of gi=
t://github.com/cschaufler/smack-next)
Merging ipvs-next/master (bfdd5aaa54b0 Merge tag 'Smack-for-5.9' of git://g=
ithub.com/cschaufler/smack-next)
Merging wireless-drivers-next/master (3dc05ffb0443 brcmfmac: Set timeout va=
lue when configuring power save)
Merging bluetooth/master (3b799254cf6f Bluetooth: hci_uart: Cancel init wor=
k before unregistering)
Merging mac80211-next/master (bfdd5aaa54b0 Merge tag 'Smack-for-5.9' of git=
://github.com/cschaufler/smack-next)
Merging gfs2/for-next (e28c02b94f9e gfs2: When gfs2_dirty_inode gets a gloc=
k error, dump the glock)
Merging mtd/mtd/next (6a1380271b75 Merge tag 'nand/for-5.9' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/mtd/linux into mtd/next)
Merging nand/nand/next (da151e3458c8 dt-bindings: mtd: fsl-upm-nand: Deprec=
ate chip-delay and fsl, upm-wait-flags)
Merging spi-nor/spi-nor/next (e93a977367b2 mtd: revert "spi-nor: intel: pro=
vide a range for poll_timout")
Merging crypto/master (3cbfe80737c1 crypto: sa2ul - Fix inconsistent IS_ERR=
 and PTR_ERR)
Merging drm/drm-next (62975d27d647 drm/ttm: revert "drm/ttm: make TT creati=
on purely optional v3")
Merging amdgpu/drm-next (a9de18085aab drm/amd/powerplay: optimize the mclk =
dpm policy settings)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/amdgpu_dm=
/amdgpu_dm_debugfs.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/amdgpu_dm=
/amdgpu_dm.c
Merging drm-intel/for-linux-next (3a3d26153c81 Merge tag 'gvt-next-fixes-20=
20-08-05' of https://github.com/intel/gvt-linux into drm-intel-next-fixes)
Merging drm-tegra/drm/tegra/for-next (4fba6d22ca9a drm/tegra: plane: Suppor=
t 180=C2=B0 rotation)
Merging drm-misc/for-linux-next (62975d27d647 drm/ttm: revert "drm/ttm: mak=
e TT creation purely optional v3")
Merging drm-msm/msm-next (1041dee2178f drm/msm: use kthread_create_worker i=
nstead of kthread_run)
Merging mali-dp/for-upstream/mali-dp (f634c6a80287 dt/bindings: display: Ad=
d optional property node define for Mali DP500)
Merging imx-drm/imx-drm/next (b93080622eb3 drm/imx: dw_hdmi-imx: use imx_dr=
m_encoder_parse_of)
Merging etnaviv/etnaviv/next (c5d5a32ead1e drm/etnaviv: fix ref count leak =
via pm_runtime_get_sync)
Merging regmap/for-next (c9fadf212afd Merge remote-tracking branch 'regmap/=
for-5.9' into regmap-next)
Merging sound/for-next (f5d0f820ff8a ALSA: isa: fix spelling mistakes in th=
e comments)
Merging sound-asoc/for-next (933cc41085d5 Merge remote-tracking branch 'aso=
c/for-5.9' into asoc-linus)
Merging modules/modules-next (262e6ae7081d modules: inherit TAINT_PROPRIETA=
RY_MODULE)
Merging input/next (d862a3068ea5 Input: exc3000 - add support to query mode=
l and fw_version)
Merging block/for-next (86cfccb66937 Merge tag 'dlm-5.9' of git://git.kerne=
l.org/pub/scm/linux/kernel/git/teigland/linux-dlm)
Merging device-mapper/for-next (a9cb9f4148ef dm: don't call report zones fo=
r more than the user requested)
Merging pcmcia/pcmcia-next (46d079790663 pcmcia: make pccard_loop_tuple() s=
tatic)
Merging mmc/next (7f4bc2e8687e mmc: mediatek: make function msdc_cqe_disabl=
e() static)
Merging mfd/for-mfd-next (e15d7f2b81d2 mfd: syscon: Use a unique name with =
regmap_config)
Merging backlight/for-backlight-next (7eb99a39ef76 video: backlight: cr_bll=
cd: Remove unused variable 'intensity')
Merging battery/for-next (46cbd0b05799 power: supply: wilco_ec: Add long li=
fe charging mode)
Merging regulator/for-next (75f4d068cb0d Merge remote-tracking branch 'regu=
lator/for-5.9' into regulator-linus)
Merging security/next-testing (ddcf4ecd547e Merge branch 'for-v5.8' into ne=
xt-testing)
Merging apparmor/apparmor-next (e37986097ba6 apparmor: Use true and false f=
or bool variable)
Merging integrity/next-integrity (3db0d0c276a7 integrity: remove redundant =
initialization of variable ret)
Merging keys/keys-next (b6f61c314649 keys: Implement update for the big_key=
 type)
Merging safesetid/safesetid-next (0476c865ded6 LSM: SafeSetID: Fix warnings=
 reported by test bot)
Merging selinux/next (54b27f9287a7 selinux: complete the inlining of hashta=
b functions)
Merging smack/next (42a2df3e829f Smack: prevent underflow in smk_set_cipso(=
))
Merging tomoyo/master (9123e3a74ec7 Linux 5.9-rc1)
Merging tpmdd/next (85467f63a05c tpm: Add support for event log pointer fou=
nd in TPM2 ACPI table)
Merging watchdog/master (d5b29c2c5ba2 watchdog: rti-wdt: balance pm runtime=
 enable calls)
Merging iommu/next (e46b3c0d011e Merge tag 'arm-smmu-updates' of git://git.=
kernel.org/pub/scm/linux/kernel/git/will/linux into next)
Merging vfio/next (ccd59dce1a21 vfio/type1: Refactor vfio_iommu_type1_ioctl=
())
Merging audit/next (b43870c74f3f audit: report audit wait metric in audit s=
tatus reply)
Merging devicetree/for-next (f516fb704d02 dt-bindings: Whitespace clean-ups=
 in schema files)
Merging mailbox/mailbox-for-next (884996986347 mailbox: mediatek: cmdq: cle=
ar task in channel before shutdown)
Merging spi/for-next (3ea884314328 Merge remote-tracking branch 'spi/for-5.=
9' into spi-linus)
Merging tip/auto-latest (76007cb19bbd Merge branch 'perf/urgent')
Merging clockevents/timers/drivers/next (9fba22584e54 clocksource: Ingenic:=
 Add support for the Ingenic X1000 OST.)
Merging edac/edac-for-next (18d0299c1360 EDAC/ie31200: Fallback if host bri=
dge device is already initialized)
Merging irqchip/irq/irqchip-next (6da45875fa17 arm64: dts: k3-am65: Update =
the RM resource types)
Merging ftrace/for-next (38ce2a9e33db tracing: Add trace_array_init_printk(=
) to initialize instance trace_printk() buffers)
Merging rcu/rcu/next (71e05e558a5f Merge branch 'kcsan.2020.06.29a' into HE=
AD)
Merging kvm/linux-next (e792415c5d3e KVM: MIPS/VZ: Fix build error caused b=
y 'kvm_run' cleanup)
Merging kvm-arm/next (16314874b12b Merge branch 'kvm-arm64/misc-5.9' into k=
vmarm-master/next)
Merging kvm-ppc/kvm-ppc-next (81ab595ddd3c KVM: PPC: Book3S HV: Rework secu=
re mem slot dropping)
Merging kvms390/next (23a60f834406 s390/kvm: diagnose 0x318 sync and reset)
Merging xen-tip/linux-next (585c6ed738a5 drm/xen-front: Pass dumb buffer da=
ta offset to the backend)
Merging percpu/for-next (4fa640dc5230 Merge tag 'vfio-v5.8-rc7' of git://gi=
thub.com/awilliam/linux-vfio into master)
Merging workqueues/for-next (10cdb1575954 workqueue: use BUILD_BUG_ON() for=
 compile time test instead of WARN_ON())
Merging drivers-x86/for-next (00e4db51259a Merge tag 'perf-tools-2020-08-10=
' of git://git.kernel.org/pub/scm/linux/kernel/git/acme/linux)
Merging chrome-platform/for-next (fc8cacf3fc68 platform/chrome: cros_ec_pro=
to: check for missing EC_CMD_HOST_EVENT_GET_WAKE_MASK)
Merging hsi/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging leds/for-next (0b019b053d21 leds: mt6323: move period calculation)
Merging ipmi/for-next (fc80c51fd4b2 Merge tag 'kbuild-v5.9' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild)
Merging driver-core/driver-core-next (a1d21081a60d Merge git://git.kernel.o=
rg/pub/scm/linux/kernel/git/netdev/net)
Merging usb/usb-next (449dc8c97089 Merge tag 'for-v5.9' of git://git.kernel=
.org/pub/scm/linux/kernel/git/sre/linux-power-supply)
Merging usb-gadget/next (f5e46aa4a124 usb: dwc3: gadget: when the started l=
ist is empty stop the active xfer)
Merging usb-serial/usb-next (47ec5303d73e Merge git://git.kernel.org/pub/sc=
m/linux/kernel/git/netdev/net-next)
Merging usb-chipidea-next/ci-for-usb-next (d6f93d21001e usb: chipidea: imx:=
 get available runtime dr mode for wakeup setting)
Merging phy-next/next (3d7b0ca5300b phy: qualcomm: fix setting of tx_deamp_=
3_5db when device property read fails)
Merging tty/tty-next (fc80c51fd4b2 Merge tag 'kbuild-v5.9' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild)
Merging char-misc/char-misc-next (00e4db51259a Merge tag 'perf-tools-2020-0=
8-10' of git://git.kernel.org/pub/scm/linux/kernel/git/acme/linux)
Merging extcon/extcon-next (b3a9e3b9622a Linux 5.8-rc1)
Merging soundwire/next (a81844034e5b Soundwire: intel_init: save Slave(s) _=
ADR info in sdw_intel_ctx)
Merging thunderbolt/next (ef7e12078ab8 thunderbolt: Fix old style declarati=
on warning)
Merging staging/staging-next (fc80c51fd4b2 Merge tag 'kbuild-v5.9' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild)
Merging mux/for-next (05f19f7f8944 mux: adgs1408: Add mod_devicetable.h and=
 remove of_match_ptr)
Merging icc/icc-next (12a400b016ab interconnect: Mark all dummy functions a=
s static inline)
Merging dmaengine/next (00043a268923 Merge branch 'topic/xilinx' into fixes)
Merging cgroup/for-next (936f2a70f207 cgroup: add cpu.stat file to root cgr=
oup)
Merging scsi/for-next (747eab70283e Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (7e0e8be3a1fd scsi: lpfc: Update lpfc version to =
12.8.0.3)
Merging vhost/linux-next (8a7c3213db06 vdpa/mlx5: fix up endian-ness for mt=
u)
Merging rpmsg/for-next (ca69dba7f13a Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (22cc422070d9 gpio: wcove: Request IRQ after all init=
ialisation done)
Merging gpio-brgl/gpio/for-next (df51f402e3b1 tools: gpio: fix spurious clo=
se warning in gpio-event-mon)
Merging gpio-intel/for-next (4941b8dedb3f gpio: sch: Add a blank line betwe=
en declaration and code)
Merging pinctrl/for-next (fc80c51fd4b2 Merge tag 'kbuild-v5.9' of git://git=
.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild)
Merging pinctrl-intel/for-next (b4f2fcb53487 pinctrl: intel: Add Intel Emmi=
tsburg pin controller support)
Merging pinctrl-samsung/for-next (b3a9e3b9622a Linux 5.8-rc1)
Merging pwm/for-next (6ced5ff0be8e pwm: bcm-iproc: handle clk_get_rate() re=
turn)
Merging userns/for-next (7fce69dff8db Implement kernel_execve)
Merging ktest/for-next (ff131efff141 ktest.pl: Fix spelling mistake "Cant" =
-> "Can't")
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
Merging rtc/rtc-next (27006416be16 rtc: pcf2127: fix alarm handling)
Merging nvdimm/libnvdimm-for-next (03b68d5d7d4b Merge branch 'for-5.9/copy_=
mc' into libnvdimm-for-next)
Merging at24/at24/for-next (8f3d9f354286 Linux 5.7-rc1)
Merging ntb/ntb-next (b3a9e3b9622a Linux 5.8-rc1)
Merging seccomp/for-next/seccomp (16b89f695313 net/scm: Fix typo in SCM_RIG=
HTS compat refactoring)
Merging kspp/for-next/kspp (4970cbebf938 overflow: Add __must_check attribu=
te to check_*() helpers)
Merging gnss/gnss-next (48778464bb7d Linux 5.8-rc2)
Merging fsi/next (4ca8b73f16f0 fsi: aspeed: Support CFAM reset GPIO)
Merging slimbus/for-next (b3a9e3b9622a Linux 5.8-rc1)
Merging nvmem/for-next (a24ef5be460b nvmem: qcom-spmi-sdam: Enable multiple=
 devices)
CONFLICT (add/add): Merge conflict in Documentation/devicetree/bindings/nvm=
em/qcom,qfprom.yaml
Merging xarray/xarray (27586ca786a7 XArray: Handle retry entries within xas=
_find_marked)
Merging hyperv/hyperv-next (95c20aa04897 Drivers: hv: vmbus: Add parsing of=
 VMbus interrupt in ACPI DSDT)
Merging auxdisplay/auxdisplay (46d4a403a04c auxdisplay: Replace HTTP links =
with HTTPS ones)
Merging kgdb/kgdb/for-next (2c308ef41351 kgdb: Make "kgdbcon" work properly=
 with "kgdb_earlycon")
Merging pidfd/for-next (da83d0cb9237 Merge branch 'cap_checkpoint_restore' =
into for-next)
Merging hmm/hmm (7d17e83abec1 mm/hmm/test: use the new migration invalidati=
on)
Merging fpga/for-next (3359f5f44cb5 fpga: dfl: change data type of feature =
id to u16)
Merging kunit/test (48778464bb7d Linux 5.8-rc2)
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
CONFLICT (content): Merge conflict in include/linux/syscalls.h
CONFLICT (content): Merge conflict in fs/internal.h
Merging memblock/for-next (762d4d1a174c arch/ia64: Restore arch-specific pg=
d_offset_k implementation)
Merging init/init-user-pointers (38b082236e77 initramfs: use vfs_utimes in =
do_copy)
Merging akpm-current/current (8d7fe396c9e5 aio: simplify read_events())
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
Merging akpm/master (e79c866c37f1 mm/madvise: check fatal signal pending of=
 target process)

--Sig_/m3KnE/2VdzNgIckDAWjZaK/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl855+MACgkQAVBC80lX
0Gzj6gf/SMCdLFDr87YZ9h0r7B6NrLYyBEb7R6yuARABsT6BH0oudWsojtGmDYWm
Z/iGUXHicSiKI66Bm8PnSr5oG9fGNAP4qWdFipYlkfJ+WQ5DqogXvtA2k6lvgrJv
wKQgN3dzNX1zQjICq6vwczHYXQoULLYyGkC34QqRicq66fwjOlJLwxQlLTXkUqH8
dfhHWvFH640YJVN8uBVlagssrQi01Kesk6V70PIBPiNOI/ge4JjPmQ1T/rW4DR6s
6n3JB+xKPfwE4WTf2AESI2+OSXGKakC4pAuoDpfL6Hbszoxp8jXBP40janUUY9Jp
s8dqGqypS23nmutnhubSx7mCLylVHw==
=hBWR
-----END PGP SIGNATURE-----

--Sig_/m3KnE/2VdzNgIckDAWjZaK/--
