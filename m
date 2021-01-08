Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A1302EECBE
	for <lists+linux-next@lfdr.de>; Fri,  8 Jan 2021 06:00:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727195AbhAHE7r (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 7 Jan 2021 23:59:47 -0500
Received: from ozlabs.org ([203.11.71.1]:50959 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726793AbhAHE7r (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 7 Jan 2021 23:59:47 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DBrVD1QjNz9sW4;
        Fri,  8 Jan 2021 15:59:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1610081940;
        bh=WUcqKvCZtdQmr7vbHlkpWL3Uxbz4nB0qxtoxpeFOtdI=;
        h=Date:From:To:Cc:Subject:From;
        b=m+00994zXPiro1nKZmTRPEmIsWmD4UbuLWFxud47dbPvpghsAYUwy19Zgy4k5EpzY
         U6Jm6crLfipB4Q/UHyeCH7NuM4jjK+Ogu8mGiuJ9ZIzphTXZo7c0ANNns8Y6BhlaQT
         M1YbcYU8cxCu+r3tcdoJwIFYcbz2tZzGZh+dKqI0hC6PLiM64AG9bXzUlw3q1R3m/L
         8rGF63fAh54ygMD1Gom2vhECkqMEfN1y/xHNqiOwGTnPoaUC+KIqzUJcL5VSbVMnZR
         bmEjSwuvaxpa0j94uMzqfH6AzMllgJJWM630UhSp9TRNFTgz/JlaLWSfgAeOAYIlT6
         p600mTATkUgFw==
Date:   Fri, 8 Jan 2021 15:58:58 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jan 8
Message-ID: <20210108155858.43ffef6d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4fM/HcT99rGbY50sjERxFyz";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/4fM/HcT99rGbY50sjERxFyz
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20210107:

The net-next tree gained conflict against the net tree.

The drm tree gained a build failure so I used the version from
next-20210107.

The amdgpu tree gained conflict against Linus' tree and a build failure
so I used the version from next-20210107.

The drm-misc tree gained a build failure from merging the drm tree,
so I have used the version from next-20210107.

Non-merge commits (relative to Linus' tree): 1770
 1804 files changed, 62353 insertions(+), 28668 deletions(-)

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
Merging origin/master (f5e6c330254a Merge tag 'spi-fix-v5.11-rc2' of git://=
git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging fixes/fixes (e71ba9452f0b Linux 5.11-rc2)
Merging kbuild-current/fixes (9bba03d4473d kconfig: remove 'kvmconfig' and =
'xenconfig' shorthands)
Merging arc-current/for-curr (bb12433bf56e ARC: unbork 5.11 bootup: fix sna=
fu in _TIF_NOTIFY_SIGNAL handling)
Merging arm-current/fixes (e64ab473ddda ARM: 9034/1: __div64_32(): straight=
en up inline asm constraints)
Merging arm64-fixes/for-next/fixes (462a1b17f8ef arm64: Move PSTATE.TCO set=
ting to separate functions)
Merging arm-soc-fixes/arm/fixes (7887cc89d585 ARM: dts: ux500/golden: Set d=
isplay max brightness)
Merging drivers-memory-fixes/fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging m68k-current/for-linus (2ae92e8b9b7e MAINTAINERS: Update m68k Mac e=
ntry)
Merging powerpc-fixes/fixes (3ce47d95b734 powerpc: Handle .text.{hot,unlike=
ly}.* in linker script)
Merging s390-fixes/fixes (129975e75b9a s390/Kconfig: sort config S390 selec=
t list once again)
Merging sparc/master (0a95a6d1a4cd sparc: use for_each_child_of_node() macr=
o)
Merging fscrypt-current/for-stable (d19d8d345eec fscrypt: fix inline encryp=
tion not used on new files)
Merging net/master (f3562f5e00bb docs: octeontx2: tune rst markup)
Merging bpf/master (6f02b540d759 bpftool: Fix compilation failure for net.o=
 with older glibc)
Merging ipsec/master (da64ae2d35d3 xfrm: Fix wraparound in xfrm_policy_addr=
_delta())
Merging netfilter/master (a8f33c038f4e Merge git://git.kernel.org/pub/scm/l=
inux/kernel/git/pablo/nf)
Merging ipvs/master (b4e70d8dd9ea netfilter: nftables: add set expression f=
lags)
Merging wireless-drivers/master (bfe55584713b MAINTAINERS: switch to differ=
ent email address)
Merging mac80211/master (3503ee6c0bec selftests: fix the return value for U=
DP GRO test)
Merging rdma-fixes/for-rc (e71ba9452f0b Linux 5.11-rc2)
Merging sound-current/for-linus (7b6227550723 Merge tag 'asoc-fix-v5.11-rc2=
' of https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound into for=
-linus)
Merging sound-asoc-fixes/for-linus (abe845f315b9 Merge remote-tracking bran=
ch 'asoc/for-5.11' into asoc-linus)
Merging regmap-fixes/for-linus (72962ebcdd45 Merge remote-tracking branch '=
regmap/for-5.11' into regmap-linus)
Merging regulator-fixes/for-linus (cd66a1589b7c Merge remote-tracking branc=
h 'regulator/for-5.11' into regulator-linus)
Merging spi-fixes/for-linus (02b3446f68d5 Merge remote-tracking branch 'spi=
/for-5.11' into spi-linus)
Merging pci-current/for-linus (e71ba9452f0b Linux 5.11-rc2)
Merging driver-core.current/driver-core-linus (e71ba9452f0b Linux 5.11-rc2)
Merging tty.current/tty-linus (54ca955b5a40 serial: mvebu-uart: fix tx lost=
 characters at power off)
Merging usb.current/usb-linus (a5c7682aaaa1 usb: dwc3: gadget: Clear wait f=
lag on dequeue)
Merging usb-gadget-fixes/fixes (129aa9734559 usb: raw-gadget: fix memory le=
ak in gadget_setup)
Merging usb-serial-fixes/usb-linus (54d0a3ab80f4 USB: serial: iuu_phoenix: =
fix DMA from stack)
Merging usb-chipidea-fixes/for-usb-fixes (65403ff98ebb MAINTAINERS: Update =
address for Cadence USB3 driver)
Merging phy/fixes (d092bd911049 phy: mediatek: allow compile-testing the ds=
i phy)
Merging staging.current/staging-linus (00b8c557d096 staging: ION: remove so=
me references to CONFIG_ION)
Merging char-misc.current/char-misc-linus (afded6d83aa7 misc: pvpanic: Chec=
k devm_ioport_map() for NULL)
Merging soundwire-fixes/fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging thunderbolt-fixes/fixes (c14556fc0c7c thunderbolt: Drop duplicated =
0x prefix from format string)
Merging input-current/for-linus (698dc0cf9447 dt-bindings: input: adc-keys:=
 clarify description)
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
Merging v4l-dvb-fixes/fixes (2984a99ff1c0 media: v4l: common: Fix naming of=
 v4l2_get_link_rate)
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
Merging btrfs-fixes/next-fixes (185771934eef Merge branch 'misc-5.11' into =
next-fixes)
Merging vfs-fixes/fixes (a0a6df9afcaf umount(2): move the flag validity che=
cks first)
Merging dma-mapping-fixes/for-linus (892fc9f6835e dma-pool: Fix an uninitia=
lized variable bug in atomic_pool_expand())
Merging i3c-fixes/i3c/fixes (291b5c9870fc i3c/master/mipi-i3c-hci: Fix posi=
tion of __maybe_unused in i3c_hci_of_match)
Merging drivers-x86-fixes/fixes (5b569302520a platform/x86: amd-pmc: Fix CO=
NFIG_DEBUG_FS check)
Merging samsung-krzk-fixes/fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging pinctrl-samsung-fixes/fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging devicetree-fixes/dt/linus (2b8f061a4f50 dt-bindings: Drop redundant=
 maxItems/items)
Merging scsi-fixes/fixes (be2553358cd4 scsi: sd: Remove obsolete variable i=
n sd_remove())
Merging drm-fixes/drm-fixes (4e181dede94d Merge tag 'drm-intel-fixes-2021-0=
1-07' of git://anongit.freedesktop.org/drm/drm-intel into drm-fixes)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (9397d66212cd drm/i915/dp: Tra=
ck pm_qos per connector)
Merging mmc-fixes/fixes (e71ba9452f0b Linux 5.11-rc2)
Merging rtc-fixes/rtc-fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging gnss-fixes/gnss-linus (5c8fe583cce5 Linux 5.11-rc1)
Merging hyperv-fixes/hyperv-fixes (ad0a6bad4475 x86/hyperv: check cpu mask =
after interrupt has been disabled)
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
Merging drm-misc-fixes/for-linux-next-fixes (a73858ef4d5e drm/ttm: unexport=
 ttm_pool_init/fini)
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
Merging arm64/for-next/core (aded8c7c2b72 iommu/arm-smmu-qcom: Initialize S=
CTLR of the bypass context)
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
Merging drivers-memory/for-next (81053f0e95da Merge branch 'for-v5.12/tegra=
-mc' into for-next)
Merging imx-mxs/for-next (90330a6dbd8c Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (b2a8f6ce4bdc Merge branch 'for_5.11/drivers-soc' int=
o next)
Merging mediatek/for-next (727bfb2c55b0 Merge branch 'v5.10-next/soc' into =
for-next)
Merging mvebu/for-next (dc14300bb67b Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (792952314166 Merge branch 'omap-for-v5.11/dt' into f=
or-next)
Merging qcom/for-next (917168164de5 Merge branches 'arm64-defconfig-for-5.1=
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
Merging scmi/for-linux-next (dd63baa9d43f Merge branch 'for-next/scmi' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-li=
nux-next)
Merging stm32/stm32-next (814fddb955f8 ARM: multi_v7_defconfig: enable STM3=
2 dfsdm audio support)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/con=
nector/usb-connector.yaml
Merging sunxi/sunxi/for-next (2e76c5b3726d Merge branches 'sunxi/clk-for-5.=
12', 'sunxi/drivers-for-5.12' and 'sunxi/dt-for-5.12' into sunxi/for-next)
Merging tegra/for-next (b11a0dfbd316 Merge branch for-5.11/arm64/defconfig =
into for-next)
Merging ti-k3/ti-k3-next (1e3d655fe7b4 Merge branch 'ti-k3-config-next' int=
o ti-k3-next)
Merging ti-k3-new/ti-k3-next (5c8fe583cce5 Linux 5.11-rc1)
Merging clk/clk-next (abe7e32f1d50 Merge branches 'clk-ingenic', 'clk-vc5',=
 'clk-cleanup', 'clk-canaan' and 'clk-marvell' into clk-next)
Merging clk-renesas/renesas-clk (193fd4c76240 clk: renesas: r8a779a0: Add M=
SIOF clocks)
Merging clk-samsung/for-next (44a9e78f9242 clk: samsung: Prevent potential =
endless loop in the PLL ops)
Merging csky/linux-next (f0bbf052ae46 csky: Reconstruct VDSO framework)
Merging h8300/h8300-next (8808515be0ed h8300: Replace <linux/clk-provider.h=
> by <linux/of_clk.h>)
Merging ia64/next (c331649e6371 ia64: Use libata instead of the legacy ide =
driver in defconfigs)
Merging m68k/for-next (2ae92e8b9b7e MAINTAINERS: Update m68k Mac entry)
Merging m68knommu/for-next (e71ba9452f0b Linux 5.11-rc2)
Merging microblaze/next (57ddf08642f0 microblaze: do not select TRACING_SUP=
PORT directly)
Merging mips/mips-next (ccb21774863a MIPS: UAPI: unexport unistd_nr_{n32,n6=
4,o32}.h)
Merging nds32/next (54bde873682b nds32: Fix bogus reference to <asm/procinf=
o.h>)
Merging nios2/for-next (6b57fa4d374b nios2: signal: Mark expected switch fa=
ll-through)
Merging openrisc/for-next (d8398bf840f8 openrisc: add local64.h to fix blk-=
iocost build)
Merging parisc-hd/for-next (2c85ebc57b3e Linux 5.10)
Merging powerpc/next (e71ba9452f0b Linux 5.11-rc2)
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
Merging cifs/for-next (3ba507dc5ef7 cifs: check pointer before freeing)
Merging configfs/for-next (65cdb4a214c0 configfs: fix kernel-doc markup iss=
ue)
Merging ecryptfs/next (8b614cb8f1dc Merge tag '5.6-rc4-smb3-fixes' of git:/=
/git.samba.org/sfrench/cifs-2.6)
Merging erofs/dev (d8b3df8b1048 erofs: avoid using generic_block_bmap)
Merging exfat/dev (614cb5894306 Merge tag 'acpi-5.11-rc1-2' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/rafael/linux-pm)
Merging ext3/for_next (d15cd626d7a4 Pull inotify memcg accounting patch.)
Merging ext4/dev (5a3b590d4b2d ext4: don't leak old mountpoint samples)
CONFLICT (content): Merge conflict in fs/ext4/super.c
Merging f2fs/dev (b21c46be11a0 f2fs: fix to keep isolation of atomic write)
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
Merging vfs/for-next (5cc02325880f Merge branches 'fixes', 'work.sparc', 'w=
ork.sparc32', 'work.elf-compat', 'work.recursive_removal', 'work.misc' and =
'work.d_name' into for-next)
Merging printk/for-next (2e9dda43cb06 Merge branch 'printk-rework' into for=
-next)
Merging pci/next (e71ba9452f0b Linux 5.11-rc2)
Merging pstore/for-next/pstore (26fecbf7602d pstore: Move kmsg_bytes defaul=
t into Kconfig)
Merging hid/for-next (a58f881f92ad Merge branch 'for-5.11/upstream-fixes' i=
nto for-next)
Merging i2c/i2c/for-next (e7ccf47c442b Merge branch 'i2c/for-current' into =
i2c/for-next)
Merging i3c/i3c/next (5c8fe583cce5 Linux 5.11-rc1)
Merging dmi/dmi-for-next (3cb4d29a2633 MAINTAINERS: The DMI/SMBIOS tree has=
 moved)
Merging hwmon-staging/hwmon-next (bae99e301bea hwmon: (pwm-fan) Support mul=
tiple fan tachometers)
Merging jc_docs/docs-next (9d54ee78aef6 docs: admin-guide: bootconfig: Fix =
feils to fails)
Merging v4l-dvb/master (ecd07f4b9d21 media: allegro: rename stream_id to ds=
t_handle)
Merging v4l-dvb-next/master (d0a9fffedca1 docs: fs: api-summary.rst: get ri=
d of kernel-doc include)
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_dp_helper.c
CONFLICT (content): Merge conflict in Documentation/dev-tools/kasan.rst
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (75a052c6b1ba Merge branch 'pm-cpufreq' into linux-ne=
xt)
Merging cpufreq-arm/cpufreq/arm/linux-next (c8bb45205438 Merge branch 'cpuf=
req/scmi' into cpufreq/arm/linux-next)
Merging cpupower/cpupower (fb7791e213a6 cpupower: add Makefile dependencies=
 for install targets)
Merging devfreq/devfreq-next (ec894883de53 PM / devfreq: Replace devfreq->d=
ev.parent as dev in devfreq_add_device)
Merging opp/opp/linux-next (0e1d9ca1766f opp: Call the missing clk_put() on=
 error)
Merging thermal/thermal/linux-next (6250d904ae1d thermal/core: Remove point=
less thermal_zone_device_reset() function)
Merging thermal-rzhang/next (54ecb8f7028c Linux 5.4-rc1)
Merging thermal-soc/next (6c375eccded4 thermal: db8500: Rewrite to be a pur=
e OF sensor)
Merging ieee1394/for-next (67f8e65e4fc1 firewire: net: remove set but not u=
sed variable 'guid')
Merging dlm/next (4f19d071f9be fs: dlm: check on existing node address)
Merging swiotlb/linux-next (e998879d4fb7 x86,swiotlb: Adjust SWIOTLB bounce=
 buffer size for SEV guests)
Merging rdma/for-next (e71ba9452f0b Linux 5.11-rc2)
Merging net-next/master (7cd1de76c95f Merge branch 'dwmac-meson8b-picosecon=
d-precision-rx-delay-support')
CONFLICT (content): Merge conflict in drivers/net/can/m_can/tcan4x5x-core.c
Merging bpf-next/for-next (e72afae47aa5 net, xdp: Introduce xdp_prepare_buf=
f utility routine)
Merging ipsec-next/master (ede71cae7285 net-next: docs: Fix typos in snmp_c=
ounter.rst)
Merging mlx5-next/mlx5-next (5c8fe583cce5 Linux 5.11-rc1)
Merging netfilter-next/master (3db1a3fa9880 Merge tag 'staging-5.11-rc1' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging)
Merging ipvs-next/master (3db1a3fa9880 Merge tag 'staging-5.11-rc1' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging)
Merging wireless-drivers-next/master (13458ffe0a95 net: x25: Remove unimple=
mented X.25-over-LLC code stubs)
Merging bluetooth/master (ad3a9c0ec2d2 Bluetooth: hci_qca: Wait for SSR com=
pletion during suspend)
Merging mac80211-next/master (3db1a3fa9880 Merge tag 'staging-5.11-rc1' of =
git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging)
Merging gfs2/for-next (2f31d01b4fe2 gfs2: amend SLAB_RECLAIM_ACCOUNT on gfs=
2 related slab cache)
Merging mtd/mtd/next (341e4faf9cad mtd: remove redundant assignment to poin=
ter eb)
Merging nand/nand/next (3d557b24bc82 mtd: parsers: afs: Fix freeing the par=
t name memory in failure)
Merging spi-nor/spi-nor/next (31ad3eff093c mtd: spi-nor: keep lock bits if =
they are non-volatile)
Merging crypto/master (fecff3b931a5 crypto: picoxcell - Remove PicoXcell dr=
iver)
Merging drm/drm-next (cb3cfbf79aff Merge tag 'drm-misc-next-2021-01-06' of =
git://anongit.freedesktop.org/drm/drm-misc into drm-next)
$ git reset --hard HEAD^
Merging next-20210107 version of drm
Merging amdgpu/drm-next (8f37c3cc3034 MAINTAINERS: update radeon/amdgpu/amd=
kfd git trees)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/amdgpu_dm=
/amdgpu_dm_mst_types.c
$ git reset --hard HEAD^
Merging next-20210107 version of amdgpu
Merging drm-intel/for-linux-next (6fdb335f1c9c drm/i915/dsi: Use unconditio=
nal msleep for the panel_on_delay when there is no reset-deassert MIPI-sequ=
ence)
Merging drm-tegra/drm/tegra/for-next (bf3a3cdcad40 drm/tegra: sor: Disable =
clocks on error in tegra_sor_init())
Merging drm-misc/for-linux-next (4992a7f7105d drm/hisilicon: Use simple enc=
oder)
$ git reset --hard HEAD^
Merging next-20210107 version of drm-misc
Merging drm-msm/msm-next (00fd44a1a470 drm/msm: Only enable A6xx LLCC code =
on A6xx)
Merging imx-drm/imx-drm/next (5d91295257ea drm/imx: dw_hdmi-imx: depend on =
OF to fix randconfig compile tests on x86_64)
Merging etnaviv/etnaviv/next (4612bad5701e drm/etnaviv: Add lockdep annotat=
ions for context lock)
Merging regmap/for-next (72962ebcdd45 Merge remote-tracking branch 'regmap/=
for-5.11' into regmap-linus)
Merging sound/for-next (6dcb8bf9a1d7 Merge branch 'for-linus' into for-next)
Merging sound-asoc/for-next (daefbe93f9cf Merge remote-tracking branch 'aso=
c/for-5.12' into asoc-next)
Merging modules/modules-next (38dc717e9715 module: delay kobject uevent unt=
il after module init call)
Merging input/next (f5cace4b93d7 Input: imx_keypad - add dependency on HAS_=
IOMEM)
Merging block/for-next (a9f7c7a1f408 Merge branch 'for-5.12/io_uring' into =
for-next)
Merging device-mapper/for-next (06a056150e8a dm: eliminate potential source=
 of excessive kernel log noise)
Merging pcmcia/pcmcia-next (4ce6b242b78d pcmcia: Switch to using the new AP=
I kobj_to_dev())
Merging mmc/next (e71ba9452f0b Linux 5.11-rc2)
Merging mfd/for-mfd-next (2fc3f48ad711 mfd: mcp-sa11x0: Use DIV_ROUND_UP to=
 calculate rw_timeout)
Merging backlight/for-backlight-next (789eb04b6c56 backlight: pwm_bl: Fix i=
nterpolation)
Merging battery/for-next (32e4978bb920 power: supply: bq256xx: Introduce th=
e BQ256XX charger driver)
Merging regulator/for-next (d2725f3a363f Merge remote-tracking branch 'regu=
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
Merging selinux/next (a9ffe682c58a selinux: fix inconsistency between inode=
_getxattr and inode_listsecurity)
Merging smack/next (9b0072e2b2b5 security/smack: remove unused varible 'rc')
Merging tomoyo/master (dea8dcf2a9fa Merge tag 'for-5.11/dm-fix' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm)
Merging tpmdd/next (5160ecd31a0f char: tpm: add i2c driver for cr50)
Merging watchdog/master (5c8fe583cce5 Linux 5.11-rc1)
Merging iommu/next (4dd6ce478003 iommu: Fix a check in iommu_check_bind_dat=
a())
Merging audit/next (a1b861faa684 kernel/audit: convert comma to semicolon)
Merging devicetree/for-next (e33dc2f36367 dt-bindings: mali-bifrost: Add dy=
namic-power-coefficient)
Merging mailbox/mailbox-for-next (5a6338cce9f4 mailbox: arm_mhuv2: Add driv=
er)
Merging spi/for-next (e645b1fb4c63 Merge remote-tracking branch 'spi/for-5.=
12' into spi-next)
Merging tip/auto-latest (1173fb292bae Merge branch 'x86/build')
CONFLICT (content): Merge conflict in arch/Kconfig
Merging clockevents/timers/drivers/next (8ae954caf49a clocksource/drivers/s=
h_cmt: Fix potential deadlock when calling runtime PM)
Merging edac/edac-for-next (f2a34093730f Merge branch 'edac-misc' into edac=
-for-next)
Merging irqchip/irq/irqchip-next (4cc99d03757d irqchip/loongson-liointc: Fi=
x build warnings)
Merging ftrace/for-next (f6a694665f13 tracing: Offload eval map updates to =
a work queue)
Merging rcu/rcu/next (81245510ceac cpuidle: Fix missing need_resched() chec=
k after rcu_idle_enter())
Merging kvm/next (647daca25d24 KVM: SVM: Add support for booting APs in an =
SEV-ES guest)
Merging kvm-arm/next (45ba7b195a36 arm64: cpufeature: remove non-exist CONF=
IG_KVM_ARM_HOST)
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
Merging usb/usb-next (ed054e4e95d6 USB: gadget: f_printer: set a default q_=
len)
CONFLICT (content): Merge conflict in drivers/usb/dwc3/gadget.c
Merging usb-gadget/next (b2c586eb07ef usb: dwc2: Fix INTR OUT transfers in =
DDMA mode.)
Merging usb-serial/usb-next (5c8fe583cce5 Linux 5.11-rc1)
Merging usb-chipidea-next/for-usb-next (fc71a6268982 usb: chipidea: tegra: =
Specify TX FIFO threshold in UDC SoC info)
Merging phy-next/next (5c8fe583cce5 Linux 5.11-rc1)
Merging tty/tty-next (01493ccb4436 tty: serial: icom: Use DEFINE_SPINLOCK()=
 for spinlock)
Merging char-misc/char-misc-next (4c5a6a7b7143 greybus: remove h from print=
k format specifier)
Merging extcon/extcon-next (226d336c1c75 extcon: max8997: Add CHGINS and CH=
GRM interrupt handling)
Merging soundwire/next (235ae89b6676 soundwire: intel: Use kzalloc for allo=
cating only one thing)
Merging thunderbolt/next (82096ecf589d thunderbolt: Use kmemdup instead of =
kzalloc and memcpy)
Merging vfio/next (bdfae1c9a913 vfio/type1: Add vfio_group_iommu_domain())
Merging staging/staging-next (87bb53b75563 staging: rtl819x: select CONFIG_=
CRC32)
Merging mux/for-next (3516bd729358 Merge tag 's390-5.11-3' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/s390/linux)
Merging icc/icc-next (4b1a60a1bb8f MAINTAINERS: Update Georgi's email addre=
ss)
Merging dmaengine/next (80f959dedfa6 dma: idxd: use DEFINE_MUTEX() for mute=
x lock)
Merging cgroup/for-next (2d18e54dd866 cgroup: Fix memory leak when parsing =
multiple source parameters)
Merging scsi/for-next (a8f808839abe Merge branch '5.11/scsi-postmerge' into=
 5.11/scsi-fixes)
Merging scsi-mkp/for-next (a967ddb22d94 scsi: ufs: ufs-exynos: Apply vendor=
-specific values for three timeouts)
Merging vhost/linux-next (e13a6915a03f vhost/vsock: add IOTLB API support)
Merging rpmsg/for-next (7cb4f293777e Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (7ac554888233 MAINTAINERS: Remove reference to non-ex=
isting file)
Merging gpio-brgl/gpio/for-next (efcdca286eef gpio: tegra: Convert to gpio_=
irq_chip)
Merging gpio-intel/for-next (5c8fe583cce5 Linux 5.11-rc1)
Merging pinctrl/for-next (6d92949813bb Merge branch 'devel' into for-next)
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
Merging slimbus/for-next (5c8fe583cce5 Linux 5.11-rc1)
Merging nvmem/for-next (40f592233f78 nvmem: imx-iim: Use of_device_get_matc=
h_data())
Merging xarray/main (80c1dbebf308 XArray: Fix splitting to non-zero orders)
Merging hyperv/hyperv-next (d03419fe2048 scsi: storvsc: Resolve data race i=
n storvsc_probe())
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
Merging mhi/mhi-next (e6ca384d3b09 mhi: pci_generic: Fix shared MSI vector =
support)
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
Merging akpm-current/current (790907e4ba85 aio: simplify read_events())
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
Merging akpm/master (5abc1e21fca0 secretmem-test-add-basic-selftest-for-mem=
fd_secret2-fix)

--Sig_/4fM/HcT99rGbY50sjERxFyz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/35pMACgkQAVBC80lX
0GxAAwf/VTCpm0VidGbUbodm4cUpVwdPlPgNJj1kE6KkHNdVAWxVLI9AHoRufIEL
0pcokqQnpTzgV2Sn1hDg4PHdE+WxwpJcluzZSF1JZ5OcqWQQU5N7jDJySxJ7e/M/
G95GZfRxBBmnCSNLSV0R7tSI+5/OeyS0MqR+10ntU0zMsksY2nMW+Rchx75HDLEo
xiy5W3ws5s459YKEKssixyb9FcfrdV+cMVtVnmhPmL+Sv6CnYME1YzXcACchdV5u
J6IcIBfbrYbOFclfUeq+t+OzEVE5y+IPelXM6k7FapJBVxxHPPFcCzgvqlcihQ+3
bjRWtGMnHD4RS1824YYF+yMngfgZVA==
=V/Hl
-----END PGP SIGNATURE-----

--Sig_/4fM/HcT99rGbY50sjERxFyz--
