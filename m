Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D39725BCEC
	for <lists+linux-next@lfdr.de>; Thu,  3 Sep 2020 10:16:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726406AbgICIQa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 3 Sep 2020 04:16:30 -0400
Received: from ozlabs.org ([203.11.71.1]:35685 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727989AbgICIQ3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 3 Sep 2020 04:16:29 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BhttZ467Zz9sTC;
        Thu,  3 Sep 2020 18:16:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1599120982;
        bh=cd2UCVJB9dL9PlbU3XNjAZbVHQy/R5JRrkNrbyVBslo=;
        h=Date:From:To:Cc:Subject:From;
        b=WRrT6lQYHjFR7dyFlkjihKge9wXlUg1btkCz9R0Scyn9+duxAua7iA1rQdYzLPvgE
         hTytxiX+i+RM3VldcYjoYuAVCHOAKas5CPabcZBYParzf3Idzc3Zg914u8dBPw7WKE
         skrPYYL77lfmbsnmbmiaT1dNN/EyUDdlbp0ZrnVqOV55JCidlDc9VgLgqfqLrklZjk
         KO2ZtKNyMQxunM37SJJp4ISZptMnvOOjOBEBSeYh6S22pZLBpyxHI4+rjYrfwRBxvy
         KB5tueGtxMa1QswR1nSdAsjRLt2PYARI6ASxnSZHio2ZhUF/glEZtO92qRiUJtG9C8
         eYq4OD3YjGY3A==
Date:   Thu, 3 Sep 2020 18:16:21 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Sep 3
Message-ID: <20200903181621.4ee556bd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hkg08KazQA2IMv9H1BmH6FT";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/hkg08KazQA2IMv9H1BmH6FT
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

News: There will be no linux-next release tomorrow or Monday.

Changes since 20200902:

The tip tree merged badly today so I had to apply a merge fix patch.

The scsi-mkp tree gained a conflict against Linus' tree.

Non-merge commits (relative to Linus' tree): 4011
 5122 files changed, 145893 insertions(+), 64144 deletions(-)

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
Merging origin/master (fc3abb53250a Merge branch 'for-linus' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/hid/hid)
Merging fixes/fixes (9123e3a74ec7 Linux 5.9-rc1)
Merging kbuild-current/fixes (844cbb93dd92 kconfig: remove redundant assign=
ment prompt =3D prompt)
Merging arc-current/for-curr (26907eb605fb ARC: [plat-hsdk]: Switch etherne=
t phy-mode to rgmii-id)
Merging arm-current/fixes (5c6360ee4a0e ARM: 8988/1: mmu: fix crash in EFI =
calls due to p4d typo in create_mapping_late())
Merging arm64-fixes/for-next/fixes (e0328feda79d arm64/module: set trampoli=
ne section flags regardless of CONFIG_DYNAMIC_FTRACE)
Merging arm-soc-fixes/arm/fixes (9c8b0a9c37b7 Merge tag 'imx-fixes-5.9' of =
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into arm/fixes)
Merging uniphier-fixes/fixes (48778464bb7d Linux 5.8-rc2)
Merging drivers-memory-fixes/fixes (7ff3a2a626f7 memory: jz4780_nemc: Fix a=
n error pointer vs NULL check in probe())
Merging m68k-current/for-linus (382f429bb559 m68k: defconfig: Update defcon=
figs for v5.8-rc3)
Merging powerpc-fixes/fixes (fc1f178cdb31 selftests/powerpc: Skip PROT_SAO =
test in guests/LPARS)
Merging s390-fixes/fixes (5c60ed283e1d s390: update defconfigs)
Merging sparc/master (0a95a6d1a4cd sparc: use for_each_child_of_node() macr=
o)
Merging fscrypt-current/for-stable (2b4eae95c736 fscrypt: don't evict dirty=
 inodes after removing key)
Merging net/master (1996cf46e467 net: bcmgenet: fix mask check in bcmgenet_=
validate_flow())
Merging bpf/master (1eb832ac2dee tools/bpf: build: Make sure resolve_btfids=
 cleans up after itself)
Merging ipsec/master (45a36a18d019 xfrmi: drop ignore_df check before updat=
ing pmtu)
Merging netfilter/master (6b6382a857d8 cxgb4: fix thermal zone device regis=
tration)
Merging ipvs/master (7c7ab580db49 net: Convert to use the fallthrough macro)
Merging wireless-drivers/master (4afc850e2e9e mwifiex: Increase AES key sto=
rage size to 256 bits)
Merging mac80211/master (c8146fe292a7 Merge git://git.kernel.org/pub/scm/li=
nux/kernel/git/bpf/bpf)
Merging rdma-fixes/for-rc (097a9d23b725 RDMA/bnxt_re: Remove the qp from li=
st only if the qp destroy succeeds)
Merging sound-current/for-linus (b79de57b4378 ALSA: hda: use consistent HDA=
udio spelling in comments/docs)
Merging sound-asoc-fixes/for-linus (7a1852b61773 Merge remote-tracking bran=
ch 'asoc/for-5.9' into asoc-linus)
Merging regmap-fixes/for-linus (f75aef392f86 Linux 5.9-rc3)
Merging regulator-fixes/for-linus (4d59222e60d3 Merge remote-tracking branc=
h 'regulator/for-5.9' into regulator-linus)
Merging spi-fixes/for-linus (3ffc1e24ed59 Merge remote-tracking branch 'spi=
/for-5.9' into spi-linus)
Merging pci-current/for-linus (7c2308f79fc8 PCI/P2PDMA: Fix build without D=
MA ops)
Merging driver-core.current/driver-core-linus (40b8b826a699 kobject: Restor=
e old behaviour of kobject_del(NULL))
Merging tty.current/tty-linus (f75aef392f86 Linux 5.9-rc3)
Merging usb.current/usb-linus (6b6c71e897e2 Merge tag 'thunderbolt-for-v5.9=
-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt =
into usb-linus)
Merging usb-gadget-fixes/fixes (bc9a2e226ea9 usb: dwc3: gadget: Handle ZLP =
for sg requests)
Merging usb-serial-fixes/usb-linus (2bb70f0a4b23 USB: serial: option: suppo=
rt dynamic Quectel USB compositions)
Merging usb-chipidea-fixes/ci-for-usb-stable (2d79b3360dcc usb: chipidea: c=
ore: add wakeup support for extcon)
Merging phy/fixes (ad7a7acaedcf phy: omap-usb2-phy: disable PHY charger det=
ect)
Merging staging.current/staging-linus (a139ffa40f0c iio: adc: mcp3422: fix =
locking on error path)
Merging char-misc.current/char-misc-linus (c626c5fb7fe4 Merge tag 'misc-hab=
analabs-fixes-2020-08-31' of git://people.freedesktop.org/~gabbayo/linux in=
to char-misc-nexxt)
Merging soundwire-fixes/fixes (f8d0168e035f soundwire: bus: fix typo in com=
ment on INTSTAT registers)
Merging thunderbolt-fixes/fixes (813050e0a9b8 thunderbolt: Use maximum USB3=
 link rate when reclaiming if link is not up)
Merging input-current/for-linus (9e8238020c5b Merge branch 'next' into for-=
linus)
Merging crypto-current/master (c195d66a8a75 crypto: af_alg - Work around em=
pty control messages without MSG_MORE)
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
Merging mfd-fixes/for-mfd-fixes (22380b65dc70 mfd: mfd-core: Ensure disable=
d devices are ignored without error)
Merging v4l-dvb-fixes/fixes (ddecfc76979d media: mceusb: Avoid GFP_ATOMIC w=
here it is not needed)
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
Merging hwmon-fixes/hwmon (f75aef392f86 Linux 5.9-rc3)
Merging nvdimm-fixes/libnvdimm-fixes (c2affe920b0e dax: do not print error =
message for non-persistent memory block device)
Merging btrfs-fixes/next-fixes (c9f8e44ec4a5 Merge branch 'misc-5.9' into n=
ext-fixes)
Merging vfs-fixes/fixes (9d682ea6bcc7 vboxsf: Fix the check for the old bin=
ary mount-arguments struct)
Merging dma-mapping-fixes/for-linus (892fc9f6835e dma-pool: Fix an uninitia=
lized variable bug in atomic_pool_expand())
Merging i3c-fixes/master (6fbc7275c7a9 Linux 5.2-rc7)
Merging drivers-x86-fixes/fixes (9123e3a74ec7 Linux 5.9-rc1)
Merging samsung-krzk-fixes/fixes (9123e3a74ec7 Linux 5.9-rc1)
Merging pinctrl-samsung-fixes/pinctrl-fixes (9123e3a74ec7 Linux 5.9-rc1)
Merging devicetree-fixes/dt/linus (5cd841d2676a dt-bindings: vendor-prefixe=
s: Remove trailing whitespace)
Merging scsi-fixes/fixes (53de092f47ff scsi: libsas: Set data_dir as DMA_NO=
NE if libata marks qc as NODATA)
Merging drm-fixes/drm-fixes (f75aef392f86 Linux 5.9-rc3)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (57537b4e1d37 drm/i915: Clear =
the repeater bit on HDCP disable)
Merging mmc-fixes/fixes (fed4a71e6d0d mmc: sdhci-msm: Add retries when all =
tuning phases are found valid)
Merging rtc-fixes/rtc-fixes (9123e3a74ec7 Linux 5.9-rc1)
Merging gnss-fixes/gnss-linus (48778464bb7d Linux 5.8-rc2)
Merging hyperv-fixes/hyperv-fixes (b46b4a8a57c3 hv_utils: drain the timesyn=
c packets on onchannelcallback)
Merging soc-fsl-fixes/fix (fe8fe7723a3a soc: fsl: dpio: register dpio irq h=
andlers after dpio create)
Merging risc-v-fixes/fixes (29d9f9dd4480 RISC-V: Take text_mutex in ftrace_=
init_nop())
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
Merging kunit-fixes/kunit-fixes (21a6d1780d5b kunit: tool: allow generating=
 test results in JSON)
Merging ubifs-fixes/fixes (f37e99aca03f Merge tag 's390-5.8-6' of git://git=
.kernel.org/pub/scm/linux/kernel/git/s390/linux into master)
Merging memblock-fixes/fixes (5f7b81c18366 ia64: fix min_low_pfn/max_low_pf=
n build errors)
Merging drm-misc-fixes/for-linux-next-fixes (c6016c6e39c3 drm/virtio: fix u=
nblank)
Merging kspp-gustavo/for-next/kspp (a56dbff00095 scsi: target: tcmu: Replac=
e zero-length array with flexible-array member)
Merging kbuild/for-next (6ad7cbc01527 Makefile: Add clang-tidy and static a=
nalyzer support to makefile)
Merging compiler-attributes/compiler-attributes (e5fc436f06ee sparse: use s=
tatic inline for __chk_{user,io}_ptr())
Merging dma-mapping/for-next (87a1931bff8d dma-mapping: introduce DMA range=
 map, supplanting dma_pfn_offset)
Merging asm-generic/master (060dc911501f nds32: fix build failure caused by=
 page table folding updates)
Merging arc/for-next (def9d2780727 Linux 5.5-rc7)
Merging arm/for-next (4dffbda6a996 Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm64/for-next/core (f75aef392f86 Linux 5.9-rc3)
Merging arm-perf/for-next/perf (f75aef392f86 Linux 5.9-rc3)
Merging arm-soc/for-next (210ecbc29884 ARM: Document merges)
Merging amlogic/for-next (c943b84fab78 Merge branch 'v5.10/dt64' into tmp/a=
ml-rebuild)
Merging aspeed/for-next (393d812b5ec1 ARM: config: aspeed: Fix selection of=
 media drivers)
Merging at91/at91-next (b68f43873b72 Merge branch 'at91-soc' into at91-next)
Merging drivers-memory/for-next (dd85345abca6 memory: fsl-corenet-cf: Fix h=
andling of platform_get_irq() error)
Merging imx-mxs/for-next (fffd14dc58ab Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (50c950e2c8b6 Merge branch 'for_5.9/driver-soc' into =
next)
Merging mediatek/for-next (63424bbb31b7 Merge branch 'v5.9-next/soc' into f=
or-next)
Merging mvebu/for-next (29bd9d8c2ac1 Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (a8e0698a5d2e Merge branch 'omap-for-v5.10/prm-genpd-=
data' into for-next)
Merging qcom/for-next (4c7f2d50c2e3 Merge branches 'arm64-for-5.10' and 'ar=
m64-defconfig-for-5.10' into for-next)
Merging raspberrypi/for-next (9123e3a74ec7 Linux 5.9-rc1)
Merging realtek/for-next (486f29df6941 Merge branch 'v5.8/dt' into next)
Merging renesas/next (67dc47513ada Merge branches 'renesas-arm-defconfig-fo=
r-v5.10' and 'renesas-drivers-for-v5.10' into renesas-next)
Merging reset/reset/next (2983e2385ff6 reset: imx7: add the cm4 reset for i=
.MX8MQ)
CONFLICT (content): Merge conflict in drivers/reset/reset-imx7.c
Merging rockchip/for-next (5b54a6a5703f Merge branch 'v5.10-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (15ecfabb1f9a Merge branch 'next/dt' into for=
-next)
Merging scmi/for-linux-next (b51594df17d0 Merge tag 'docs-5.9-3' of git://g=
it.lwn.net/linux)
Merging sunxi/sunxi/for-next (4fc958d5a0c6 Merge branches 'sunxi/clk-for-5.=
10', 'sunxi/dt-for-5.10' and 'sunxi/fixes-for-5.9' into sunxi/for-next)
Merging tegra/for-next (05ccc6eebf8e Merge branch for-5.10/arm64/defconfig =
into for-next)
Merging ti-k3/ti-k3-next (1e3d655fe7b4 Merge branch 'ti-k3-config-next' int=
o ti-k3-next)
Merging ti-k3-new/ti-k3-next (269a5641b1ed arm64: dts: ti: k3-am65: restric=
t PCIe to Gen2 speed)
Merging uniphier/for-next (4f8fb65af529 Merge branch 'dt64' into for-next)
Merging clk/clk-next (24907ec54702 Merge branch 'clk-fixes' into clk-next)
Merging clk-samsung/for-next (3d77e6a8804a Linux 5.7)
Merging csky/linux-next (bdcd93ef9afb csky: Add context tracking support)
Merging h8300/h8300-next (8808515be0ed h8300: Replace <linux/clk-provider.h=
> by <linux/of_clk.h>)
Merging ia64/next (1a9d3c34c593 x86/cpu: Add Lakefield, Alder Lake and Rock=
et Lake to Intel family)
Merging m68k/for-next (5661bccb70ef m68k: Correct some typos in comments)
Merging m68knommu/for-next (f75aef392f86 Linux 5.9-rc3)
Merging microblaze/next (4a17e8513376 microblaze: fix kbuild redundant file=
 warning)
Merging mips/mips-next (aa9c45db018f MIPS: SGI-IP32: No need to include mc1=
4818*.h)
Merging nds32/next (54bde873682b nds32: Fix bogus reference to <asm/procinf=
o.h>)
Merging nios2/for-next (6b57fa4d374b nios2: signal: Mark expected switch fa=
ll-through)
Merging openrisc/for-next (55b2662ec665 openrisc: uaccess: Add user address=
 space check to access_ok)
Merging parisc-hd/for-next (685cbf6616ce parisc/stifb: Convert STI core dri=
ver to dynamic printk)
Merging powerpc/next (9123e3a74ec7 Linux 5.9-rc1)
Merging fsl/next (a76bea0287ce powerpc/kmcent2: add ranges to the pci bridg=
es)
Merging soc-fsl/next (e9e4ef9116b1 soc: fsl: dpio: Remove unused inline fun=
ction qbman_write_eqcr_am_rt_register)
Merging risc-v/for-next (d012a7190fc1 Linux 5.9-rc2)
Merging s390/features (4bff8cb54502 s390: convert to GENERIC_VDSO)
Merging sh/for-next (0c64a0dce51f sh: landisk: Add missing initialization o=
f sh_io_port_base)
Merging sparc-next/master (dd0d718152e4 Merge tag 'spi-fix-v5.8-rc2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging uml/linux-next (f6e8c474390b um: virtio: Replace zero-length array =
with flexible-array)
Merging xtensa/xtensa-for-next (4ca4c562efb6 xtensa: uaccess: Add missing _=
_user to strncpy_from_user() prototype)
Merging fscrypt/master (55e32c54bbd5 fscrypt: don't load ->i_crypt_info bef=
ore it's known to be valid)
Merging afs/afs-next (8409f67b6437 afs: Adjust the fileserver rotation algo=
rithm to reprobe/retry more quickly)
Merging btrfs/for-next (70daa2f88d69 Merge branch 'for-next-next-v5.9-20200=
826' into for-next-20200826)
Merging ceph/master (496ceaf12432 ceph: don't allow setlease on cephfs)
Merging cifs/for-next (f75aef392f86 Linux 5.9-rc3)
Merging configfs/for-next (059ccbfff8a8 configfs: use flush file op to comm=
it writes to a binary file)
Merging ecryptfs/next (8b614cb8f1dc Merge tag '5.6-rc4-smb3-fixes' of git:/=
/git.samba.org/sfrench/cifs-2.6)
Merging erofs/dev (cfcedfe21820 erofs: avoid duplicated permission check fo=
r "trusted." xattrs)
Merging exfat/dev (9409a51062c1 exfat: fix pointer error checking)
Merging ext3/for_next (de575ac602ab Pull reiserfs spelling fixes.)
Merging ext4/dev (27bc446e2def ext4: limit the length of per-inode prealloc=
 list)
Merging f2fs/dev (49d76b957a5e f2fs: allocate proper size memory for zstd d=
ecompress)
Merging fsverity/fsverity (f3db0bed4583 fs-verity: use smp_load_acquire() f=
or ->i_verity_info)
Merging fuse/for-next (9e9e23bd2d36 fuse: update project homepage)
Merging jfs/jfs-next (7aba5dcc2346 jfs: Replace zero-length array with flex=
ible-array member)
Merging nfs/linux-next (3d7a9520f0c3 NFSv4.1 handle ERR_DELAY error reclaim=
ing locking state on delegation recall)
Merging nfs-anna/linux-next (65caafd0d214 SUNRPC reverting d03727b248d0 ("N=
FSv4 fix CLOSE not waiting for direct IO compeletion"))
Merging nfsd/nfsd-next (9123e3a74ec7 Linux 5.9-rc1)
Merging cel/cel-next (9fe8cbb3e9ba NFSD: Correct type annotations in user x=
attr helpers)
Merging orangefs/for-next (e848643b524b orangefs: remove unnecessary assign=
ment to variable ret)
Merging overlayfs/overlayfs-next (8f6ee74c2786 ovl: rearrange ovl_can_list(=
))
Merging ubifs/next (798b7347e4f2 jffs2: fix UAF problem)
Merging v9fs/9p-next (2ed0b7578170 9p: Remove unneeded cast from memory all=
ocation)
Merging xfs/for-next (125eac243806 xfs: initialize the shortform attr heade=
r padding entry)
Merging zonefs/for-next (d012a7190fc1 Linux 5.9-rc2)
Merging iomap/iomap-for-next (60263d5889e6 iomap: fall back to buffered wri=
tes for invalidation failures)
Merging djw-vfs/vfs-for-next (e4f9ba20d3b8 fs/xfs: Update xfs_ioctl_setattr=
_dax_invalidate())
Merging file-locks/locks-next (1ad5f100e3ba locks: Remove extra "0x" in tra=
cepoint format specifier)
Merging vfs/for-next (bcf876870b95 Linux 5.8)
Merging printk/for-next (b1b58fe90d07 Merge branch 'printk-rework' into for=
-next)
Merging pci/next (88f66c681780 Merge branch 'pci/pm')
Merging pstore/for-next/pstore (137c6236aeec mailmap: Add WeiXiong Liao)
CONFLICT (content): Merge conflict in .mailmap
Merging hid/for-next (4b782e3d2028 Merge branch 'for-5.9/upstream-fixes' in=
to for-next)
Merging i2c/i2c/for-next (4323405f424e Merge branch 'i2c/for-5.10' into i2c=
/for-next)
Merging i3c/i3c/next (9da36a7ec421 i3c: master add i3c_master_attach_boardi=
nfo to preserve boardinfo)
Merging dmi/dmi-for-next (a3d13a0a23ea Replace HTTP links with HTTPS ones: =
DMI/SMBIOS SUPPORT)
Merging hwmon-staging/hwmon-next (33efa9e652f5 hwmon: (adt7462) replace imp=
ossible fallthroughs with breaks)
Merging jc_docs/docs-next (755a2f180c91 Documentation: clarify driver licen=
sing rules)
Merging v4l-dvb/master (cfe9e707c564 media: open.rst: document mc-centric a=
nd video-node-centric)
Merging v4l-dvb-next/master (0d6db85131e0 Revert "media: atomisp: keep the =
ISP powered on when setting it")
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (7eada1ae101b Merge branch 'pm-cpufreq' into linux-ne=
xt)
Merging cpufreq-arm/cpufreq/arm/linux-next (b981e97306ef cpufreq: s5pv210: =
Use dev_err instead of pr_err in probe)
Merging cpupower/cpupower (527b7779e5ec cpupower: speed up generating git v=
ersion string)
Merging devfreq/devfreq-next (4b1e767350fb devfreq: rk3399_dmc: Simplify wi=
th dev_err_probe())
Merging opp/opp/linux-next (257eba525a2e opp: Prevent memory leak in dev_pm=
_opp_attach_genpd())
Merging thermal/thermal/linux-next (6f55be9fd5ee Merge branch 'thermal/fixe=
s' into thermal/linux-next)
Merging thermal-rzhang/next (54ecb8f7028c Linux 5.4-rc1)
Merging thermal-soc/next (6c375eccded4 thermal: db8500: Rewrite to be a pur=
e OF sensor)
Merging ieee1394/for-next (67f8e65e4fc1 firewire: net: remove set but not u=
sed variable 'guid')
Merging dlm/next (7ae0451e2e6c fs: dlm: use free_con to free connection)
Merging swiotlb/linux-next (4cdfb27ba80d xen/swiotlb: remember having calle=
d xen_create_contiguous_region())
CONFLICT (content): Merge conflict in drivers/xen/swiotlb-xen.c
Merging rdma/for-next (524d8ffd07f0 RDMA/qib: Tidy up process_cc())
Merging net-next/master (22b330b622e3 Merge branch 'ionic-struct-cleanups')
CONFLICT (content): Merge conflict in net/ipv4/raw.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/ibm/ibmvnic.c
Merging bpf-next/master (1ba5fe2facf7 libbpf: Remove arch-specific include =
path in Makefile)
Merging ipsec-next/master (50aba46c234e gtp: add notification mechanism)
Merging mlx5-next/mlx5-next (9123e3a74ec7 Linux 5.9-rc1)
Merging netfilter-next/master (144b0a0e6086 ipvs: remove dependency on ip6_=
tables)
Merging ipvs-next/master (bfdd5aaa54b0 Merge tag 'Smack-for-5.9' of git://g=
ithub.com/cschaufler/smack-next)
Merging wireless-drivers-next/master (4d342964f31e rtlwifi: Remove temporar=
y definition of RT_TRACE)
Merging bluetooth/master (0e9952804ec9 Bluetooth: Clear suspend tasks on un=
register)
Merging mac80211-next/master (0f091e43310f netlabel: remove unused param fr=
om audit_log_format())
Merging gfs2/for-next (2928eebec009 gfs2: Fix bad comment for trans_drain)
Merging mtd/mtd/next (6a1380271b75 Merge tag 'nand/for-5.9' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/mtd/linux into mtd/next)
Merging nand/nand/next (da151e3458c8 dt-bindings: mtd: fsl-upm-nand: Deprec=
ate chip-delay and fsl, upm-wait-flags)
Merging spi-nor/spi-nor/next (e93a977367b2 mtd: revert "spi-nor: intel: pro=
vide a range for poll_timout")
Merging crypto/master (bbb2832620ac crypto: stm32 - Fix sparse warnings)
Merging drm/drm-next (3393649977f9 Merge tag 'drm-intel-next-2020-08-24-1' =
of git://anongit.freedesktop.org/drm/drm-intel into drm-next)
CONFLICT (content): Merge conflict in drivers/video/fbdev/savage/savagefb_d=
river.c
CONFLICT (content): Merge conflict in drivers/video/fbdev/atmel_lcdfb.c
CONFLICT (content): Merge conflict in drivers/video/fbdev/arcfb.c
Applying: fix interaction with drm-misc-fix commit
Merging amdgpu/drm-next (1b7eca59ceb0 Revert "drm/radeon: handle PCIe root =
ports with addressing limitations")
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/pm/swsmu/smu11/si=
enna_cichlid_ppt.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/pm/powerplay/hwmg=
r/vega10_thermal.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/pm/inc/smu_v11_0.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/pm/inc/smu11_driv=
er_if_sienna_cichlid.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/dml/di=
splay_mode_vba.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/dcn30/=
dcn30_resource.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/bios/c=
ommand_table2.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/amdgpu_dm=
/amdgpu_dm_debugfs.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/amdgpu_dm=
/amdgpu_dm.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_vra=
m_mgr.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_ttm=
.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_ttm=
.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_gtt=
_mgr.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_dev=
ice.c
Merging drm-intel/for-linux-next (1fa0140956e7 drm/i915: Add HDCP 1.4 suppo=
rt for MST connectors)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_hd=
cp.c
Merging drm-tegra/drm/tegra/for-next (4fba6d22ca9a drm/tegra: plane: Suppor=
t 180=C2=B0 rotation)
Merging drm-misc/for-linux-next (0f50257f5348 dma-buf: fix kernel-doc warni=
ng in <linux/dma-buf.h>)
CONFLICT (content): Merge conflict in drivers/gpu/drm/virtio/virtgpu_drv.h
Merging drm-msm/msm-next (5e0c22d4a9dd drm/msm/a6xx: fix frequency not alwa=
ys being restored on GMU resume)
Merging mali-dp/for-upstream/mali-dp (f634c6a80287 dt/bindings: display: Ad=
d optional property node define for Mali DP500)
Merging imx-drm/imx-drm/next (efd5a93d2a89 drm/imx: drop explicit drm_mode_=
config_cleanup)
Merging etnaviv/etnaviv/next (c5d5a32ead1e drm/etnaviv: fix ref count leak =
via pm_runtime_get_sync)
Merging regmap/for-next (b89102f28d29 Merge remote-tracking branch 'regmap/=
for-5.10' into regmap-next)
Merging sound/for-next (685a04a53747 ALSA: hda/ca0132 - Add AE-7 exit comma=
nds.)
Merging sound-asoc/for-next (f7770456493d Merge remote-tracking branch 'aso=
c/for-5.10' into asoc-next)
Merging modules/modules-next (14721add58ef module: Add more error message f=
or failed kernel module loading)
Merging input/next (9b5fbad1dcee Input: MT - avoid comma separated statemen=
ts)
Merging block/for-next (020ad0333b03 Merge branch 'for-5.10/block' into for=
-next)
Merging device-mapper/for-next (3a653b205f29 dm thin metadata: Fix use-afte=
r-free in dm_bm_set_read_only)
Merging pcmcia/pcmcia-next (46d079790663 pcmcia: make pccard_loop_tuple() s=
tatic)
Merging mmc/next (7df79c1ebc20 mmc: core: Allow setting slot index via devi=
ce tree alias)
Merging mfd/for-mfd-next (c563a66537d2 mfd: rn5t618: Add a power supply sub=
device)
Merging backlight/for-backlight-next (7eb99a39ef76 video: backlight: cr_bll=
cd: Remove unused variable 'intensity')
Merging battery/for-next (d8483f31487c dt-bindings: power: supply: Cleanup =
charger-manager bindings)
Merging regulator/for-next (f3b22f1d15f1 Merge remote-tracking branch 'regu=
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
Merging selinux/next (66ccd2560aff selinux: simplify away security_policydb=
_len())
Merging smack/next (d012a7190fc1 Linux 5.9-rc2)
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
Merging spi/for-next (cd9ccab42841 Merge remote-tracking branch 'spi/for-5.=
10' into spi-next)
Merging tip/auto-latest (5545b0d34f37 Merge branch 'linus')
Applying: merge fix for compiler.h
Merging clockevents/timers/drivers/next (9fba22584e54 clocksource: Ingenic:=
 Add support for the Ingenic X1000 OST.)
Merging edac/edac-for-next (8d5d94603eaf Merge branch 'edac-misc' into edac=
-for-next)
Merging irqchip/irq/irqchip-next (821fc9e261f3 irqchip/ingenic: Leave paren=
t IRQ unmasked on suspend)
Merging ftrace/for-next (38ce2a9e33db tracing: Add trace_array_init_printk(=
) to initialize instance trace_printk() buffers)
Merging rcu/rcu/next (c104850647b2 locktorture: Track time of last ->writeu=
nlock())
CONFLICT (content): Merge conflict in Documentation/memory-barriers.txt
Merging kvm/linux-next (e792415c5d3e KVM: MIPS/VZ: Fix build error caused b=
y 'kvm_run' cleanup)
Merging kvm-arm/next (16314874b12b Merge branch 'kvm-arm64/misc-5.9' into k=
vmarm-master/next)
Merging kvm-ppc/kvm-ppc-next (81ab595ddd3c KVM: PPC: Book3S HV: Rework secu=
re mem slot dropping)
Merging kvms390/next (23a60f834406 s390/kvm: diagnose 0x318 sync and reset)
Merging xen-tip/linux-next (9d3004bf7ba3 arm/xen: Add misuse warning to vir=
t_to_gfn)
Merging percpu/for-next (4fa640dc5230 Merge tag 'vfio-v5.8-rc7' of git://gi=
thub.com/awilliam/linux-vfio into master)
Merging workqueues/for-next (10cdb1575954 workqueue: use BUILD_BUG_ON() for=
 compile time test instead of WARN_ON())
Merging drivers-x86/for-next (9123e3a74ec7 Linux 5.9-rc1)
Merging chrome-platform/for-next (814318242687 platform/chrome: cros_ec_tra=
ce: Add fields to command traces)
Merging hsi/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging leds/for-next (242b81170fb8 leds: lp50xx: Add the LP50XX family of =
the RGB LED driver)
Merging ipmi/for-next (83dea1285672 char: ipmi: convert tasklets to use new=
 tasklet_setup() API)
Merging driver-core/driver-core-next (d012a7190fc1 Linux 5.9-rc2)
Merging usb/usb-next (5fedf0d295d3 Merge 5.9-rc3 into usb-next)
Merging usb-gadget/next (f5e46aa4a124 usb: dwc3: gadget: when the started l=
ist is empty stop the active xfer)
Merging usb-serial/usb-next (9123e3a74ec7 Linux 5.9-rc1)
Merging usb-chipidea-next/ci-for-usb-next (58a3cefb3840 usb: chipidea: imx:=
 add two samsung picophy parameters tuning implementation)
Merging phy-next/next (23bea1be4eea phy: qcom-ipq4019-usb: Constify static =
phy_ops structs)
Merging tty/tty-next (8f49a2fe8e6b Merge 5.9-rc3 into tty-next)
Merging char-misc/char-misc-next (dd5597245d35 Merge 5.9-rc3 into char-misc=
-next)
Merging extcon/extcon-next (b49959fcfb2d extcon: palmas: Simplify with dev_=
err_probe())
Merging soundwire/next (f046b2334083 soundwire: intel: fix intel_suspend/re=
sume defined but not used warning)
Merging thunderbolt/next (fff15f23b8e7 thunderbolt: Use kobj_to_dev() inste=
ad of container_of())
Merging staging/staging-next (4c6491a343e9 staging: spmi: hisi-spmi-control=
ler: Use proper format in call to dev_err())
Merging mux/for-next (05f19f7f8944 mux: adgs1408: Add mod_devicetable.h and=
 remove of_match_ptr)
Merging icc/icc-next (12a400b016ab interconnect: Mark all dummy functions a=
s static inline)
Merging dmaengine/next (78a2f92e4c4a dmaengine: axi-dmac: add support for r=
eading bus attributes from registers)
Merging cgroup/for-next (936f2a70f207 cgroup: add cpu.stat file to root cgr=
oup)
Merging scsi/for-next (5da7eb801d50 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (8c6572356646 scsi: scsi_debug: Make sdebug_build=
_parts() respect virtual_gb)
CONFLICT (content): Merge conflict in drivers/scsi/ufs/ufshcd.h
CONFLICT (content): Merge conflict in drivers/scsi/ufs/ufshcd.c
CONFLICT (content): Merge conflict in drivers/scsi/aacraid/aachba.c
Merging vhost/linux-next (8a7c3213db06 vdpa/mlx5: fix up endian-ness for mt=
u)
Merging rpmsg/for-next (ca69dba7f13a Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (feeaefd378ca gpio: dwapb: Use resource managed GPIO-=
chip add data method)
Merging gpio-brgl/gpio/for-next (805a6ef8ac28 gpio: zynq: Simplify with dev=
_err_probe())
Merging gpio-intel/for-next (9123e3a74ec7 Linux 5.9-rc1)
Merging pinctrl/for-next (ebc2599144b6 pinctrl: mcp23s08: Improve error mes=
saging in ->probe())
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
Merging kselftest/next (f69237e1e954 selftests: more general make nesting s=
upport)
Merging y2038/y2038 (c4e71212a245 Revert "drm/etnaviv: reject timeouts with=
 tv_nsec >=3D NSEC_PER_SEC")
Merging livepatching/for-next (338c0aff6dbb Merge branch 'for-5.9/upstream-=
fixes' into for-next)
Merging coresight/next (17f17c8f02a3 coresight: etm4x: Fix issues within re=
set interface of sysfs)
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
Merging slimbus/for-next (9123e3a74ec7 Linux 5.9-rc1)
Merging nvmem/for-next (9123e3a74ec7 Linux 5.9-rc1)
Merging xarray/xarray (27586ca786a7 XArray: Handle retry entries within xas=
_find_marked)
Merging hyperv/hyperv-next (49971e6bad2d drivers: hv: remove cast from hype=
rv_die_event)
Merging auxdisplay/auxdisplay (46d4a403a04c auxdisplay: Replace HTTP links =
with HTTPS ones)
Merging kgdb/kgdb/for-next (2c308ef41351 kgdb: Make "kgdbcon" work properly=
 with "kgdb_earlycon")
Merging pidfd/for-next (f2e9aec45e9e Merge tag 'kernel-clone-v5.9' into for=
-next)
Merging hmm/hmm (9123e3a74ec7 Linux 5.9-rc1)
Merging fpga/for-next (89eb35e810a8 fpga: dfl: map feature mmio resources i=
n their own feature drivers)
Merging kunit/test (9123e3a74ec7 Linux 5.9-rc1)
Merging generic-ioremap/for-next (4bdc0d676a64 remove ioremap_nocache and d=
evm_ioremap_nocache)
Merging cfi/cfi/next (11399346ac39 mtd: Replace zero-length array with flex=
ible-array)
Merging kunit-next/kunit (abe83f7621ee kunit: ubsan integration)
Merging trivial/for-next (2a9b29b28983 xtensa: fix Kconfig typo)
Merging zx2c4/for-next (16fbf79b0f83 Linux 5.6-rc7)
Merging mhi/mhi-next (18e9533ac877 bus: mhi: core: Introduce APIs to alloca=
te and free the MHI controller)
Merging notifications/notifications-pipe-core (841a0dfa5113 watch_queue: sa=
mple: Display mount tree change notifications)
Merging memblock/for-next (762d4d1a174c arch/ia64: Restore arch-specific pg=
d_offset_k implementation)
Merging init/init-user-pointers (38b082236e77 initramfs: use vfs_utimes in =
do_copy)
Merging akpm-current/current (f60aef257493 ROMFS: support inode blocks calc=
ulation)
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
Merging akpm/master (8b0f99ecfedc mm/mmap: add inline munmap_vma_range() fo=
r code readability)

--Sig_/hkg08KazQA2IMv9H1BmH6FT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9QplUACgkQAVBC80lX
0GwEjgf/cj1KaSdeu4LsNE8kN0adg7FP8rqiRJ3wETaByrhqDmkmXclbdmQjU14z
d4Q3f6DdIJe60PIyQdZ8MPQB32NlzSCNVXQJoMTzdg7LE0Rqg+fAl0qE0fy10JM1
g6VEPmSH4bgOa5bO9DXWr3t1e3mtZpbnWZz2PVpKRiorrYj3pbD7nZN4mhkEgsI6
5Ol7i0H9KTx+DUo4kgW8BBV8Wz7XtwBYXGfbjPyNskSaaxrym4SBCowhPa6W6t6+
tvp19exsP3HJu0Cck+mYOUchANj2uVYTAbSTS7nz2zVbx8DsgzudZbcbC2z1Z/dl
p1mgaaWN6iV7deBEqtBfXIc+0MoV6Q==
=ogeM
-----END PGP SIGNATURE-----

--Sig_/hkg08KazQA2IMv9H1BmH6FT--
