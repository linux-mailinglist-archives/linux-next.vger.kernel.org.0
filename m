Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F051253D1A
	for <lists+linux-next@lfdr.de>; Thu, 27 Aug 2020 07:11:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726266AbgH0FLM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 27 Aug 2020 01:11:12 -0400
Received: from ozlabs.org ([203.11.71.1]:50143 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726028AbgH0FLL (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 27 Aug 2020 01:11:11 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BcW624JBlz9sSP;
        Thu, 27 Aug 2020 15:11:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1598505066;
        bh=x0xL+jHLazT2r0k/LuD9MNeSWPkQdiF7ioD8U17W/qo=;
        h=Date:From:To:Cc:Subject:From;
        b=NFyafhx9okx6AqTF45nKrWvDTJ/E75UBbjvQLN+cyfmZYRukorD+BqMHXfpf/CKl0
         xQyByhk4IHUpKPleIhkDAYfBQJKmtj9jTVs+wB0jZo6yDOIjfTO5QDFL+dRvhTcBgF
         GRfbUlI9xKgagQQJ83A5VoVw+jyIE8pxSh5T864InUrThuliQggwjOldEYBP1rGjqg
         jX5Tbea+vnWyeluZgIzYNcbIiibfQvd0l/8xAfQJryXB4QsreoA5+mzMAN5j1w9Yyf
         Bc8RNcZLfvRBAvY3ZZZASh6tnz0Di5Ex47fgwxfhXPrkfuF0HUr5sz3eYPH0E75eKf
         p1OJyIoadJxVw==
Date:   Thu, 27 Aug 2020 15:11:05 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Aug 27
Message-ID: <20200827151105.73c75040@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qdgUTZ+n/lPcMVEQdQnQ0N5";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/qdgUTZ+n/lPcMVEQdQnQ0N5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

News:  There will be no linux-next releases next Monday or Tuesday.

Changes since 20200826:

The net-next tree gained a conflict against the net tree.

Non-merge commits (relative to Linus' tree): 2901
 3429 files changed, 100496 insertions(+), 37081 deletions(-)

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
Merging origin/master (15bc20c6af4c Merge tag 'tty-5.9-rc3' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/gregkh/tty)
Merging fixes/fixes (9123e3a74ec7 Linux 5.9-rc1)
Merging kbuild-current/fixes (d012a7190fc1 Linux 5.9-rc2)
Merging arc-current/for-curr (37016ab49214 irqchip/eznps: Fix build error f=
or !ARC700 builds)
Merging arm-current/fixes (5c6360ee4a0e ARM: 8988/1: mmu: fix crash in EFI =
calls due to p4d typo in create_mapping_late())
Merging arm64-fixes/for-next/fixes (8d75785a8142 ARM64: vdso32: Install vds=
o32 from vdso_install)
Merging arm-soc-fixes/arm/fixes (9c8b0a9c37b7 Merge tag 'imx-fixes-5.9' of =
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into arm/fixes)
Merging uniphier-fixes/fixes (48778464bb7d Linux 5.8-rc2)
Merging drivers-memory-fixes/fixes (7ff3a2a626f7 memory: jz4780_nemc: Fix a=
n error pointer vs NULL check in probe())
Merging m68k-current/for-linus (382f429bb559 m68k: defconfig: Update defcon=
figs for v5.8-rc3)
Merging powerpc-fixes/fixes (64ef8f2c4791 powerpc/perf/hv-24x7: Move cpumas=
k file to top folder of hv-24x7 driver)
Merging s390-fixes/fixes (bffc2f7aa963 s390/vmem: fix vmem_add_range for 4-=
level paging)
Merging sparc/master (0a95a6d1a4cd sparc: use for_each_child_of_node() macr=
o)
Merging fscrypt-current/for-stable (2b4eae95c736 fscrypt: don't evict dirty=
 inodes after removing key)
Merging net/master (5fd99b5d9950 net: cdc_ncm: Fix build error)
Merging bpf/master (7787b6fc938e bpf, sysctl: Let bpf_stats_handler take a =
kernel pointer buffer)
Merging ipsec/master (4eb2e1341575 espintcp: restore IP CB before handing t=
he packet to xfrm)
Merging netfilter/master (3622adb02623 ipv6: ndisc: adjust ndisc_ifinfo_sys=
ctl_change prototype)
Merging ipvs/master (7c7ab580db49 net: Convert to use the fallthrough macro)
Merging wireless-drivers/master (9a2a0862d973 brcmfmac: reserve tx credit o=
nly when txctl is ready to send)
Merging mac80211/master (fce2ff728f95 nl80211: fix NL80211_ATTR_HE_6GHZ_CAP=
ABILITY usage)
Merging rdma-fixes/for-rc (60b1af64eb35 RDMA/rxe: Fix the parent sysfs read=
 when the interface has 15 chars)
Merging sound-current/for-linus (858e0ad9301d ALSA: hda/hdmi: always check =
pin power status in i915 pin fixup)
Merging sound-asoc-fixes/for-linus (d563b6c834ae Merge series "ASoC: Fix re=
turn check for devm_regmap_init_sdw()" from Vinod Koul <vkoul@kernel.org>:)
Merging regmap-fixes/for-linus (d012a7190fc1 Linux 5.9-rc2)
Merging regulator-fixes/for-linus (3bec5b6aae83 Merge tag 'v5.9-rc2' into r=
egulator-5.9)
Merging spi-fixes/for-linus (3812e0343b42 Merge remote-tracking branch 'spi=
/for-5.9' into spi-linus)
Merging pci-current/for-linus (7c2308f79fc8 PCI/P2PDMA: Fix build without D=
MA ops)
Merging driver-core.current/driver-core-linus (d012a7190fc1 Linux 5.9-rc2)
Merging tty.current/tty-linus (ea1fc02e12b6 tty: serial: imx: add dependenc=
e and build for earlycon)
Merging usb.current/usb-linus (23e26d057753 usb: typec: tcpm: Fix Fix sourc=
e hard reset response for TDA 2.3.1.1 and TDA 2.3.1.2 failures)
Merging usb-gadget-fixes/fixes (bc9a2e226ea9 usb: dwc3: gadget: Handle ZLP =
for sg requests)
Merging usb-serial-fixes/usb-linus (6ccc48e0eb2f USB: serial: ftdi_sio: add=
 IDs for Xsens Mti USB converter)
Merging usb-chipidea-fixes/ci-for-usb-stable (2d79b3360dcc usb: chipidea: c=
ore: add wakeup support for extcon)
Merging phy/fixes (afd55e6d1bd3 phy: qcom-qmp: Use correct values for ipq80=
74 PCIe Gen2 PHY init)
Merging staging.current/staging-linus (1dffeb8b8b4c staging: greybus: audio=
: fix uninitialized value issue)
Merging char-misc.current/char-misc-linus (9c97cecab0d4 Merge tag 'misc-hab=
analabs-fixes-2020-08-22' of git://people.freedesktop.org/~gabbayo/linux in=
to char-misc-linus)
Merging soundwire-fixes/fixes (f8d0168e035f soundwire: bus: fix typo in com=
ment on INTSTAT registers)
Merging thunderbolt-fixes/fixes (813050e0a9b8 thunderbolt: Use maximum USB3=
 link rate when reclaiming if link is not up)
Merging input-current/for-linus (9e8238020c5b Merge branch 'next' into for-=
linus)
Merging crypto-current/master (bfe8fe939a04 crypto: sa2ul - add Kconfig sel=
ects to fix build error)
Merging ide/master (6800cd8cbc6e ide-acpi: use %*ph to print small buffer)
Merging vfio-fixes/for-linus (aae7a75a821a vfio/type1: Add proper error unw=
ind for vfio_iommu_replay())
Merging kselftest-fixes/fixes (5c1e4f7e9e49 selftests/timers: Turn off time=
out setting)
Merging modules-fixes/modules-linus (57baec7b1b04 scripts/nsdeps: make sure=
 to pass all module source files to spatch)
Merging dmaengine-fixes/fixes (6d6018fc30be drivers/dma/dma-jz4780: Fix rac=
e condition between probe and irq handler)
Merging backlight-fixes/for-backlight-fixes (219d54332a09 Linux 5.4)
Merging mtd-fixes/mtd/fixes (f7e6b19bc764 mtd: properly check all write ioc=
tls for permissions)
Merging mfd-fixes/for-mfd-fixes (dddf4ddc3971 mfd: mfd-core: Ensure disable=
d devices are ignored without error)
Merging v4l-dvb-fixes/fixes (4ffb879ea648 media: media/v4l2-core: Fix kerne=
l-infoleak in video_put_user())
Merging reset-fixes/reset/fixes (b460e0a9e240 reset: intel: add unspecified=
 HAS_IOMEM dependency)
Merging mips-fixes/mips-fixes (91dbd73a1739 mips/oprofile: Fix fallthrough =
placement)
Merging at91-fixes/at91-fixes (54ecb8f7028c Linux 5.4-rc1)
Merging omap-fixes/fixes (6542e2b613c2 ARM: dts: omap5: Fix DSI base addres=
s and clocks)
Merging kvm-fixes/master (b5331379bc62 KVM: arm64: Only reschedule if MMU_N=
OTIFIER_RANGE_BLOCKABLE is not set)
Merging kvms390-fixes/master (774911290c58 KVM: s390: reduce number of IO p=
ins to 1)
Merging hwmon-fixes/hwmon (cecf7560f00a hwmon: (applesmc) check status earl=
ier.)
Merging nvdimm-fixes/libnvdimm-fixes (c2affe920b0e dax: do not print error =
message for non-persistent memory block device)
Merging btrfs-fixes/next-fixes (c9f8e44ec4a5 Merge branch 'misc-5.9' into n=
ext-fixes)
Merging vfs-fixes/fixes (9d682ea6bcc7 vboxsf: Fix the check for the old bin=
ary mount-arguments struct)
Merging dma-mapping-fixes/for-linus (7dc6fd0f3b84 Merge branch 'i2c/for-cur=
rent' of git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux)
Merging i3c-fixes/master (6fbc7275c7a9 Linux 5.2-rc7)
Merging drivers-x86-fixes/fixes (9123e3a74ec7 Linux 5.9-rc1)
Merging samsung-krzk-fixes/fixes (9123e3a74ec7 Linux 5.9-rc1)
Merging pinctrl-samsung-fixes/pinctrl-fixes (9123e3a74ec7 Linux 5.9-rc1)
Merging devicetree-fixes/dt/linus (5cd841d2676a dt-bindings: vendor-prefixe=
s: Remove trailing whitespace)
Merging scsi-fixes/fixes (75d46c6d15ef scsi: scsi_debug: Remove superfluous=
 close zone in resp_open_zone())
Merging drm-fixes/drm-fixes (d012a7190fc1 Linux 5.9-rc2)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (e5f10d6385cd drm/i915: Fix cm=
d parser desc matching with masks)
Merging mmc-fixes/fixes (710d4d916e6d dt-bindings: mmc: Add missing descrip=
tion for clk_in/out_sd1)
Merging rtc-fixes/rtc-fixes (9123e3a74ec7 Linux 5.9-rc1)
Merging gnss-fixes/gnss-linus (48778464bb7d Linux 5.8-rc2)
Merging hyperv-fixes/hyperv-fixes (b46b4a8a57c3 hv_utils: drain the timesyn=
c packets on onchannelcallback)
Merging soc-fsl-fixes/fix (fe8fe7723a3a soc: fsl: dpio: register dpio irq h=
andlers after dpio create)
Merging risc-v-fixes/fixes (0981b50cd6c7 riscv/mm: Simplify retry logic in =
do_page_fault())
Merging pidfd-fixes/fixes (bda4c60d02e9 sys: Convert to the new fallthrough=
 notation)
Merging fpga-fixes/fixes (8614afd689df fpga: dfl: fix bug in port reset han=
dshake)
Merging spdx/spdx-linus (9123e3a74ec7 Linux 5.9-rc1)
Merging gpio-intel-fixes/fixes (9123e3a74ec7 Linux 5.9-rc1)
Merging pinctrl-intel-fixes/fixes (9123e3a74ec7 Linux 5.9-rc1)
Merging erofs-fixes/fixes (9ebcfadb0610 Linux 5.8-rc3)
Merging integrity-fixes/fixes (843385694721 evm: Fix a small race in init_d=
esc())
Merging kunit-fixes/kunit-fixes (9123e3a74ec7 Linux 5.9-rc1)
Merging ubifs-fixes/fixes (f37e99aca03f Merge tag 's390-5.8-6' of git://git=
.kernel.org/pub/scm/linux/kernel/git/s390/linux into master)
Merging memblock-fixes/fixes (bd05220c7be3 arch/ia64: Restore arch-specific=
 pgd_offset_k implementation)
Merging drm-misc-fixes/for-linux-next-fixes (460f26d3ee70 drm/virtio: Rever=
t "drm/virtio: Call the right shmem helpers")
Merging kspp-gustavo/for-next/kspp (14fb4700629b afs: Remove erroneous fall=
though annotation)
Merging kbuild/for-next (6ad7cbc01527 Makefile: Add clang-tidy and static a=
nalyzer support to makefile)
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
Merging arm-soc/for-next (2694ca73fa41 ARM: Document merges)
Merging amlogic/for-next (c943b84fab78 Merge branch 'v5.10/dt64' into tmp/a=
ml-rebuild)
Merging aspeed/for-next (7c32a9d95c9a ARM: dts: aspeed: wedge40: Update UAR=
T4 pin settings)
Merging at91/at91-next (b68f43873b72 Merge branch 'at91-soc' into at91-next)
Merging drivers-memory/for-next (4c54228ac8fd memory: omap-gpmc: Fix a coup=
le off by ones)
Merging imx-mxs/for-next (427954264555 Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (50c950e2c8b6 Merge branch 'for_5.9/driver-soc' into =
next)
Merging mediatek/for-next (647a84d1e4dc Merge branch 'v5.8-next/soc' into f=
or-next)
Merging mvebu/for-next (29bd9d8c2ac1 Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (390f789055a0 Merge branch 'omap-for-v5.10/dt' into f=
or-next)
Merging qcom/for-next (9123e3a74ec7 Linux 5.9-rc1)
Merging raspberrypi/for-next (9123e3a74ec7 Linux 5.9-rc1)
Merging realtek/for-next (486f29df6941 Merge branch 'v5.8/dt' into next)
Merging renesas/next (15c95b417a9c Merge branches 'renesas-arm-defconfig-fo=
r-v5.10', 'renesas-arm-dt-for-v5.10' and 'renesas-drivers-for-v5.10' into r=
enesas-next)
Merging reset/reset/next (2983e2385ff6 reset: imx7: add the cm4 reset for i=
.MX8MQ)
CONFLICT (content): Merge conflict in drivers/reset/reset-imx7.c
Merging rockchip/for-next (088d74f51158 Merge branch 'v5.9-clk/next' into f=
or-next)
Merging samsung-krzk/for-next (f609c46be3ca Merge branch 'next/soc-s3c-clea=
nup' into for-next)
Merging scmi/for-linux-next (d012a7190fc1 Linux 5.9-rc2)
Merging sunxi/sunxi/for-next (9123e3a74ec7 Linux 5.9-rc1)
Merging tegra/for-next (8617339892a6 Merge branch for-5.9/arm64/dt into for=
-next)
Merging ti-k3/ti-k3-next (1e3d655fe7b4 Merge branch 'ti-k3-config-next' int=
o ti-k3-next)
Merging ti-k3-new/ti-k3-next (9123e3a74ec7 Linux 5.9-rc1)
Merging uniphier/for-next (4f8fb65af529 Merge branch 'dt64' into for-next)
Merging clk/clk-next (24907ec54702 Merge branch 'clk-fixes' into clk-next)
Merging clk-samsung/for-next (3d77e6a8804a Linux 5.7)
Merging csky/linux-next (bdcd93ef9afb csky: Add context tracking support)
Merging h8300/h8300-next (8808515be0ed h8300: Replace <linux/clk-provider.h=
> by <linux/of_clk.h>)
Merging ia64/next (1a9d3c34c593 x86/cpu: Add Lakefield, Alder Lake and Rock=
et Lake to Intel family)
Merging m68k/for-next (5661bccb70ef m68k: Correct some typos in comments)
Merging m68knommu/for-next (0fdaa525ea1c binfmt_flat: revert "binfmt_flat: =
don't offset the data start")
Merging microblaze/next (b3a9e3b9622a Linux 5.8-rc1)
Merging mips/mips-next (aa9c45db018f MIPS: SGI-IP32: No need to include mc1=
4818*.h)
Merging nds32/next (0a2e478902c7 nds32: use get_kernel_nofault in dump_mem)
Merging nios2/for-next (6b57fa4d374b nios2: signal: Mark expected switch fa=
ll-through)
Merging openrisc/for-next (55b2662ec665 openrisc: uaccess: Add user address=
 space check to access_ok)
Merging parisc-hd/for-next (bcf876870b95 Linux 5.8)
Merging powerpc/next (9123e3a74ec7 Linux 5.9-rc1)
Merging fsl/next (a76bea0287ce powerpc/kmcent2: add ranges to the pci bridg=
es)
Merging soc-fsl/next (e9e4ef9116b1 soc: fsl: dpio: Remove unused inline fun=
ction qbman_write_eqcr_am_rt_register)
Merging risc-v/for-next (f75fa0a51b8b efi: Rename arm-init to efi-init comm=
on for all arch)
Merging s390/features (d012a7190fc1 Linux 5.9-rc2)
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
Merging btrfs/for-next (70daa2f88d69 Merge branch 'for-next-next-v5.9-20200=
826' into for-next-20200826)
Merging ceph/master (496ceaf12432 ceph: don't allow setlease on cephfs)
Merging cifs/for-next (d012a7190fc1 Linux 5.9-rc2)
Merging configfs/for-next (059ccbfff8a8 configfs: use flush file op to comm=
it writes to a binary file)
Merging ecryptfs/next (8b614cb8f1dc Merge tag '5.6-rc4-smb3-fixes' of git:/=
/git.samba.org/sfrench/cifs-2.6)
Merging erofs/dev (cfcedfe21820 erofs: avoid duplicated permission check fo=
r "trusted." xattrs)
Merging exfat/dev (34d41dbe5455 exfat: use i_blocksize() to get blocksize)
Merging ext3/for_next (de575ac602ab Pull reiserfs spelling fixes.)
Merging ext4/dev (27bc446e2def ext4: limit the length of per-inode prealloc=
 list)
Merging f2fs/dev (da0815f3bce1 f2fs: Use generic casefolding support)
Merging fsverity/fsverity (f3db0bed4583 fs-verity: use smp_load_acquire() f=
or ->i_verity_info)
Merging fuse/for-next (9e9e23bd2d36 fuse: update project homepage)
Merging jfs/jfs-next (7aba5dcc2346 jfs: Replace zero-length array with flex=
ible-array member)
Merging nfs/linux-next (d012a7190fc1 Linux 5.9-rc2)
Merging nfs-anna/linux-next (65caafd0d214 SUNRPC reverting d03727b248d0 ("N=
FSv4 fix CLOSE not waiting for direct IO compeletion"))
Merging nfsd/nfsd-next (9123e3a74ec7 Linux 5.9-rc1)
Merging cel/cel-next (ad112aa8b1ac SUNRPC: remove duplicate include)
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
Merging printk/for-next (20d6ee092831 Merge branch 'for-5.10' into for-next)
Merging pci/next (9123e3a74ec7 Linux 5.9-rc1)
Merging pstore/for-next/pstore (137c6236aeec mailmap: Add WeiXiong Liao)
CONFLICT (content): Merge conflict in .mailmap
Merging hid/for-next (de11ec5fedd9 Merge branch 'for-5.9/upstream-fixes' in=
to for-next)
Merging i2c/i2c/for-next (3f7462407ce3 Merge branch 'i2c/for-current' into =
i2c/for-next)
Merging i3c/i3c/next (9da36a7ec421 i3c: master add i3c_master_attach_boardi=
nfo to preserve boardinfo)
Merging dmi/dmi-for-next (a3d13a0a23ea Replace HTTP links with HTTPS ones: =
DMI/SMBIOS SUPPORT)
Merging hwmon-staging/hwmon-next (314119a53803 dt-bindings: hwmon: Add bind=
ings for ADM1266)
Merging jc_docs/docs-next (92001bc0365a Documentation: laptops: thinkpad-ac=
pi: fix underline length build warning)
Merging v4l-dvb/master (9a538b83612c media: venus: core: Add support for op=
p tables/perf voting)
Merging v4l-dvb-next/master (0d6db85131e0 Revert "media: atomisp: keep the =
ISP powered on when setting it")
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (fe784821d630 Merge branch 'pm-sleep' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (99bcfd231280 cpufreq: tegra186:=
 Fix initial frequency)
Merging cpupower/cpupower (527b7779e5ec cpupower: speed up generating git v=
ersion string)
Merging devfreq/devfreq-next (9123e3a74ec7 Linux 5.9-rc1)
Merging opp/opp/linux-next (8c6269534d00 opp: Set required OPPs in reverse =
order when scaling down)
Merging thermal/thermal/linux-next (6f55be9fd5ee Merge branch 'thermal/fixe=
s' into thermal/linux-next)
Merging thermal-rzhang/next (54ecb8f7028c Linux 5.4-rc1)
Merging thermal-soc/next (6c375eccded4 thermal: db8500: Rewrite to be a pur=
e OF sensor)
Merging ieee1394/for-next (67f8e65e4fc1 firewire: net: remove set but not u=
sed variable 'guid')
Merging dlm/next (fa601a9ebd49 fs: dlm: implement tcp graceful shutdown)
Merging swiotlb/linux-next (4cdfb27ba80d xen/swiotlb: remember having calle=
d xen_create_contiguous_region())
CONFLICT (content): Merge conflict in drivers/xen/swiotlb-xen.c
Merging rdma/for-next (8dc105befe16 RDMA/cm: Add tracepoints to track MAD s=
end operations)
Merging net-next/master (d6fc1923d683 net: ipa: remove duplicate include)
CONFLICT (content): Merge conflict in drivers/net/ethernet/ibm/ibmvnic.c
Merging bpf-next/master (ef05afa66c59 libbpf: Fix unintentional success ret=
urn code in bpf_object__load)
CONFLICT (content): Merge conflict in tools/lib/bpf/libbpf.c
Merging ipsec-next/master (da7955405fb2 sfc: Fix build with CONFIG_RFS_ACCE=
L disabled.)
Merging mlx5-next/mlx5-next (9123e3a74ec7 Linux 5.9-rc1)
Merging netfilter-next/master (d0a84e1f38d9 ethtool: allow flow-type ether =
without IP protocol field)
Merging ipvs-next/master (bfdd5aaa54b0 Merge tag 'Smack-for-5.9' of git://g=
ithub.com/cschaufler/smack-next)
Merging wireless-drivers-next/master (eb77802e0daa Merge ath-next from git:=
//git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git)
Merging bluetooth/master (3b799254cf6f Bluetooth: hci_uart: Cancel init wor=
k before unregistering)
Merging mac80211-next/master (e5b15f5af21a Merge branch 'ptp-Add-generic-he=
lper-functions')
Merging gfs2/for-next (e28c02b94f9e gfs2: When gfs2_dirty_inode gets a gloc=
k error, dump the glock)
Merging mtd/mtd/next (6a1380271b75 Merge tag 'nand/for-5.9' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/mtd/linux into mtd/next)
Merging nand/nand/next (da151e3458c8 dt-bindings: mtd: fsl-upm-nand: Deprec=
ate chip-delay and fsl, upm-wait-flags)
Merging spi-nor/spi-nor/next (e93a977367b2 mtd: revert "spi-nor: intel: pro=
vide a range for poll_timout")
Merging crypto/master (6779d0e6b0fe crypto: arm/curve25519 - include <linux=
/scatterlist.h>)
Merging drm/drm-next (d012a7190fc1 Linux 5.9-rc2)
Merging amdgpu/drm-next (19ec3e0535a2 drm/amdgpu/swsmu: add handle manual f=
an readback on sienna cichlid)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/pm/swsmu/smu11/si=
enna_cichlid_ppt.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/pm/inc/smu_v11_0.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/pm/inc/smu11_driv=
er_if_sienna_cichlid.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/dml/di=
splay_mode_vba.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/dcn30/=
dcn30_resource.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/core/d=
c_link.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/bios/c=
ommand_table2.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/amdgpu_dm=
/amdgpu_dm_debugfs.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/amdgpu_dm=
/amdgpu_dm.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/nv.c
Merging drm-intel/for-linux-next (a91da6686108 drm/i915/gt: Implement WA_14=
06941453)
Merging drm-tegra/drm/tegra/for-next (4fba6d22ca9a drm/tegra: plane: Suppor=
t 180=C2=B0 rotation)
Merging drm-misc/for-linux-next (94d4c13233c2 drm/bridge: ps8640: Print an =
error if VDO control fails)
CONFLICT (content): Merge conflict in drivers/video/fbdev/savage/savagefb_d=
river.c
CONFLICT (content): Merge conflict in drivers/video/fbdev/atmel_lcdfb.c
CONFLICT (content): Merge conflict in drivers/video/fbdev/arcfb.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_vra=
m_mgr.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_ttm=
.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_ttm=
.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_gtt=
_mgr.c
Applying: fix interaction with drm-misc-fix commit
Merging drm-msm/msm-next (5e0c22d4a9dd drm/msm/a6xx: fix frequency not alwa=
ys being restored on GMU resume)
Merging mali-dp/for-upstream/mali-dp (f634c6a80287 dt/bindings: display: Ad=
d optional property node define for Mali DP500)
Merging imx-drm/imx-drm/next (efd5a93d2a89 drm/imx: drop explicit drm_mode_=
config_cleanup)
Merging etnaviv/etnaviv/next (c5d5a32ead1e drm/etnaviv: fix ref count leak =
via pm_runtime_get_sync)
Merging regmap/for-next (53be8bbc2f40 mfd: intel-m10-bmc: add Max10 BMC chi=
p support for Intel FPGA PAC)
Merging sound/for-next (685a04a53747 ALSA: hda/ca0132 - Add AE-7 exit comma=
nds.)
Merging sound-asoc/for-next (8ef6e85bc5de Merge remote-tracking branch 'aso=
c/for-5.10' into asoc-next)
Merging modules/modules-next (262e6ae7081d modules: inherit TAINT_PROPRIETA=
RY_MODULE)
Merging input/next (9b5fbad1dcee Input: MT - avoid comma separated statemen=
ts)
Merging block/for-next (86cfccb66937 Merge tag 'dlm-5.9' of git://git.kerne=
l.org/pub/scm/linux/kernel/git/teigland/linux-dlm)
Merging device-mapper/for-next (a9cb9f4148ef dm: don't call report zones fo=
r more than the user requested)
Merging pcmcia/pcmcia-next (46d079790663 pcmcia: make pccard_loop_tuple() s=
tatic)
Merging mmc/next (10a70e0d4edd Merge branch 'fixes' into next)
Merging mfd/for-mfd-next (c563a66537d2 mfd: rn5t618: Add a power supply sub=
device)
Merging backlight/for-backlight-next (7eb99a39ef76 video: backlight: cr_bll=
cd: Remove unused variable 'intensity')
Merging battery/for-next (e03e3601fb9f power: supply: lego_ev3: Simplify wi=
th dev_err_probe())
Merging regulator/for-next (d858a71016ec Merge remote-tracking branch 'regu=
lator/for-5.10' into regulator-next)
Merging security/next-testing (bc62d68e2a0a device_cgroup: Fix RCU list deb=
ugging warning)
Merging apparmor/apparmor-next (e37986097ba6 apparmor: Use true and false f=
or bool variable)
Merging integrity/next-integrity (d012a7190fc1 Linux 5.9-rc2)
Merging keys/keys-next (b6f61c314649 keys: Implement update for the big_key=
 type)
Merging safesetid/safesetid-next (0476c865ded6 LSM: SafeSetID: Fix warnings=
 reported by test bot)
Merging selinux/next (0256b0aa8019 selinux: fix error handling bugs in secu=
rity_load_policy())
Merging smack/next (42a2df3e829f Smack: prevent underflow in smk_set_cipso(=
))
Merging tomoyo/master (9123e3a74ec7 Linux 5.9-rc1)
Merging tpmdd/next (9123e3a74ec7 Linux 5.9-rc1)
Merging watchdog/master (18445bf405cb Merge tag 'spi-fix-v5.9-rc1' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging iommu/next (e46b3c0d011e Merge tag 'arm-smmu-updates' of git://git.=
kernel.org/pub/scm/linux/kernel/git/will/linux into next)
Merging vfio/next (ccd59dce1a21 vfio/type1: Refactor vfio_iommu_type1_ioctl=
())
Merging audit/next (c07203516439 audit: Remove redundant null check)
Merging devicetree/for-next (7ba58fff001d dt-bindings: Validate DT binding =
schema in a single call)
Merging mailbox/mailbox-for-next (884996986347 mailbox: mediatek: cmdq: cle=
ar task in channel before shutdown)
Merging spi/for-next (a37344d70f47 Merge remote-tracking branch 'spi/for-5.=
10' into spi-next)
Merging tip/auto-latest (21f294e9c2da Merge branch 'perf/core')
Merging clockevents/timers/drivers/next (9fba22584e54 clocksource: Ingenic:=
 Add support for the Ingenic X1000 OST.)
Merging edac/edac-for-next (e9b46cc8e3eb Merge branch 'edac-misc' into edac=
-for-next)
Merging irqchip/irq/irqchip-next (821fc9e261f3 irqchip/ingenic: Leave paren=
t IRQ unmasked on suspend)
Merging ftrace/for-next (38ce2a9e33db tracing: Add trace_array_init_printk(=
) to initialize instance trace_printk() buffers)
Merging rcu/rcu/next (72cc80705122 rcu: Remove unused "cpu" parameter from =
rcu_report_qs_rdp())
Merging kvm/linux-next (e792415c5d3e KVM: MIPS/VZ: Fix build error caused b=
y 'kvm_run' cleanup)
Merging kvm-arm/next (16314874b12b Merge branch 'kvm-arm64/misc-5.9' into k=
vmarm-master/next)
Merging kvm-ppc/kvm-ppc-next (81ab595ddd3c KVM: PPC: Book3S HV: Rework secu=
re mem slot dropping)
Merging kvms390/next (23a60f834406 s390/kvm: diagnose 0x318 sync and reset)
Merging xen-tip/linux-next (ee87e1557c42 Fix build error when CONFIG_ACPI i=
s not set/enabled:)
Merging percpu/for-next (4fa640dc5230 Merge tag 'vfio-v5.8-rc7' of git://gi=
thub.com/awilliam/linux-vfio into master)
Merging workqueues/for-next (10cdb1575954 workqueue: use BUILD_BUG_ON() for=
 compile time test instead of WARN_ON())
Merging drivers-x86/for-next (9123e3a74ec7 Linux 5.9-rc1)
Merging chrome-platform/for-next (9123e3a74ec7 Linux 5.9-rc1)
Merging hsi/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging leds/for-next (242b81170fb8 leds: lp50xx: Add the LP50XX family of =
the RGB LED driver)
Merging ipmi/for-next (83dea1285672 char: ipmi: convert tasklets to use new=
 tasklet_setup() API)
Merging driver-core/driver-core-next (d012a7190fc1 Linux 5.9-rc2)
Merging usb/usb-next (cb06b385d536 usb: atm: don't use snprintf() for sysfs=
 attrs)
Merging usb-gadget/next (f5e46aa4a124 usb: dwc3: gadget: when the started l=
ist is empty stop the active xfer)
Merging usb-serial/usb-next (9123e3a74ec7 Linux 5.9-rc1)
Merging usb-chipidea-next/ci-for-usb-next (58a3cefb3840 usb: chipidea: imx:=
 add two samsung picophy parameters tuning implementation)
Merging phy-next/next (c42dcb195b2f phy: ti: j721e-wiz: Remove duplicate in=
clude)
Merging tty/tty-next (52c3c3a59234 Revert "vc_screen: extract vcs_read_buf_=
header")
Merging char-misc/char-misc-next (d162219c655c mei: virtio: virtualization =
frontend driver)
Merging extcon/extcon-next (57a3706b02e2 extcon: Replace HTTP links with HT=
TPS ones)
Merging soundwire/next (08abad9f45f1 soundwire: intel: refine runtime pm fo=
r SDW_INTEL_CLK_STOP_BUS_RESET)
Merging thunderbolt/next (d012a7190fc1 Linux 5.9-rc2)
Merging staging/staging-next (bc752d2f345b staging: hikey9xx: Kconfig: add =
regulator dependency)
Merging mux/for-next (05f19f7f8944 mux: adgs1408: Add mod_devicetable.h and=
 remove of_match_ptr)
Merging icc/icc-next (12a400b016ab interconnect: Mark all dummy functions a=
s static inline)
Merging dmaengine/next (78a2f92e4c4a dmaengine: axi-dmac: add support for r=
eading bus attributes from registers)
Merging cgroup/for-next (936f2a70f207 cgroup: add cpu.stat file to root cgr=
oup)
Merging scsi/for-next (7b08f25e38ce Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (32417d7844ab scsi: esas2r: Remove unnecessary ca=
sts)
CONFLICT (content): Merge conflict in drivers/scsi/ufs/ufshcd.c
Merging vhost/linux-next (8a7c3213db06 vdpa/mlx5: fix up endian-ness for mt=
u)
Merging rpmsg/for-next (ca69dba7f13a Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (22cc422070d9 gpio: wcove: Request IRQ after all init=
ialisation done)
Merging gpio-brgl/gpio/for-next (01e8d85b68fd gpio: aggregator: Refactor ->=
{get, set}_multiple() to make Sparse happy)
Merging gpio-intel/for-next (9123e3a74ec7 Linux 5.9-rc1)
Merging pinctrl/for-next (fc80c51fd4b2 Merge tag 'kbuild-v5.9' of git://git=
.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild)
Merging pinctrl-intel/for-next (04d53068508e pinctrl: intel: Update header =
block to reflect direct dependencies)
Merging pinctrl-samsung/for-next (9123e3a74ec7 Linux 5.9-rc1)
Merging pwm/for-next (6ced5ff0be8e pwm: bcm-iproc: handle clk_get_rate() re=
turn)
Merging userns/for-next (7fce69dff8db Implement kernel_execve)
Merging ktest/for-next (ff131efff141 ktest.pl: Fix spelling mistake "Cant" =
-> "Can't")
Merging random/dev (ab9a7e27044b random: avoid warnings for !CONFIG_NUMA bu=
ilds)
Merging kselftest/next (9123e3a74ec7 Linux 5.9-rc1)
Merging y2038/y2038 (c4e71212a245 Revert "drm/etnaviv: reject timeouts with=
 tv_nsec >=3D NSEC_PER_SEC")
Merging livepatching/for-next (bf14b015bf51 Merge branch 'for-5.9/selftests=
-cleanup' into for-next)
Merging coresight/next (ff1304be0a05 coresight: etm4x: Add Support for HiSi=
licon ETM device)
Merging rtc/rtc-next (9123e3a74ec7 Linux 5.9-rc1)
Merging nvdimm/libnvdimm-for-next (03b68d5d7d4b Merge branch 'for-5.9/copy_=
mc' into libnvdimm-for-next)
Merging at24/at24/for-next (99363d1c26c8 eeprom: at24: Tidy at24_read())
Merging ntb/ntb-next (b8e2c8bbdf77 NTB: Use struct_size() helper in devm_kz=
alloc())
Merging seccomp/for-next/seccomp (16b89f695313 net/scm: Fix typo in SCM_RIG=
HTS compat refactoring)
Merging kspp/for-next/kspp (55dde35fdb7f overflow: Add __must_check attribu=
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
Merging hyperv/hyperv-next (49971e6bad2d drivers: hv: remove cast from hype=
rv_die_event)
Merging auxdisplay/auxdisplay (46d4a403a04c auxdisplay: Replace HTTP links =
with HTTPS ones)
Merging kgdb/kgdb/for-next (2c308ef41351 kgdb: Make "kgdbcon" work properly=
 with "kgdb_earlycon")
Merging pidfd/for-next (da83d0cb9237 Merge branch 'cap_checkpoint_restore' =
into for-next)
Merging hmm/hmm (9123e3a74ec7 Linux 5.9-rc1)
Merging fpga/for-next (8a5de2de0339 fpga: dfl: change data type of feature =
id to u16)
Merging kunit/test (9123e3a74ec7 Linux 5.9-rc1)
Merging generic-ioremap/for-next (4bdc0d676a64 remove ioremap_nocache and d=
evm_ioremap_nocache)
Merging cfi/cfi/next (11399346ac39 mtd: Replace zero-length array with flex=
ible-array)
Merging kunit-next/kunit (9123e3a74ec7 Linux 5.9-rc1)
Merging trivial/for-next (c1a371cf80fb printk: fix global comment)
Merging zx2c4/for-next (16fbf79b0f83 Linux 5.6-rc7)
Merging mhi/mhi-next (18e9533ac877 bus: mhi: core: Introduce APIs to alloca=
te and free the MHI controller)
Merging notifications/notifications-pipe-core (841a0dfa5113 watch_queue: sa=
mple: Display mount tree change notifications)
Merging memblock/for-next (762d4d1a174c arch/ia64: Restore arch-specific pg=
d_offset_k implementation)
Merging init/init-user-pointers (38b082236e77 initramfs: use vfs_utimes in =
do_copy)
Merging akpm-current/current (e1df8eee6374 ROMFS: support inode blocks calc=
ulation)
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
Merging akpm/master (fbaa3fc5cf22 mm/mmap: add inline munmap_vma_range() fo=
r code readability)

--Sig_/qdgUTZ+n/lPcMVEQdQnQ0N5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9HQGkACgkQAVBC80lX
0Gy9XQgAokiRQ2bl4B3SZRhhC8g+gcJwIsyq39KPG/ra2PNksXsufGiyF27aKB3r
Lu0DDdgdPoiRjx937//BZ4QzRg2BGTRhEtwFgxnh3Vwx86LIN4+TJmAjlZn97iVY
j14lkpPu4Cz7cRyPD8EmY2CGzroL3rJTF28CK4M4Z9H/Y3R3a/O4TEUktMcSXPUA
hJObGfITiRMWN5YWmBF4cttDC4EwcrxWo8GulsxhB87Xvu3klj+fe0csvEPON2nu
qx7aMjESt129bBQbbGimp0x9wnmBVOTXT8K5jv0/BrtHM4Qrzue9wzRcZRX03xJA
x/y2udt6LdNVNeUVp+YYBylMmfLTXQ==
=yoBZ
-----END PGP SIGNATURE-----

--Sig_/qdgUTZ+n/lPcMVEQdQnQ0N5--
