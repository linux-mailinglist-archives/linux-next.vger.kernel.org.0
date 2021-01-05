Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B07E2EA378
	for <lists+linux-next@lfdr.de>; Tue,  5 Jan 2021 03:51:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726613AbhAECux (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 4 Jan 2021 21:50:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726605AbhAECuw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 4 Jan 2021 21:50:52 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBFE8C061793;
        Mon,  4 Jan 2021 18:50:10 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4D8xmw6C3tz9sVq;
        Tue,  5 Jan 2021 13:50:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1609815009;
        bh=C17O5STvby3XKmkR6vf92Brp1VgDu7R6ImhHT95G90s=;
        h=Date:From:To:Cc:Subject:From;
        b=KE9eogbOaOWNFJgH20iqx1FgXjfmMKgiUf3TtCnlRJw55HlL5lGpGIxZVJaEJtdtI
         rR/sK8Dn/nUbIb8c8T8F1sTsQEm7g2/Q5+bqZL79aae0LbZEKuY66BA2IiAHV+6iCA
         ZHoRHs9p2S4AzUsJJmgGxDXIIjVVcoaxC7zfgDIvOpJ523CJn+A1BFPhSVY05ULX7H
         lH+Vxjtq9si0SeADL7Im8Xv1b6dJHjVHYC55Qq1ZZQvxAwMBn1vI/WGHtGlh6vUb1j
         pQrYxXluyJEyUKF6kL9Mce9OnQ85l+hdGnd/Bg6JKQ+6wOu3ciqn4OxREedtyE5lwr
         MB8zK0KlcL9jg==
Date:   Tue, 5 Jan 2021 13:50:07 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jan 5
Message-ID: <20210105135007.0c5d549e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BT4.w+FHmchqCqjZ=GBh.N4";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/BT4.w+FHmchqCqjZ=GBh.N4
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20210104:

The vfs tree gained a build failure so I used the version from
next-20210104.

The rcu tree lost its build failure.

The staging tree lost its build failures.

Non-merge commits (relative to Linus' tree): 1367
 1323 files changed, 47247 insertions(+), 20428 deletions(-)

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

I am currently merging 330 trees (counting Linus' and 85 trees of bug
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
Merging origin/master (36bbbd0e234d Merge branch 'rcu/urgent' of git://git.=
kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu)
Merging fixes/fixes (e71ba9452f0b Linux 5.11-rc2)
Merging kbuild-current/fixes (9bba03d4473d kconfig: remove 'kvmconfig' and =
'xenconfig' shorthands)
Merging arc-current/for-curr (3a71e423133a ARC: build: use $(READELF) inste=
ad of hard-coded readelf)
Merging arm-current/fixes (e64ab473ddda ARM: 9034/1: __div64_32(): straight=
en up inline asm constraints)
Merging arm64-fixes/for-next/fixes (095507dc1350 arm64: mm: Fix ARCH_LOW_AD=
DRESS_LIMIT when !CONFIG_ZONE_DMA)
Merging arm-soc-fixes/arm/fixes (7887cc89d585 ARM: dts: ux500/golden: Set d=
isplay max brightness)
Merging drivers-memory-fixes/fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging m68k-current/for-linus (2ae92e8b9b7e MAINTAINERS: Update m68k Mac e=
ntry)
Merging powerpc-fixes/fixes (d5c243989fb0 powerpc/32: Fix vmap stack - Prop=
erly set r1 before activating MMU on syscall too)
Merging s390-fixes/fixes (129975e75b9a s390/Kconfig: sort config S390 selec=
t list once again)
Merging sparc/master (0a95a6d1a4cd sparc: use for_each_child_of_node() macr=
o)
Merging fscrypt-current/for-stable (d19d8d345eec fscrypt: fix inline encryp=
tion not used on new files)
Merging net/master (e4da63cda51f docs: networking: packet_mmap: fix old con=
fig reference)
Merging bpf/master (04901aab40ea bpf: Fix a task_iter bug caused by a merge=
 conflict resolution)
Merging ipsec/master (56ce7c25ae15 xfrm: Fix oops in xfrm_replay_advance_bm=
p)
Merging netfilter/master (b4e70d8dd9ea netfilter: nftables: add set express=
ion flags)
Merging ipvs/master (b4e70d8dd9ea netfilter: nftables: add set expression f=
lags)
Merging wireless-drivers/master (bfe55584713b MAINTAINERS: switch to differ=
ent email address)
Merging mac80211/master (2c85ebc57b3e Linux 5.10)
Merging rdma-fixes/for-rc (e71ba9452f0b Linux 5.11-rc2)
Merging sound-current/for-linus (4bfd6247fa91 ALSA: hda/via: Fix runtime PM=
 for Clevo W35xSS)
Merging sound-asoc-fixes/for-linus (48ffb5334a3f Merge remote-tracking bran=
ch 'asoc/for-5.11' into asoc-linus)
Merging regmap-fixes/for-linus (cffa4b2122f5 regmap: debugfs: Fix a memory =
leak when calling regmap_attach_dev)
Merging regulator-fixes/for-linus (6f4ab1ad5aed Merge remote-tracking branc=
h 'regulator/for-5.11' into regulator-linus)
Merging spi-fixes/for-linus (339a362ed418 Merge remote-tracking branch 'spi=
/for-5.11' into spi-linus)
Merging pci-current/for-linus (5c8fe583cce5 Linux 5.11-rc1)
Merging driver-core.current/driver-core-linus (e71ba9452f0b Linux 5.11-rc2)
Merging tty.current/tty-linus (54ca955b5a40 serial: mvebu-uart: fix tx lost=
 characters at power off)
Merging usb.current/usb-linus (6cd0fe913879 usb: gadget: configfs: Preserve=
 function ordering after bind failure)
Merging usb-gadget-fixes/fixes (129aa9734559 usb: raw-gadget: fix memory le=
ak in gadget_setup)
Merging usb-serial-fixes/usb-linus (54d0a3ab80f4 USB: serial: iuu_phoenix: =
fix DMA from stack)
Merging usb-chipidea-fixes/for-usb-fixes (65403ff98ebb MAINTAINERS: Update =
address for Cadence USB3 driver)
Merging phy/fixes (d092bd911049 phy: mediatek: allow compile-testing the ds=
i phy)
Merging staging.current/staging-linus (d887d6104ade staging: mt7621-dma: Fi=
x a resource leak in an error handling path)
Merging char-misc.current/char-misc-linus (f93274ef0fe9 crypto: asym_tpm: c=
orrect zero out potential secrets)
Merging soundwire-fixes/fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging thunderbolt-fixes/fixes (e71ba9452f0b Linux 5.11-rc2)
Merging input-current/for-linus (60159e9e7bc7 Input: ili210x - implement pr=
essure reporting for ILI251x)
Merging crypto-current/master (0aa171e9b267 crypto: ecdh - avoid buffer ove=
rflow in ecdh_set_secret())
Merging ide/master (6800cd8cbc6e ide-acpi: use %*ph to print small buffer)
Merging vfio-fixes/for-linus (e4eccb853664 vfio/pci: Bypass IGD init in cas=
e of -ENODEV)
Merging kselftest-fixes/fixes (7a6eb7c34a78 selftests: Skip BPF seftests by=
 default)
Merging modules-fixes/modules-linus (57baec7b1b04 scripts/nsdeps: make sure=
 to pass all module source files to spatch)
Merging dmaengine-fixes/fixes (e1263f9277ba dmaengine: stm32-mdma: fix STM3=
2_MDMA_VERY_HIGH_PRIORITY value)
Merging backlight-fixes/for-backlight-fixes (bbf5c979011a Linux 5.9)
Merging mtd-fixes/mtd/fixes (4883a60c17ed mtd: rawnand: gpmi: fix dst bit o=
ffset when extracting raw payload)
Merging mfd-fixes/for-mfd-fixes (bbf5c979011a Linux 5.9)
Merging v4l-dvb-fixes/fixes (896111dc4bcf media: rc: ensure that uevent can=
 be read directly after rc device register)
Merging reset-fixes/reset/fixes (b460e0a9e240 reset: intel: add unspecified=
 HAS_IOMEM dependency)
Merging mips-fixes/mips-fixes (698222457465 MIPS: Fix malformed NT_FILE and=
 NT_SIGINFO in 32bit coredumps)
Merging at91-fixes/at91-fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging omap-fixes/fixes (181739822cf6 ARM: dts; gta04: SPI panel chip sele=
ct is active low)
Merging kvm-fixes/master (111d0bda8eeb tools/kvm_stat: Exempt time-based co=
unters)
Merging kvms390-fixes/master (735931f9a51a MAINTAINERS: add uv.c also to KV=
M/s390)
Merging hwmon-fixes/hwmon (1eda52334e6d hwmon: (pwm-fan) Ensure that calcul=
ation doesn't discard big period values)
Merging nvdimm-fixes/libnvdimm-fixes (88b67edd7247 dax: Fix compilation for=
 CONFIG_DAX && !CONFIG_FS_DAX)
Merging btrfs-fixes/next-fixes (e4867bc3cdd7 Merge branch 'misc-5.11' into =
next-fixes)
Merging vfs-fixes/fixes (6220e48d9640 [regression fix] really dumb fuckup i=
n sparc64 __csum_partial_copy() changes)
Merging dma-mapping-fixes/for-linus (892fc9f6835e dma-pool: Fix an uninitia=
lized variable bug in atomic_pool_expand())
Merging i3c-fixes/i3c/fixes (291b5c9870fc i3c/master/mipi-i3c-hci: Fix posi=
tion of __maybe_unused in i3c_hci_of_match)
Merging drivers-x86-fixes/fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging samsung-krzk-fixes/fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging pinctrl-samsung-fixes/fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging devicetree-fixes/dt/linus (2b8f061a4f50 dt-bindings: Drop redundant=
 maxItems/items)
Merging scsi-fixes/fixes (a8f808839abe Merge branch '5.11/scsi-postmerge' i=
nto 5.11/scsi-fixes)
Merging drm-fixes/drm-fixes (2c85ebc57b3e Linux 5.10)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (e71ba9452f0b Linux 5.11-rc2)
Merging mmc-fixes/fixes (c0d638a03bc5 mmc: mediatek: mark PM functions as _=
_maybe_unused)
Merging rtc-fixes/rtc-fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging gnss-fixes/gnss-linus (5c8fe583cce5 Linux 5.11-rc1)
Merging hyperv-fixes/hyperv-fixes (5f1251a48c17 video: hyperv_fb: Fix the c=
ache type when mapping the VRAM)
Merging soc-fsl-fixes/fix (2663b3388551 soc: fsl: dpio: Get the cpumask thr=
ough cpumask_of(cpu))
Merging risc-v-fixes/fixes (20620d72c31e riscv: return -ENOSYS for syscall =
-1)
Merging pidfd-fixes/fixes (a409ed156a90 Merge tag 'gpio-v5.11-1' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio)
Merging fpga-fixes/fixes (8614afd689df fpga: dfl: fix bug in port reset han=
dshake)
Merging spdx/spdx-linus (5c8fe583cce5 Linux 5.11-rc1)
Merging gpio-intel-fixes/fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging pinctrl-intel-fixes/fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging erofs-fixes/fixes (a30573b3cdc7 erofs: fix setting up pcluster for =
temporary pages)
Merging integrity-fixes/fixes (843385694721 evm: Fix a small race in init_d=
esc())
Merging kunit-fixes/kunit-fixes (65a4e5299739 kunit: tool: Force the use of=
 the 'tty' console for UML)
Merging ubifs-fixes/fixes (78c7d49f55d8 ubifs: journal: Make sure to not di=
rty twice for auth nodes)
Merging memblock-fixes/fixes (b9bc36704cca ARM, xtensa: highmem: avoid clob=
bering non-page aligned memory reservations)
Merging drm-misc-fixes/for-linux-next-fixes (fd4e788e971c drm/omap: sdi: fi=
x bridge enable/disable)
Merging kspp-gustavo/for-next/kspp (36f9ff9e03de lib: Fix fall-through warn=
ings for Clang)
Merging kbuild/for-next (a76082b037f5 Makefile: use smaller dictionary size=
 for xz module compression)
Merging compiler-attributes/compiler-attributes (196793946264 Compiler Attr=
ibutes: remove CONFIG_ENABLE_MUST_CHECK)
Merging dma-mapping/for-next (f726c72d6c05 dma-mapping: benchmark: check th=
e validity of dma mask bits)
Merging asm-generic/master (2c85ebc57b3e Linux 5.10)
Merging arc/for-next (def9d2780727 Linux 5.5-rc7)
Merging arm/for-next (ecbbb88727ae Merge branch 'devel-stable' into for-nex=
t)
Merging arm64/for-next/core (95d1718c961e Merge remote-tracking branch 'arm=
64/for-next/iommu/core' into for-next/core)
Merging arm-perf/for-next/perf (881b0520504a perf/imx_ddr: Add system PMU i=
dentifier for userspace)
Merging arm-soc/for-next (9b28a2eacfe4 soc: document merges)
Merging actions/for-next (a501abf8d8cb Merge branch 'v5.12/soc' into for-ne=
xt)
Merging amlogic/for-next (60f232d3c04a Merge branch 'v5.12/dt64' into tmp/a=
ml-rebuild)
Merging aspeed/for-next (41707a524026 Merge branches 'soc-for-v5.11' and 'd=
efconfig-for-v5.11' into for-next)
Merging at91/at91-next (3e3d5e8a7d73 Merge branches 'at91-soc' and 'at91-de=
fconfig' into at91-next)
Merging drivers-memory/for-next (bd96a89ca3fe memory: emif: Use DEFINE_SPIN=
LOCK() for spinlock)
Merging imx-mxs/for-next (09690c0e0d1c Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (b2a8f6ce4bdc Merge branch 'for_5.11/drivers-soc' int=
o next)
Merging mediatek/for-next (727bfb2c55b0 Merge branch 'v5.10-next/soc' into =
for-next)
Merging mvebu/for-next (dc14300bb67b Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (792952314166 Merge branch 'omap-for-v5.11/dt' into f=
or-next)
Merging qcom/for-next (6c556a34e4b1 Merge branches 'arm64-defconfig-for-5.1=
2', 'arm64-for-5.12', 'drivers-for-5.12' and 'dts-for-5.12' into for-next)
Merging raspberrypi/for-next (e10bb7f95cba ARM: dts: bcm2711: Use compatibl=
e string for BCM2711 DSI1)
Merging realtek/for-next (486f29df6941 Merge branch 'v5.8/dt' into next)
Merging renesas/next (b8e76cdb1574 Merge branches 'renesas-arm-dt-for-v5.12=
' and 'renesas-dt-bindings-for-v5.12' into renesas-next)
Merging reset/reset/next (69e392526dc2 dt-bindings: reset: convert Hisilico=
n reset controller bindings to json-schema)
Merging rockchip/for-next (e15c5c9836dc Merge branch 'v5.11-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (ef2a4443c150 Merge branch 'next/dt' into for=
-next)
Merging scmi/for-linux-next (e71ba9452f0b Linux 5.11-rc2)
Merging stm32/stm32-next (814fddb955f8 ARM: multi_v7_defconfig: enable STM3=
2 dfsdm audio support)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/con=
nector/usb-connector.yaml
Merging sunxi/sunxi/for-next (193c89ea570c ARM: dts: sun8i-h2-plus-bananapi=
-m2-zero: add poweroff node)
Merging tegra/for-next (b11a0dfbd316 Merge branch for-5.11/arm64/defconfig =
into for-next)
Merging ti-k3/ti-k3-next (1e3d655fe7b4 Merge branch 'ti-k3-config-next' int=
o ti-k3-next)
Merging ti-k3-new/ti-k3-next (5c8fe583cce5 Linux 5.11-rc1)
Merging clk/clk-next (abe7e32f1d50 Merge branches 'clk-ingenic', 'clk-vc5',=
 'clk-cleanup', 'clk-canaan' and 'clk-marvell' into clk-next)
Merging clk-renesas/renesas-clk (ab2ccacd7386 clk: renesas: r8a779a0: Add R=
WDT clocks)
Merging clk-samsung/for-next (44a9e78f9242 clk: samsung: Prevent potential =
endless loop in the PLL ops)
Merging csky/linux-next (f0bbf052ae46 csky: Reconstruct VDSO framework)
Merging h8300/h8300-next (8808515be0ed h8300: Replace <linux/clk-provider.h=
> by <linux/of_clk.h>)
Merging ia64/next (c331649e6371 ia64: Use libata instead of the legacy ide =
driver in defconfigs)
Merging m68k/for-next (2ae92e8b9b7e MAINTAINERS: Update m68k Mac entry)
Merging m68knommu/for-next (8b22820efb35 m68k: m68328: remove duplicate cod=
e)
Merging microblaze/next (57ddf08642f0 microblaze: do not select TRACING_SUP=
PORT directly)
Merging mips/mips-next (ecd3e709747b MIPS: loongson64: smp.c: Fix block com=
ment coding style)
Merging nds32/next (54bde873682b nds32: Fix bogus reference to <asm/procinf=
o.h>)
Merging nios2/for-next (6b57fa4d374b nios2: signal: Mark expected switch fa=
ll-through)
Merging openrisc/for-next (d8398bf840f8 openrisc: add local64.h to fix blk-=
iocost build)
Merging parisc-hd/for-next (2c85ebc57b3e Linux 5.10)
Merging powerpc/next (8a5be36b9303 Merge tag 'powerpc-5.11-1' of git://git.=
kernel.org/pub/scm/linux/kernel/git/powerpc/linux)
Merging fsl/next (a76bea0287ce powerpc/kmcent2: add ranges to the pci bridg=
es)
Merging soc-fsl/next (e95f287deed2 soc: fsl: handle RCPM errata A-008646 on=
 SoC LS1021A)
Merging risc-v/for-next (e2ae634014d3 Merge tag 'riscv-for-linus-5.11-mw0' =
of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux)
Merging s390/for-next (5e935f340864 Merge branch 'fixes' into for-next)
Merging sh/for-next (b0cfc315ff38 sh: fix syscall tracing)
Merging sparc-next/master (dd0d718152e4 Merge tag 'spi-fix-v5.8-rc2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging uml/linux-next (1fb1abc83636 um: Fix build w/o CONFIG_PM_SLEEP)
Merging xtensa/xtensa-for-next (7b79eba1d0d1 xtensa: fix spelling mistake i=
n Kconfig "wont" -> "won't")
Merging fscrypt/master (a14d0b676491 fscrypt: allow deleting files with uns=
upported encryption policy)
Merging afs/afs-next (8409f67b6437 afs: Adjust the fileserver rotation algo=
rithm to reprobe/retry more quickly)
Merging btrfs/for-next (97847e06525b Merge branch 'for-next-next-v5.10-2020=
1211' into for-next-20201211)
CONFLICT (content): Merge conflict in fs/btrfs/space-info.c
Merging ceph/master (4972cf605f8a libceph, ceph: disambiguate ceph_connecti=
on_operations handlers)
Merging cifs/for-next (03965997e84a smb3: allow files to be created with ba=
ckslash in file name)
Merging configfs/for-next (65cdb4a214c0 configfs: fix kernel-doc markup iss=
ue)
Merging ecryptfs/next (8b614cb8f1dc Merge tag '5.6-rc4-smb3-fixes' of git:/=
/git.samba.org/sfrench/cifs-2.6)
Merging erofs/dev (d8b3df8b1048 erofs: avoid using generic_block_bmap)
Merging exfat/dev (614cb5894306 Merge tag 'acpi-5.11-rc1-2' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/rafael/linux-pm)
Merging ext3/for_next (bdcfc08b8b5b Pull warning fix from Christoph)
Merging ext4/dev (5a3b590d4b2d ext4: don't leak old mountpoint samples)
CONFLICT (content): Merge conflict in fs/ext4/super.c
Merging f2fs/dev (e3279133dd63 f2fs: relocate f2fs_precache_extents())
Merging fsverity/fsverity (bde493349025 fs-verity: move structs needed for =
file signing to UAPI header)
Merging fuse/for-next (5d069dbe8aaf fuse: fix bad inode)
Merging jfs/jfs-next (3bef198f1b17 JFS: more checks for invalid superblock)
Merging nfs/linux-next (e71ba9452f0b Linux 5.11-rc2)
Merging nfs-anna/linux-next (11392155f2bd NFS: Disable READ_PLUS by default)
CONFLICT (content): Merge conflict in fs/nfs/nfs4proc.c
Merging nfsd/nfsd-next (c3213d260a23 SUNRPC: Fix oops in the rpc_xdr_buf ev=
ent class)
Merging cel/cel-next (7b723008f9c9 NFSD: Restore NFSv4 decoding's SAVEMEM f=
unctionality)
Merging orangefs/for-next (c1048828c3db orangefs: add splice file operation=
s)
Merging overlayfs/overlayfs-next (459c7c565ac3 ovl: unprivieged mounts)
Merging ubifs/next (b80a974b8c58 ubifs: ubifs_dump_node: Dump all branches =
of the index node)
Merging v9fs/9p-next (324a158fe535 fs: 9p: add generic splice_write file op=
eration)
Merging xfs/for-next (e82226138b20 xfs: remove xfs_buf_t typedef)
Merging zonefs/for-next (4f8b848788f7 zonefs: select CONFIG_CRC32)
Merging iomap/iomap-for-next (1a31182edd00 iomap: Call inode_dio_end() befo=
re generic_write_sync())
Merging djw-vfs/vfs-for-next (9b8523423b23 vfs: move __sb_{start,end}_write=
* to fs.h)
Merging file-locks/locks-next (8d1ddb5e7937 fcntl: Fix potential deadlock i=
n send_sig{io, urg}())
Merging vfs/for-next (966af2856eb9 Merge branch 'fixes' into for-next)
$ git reset --hard HEAD^
Merging next-20210104 version of vfs
Merging printk/for-next (2e9dda43cb06 Merge branch 'printk-rework' into for=
-next)
Merging pci/next (255b2d524884 Merge branch 'remotes/lorenzo/pci/misc')
Merging pstore/for-next/pstore (26fecbf7602d pstore: Move kmsg_bytes defaul=
t into Kconfig)
Merging hid/for-next (6b36d59fdc6b Merge branch 'for-5.11/upstream-fixes' i=
nto for-next)
Merging i2c/i2c/for-next (e71ba9452f0b Linux 5.11-rc2)
Merging i3c/i3c/next (5c8fe583cce5 Linux 5.11-rc1)
Merging dmi/dmi-for-next (3cb4d29a2633 MAINTAINERS: The DMI/SMBIOS tree has=
 moved)
Merging hwmon-staging/hwmon-next (bae99e301bea hwmon: (pwm-fan) Support mul=
tiple fan tachometers)
Merging jc_docs/docs-next (798ed7800e20 atomic: remove further references t=
o atomic_ops)
Merging v4l-dvb/master (ecd07f4b9d21 media: allegro: rename stream_id to ds=
t_handle)
Merging v4l-dvb-next/master (d0a9fffedca1 docs: fs: api-summary.rst: get ri=
d of kernel-doc include)
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_dp_helper.c
CONFLICT (content): Merge conflict in Documentation/dev-tools/kasan.rst
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (a04307bd9ddd Merge branches 'pm-cpufreq', 'pm-cpuidl=
e' and 'powercap' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (c8bb45205438 Merge branch 'cpuf=
req/scmi' into cpufreq/arm/linux-next)
Merging cpupower/cpupower (e71ba9452f0b Linux 5.11-rc2)
Merging devfreq/devfreq-next (6a575e84f11e PM / devfreq: tegra30: Separate =
configurations per-SoC generation)
Merging opp/opp/linux-next (0e1d9ca1766f opp: Call the missing clk_put() on=
 error)
Merging thermal/thermal/linux-next (67698880ac9d thermal: int340x: Support =
Alder Lake)
Merging thermal-rzhang/next (54ecb8f7028c Linux 5.4-rc1)
Merging thermal-soc/next (6c375eccded4 thermal: db8500: Rewrite to be a pur=
e OF sensor)
Merging ieee1394/for-next (67f8e65e4fc1 firewire: net: remove set but not u=
sed variable 'guid')
Merging dlm/next (4f19d071f9be fs: dlm: check on existing node address)
Merging swiotlb/linux-next (e998879d4fb7 x86,swiotlb: Adjust SWIOTLB bounce=
 buffer size for SEV guests)
Merging rdma/for-next (e71ba9452f0b Linux 5.11-rc2)
Merging net-next/master (3db1a3fa9880 Merge tag 'staging-5.11-rc1' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging)
Merging bpf-next/for-next (3db1a3fa9880 Merge tag 'staging-5.11-rc1' of git=
://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging)
Merging ipsec-next/master (3db1a3fa9880 Merge tag 'staging-5.11-rc1' of git=
://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging)
Merging mlx5-next/mlx5-next (5c8fe583cce5 Linux 5.11-rc1)
Merging netfilter-next/master (3db1a3fa9880 Merge tag 'staging-5.11-rc1' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging)
Merging ipvs-next/master (3db1a3fa9880 Merge tag 'staging-5.11-rc1' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging)
Merging wireless-drivers-next/master (13458ffe0a95 net: x25: Remove unimple=
mented X.25-over-LLC code stubs)
Merging bluetooth/master (a5687c644015 Bluetooth: Fix initializing response=
 id after clearing struct)
Merging mac80211-next/master (13458ffe0a95 net: x25: Remove unimplemented X=
.25-over-LLC code stubs)
Merging gfs2/for-next (22bd8cd0e897 gfs2: make recovery workqueue operate o=
n a gfs2 mount point, not journal)
Merging mtd/mtd/next (341e4faf9cad mtd: remove redundant assignment to poin=
ter eb)
Merging nand/nand/next (3d557b24bc82 mtd: parsers: afs: Fix freeing the par=
t name memory in failure)
Merging spi-nor/spi-nor/next (31ad3eff093c mtd: spi-nor: keep lock bits if =
they are non-volatile)
Merging crypto/master (fecff3b931a5 crypto: picoxcell - Remove PicoXcell dr=
iver)
Merging drm/drm-next (5b2fc08c455b Merge tag 'amd-drm-fixes-5.11-2020-12-23=
' of git://people.freedesktop.org/~agd5f/linux into drm-next)
Merging amdgpu/drm-next (6db5a939c8db drm/amdgpu: take runtime pm reference=
 when we attach a buffer)
Merging drm-intel/for-linux-next (b3304591f14b drm/i915/dp: Track pm_qos pe=
r connector)
Merging drm-tegra/drm/tegra/for-next (bf3a3cdcad40 drm/tegra: sor: Disable =
clocks on error in tegra_sor_init())
Merging drm-misc/for-linux-next (be3e477effba drm/komeda: Fix bit check to =
import to value of proper type)
Merging drm-msm/msm-next (57f04815fd95 drm/msm: Fix WARN_ON() splat in _fre=
e_object())
Merging imx-drm/imx-drm/next (16da8e9a7767 drm/imx: ipuv3-crtc: use drm man=
aged resources)
Merging etnaviv/etnaviv/next (4612bad5701e drm/etnaviv: Add lockdep annotat=
ions for context lock)
Merging regmap/for-next (cffa4b2122f5 regmap: debugfs: Fix a memory leak wh=
en calling regmap_attach_dev)
Merging sound/for-next (64062869f0d6 ALSA: maestro: Use DIV_ROUND_CLOSEST()=
 instead of open-coding it)
Merging sound-asoc/for-next (11f0a38bed1e Merge remote-tracking branch 'aso=
c/for-5.12' into asoc-next)
Merging modules/modules-next (38dc717e9715 module: delay kobject uevent unt=
il after module init call)
Merging input/next (f5cace4b93d7 Input: imx_keypad - add dependency on HAS_=
IOMEM)
Merging block/for-next (dea8dcf2a9fa Merge tag 'for-5.11/dm-fix' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm)
Merging device-mapper/for-next (d68b29584c25 dm crypt: use GFP_ATOMIC when =
allocating crypto requests from softirq)
Merging pcmcia/pcmcia-next (4ce6b242b78d pcmcia: Switch to using the new AP=
I kobj_to_dev())
Merging mmc/next (72b248cfbf3f dt-bindings: mmc: eliminate yamllint warning=
s)
Merging mfd/for-mfd-next (2fc3f48ad711 mfd: mcp-sa11x0: Use DIV_ROUND_UP to=
 calculate rw_timeout)
Merging backlight/for-backlight-next (789eb04b6c56 backlight: pwm_bl: Fix i=
nterpolation)
Merging battery/for-next (bb118e5178b3 power: supply: max8997_charger: Set =
CHARGER current limit)
Merging regulator/for-next (86075ff7bd09 Merge remote-tracking branch 'regu=
lator/for-5.12' into regulator-next)
Merging security/next-testing (9dcd47fc1f7d Merge branch 'fixes-v5.10' into=
 next-testing)
Merging apparmor/apparmor-next (e37986097ba6 apparmor: Use true and false f=
or bool variable)
Merging integrity/next-integrity (207cdd565dfc ima: Don't modify file descr=
iptor mode on the fly)
Merging keys/keys-next (6b8945603d05 certs: Replace K{U,G}IDT_INIT() with G=
LOBAL_ROOT_{U,G}ID)
Merging safesetid/safesetid-next (03ca0ec13892 LSM: SafeSetID: Fix warnings=
 reported by test bot)
Merging selinux/next (3df98d79215a lsm,selinux: pass flowi_common instead o=
f flowi to the LSM hooks)
Merging smack/next (9b0072e2b2b5 security/smack: remove unused varible 'rc')
Merging tomoyo/master (dea8dcf2a9fa Merge tag 'for-5.11/dm-fix' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm)
Merging tpmdd/next (5160ecd31a0f char: tpm: add i2c driver for cr50)
Merging watchdog/master (5c8fe583cce5 Linux 5.11-rc1)
Merging iommu/next (4dd6ce478003 iommu: Fix a check in iommu_check_bind_dat=
a())
Merging audit/next (6b3211842a11 audit: replace atomic_add_return())
Merging devicetree/for-next (e33dc2f36367 dt-bindings: mali-bifrost: Add dy=
namic-power-coefficient)
Merging mailbox/mailbox-for-next (5a6338cce9f4 mailbox: arm_mhuv2: Add driv=
er)
Merging spi/for-next (ee6597b1bf06 Merge remote-tracking branch 'spi/for-5.=
12' into spi-next)
Merging tip/auto-latest (1173fb292bae Merge branch 'x86/build')
Merging clockevents/timers/drivers/next (8ae954caf49a clocksource/drivers/s=
h_cmt: Fix potential deadlock when calling runtime PM)
Merging edac/edac-for-next (f2a34093730f Merge branch 'edac-misc' into edac=
-for-next)
Merging irqchip/irq/irqchip-next (e1dc20995cb9 driver core: platform: Add e=
xtra error check in devm_platform_get_irqs_affinity())
Merging ftrace/for-next (f6a694665f13 tracing: Offload eval map updates to =
a work queue)
Merging rcu/rcu/next (b43abba9bf1c cpuidle: Fix missing need_resched() chec=
k after rcu_idle_enter())
Merging kvm/next (d45f89f7437d KVM: SVM: fix 32-bit compilation)
Merging kvm-arm/next (8cbebc4118b5 KVM: arm64: Replace KVM_ARM_PMU with HW_=
PERF_EVENTS)
Merging kvm-ppc/kvm-ppc-next (dc924b062488 KVM: SVM: check CR4 changes agai=
nst vcpu->arch)
Merging kvms390/next (50a05be484cb KVM: s390: track synchronous pfault even=
ts in kvm_stat)
Merging xen-tip/linux-next (6190c0ccaf5d xen: Kconfig: remove X86_64 depend=
s from XEN_512GB)
Merging percpu/for-next (7dd3050a0194 Merge branch 'for-5.12' into for-next)
Merging workqueues/for-next (ac87f8ff6cf1 workqueue: Kick a worker based on=
 the actual activation of delayed works)
Merging drivers-x86/for-next (5b569302520a platform/x86: amd-pmc: Fix CONFI=
G_DEBUG_FS check)
Merging chrome-platform/for-next (6ae9b5ffcaeb platform/chrome: cros_ec_typ=
ec: Tolerate unrecognized mux flags)
Merging hsi/for-next (aa57e77b3d28 HSI: Fix PM usage counter unbalance in s=
si_hw_init)
Merging leds/for-next (9a5ad5c5b2d2 leds: trigger: fix potential deadlock w=
ith libata)
Merging ipmi/for-next (dea8dcf2a9fa Merge tag 'for-5.11/dm-fix' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm)
Merging driver-core/driver-core-next (e71ba9452f0b Linux 5.11-rc2)
Merging usb/usb-next (cb4d9b52ec06 usb: dwc3: drd: Improve dwc3_get_extcon(=
) style)
Merging usb-gadget/next (b2c586eb07ef usb: dwc2: Fix INTR OUT transfers in =
DDMA mode.)
Merging usb-serial/usb-next (5c8fe583cce5 Linux 5.11-rc1)
Merging usb-chipidea-next/for-usb-next (fc71a6268982 usb: chipidea: tegra: =
Specify TX FIFO threshold in UDC SoC info)
Merging phy-next/next (5c8fe583cce5 Linux 5.11-rc1)
Merging tty/tty-next (01493ccb4436 tty: serial: icom: Use DEFINE_SPINLOCK()=
 for spinlock)
Merging char-misc/char-misc-next (5c8fe583cce5 Linux 5.11-rc1)
Merging extcon/extcon-next (226d336c1c75 extcon: max8997: Add CHGINS and CH=
GRM interrupt handling)
Merging soundwire/next (5c8fe583cce5 Linux 5.11-rc1)
Merging thunderbolt/next (82096ecf589d thunderbolt: Use kmemdup instead of =
kzalloc and memcpy)
Merging vfio/next (bdfae1c9a913 vfio/type1: Add vfio_group_iommu_domain())
Merging staging/staging-next (1f82c33205db Revert "staging: board: Remove m=
acro board_staging")
Merging mux/for-next (3516bd729358 Merge tag 's390-5.11-3' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/s390/linux)
Merging icc/icc-next (4b1a60a1bb8f MAINTAINERS: Update Georgi's email addre=
ss)
Merging dmaengine/next (5c8fe583cce5 Linux 5.11-rc1)
Merging cgroup/for-next (2d18e54dd866 cgroup: Fix memory leak when parsing =
multiple source parameters)
Merging scsi/for-next (2da499c6f7b1 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (e71ba9452f0b Linux 5.11-rc2)
Merging vhost/linux-next (e13a6915a03f vhost/vsock: add IOTLB API support)
Merging rpmsg/for-next (c101deb7d50b Merge branche 'rproc-fixes' into for-n=
ext)
Merging gpio/for-next (7ac554888233 MAINTAINERS: Remove reference to non-ex=
isting file)
Merging gpio-brgl/gpio/for-next (7b8ecb1dca54 gpio: Kconfig: Update help de=
scription for GPIO_RCAR config)
Merging gpio-intel/for-next (5c8fe583cce5 Linux 5.11-rc1)
Merging pinctrl/for-next (3df09cb8c92e pinctrl/spear: simplify the return e=
xpression of spear300_pinctrl_probe())
Merging pinctrl-intel/for-next (5c8fe583cce5 Linux 5.11-rc1)
Merging pinctrl-renesas/renesas-pinctrl (7ba4a9591a8a pinctrl: renesas: Fix=
 fall-through warnings for Clang)
Merging pinctrl-samsung/for-next (5c8fe583cce5 Linux 5.11-rc1)
Merging pwm/for-next (6eefb79d6f5b pwm: sun4i: Remove erroneous else branch)
Merging userns/for-next (95ebabde382c capabilities: Don't allow writing amb=
iguous v3 file capabilities)
Merging ktest/for-next (170f4869e662 ktest.pl: Fix the logic for truncating=
 the size of the log file for email)
Merging random/dev (ab9a7e27044b random: avoid warnings for !CONFIG_NUMA bu=
ilds)
Merging kselftest/next (df00d0298902 selftests/vDSO: fix -Wformat warning i=
n vdso_test_correctness)
Merging y2038/y2038 (c4e71212a245 Revert "drm/etnaviv: reject timeouts with=
 tv_nsec >=3D NSEC_PER_SEC")
Merging livepatching/for-next (59fc1e476962 Merge branch 'for-5.10/flive-pa=
tching' into for-next)
Merging coresight/next (1efbcec2ef8c coresight: cti: Reduce scope for the v=
ariable =E2=80=9Ccs_fwnode=E2=80=9D in cti_plat_create_connection())
Merging rtc/rtc-next (5c8fe583cce5 Linux 5.11-rc1)
Merging nvdimm/libnvdimm-for-next (127c3d2e7e8a Merge branch 'for-5.11/dax'=
 into for-5.11/libnvdimm)
Merging at24/at24/for-next (5c8fe583cce5 Linux 5.11-rc1)
Merging ntb/ntb-next (5c8fe583cce5 Linux 5.11-rc1)
Merging seccomp/for-next/seccomp (2c07343abd89 selftests/seccomp: Update ke=
rnel config)
Merging kspp/for-next/kspp (09162bc32c88 Linux 5.10-rc4)
Merging gnss/gnss-next (5c8fe583cce5 Linux 5.11-rc1)
Merging fsi/next (4a851d714ead fsi: aspeed: Support CFAM reset GPIO)
Merging slimbus/for-next (6790dc4a58f3 slimbus: qcom-ngd-ctrl: fix SSR depe=
ndencies)
Merging nvmem/for-next (292b72c982a6 nvmem: imx-ocotp: add support for the =
unaliged word count)
Merging xarray/main (80c1dbebf308 XArray: Fix splitting to non-zero orders)
Merging hyperv/hyperv-next (d1df458cbfdb hv_balloon: do adjust_managed_page=
_count() when ballooning/un-ballooning)
Merging auxdisplay/auxdisplay (351dcacc6d77 auxdisplay: panel: Remove redun=
dant charlcd_ops structures)
Merging kgdb/kgdb/for-next (d081a6e35316 kdb: Fix pager search for multi-li=
ne strings)
Merging pidfd/for-next (7abe0224623f Merge tag 'time-namespace-v5.11' of gi=
tolite.kernel.org:pub/scm/linux/kernel/git/brauner/linux into for-next)
Merging hmm/hmm (3650b228f83a Linux 5.10-rc1)
Merging fpga/for-next (5c8fe583cce5 Linux 5.11-rc1)
Merging kunit/test (e71ba9452f0b Linux 5.11-rc2)
Merging generic-ioremap/for-next (4bdc0d676a64 remove ioremap_nocache and d=
evm_ioremap_nocache)
Merging cfi/cfi/next (5de15b610f78 mtd: hyperbus: add Renesas RPC-IF driver)
Merging kunit-next/kunit (e71ba9452f0b Linux 5.11-rc2)
Merging trivial/for-next (9ff9b0d392ea Merge tag 'net-next-5.10' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging zx2c4/for-next (16fbf79b0f83 Linux 5.6-rc7)
Merging mhi/mhi-next (4ea6fa2cb921 mhi: pci_generic: Fix implicit conversio=
n warning)
Merging notifications/notifications-pipe-core (841a0dfa5113 watch_queue: sa=
mple: Display mount tree change notifications)
CONFLICT (content): Merge conflict in include/uapi/asm-generic/unistd.h
CONFLICT (content): Merge conflict in arch/xtensa/kernel/syscalls/syscall.t=
bl
CONFLICT (content): Merge conflict in arch/x86/entry/syscalls/syscall_64.tbl
CONFLICT (content): Merge conflict in arch/x86/entry/syscalls/syscall_32.tbl
CONFLICT (content): Merge conflict in arch/sparc/kernel/syscalls/syscall.tbl
CONFLICT (content): Merge conflict in arch/sh/kernel/syscalls/syscall.tbl
CONFLICT (content): Merge conflict in arch/s390/kernel/syscalls/syscall.tbl
CONFLICT (content): Merge conflict in arch/powerpc/kernel/syscalls/syscall.=
tbl
CONFLICT (content): Merge conflict in arch/parisc/kernel/syscalls/syscall.t=
bl
CONFLICT (content): Merge conflict in arch/mips/kernel/syscalls/syscall_o32=
.tbl
CONFLICT (content): Merge conflict in arch/mips/kernel/syscalls/syscall_n64=
.tbl
CONFLICT (content): Merge conflict in arch/mips/kernel/syscalls/syscall_n32=
.tbl
CONFLICT (content): Merge conflict in arch/microblaze/kernel/syscalls/sysca=
ll.tbl
CONFLICT (content): Merge conflict in arch/m68k/kernel/syscalls/syscall.tbl
CONFLICT (content): Merge conflict in arch/ia64/kernel/syscalls/syscall.tbl
CONFLICT (content): Merge conflict in arch/arm64/include/asm/unistd32.h
CONFLICT (content): Merge conflict in arch/arm64/include/asm/unistd.h
CONFLICT (content): Merge conflict in arch/arm/tools/syscall.tbl
CONFLICT (content): Merge conflict in arch/alpha/kernel/syscalls/syscall.tbl
Merging memblock/for-next (5bdba520c1b3 mm: memblock: drop __init from memb=
lock functions to make it inline)
Merging init/init-user-pointers (38b082236e77 initramfs: use vfs_utimes in =
do_copy)
Merging counters/counters (e71ba9452f0b Linux 5.11-rc2)
Merging akpm-current/current (ef677e35644c aio: simplify read_events())
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
Merging akpm/master (7888fe42dfc1 secretmem-test-add-basic-selftest-for-mem=
fd_secret2-fix)

--Sig_/BT4.w+FHmchqCqjZ=GBh.N4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/z098ACgkQAVBC80lX
0GwQ3AgAnqYxRiCR+n55IEI9FdNwhptsleEW95S97hsc5hr8jLD7N7ux/WYBINcL
HvE3Siv/DKqxdMa2TWkqPdOIRJrgG0JAktAKSWCZsmbnB8oERgF9i480FIw0kmQ3
ykK51HCkni9w66zVF8gn6yzgxq3MfPNxFppEvUTcaW3zEb8NHTQC3inSbV+E+sod
7rxdtbFGzRN9ZO963EzDljNYLo+W+e9OPU8XZLp8R5qn7Znt9BGSCdNgB0RdF3Lg
pJ/8V5nZvL12SYQxZwftCbWHPeX5C1LrSNsmAoerZoG5M947ipW+1BmQUSnw8TVv
M+rIAcDS5dbjhC8Zp3ZdHDUYFPNSAw==
=YHmn
-----END PGP SIGNATURE-----

--Sig_/BT4.w+FHmchqCqjZ=GBh.N4--
