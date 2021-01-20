Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 152442FCB21
	for <lists+linux-next@lfdr.de>; Wed, 20 Jan 2021 07:44:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726437AbhATGkK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 Jan 2021 01:40:10 -0500
Received: from ozlabs.org ([203.11.71.1]:45619 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729693AbhATG1m (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 20 Jan 2021 01:27:42 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DLFt56C4lz9sT6;
        Wed, 20 Jan 2021 17:26:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611124013;
        bh=q7ScrqEJyTCGMm/W/Fijawk2uKth3OWPn+gllUwzPkI=;
        h=Date:From:To:Cc:Subject:From;
        b=YQqxz/wvMiFSmikAC3zg3b8WzC9Rx8aD9HdctlFsfaYmr8UfTC5lngWBO4omFW84J
         /hPe6f7XIEXdiDo2vGQRJd789fWNkCOpGA7a84NmL5fAq3+1/1VNduw5i4IkpxPOUS
         tRDTzKQ8LZxmF6DaHvQHirAfp5a15K2YxTp7f7kTZNs7Xlbq60sfzjtv0CYRHARTXo
         7DPU/gaq/ChYV7iEhL35VoZrNbzybtJlO8PWpNVs9alCpmNSz/zfAVaWUV5uAlPjZn
         k25AUDbDbqPcdABZ4KZLd2pWG2y1YZZ2HQEMUlg6jfre9fos3bXOHH/u842Zhkma7/
         zNeuNXOvmo+IA==
Date:   Wed, 20 Jan 2021 17:26:52 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jan 20
Message-ID: <20210120172652.66e12c25@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lmpZoq+vhIszdQ/f0B02d=x";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/lmpZoq+vhIszdQ/f0B02d=x
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20210119:

The drm tree still had its build failure so I used the version from
next-20210107.

The drm-intel tree still had its build failure from merging the drm tree
and gained another, so I have used the version from next-20210108.

The usb tree gained a conflict against the usb.current tree.

The gpio-brgl tree gained a conflict against the gpio-brgl-fixes tree.

The akpm-current tree gained a build failure for which I applied a
supplied patch.

Non-merge commits (relative to Linus' tree): 4117
 4547 files changed, 157860 insertions(+), 83445 deletions(-)

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

I am currently merging 333 trees (counting Linus' and 86 trees of bug
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
Merging origin/master (1e2a199f6ccd Merge tag 'spi-fix-v5.11-rc4' of git://=
git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging fixes/fixes (e71ba9452f0b Linux 5.11-rc2)
Merging kbuild-current/fixes (0bc9bc1d8b2f Merge tag 'ext4_for_linus_stable=
' of git://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4)
Merging arc-current/for-curr (7c53f6b671f4 Linux 5.11-rc3)
Merging arm-current/fixes (e64ab473ddda ARM: 9034/1: __div64_32(): straight=
en up inline asm constraints)
Merging arm64-fixes/for-next/fixes (3ed86b9a7140 kasan, arm64: fix pointer =
tags in KASAN reports)
Merging arm-soc-fixes/arm/fixes (8a996b2d8a03 ARM: dts: ux500: Reserve memo=
ry carveouts)
Merging drivers-memory-fixes/fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging m68k-current/for-linus (2ae92e8b9b7e MAINTAINERS: Update m68k Mac e=
ntry)
Merging powerpc-fixes/fixes (41131a5e54ae powerpc/vdso: Fix clock_gettime_f=
allback for vdso32)
Merging s390-fixes/fixes (19c329f68089 Linux 5.11-rc4)
Merging sparc/master (0a95a6d1a4cd sparc: use for_each_child_of_node() macr=
o)
Merging fscrypt-current/for-stable (d19d8d345eec fscrypt: fix inline encryp=
tion not used on new files)
Merging net/master (f7b9820dbe16 Merge branch 'sh_eth-fix-reboot-crash')
Merging bpf/master (e23a8d002198 Merge https://git.kernel.org/pub/scm/linux=
/kernel/git/bpf/bpf)
Merging ipsec/master (da64ae2d35d3 xfrm: Fix wraparound in xfrm_policy_addr=
_delta())
Merging netfilter/master (c8a8ead01736 Merge git://git.kernel.org/pub/scm/l=
inux/kernel/git/pablo/nf)
Merging ipvs/master (c8a8ead01736 Merge git://git.kernel.org/pub/scm/linux/=
kernel/git/pablo/nf)
Merging wireless-drivers/master (952de419b617 mt76: mt7663s: fix rx buffer =
refcounting)
Merging mac80211/master (c13cf5c15966 mac80211: check if atf has been disab=
led in __ieee80211_schedule_txq)
Merging rdma-fixes/for-rc (a372173bf314 RDMA/cxgb4: Fix the reported max_re=
cv_sge value)
Merging sound-current/for-linus (2b73649cee65 ALSA: hda: Balance runtime/sy=
stem PM if direct-complete is disabled)
Merging sound-asoc-fixes/for-linus (63e1267254ab Merge remote-tracking bran=
ch 'asoc/for-5.11' into asoc-linus)
Merging regmap-fixes/for-linus (7c53f6b671f4 Linux 5.11-rc3)
Merging regulator-fixes/for-linus (09db7311ca61 Merge v5.11-rc3)
Merging spi-fixes/for-linus (a12e0fb859fc Merge remote-tracking branch 'spi=
/for-5.11' into spi-linus)
Merging pci-current/for-linus (7c53f6b671f4 Linux 5.11-rc3)
Merging driver-core.current/driver-core-linus (895bee270863 Revert "driver =
core: Reorder devices on successful probe")
Merging tty.current/tty-linus (54ca955b5a40 serial: mvebu-uart: fix tx lost=
 characters at power off)
Merging usb.current/usb-linus (ef02684c4e67 usb: bdc: Make bdc pci driver d=
epend on BROKEN)
Merging usb-gadget-fixes/fixes (129aa9734559 usb: raw-gadget: fix memory le=
ak in gadget_setup)
Merging usb-serial-fixes/usb-linus (43377df70480 USB: serial: cp210x: add n=
ew VID/PID for supporting Teraoka AD2000)
Merging usb-chipidea-fixes/for-usb-fixes (491b1bea0004 MAINTAINERS: update =
Peter Chen's email address)
Merging phy/fixes (36acd5e24e30 phy: lantiq: rcu-usb2: wait after clock ena=
ble)
Merging staging.current/staging-linus (a1bfb0ccf94d Merge tag 'iio-fixes-fo=
r-5.11a' of https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio into =
staging-linus)
Merging char-misc.current/char-misc-linus (02039b172327 Merge tag 'misc-hab=
analabs-fixes-2021-01-13' of https://git.kernel.org/pub/scm/linux/kernel/gi=
t/ogabbay/linux into char-misc-linus)
Merging soundwire-fixes/fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging thunderbolt-fixes/fixes (c14556fc0c7c thunderbolt: Drop duplicated =
0x prefix from format string)
Merging input-current/for-linus (5d06f72dc29c Input: ariel-pwrbutton - remo=
ve unused variable ariel_pwrbutton_id_table)
Merging crypto-current/master (382811940303 crypto: omap-sham - Fix link er=
ror without crypto-engine)
Merging ide/master (6800cd8cbc6e ide-acpi: use %*ph to print small buffer)
Merging vfio-fixes/for-linus (e4eccb853664 vfio/pci: Bypass IGD init in cas=
e of -ENODEV)
Merging kselftest-fixes/fixes (7a6eb7c34a78 selftests: Skip BPF seftests by=
 default)
Merging modules-fixes/modules-linus (57baec7b1b04 scripts/nsdeps: make sure=
 to pass all module source files to spatch)
Merging dmaengine-fixes/fixes (e594443196d6 dmaengine: move channel device_=
node deletion to driver)
Merging backlight-fixes/for-backlight-fixes (bbf5c979011a Linux 5.9)
Merging mtd-fixes/mtd/fixes (e708789c4a87 mtd: spinand: Fix MTD_OPS_AUTO_OO=
B requests)
Merging mfd-fixes/for-mfd-fixes (bbf5c979011a Linux 5.9)
Merging v4l-dvb-fixes/fixes (95e9295daa84 media: Revert "media: videobuf2: =
Fix length check for single plane dmabuf queueing")
Merging reset-fixes/reset/fixes (b460e0a9e240 reset: intel: add unspecified=
 HAS_IOMEM dependency)
Merging mips-fixes/mips-fixes (7b490a8ab0f2 MIPS: OCTEON: fix unreachable c=
ode in octeon_irq_init_ciu)
Merging at91-fixes/at91-fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging omap-fixes/fixes (181739822cf6 ARM: dts; gta04: SPI panel chip sele=
ct is active low)
Merging kvm-fixes/master (7c53f6b671f4 Linux 5.11-rc3)
Merging kvms390-fixes/master (735931f9a51a MAINTAINERS: add uv.c also to KV=
M/s390)
Merging hwmon-fixes/hwmon (84e261553e6f hwmon: (amd_energy) fix allocation =
of hwmon_channel_info config)
Merging nvdimm-fixes/libnvdimm-fixes (88b67edd7247 dax: Fix compilation for=
 CONFIG_DAX && !CONFIG_FS_DAX)
Merging btrfs-fixes/next-fixes (471db1e4bc9b Merge branch 'misc-5.11' into =
next-fixes)
Merging vfs-fixes/fixes (d36a1dd9f77a dump_common_audit_data(): fix racy ac=
cesses to ->d_name)
Merging dma-mapping-fixes/for-linus (892fc9f6835e dma-pool: Fix an uninitia=
lized variable bug in atomic_pool_expand())
Merging i3c-fixes/i3c/fixes (291b5c9870fc i3c/master/mipi-i3c-hci: Fix posi=
tion of __maybe_unused in i3c_hci_of_match)
Merging drivers-x86-fixes/fixes (173aac2fef96 platform/x86: thinkpad_acpi: =
Add P53/73 firmware to fan_quirk_table for dual fan control)
Merging samsung-krzk-fixes/fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging pinctrl-samsung-fixes/fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging devicetree-fixes/dt/linus (5c8fe583cce5 Linux 5.11-rc1)
Merging scsi-fixes/fixes (764907293edc scsi: ibmvfc: Set default timeout to=
 avoid crash during migration)
Merging drm-fixes/drm-fixes (c8f6364f35f3 Merge branch '04.00-ampere-lite-f=
ixes' of git://github.com/skeggsb/linux into drm-fixes)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (1c4995b0a576 drm/i915: Only e=
nable DFP 4:4:4->4:2:0 conversion when outputting YCbCr 4:4:4)
Merging mmc-fixes/fixes (b503087445ce mmc: core: don't initialize block siz=
e from ext_csd if not present)
Merging rtc-fixes/rtc-fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging gnss-fixes/gnss-linus (7c53f6b671f4 Linux 5.11-rc3)
Merging hyperv-fixes/hyperv-fixes (fff7b5e6ee63 x86/hyperv: Initialize cloc=
kevents after LAPIC is initialized)
Merging soc-fsl-fixes/fix (2663b3388551 soc: fsl: dpio: Get the cpumask thr=
ough cpumask_of(cpu))
Merging risc-v-fixes/fixes (e557793799c5 RISC-V: Fix maximum allowed phsyic=
al memory for RV32)
Merging pidfd-fixes/fixes (a409ed156a90 Merge tag 'gpio-v5.11-1' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio)
Merging fpga-fixes/fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging spdx/spdx-linus (5c8fe583cce5 Linux 5.11-rc1)
Merging gpio-brgl-fixes/gpio/for-current (298d75c9b188 gpio: tegra: Add mis=
sing dependencies)
Merging gpio-intel-fixes/fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging pinctrl-intel-fixes/fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging erofs-fixes/fixes (a30573b3cdc7 erofs: fix setting up pcluster for =
temporary pages)
Merging integrity-fixes/fixes (843385694721 evm: Fix a small race in init_d=
esc())
Merging kunit-fixes/kunit-fixes (2b8fdbbf1c61 kunit: tool: move kunitconfig=
 parsing into __init__, make it optional)
Merging ubifs-fixes/fixes (78c7d49f55d8 ubifs: journal: Make sure to not di=
rty twice for auth nodes)
Merging memblock-fixes/fixes (32c2bc8f2d85 ia64: fix build failure caused b=
y memory model changes)
Merging drm-misc-fixes/for-linux-next-fixes (abbc4d6ecd07 drm/vram-helper: =
Reuse existing page mappings in vmap)
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
Merging arm64/for-next/core (19c329f68089 Linux 5.11-rc4)
Merging arm-perf/for-next/perf (19c329f68089 Linux 5.11-rc4)
Merging arm-soc/for-next (5297ef205781 soc: document merges)
Merging actions/for-next (a501abf8d8cb Merge branch 'v5.12/soc' into for-ne=
xt)
Merging amlogic/for-next (60f232d3c04a Merge branch 'v5.12/dt64' into tmp/a=
ml-rebuild)
Merging aspeed/for-next (41707a524026 Merge branches 'soc-for-v5.11' and 'd=
efconfig-for-v5.11' into for-next)
Merging at91/at91-next (6bb5d7fe1432 Merge branches 'at91-soc' and 'at91-de=
fconfig' into at91-next)
Merging drivers-memory/for-next (81053f0e95da Merge branch 'for-v5.12/tegra=
-mc' into for-next)
Merging imx-mxs/for-next (5df5ec0e41f3 Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (b2a8f6ce4bdc Merge branch 'for_5.11/drivers-soc' int=
o next)
Merging mediatek/for-next (727bfb2c55b0 Merge branch 'v5.10-next/soc' into =
for-next)
Merging mvebu/for-next (dc14300bb67b Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (792952314166 Merge branch 'omap-for-v5.11/dt' into f=
or-next)
Merging qcom/for-next (da9a0fd2ac14 Merge branches 'arm64-defconfig-for-5.1=
2', 'arm64-for-5.12', 'drivers-for-5.12' and 'dts-for-5.12' into for-next)
Merging raspberrypi/for-next (e10bb7f95cba ARM: dts: bcm2711: Use compatibl=
e string for BCM2711 DSI1)
Merging realtek/for-next (486f29df6941 Merge branch 'v5.8/dt' into next)
Merging renesas/next (b72b30fb341d Merge branch 'renesas-arm-dt-for-v5.12' =
into renesas-next)
Merging reset/reset/next (ac9b7554afeb reset: core: fix a kernel-doc markup)
Merging rockchip/for-next (8ff9cfc48824 Merge branch 'v5.12-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (f9e152f18310 Merge branch 'next/drivers' int=
o for-next)
Merging scmi/for-linux-next (ce9e72832f2b Merge branch 'for-next/scmi' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-li=
nux-next)
Merging stm32/stm32-next (8ba396551d5d ARM: dts: stm32: Disable KS8851 and =
FMC on PicoITX board)
Merging sunxi/sunxi/for-next (ab33b69c3299 Merge branch 'sunxi/drivers-for-=
5.12' into sunxi/for-next)
Merging tegra/for-next (eb46193ad61a Merge branch for-5.12/arm64/defconfig =
into for-next)
Merging ti-k3/ti-k3-next (1e3d655fe7b4 Merge branch 'ti-k3-config-next' int=
o ti-k3-next)
Merging ti-k3-new/ti-k3-next (34f13f0656c0 Merge branch 'ti-k3-dts-next' in=
to ti-k3-next)
Merging clk/clk-next (6370ad6c0e83 Merge branch 'clk-fixes' into clk-next)
Merging clk-renesas/renesas-clk (c706121386fe dt-bindings: clock: renesas: =
rcar-usb2-clock-sel: Add support for RZ/G2 M/N/H)
Merging clk-samsung/for-next (44a9e78f9242 clk: samsung: Prevent potential =
endless loop in the PLL ops)
Merging csky/linux-next (8d1733b612c9 csky: Add VDSO with GENERIC_GETTIMEOF=
DAY, GENERIC_TIME_VSYSCALL, HAVE_GENERIC_VDSO)
Merging h8300/h8300-next (8808515be0ed h8300: Replace <linux/clk-provider.h=
> by <linux/of_clk.h>)
Merging ia64/next (c331649e6371 ia64: Use libata instead of the legacy ide =
driver in defconfigs)
Merging m68k/for-next (2ae92e8b9b7e MAINTAINERS: Update m68k Mac entry)
Merging m68knommu/for-next (7c53f6b671f4 Linux 5.11-rc3)
Merging microblaze/next (57ddf08642f0 microblaze: do not select TRACING_SUP=
PORT directly)
Merging mips/mips-next (d9e84fb1a34e MIPS: relocatable: optimize the reloca=
tion process)
Merging nds32/next (54bde873682b nds32: Fix bogus reference to <asm/procinf=
o.h>)
Merging nios2/for-next (6b57fa4d374b nios2: signal: Mark expected switch fa=
ll-through)
Merging openrisc/for-next (803c72c8547c openrisc: add arch/openrisc/Kbuild)
Merging parisc-hd/for-next (2c85ebc57b3e Linux 5.10)
Merging powerpc/next (e71ba9452f0b Linux 5.11-rc2)
Merging fsl/next (a76bea0287ce powerpc/kmcent2: add ranges to the pci bridg=
es)
Merging soc-fsl/next (e95f287deed2 soc: fsl: handle RCPM errata A-008646 on=
 SoC LS1021A)
Merging risc-v/for-next (f766f77a74f5 riscv/stacktrace: Fix stack output wi=
thout ra on the stack top)
Merging s390/for-next (3a790cc1c9ef s390: pass struct pt_regs instead of re=
gisters to syscalls)
Merging sh/for-next (b89bc060b53e sh/intc: Restore devm_ioremap() alignment)
Merging sparc-next/master (dd0d718152e4 Merge tag 'spi-fix-v5.8-rc2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging uml/linux-next (1fb1abc83636 um: Fix build w/o CONFIG_PM_SLEEP)
Merging xtensa/xtensa-for-next (7b79eba1d0d1 xtensa: fix spelling mistake i=
n Kconfig "wont" -> "won't")
Merging fscrypt/master (a14d0b676491 fscrypt: allow deleting files with uns=
upported encryption policy)
Merging afs/afs-next (8409f67b6437 afs: Adjust the fileserver rotation algo=
rithm to reprobe/retry more quickly)
Merging btrfs/for-next (5be0db194983 Merge branch 'for-next-next-v5.11-2021=
0114' into for-next-20210114)
Merging ceph/master (4972cf605f8a libceph, ceph: disambiguate ceph_connecti=
on_operations handlers)
Merging cifs/for-next (16a78851e1f5 fs/cifs: Simplify bool comparison.)
Merging configfs/for-next (65cdb4a214c0 configfs: fix kernel-doc markup iss=
ue)
Merging ecryptfs/next (8b614cb8f1dc Merge tag '5.6-rc4-smb3-fixes' of git:/=
/git.samba.org/sfrench/cifs-2.6)
Merging erofs/dev (d8b3df8b1048 erofs: avoid using generic_block_bmap)
Merging exfat/dev (4b7bc2c32cba exfat: improve performance of exfat_free_cl=
uster when using dirsync mount option)
Merging ext3/for_next (6309c460a76f Pull lazytime fixes from Eric Biggers)
Merging ext4/dev (e9f53353e166 ext4: remove expensive flush on fast commit)
Merging f2fs/dev (b640eda3ba7e f2fs: introduce checkpoint=3Dmerge mount opt=
ion)
Merging fsverity/fsverity (bde493349025 fs-verity: move structs needed for =
file signing to UAPI header)
Merging fuse/for-next (5d069dbe8aaf fuse: fix bad inode)
Merging jfs/jfs-next (3bef198f1b17 JFS: more checks for invalid superblock)
Merging nfs/linux-next (19c329f68089 Linux 5.11-rc4)
Merging nfs-anna/linux-next (11392155f2bd NFS: Disable READ_PLUS by default)
CONFLICT (content): Merge conflict in fs/nfs/nfs4proc.c
Merging nfsd/nfsd-next (c3213d260a23 SUNRPC: Fix oops in the rpc_xdr_buf ev=
ent class)
Merging cel/for-next (1b4f9164e7b7 nfsd: report per-export stats)
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
Merging vfs/for-next (98583cf6115c Merge branch 'work.audit' into for-next)
CONFLICT (content): Merge conflict in arch/Kconfig
Merging printk/for-next (e103e8f1e0bf Merge branch 'printk-rework' into for=
-next)
Merging pci/next (8f5ab3b46476 Merge branch 'remotes/lorenzo/pci/rcar')
Merging pstore/for-next/pstore (26fecbf7602d pstore: Move kmsg_bytes defaul=
t into Kconfig)
Merging hid/for-next (ab7fcff8a2e2 Merge branch 'for-5.12/i2c-hid' into for=
-next)
CONFLICT (content): Merge conflict in arch/arm64/configs/defconfig
Merging i2c/i2c/for-next (98babb378826 Merge branch 'i2c/for-5.12' into i2c=
/for-next)
Merging i3c/i3c/next (5c8fe583cce5 Linux 5.11-rc1)
Merging dmi/dmi-for-next (3cb4d29a2633 MAINTAINERS: The DMI/SMBIOS tree has=
 moved)
Merging hwmon-staging/hwmon-next (d1f7b079ce5b hwmon: (aspeed-pwm-tacho) Sw=
itch to using the new API kobj_to_dev())
Merging jc_docs/docs-next (52042e2db452 scripts: kernel-doc: validate kerne=
l-doc markup with the actual names)
Merging v4l-dvb/master (321af22a3d2f media: atomisp: convert comma to semic=
olon)
Merging v4l-dvb-next/master (d0a9fffedca1 docs: fs: api-summary.rst: get ri=
d of kernel-doc include)
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_dp_helper.c
CONFLICT (content): Merge conflict in Documentation/dev-tools/kasan.rst
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (a2ab445613e2 Merge branch 'acpica' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (3657f729b6fb cpufreq: brcmstb-a=
vs-cpufreq: Fix resource leaks in ->remove())
Merging cpupower/cpupower (fb7791e213a6 cpupower: add Makefile dependencies=
 for install targets)
Merging devfreq/devfreq-next (ec894883de53 PM / devfreq: Replace devfreq->d=
ev.parent as dev in devfreq_add_device)
Merging opp/opp/linux-next (302c014726db opp: Prepare for ->set_opp() helpe=
r to work without regulators)
Merging thermal/thermal/linux-next (7a583405f24b thermal: power allocator: =
fail binding for non-power actor devices)
Merging thermal-rzhang/next (54ecb8f7028c Linux 5.4-rc1)
Merging thermal-soc/next (6c375eccded4 thermal: db8500: Rewrite to be a pur=
e OF sensor)
Merging ieee1394/for-next (67f8e65e4fc1 firewire: net: remove set but not u=
sed variable 'guid')
Merging dlm/next (4f19d071f9be fs: dlm: check on existing node address)
Merging swiotlb/linux-next (e998879d4fb7 x86,swiotlb: Adjust SWIOTLB bounce=
 buffer size for SEV guests)
Merging rdma/for-next (7fbc3c373eef RDMA/rtrs: Fix KASAN: stack-out-of-boun=
ds bug)
Merging net-next/master (7eab14de73a8 mdio, phy: fix -Wshadow warnings trig=
gered by nested container_of())
Merging bpf-next/for-next (8edc0c67d09d Merge branch 'Allow attaching to ba=
re tracepoints')
Merging ipsec-next/master (18f976960bca xfrm: interface: enable TSO on xfrm=
 interfaces)
Merging mlx5-next/mlx5-next (ab0da5a57188 net/mlx5: Expose ifc bits for que=
ry modify header)
Merging netfilter-next/master (09b5b5fb3902 ppp: clean up endianness conver=
sions)
Merging ipvs-next/master (09b5b5fb3902 ppp: clean up endianness conversions)
Merging wireless-drivers-next/master (07ceefa3012f wlcore: Downgrade exceed=
ed max RX BA sessions to debug)
Merging bluetooth/master (ad3a9c0ec2d2 Bluetooth: hci_qca: Wait for SSR com=
pletion during suspend)
Merging mac80211-next/master (0ae5b43d6dde tcp: assign skb hash after tcp_e=
vent_data_sent)
Merging gfs2/for-next (6c7c04f7bc18 gfs2: Fix invalid block size message)
Merging mtd/mtd/next (341e4faf9cad mtd: remove redundant assignment to poin=
ter eb)
Merging nand/nand/next (89f34274ff2f mtd: st_spi_fsm: convert comma to semi=
colon)
Merging spi-nor/spi-nor/next (19c329f68089 Linux 5.11-rc4)
Merging crypto/master (e2811196fbe0 crypto: keembay-ocs-hcu - Add dependenc=
y on HAS_IOMEM and ARCH_KEEMBAY)
Merging drm/drm-next (1777b185f5cc Merge tag 'imx-drm-next-2021-01-08' of g=
it://git.pengutronix.de/git/pza/linux into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_pmu.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gt/intel_lrc.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gt/intel_breadcr=
umbs.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_dp=
.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/amdgpu_dm=
/amdgpu_dm_crc.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/amdgpu_dm=
/amdgpu_dm.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/amdgpu_dm=
/amdgpu_dm.c
$ git reset --hard HEAD^
Merging next-20210107 version of drm
Merging amdgpu/drm-next (4db0a05c28de ALSA: hda/hdmi - enable runtime pm fo=
r CI AMD display audio)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/amdgpu_dm=
/amdgpu_dm_mst_types.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/amdgpu_dm=
/amdgpu_dm.h
Merging drm-intel/for-linux-next (7c553f8b5a7d drm/dp: Revert "drm/dp: Intr=
oduce EDID-based quirks")
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_pmu.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gt/intel_lrc.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gt/intel_breadcr=
umbs.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_pa=
nel.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_dp=
.c
$ git reset --hard HEAD^
Merging next-20210108 version of drm-intel
Merging drm-tegra/drm/tegra/for-next (dcdfe2712b68 drm/tegra: Fix reference=
 leak when pm_runtime_get_sync() fails)
Merging drm-misc/for-linux-next (d14413946f42 drm/vmwgfx/ttm_object: Reorde=
r header to immediately precede its struct)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_dp=
.c
Merging drm-msm/msm-next (00fd44a1a470 drm/msm: Only enable A6xx LLCC code =
on A6xx)
Merging imx-drm/imx-drm/next (82581fcf070b drm/modes: add non-OF stub for o=
f_get_drm_display_mode)
Merging etnaviv/etnaviv/next (4612bad5701e drm/etnaviv: Add lockdep annotat=
ions for context lock)
Merging regmap/for-next (7c53f6b671f4 Linux 5.11-rc3)
Merging sound/for-next (b952ac76a20b ALSA: usb-audio: Add support for Pione=
er DJM-750)
Merging sound-asoc/for-next (f2a53be5ab2f Merge remote-tracking branch 'aso=
c/for-5.12' into asoc-next)
Merging modules/modules-next (ec2a29593c83 module: harden ELF info handling)
Merging input/next (2f6aa61d87e7 Input: omap4-keypad - implement errata che=
ck for lost key-up events)
Merging block/for-next (a9f7c7a1f408 Merge branch 'for-5.12/io_uring' into =
for-next)
Merging device-mapper/for-next (c87a95dc28b1 dm crypt: defer decryption to =
a tasklet if interrupts disabled)
Merging pcmcia/pcmcia-next (4ce6b242b78d pcmcia: Switch to using the new AP=
I kobj_to_dev())
Merging mmc/next (f2134ac9905b dt-bindings: mmc: sdhci-am654: fix compatibl=
e for j7200)
Merging mfd/for-mfd-next (d0e648f2186a mfd: intel-lpss: Add Intel Alder Lak=
e PCH-P PCI IDs)
Merging backlight/for-backlight-next (789eb04b6c56 backlight: pwm_bl: Fix i=
nterpolation)
Merging battery/for-next (a4bdea2004b2 power: supply: fix sbs-charger build=
, needs REGMAP_I2C)
Merging regulator/for-next (248582aa58b2 Merge remote-tracking branch 'regu=
lator/for-5.12' into regulator-next)
Merging security/next-testing (9dcd47fc1f7d Merge branch 'fixes-v5.10' into=
 next-testing)
Merging apparmor/apparmor-next (e37986097ba6 apparmor: Use true and false f=
or bool variable)
Merging integrity/next-integrity (207cdd565dfc ima: Don't modify file descr=
iptor mode on the fly)
Merging keys/keys-next (52db910f6fdf certs: Replace K{U,G}IDT_INIT() with G=
LOBAL_ROOT_{U,G}ID)
Merging safesetid/safesetid-next (03ca0ec13892 LSM: SafeSetID: Fix warnings=
 reported by test bot)
Merging selinux/next (365982aba1f2 fs: anon_inodes: rephrase to appropriate=
 kernel-doc)
Merging smack/next (9b0072e2b2b5 security/smack: remove unused varible 'rc')
Merging tomoyo/master (dea8dcf2a9fa Merge tag 'for-5.11/dm-fix' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm)
Merging tpmdd/next (262fafe138e8 keys: Update comment for restrict_link_by_=
key_or_keyring_chain)
Merging watchdog/master (7c53f6b671f4 Linux 5.11-rc3)
Merging iommu/next (4dd6ce478003 iommu: Fix a check in iommu_check_bind_dat=
a())
Merging audit/next (c1de44631eb5 audit: Remove leftover reference to the au=
dit_tasklet)
Merging devicetree/for-next (8a5a75e5e9e5 of/fdt: Make sure no-map does not=
 remove already reserved regions)
Merging mailbox/mailbox-for-next (5a6338cce9f4 mailbox: arm_mhuv2: Add driv=
er)
Merging spi/for-next (246f4bfa2b97 Merge remote-tracking branch 'spi/for-5.=
12' into spi-next)
Merging tip/auto-latest (a518bfa05b6f Merge branch 'objtool/core')
Merging clockevents/timers/drivers/next (8ae954caf49a clocksource/drivers/s=
h_cmt: Fix potential deadlock when calling runtime PM)
Merging edac/edac-for-next (83c0cf46675f Merge branch 'edac-misc' into edac=
-for-next)
Merging irqchip/irq/irqchip-next (599b3063adf4 irqchip/mips-cpu: Set IPI do=
main parent chip)
Merging ftrace/for-next (f6a694665f13 tracing: Offload eval map updates to =
a work queue)
Merging rcu/rcu/next (f81f6edb74f2 rcu: Remove spurious instrumentation_end=
() in rcu_nmi_enter())
Merging kvm/next (7c53f6b671f4 Linux 5.11-rc3)
Merging kvm-arm/next (7ba8b4380afb KVM: arm64: Use the reg_to_encoding() ma=
cro instead of sys_reg())
Merging kvm-ppc/kvm-ppc-next (dc924b062488 KVM: SVM: check CR4 changes agai=
nst vcpu->arch)
Merging kvms390/next (50a05be484cb KVM: s390: track synchronous pfault even=
ts in kvm_stat)
Merging xen-tip/linux-next (bd9dcef67ffc x86/xen: fix 'nopvspin' build erro=
r)
Merging percpu/for-next (7dd3050a0194 Merge branch 'for-5.12' into for-next)
Merging workqueues/for-next (7bf9c4a88e3e workqueue: tracing the name of th=
e workqueue instead of it's address)
Merging drivers-x86/for-next (0627cc334d40 sony-laptop: Remove unneeded sem=
icolon)
Merging chrome-platform/for-next (6ae9b5ffcaeb platform/chrome: cros_ec_typ=
ec: Tolerate unrecognized mux flags)
Merging hsi/for-next (aa57e77b3d28 HSI: Fix PM usage counter unbalance in s=
si_hw_init)
Merging leds/for-next (9a5ad5c5b2d2 leds: trigger: fix potential deadlock w=
ith libata)
Merging ipmi/for-next (dea8dcf2a9fa Merge tag 'for-5.11/dm-fix' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm)
Merging driver-core/driver-core-next (3ac6e56c325e Revert "drivers: core: D=
etach device from power domain on shutdown")
Merging usb/usb-next (d70f7598c458 usb: gadget: u_audio: clean up locking)
CONFLICT (content): Merge conflict in drivers/usb/gadget/udc/bdc/Kconfig
Merging usb-gadget/next (b2c586eb07ef usb: dwc2: Fix INTR OUT transfers in =
DDMA mode.)
Merging usb-serial/usb-next (cfb0fde7a7fa USB: serial: f81534: drop short c=
ontrol-transfer check)
Merging usb-chipidea-next/for-usb-next (9fd53a5bd129 usb: cdnsp: fixes unde=
fined reference to cdns_remove)
Merging phy-next/next (71edb0b4fa0e dt-bindings: phy: qcom-qusb2: Document =
SDM660 compatible)
Merging tty/tty-next (429b29aef7f8 tty: serial: Drop unused efm32 serial dr=
iver)
Merging char-misc/char-misc-next (20612d2428c3 fpga: dfl-pci: rectify ReST =
formatting)
CONFLICT (content): Merge conflict in scripts/mod/file2alias.c
CONFLICT (content): Merge conflict in scripts/mod/devicetable-offsets.c
CONFLICT (content): Merge conflict in include/linux/mod_devicetable.h
Merging extcon/extcon-next (226d336c1c75 extcon: max8997: Add CHGINS and CH=
GRM interrupt handling)
Merging soundwire/next (9a0c798c7a98 soundwire: cadence: adjust verbosity i=
n response handling)
Merging thunderbolt/next (3da88be24997 thunderbolt: Add support for de-auth=
orizing devices)
Merging vfio/next (bdfae1c9a913 vfio/type1: Add vfio_group_iommu_domain())
Merging staging/staging-next (3dba1da360da Merge 5.11-rc3 into staging-next)
Merging mux/for-next (3516bd729358 Merge tag 's390-5.11-3' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/s390/linux)
Merging icc/icc-next (23145465c5b0 Merge branch 'icc-msm8939' into icc-next)
Merging dmaengine/next (c06e424be5f5 dmaengine: idxd: set DMA channel to be=
 private)
Merging cgroup/for-next (00bfa16052cd Merge branch 'for-5.11-fixes' into fo=
r-next)
Merging scsi/for-next (a7ed11fc0b72 Merge branch 'fixes' into for-next)
Merging scsi-mkp/for-next (7f3a79a7fd51 scsi: lpfc: Add support for eh_shou=
ld_retry_cmd())
CONFLICT (content): Merge conflict in drivers/scsi/ufs/ufshcd.c
Merging vhost/linux-next (e13a6915a03f vhost/vsock: add IOTLB API support)
Merging rpmsg/for-next (7cb4f293777e Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (7ac554888233 MAINTAINERS: Remove reference to non-ex=
isting file)
Merging gpio-brgl/gpio/for-next (355ef6bb005f gpio: tegra: Add dependency o=
n GPIOLIB_IRQCHIP)
CONFLICT (content): Merge conflict in drivers/gpio/Kconfig
Merging gpio-intel/for-next (2a8a3f09d9b1 gpio: wcove: convert comma to sem=
icolon)
Merging pinctrl/for-next (f205fa436042 Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (0e793a4e2834 pinctrl: tigerlake: Add Alder =
Lake-P ACPI ID)
Merging pinctrl-renesas/renesas-pinctrl (a5cda861ed57 pinctrl: renesas: r8a=
779a0: Add TPU pins, groups and functions)
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
Merging rtc/rtc-next (12b1ef321a73 rtc: tps65910: remove tps65910_rtc_ops_n=
oirq)
Merging nvdimm/libnvdimm-for-next (127c3d2e7e8a Merge branch 'for-5.11/dax'=
 into for-5.11/libnvdimm)
Merging at24/at24/for-next (5c8fe583cce5 Linux 5.11-rc1)
Merging ntb/ntb-next (5c8fe583cce5 Linux 5.11-rc1)
Merging seccomp/for-next/seccomp (2c07343abd89 selftests/seccomp: Update ke=
rnel config)
Merging kspp/for-next/kspp (112b6a8e038d arm64: allow LTO to be selected)
CONFLICT (content): Merge conflict in include/asm-generic/vmlinux.lds.h
Merging gnss/gnss-next (45d5996e034c gnss: drop stray semicolons)
Merging fsi/next (4a851d714ead fsi: aspeed: Support CFAM reset GPIO)
Merging slimbus/for-next (5c8fe583cce5 Linux 5.11-rc1)
Merging nvmem/for-next (2bf4fd065384 nvmem: Add driver to expose reserved m=
emory as nvmem)
Merging xarray/main (80c1dbebf308 XArray: Fix splitting to non-zero orders)
Merging hyperv/hyperv-next (aa7fb666092d Drivers: hv: vmbus: Add /sys/bus/v=
mbus/hibernation)
Merging auxdisplay/auxdisplay (351dcacc6d77 auxdisplay: panel: Remove redun=
dant charlcd_ops structures)
Merging kgdb/kgdb/for-next (d081a6e35316 kdb: Fix pager search for multi-li=
ne strings)
Merging pidfd/for-next (cb5021ca622f kthread: remove comments about old _do=
_fork() helper)
Merging hmm/hmm (3650b228f83a Linux 5.10-rc1)
Merging fpga/for-next (e41d4c011706 fpga: dfl: fme: Constify static attribu=
te_group structs)
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
Merging memblock/for-next (097d43d85704 mm: memblock: remove return value o=
f memblock_free_all())
Merging init/init-user-pointers (38b082236e77 initramfs: use vfs_utimes in =
do_copy)
Merging counters/counters (e71ba9452f0b Linux 5.11-rc2)
Merging iomem-mmap-vs-gup/topic/iomem-mmap-vs-gup (74b30195395c sysfs: Supp=
ort zapping of binary attr mmaps)
Merging oprofile-removal/oprofile/removal (bae6ac7b1c6a fs: Remove dcookies=
 support)
Merging akpm-current/current (51346d25dd3e initramfs-panic-with-memory-info=
rmation-fix)
Applying: mm/memory_hotplug: fix for CONFIG_ZONE_DEVICE not enabled
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
Merging akpm/master (dc3c00fdf97c secretmem-test-add-basic-selftest-for-mem=
fd_secret2-fix)

--Sig_/lmpZoq+vhIszdQ/f0B02d=x
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAHzSwACgkQAVBC80lX
0GwePwf/f4VQirJcZz6hg59xfj6tvCvpxekGNC8M+Y4lk4wx78nsMfAHnKjSD2NZ
GM5FI7YqJQ0DiyXp6zbfHIwwL43HAmeaovJbP9GtWz3hUR/GCGnpBiQ1tQMLlxJW
u7yS6tALsvVExBTXKnIs47+sI8JGyjdQxoOa9cp4r1W8jjL6oEtJSXQY32xnMpmP
W3IqJZ5VeLVGBBUv+Xp8yS6zWjzthyOk3/wOEfnt4FblWrQsIrqzlIXwap1zYO0/
tXedbx3pPbmHYvbD9Uf2za6tpg29hgqhzmj3PJNE3emEO6uLh0JNW9En8RIWr5GP
WtPx859/8BzSRl9FUQ4BmisCq3m13w==
=E/NC
-----END PGP SIGNATURE-----

--Sig_/lmpZoq+vhIszdQ/f0B02d=x--
