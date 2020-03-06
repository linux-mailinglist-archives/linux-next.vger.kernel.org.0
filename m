Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 835E617B6FE
	for <lists+linux-next@lfdr.de>; Fri,  6 Mar 2020 07:48:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725869AbgCFGsL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 6 Mar 2020 01:48:11 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:56725 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725927AbgCFGsK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 6 Mar 2020 01:48:10 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48YdVD63P0z9sPK;
        Fri,  6 Mar 2020 17:48:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1583477284;
        bh=eAREpmyLi4GE32pRPHo1nrCCK4kzWxnnRhOJj3EIUzM=;
        h=Date:From:To:Cc:Subject:From;
        b=dMaaHuCFLXlg09YT8U47ttLU/IuS8unLh5+kZu8U5egLbAsr5L9QqvdJjU7gcmqQA
         kACUPX8vgtqRfFSu5hjMUKYMR4OuLKrS3CCYgdgi45nvNg0R+Lu6Jr72JcG9nQLOPi
         dqKjez51S/dk35bNU4zAZsAim6olt+Kxuq4NAkvT0xJO2q5mCz6bN9+ois206zGDAb
         hgrlYYxa6WMwkkvaiqDeOVt55pT93rR3n2HpgGLMQgyP5j4p/5/pp6HGJG68tLQ730
         AVQmp0kYIkjsuTUA7DcunbAuTQXYvPr5e7Eh+9dBVn4JPHn1To9H2hWsQNVPbUyET1
         1wGBuBVsjdoSA==
Date:   Fri, 6 Mar 2020 17:48:04 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Mar 6
Message-ID: <20200306174804.170bffaf@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/oq6n2bk8EmHiHC5i_VRfdbw";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/oq6n2bk8EmHiHC5i_VRfdbw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20200305:

The net-next tree gained a conflict against the powerpc tree.

The akpm tree gained conflicts against the powerpc tree.

Non-merge commits (relative to Linus' tree): 6074
 5716 files changed, 223246 insertions(+), 119202 deletions(-)

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

I am currently merging 314 trees (counting Linus' and 78 trees of bug
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
Merging origin/master (9f65ed5fe41c Merge tag 'hyperv-fixes-signed' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux)
Merging fixes/master (eb239a5f369f evh_bytechan: fix out of bounds accesses)
Merging kbuild-current/fixes (98d54f81e36b Linux 5.6-rc4)
Merging arc-current/for-curr (3b00b042eeaa ARC: Replace <linux/clk-provider=
.h> by <linux/of_clk.h>)
Merging arm-current/fixes (89604523a76e ARM: 8961/2: Fix Kbuild issue cause=
d by per-task stack protector GCC plugin)
Merging arm-soc-fixes/arm/fixes (d4d89e25fc7b Merge tag 'socfpga_defconfig_=
fix_for_v5.6' of git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/lin=
ux into arm/fixes)
Merging arm64-fixes/for-next/fixes (9abd515a6e4a arm64: context: Fix ASID l=
imit in boot messages)
Merging m68k-current/for-linus (6aabc1facdb2 m68k: Implement copy_thread_tl=
s())
Merging powerpc-fixes/fixes (59bee45b9712 powerpc/mm: Fix missing KUAP disa=
ble in flush_coherent_icache())
Merging s390-fixes/fixes (df057c914a9c s390/pci: Fix unexpected write combi=
ne on resource)
Merging sparc/master (11648b8339f8 sparc64: fix adjtimex regression)
Merging fscrypt-current/for-stable (ae64f9bd1d36 Linux 4.15-rc2)
Merging net/master (110a40dfb708 slip: make slhc_compress() more robust aga=
inst malicious packets)
Merging bpf/master (52e7c083b417 mailmap: Update email address)
Merging ipsec/master (edf0d283d988 ipv6: xfrm6_tunnel.c: Use built-in RCU l=
ist checking)
Merging netfilter/master (88a637719a15 netfilter: nft_tunnel: add missing a=
ttribute validation for tunnels)
Merging ipvs/master (c24b75e0f923 ipvs: move old_secure_tcp into struct net=
ns_ipvs)
Merging wireless-drivers/master (b102f0c522cf mt76: fix array overflow on r=
eceiving too many fragments for a packet)
Merging mac80211/master (3614d05b5e6b Merge tag 'mac80211-for-net-2020-02-2=
4' of git://git.kernel.org/pub/scm/linux/kernel/git/jberg/mac80211)
Merging rdma-fixes/for-rc (817a68a6584a IB/hfi1, qib: Ensure RCU is locked =
when accessing list)
Merging sound-current/for-linus (8b33a134a9cc ALSA: hda/realtek - Enable th=
e headset of ASUS B9450FA with ALC294)
Merging sound-asoc-fixes/for-linus (667bc2270850 Merge branch 'asoc-5.6' in=
to asoc-linus)
Merging regmap-fixes/for-linus (d29456d34def Merge branch 'regmap-5.6' into=
 regmap-linus)
Merging regulator-fixes/for-linus (2339289c9c69 Merge branch 'regulator-5.6=
' into regulator-linus)
Merging spi-fixes/for-linus (5b289b22eedc Merge branch 'spi-5.6' into spi-l=
inus)
Merging pci-current/for-linus (5901b51f3e5d MAINTAINERS: Correct Cadence PC=
I driver path)
Merging driver-core.current/driver-core-linus (77036165d8bc driver core: Sk=
ip unnecessary work when device doesn't have sync_state())
Merging tty.current/tty-linus (b85c82108335 MAINTAINERS: Add missed files r=
elated to Synopsys DesignWare UART)
Merging usb.current/usb-linus (19f3c1e98bd1 Merge tag 'phy-for-5.6-rc_v2' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/kishon/linux-phy into usb-l=
inus)
Merging usb-gadget-fixes/fixes (42cd5ffe46c1 usb: dwc3: debug: fix string p=
osition formatting mixup with ret and len)
Merging usb-serial-fixes/usb-linus (f8788d86ab28 Linux 5.6-rc3)
Merging usb-chipidea-fixes/ci-for-usb-stable (16009db47c51 usb: chipidea: u=
dc: workaround for endpoint conflict issue)
Merging phy/fixes (be4e3c737eeb phy: mapphone-mdm6600: Fix timeouts by addi=
ng wake-up handling)
Merging staging.current/staging-linus (f8788d86ab28 Linux 5.6-rc3)
Merging char-misc.current/char-misc-linus (f0fe2c0f050d binder: prevent UAF=
 for binderfs devices II)
Merging soundwire-fixes/fixes (bb6d3fb354c5 Linux 5.6-rc1)
Merging thunderbolt-fixes/fixes (e9d0e7511fda thunderbolt: Fix error code i=
n tb_port_is_width_supported())
Merging input-current/for-linus (3dbae1553897 Input: cyapa - replace zero-l=
ength array with flexible-array member)
Merging crypto-current/master (c9cc0517bba9 crypto: chacha20poly1305 - prev=
ent integer overflow on large input)
Merging ide/master (94f2630b1897 Merge tag '5.6-rc-small-smb3-fix-for-stabl=
e' of git://git.samba.org/sfrench/cifs-2.6)
Merging vfio-fixes/for-linus (95f89e090618 vfio/type1: Initialize resv_msi_=
base)
Merging kselftest-fixes/fixes (f3a60268f5ce selftest/lkdtm: Use local .giti=
gnore)
Merging modules-fixes/modules-linus (57baec7b1b04 scripts/nsdeps: make sure=
 to pass all module source files to spatch)
Merging slave-dma-fixes/fixes (25962e1a7f1d dmaengine: imx-sdma: Fix the ev=
ent id check to include RX event for UART6)
Merging backlight-fixes/for-backlight-fixes (219d54332a09 Linux 5.4)
Merging mtd-fixes/mtd/fixes (def9d2780727 Linux 5.5-rc7)
Merging mfd-fixes/for-mfd-fixes (603d9299da32 mfd: mt6397: Fix probe after =
changing mt6397-core)
Merging v4l-dvb-fixes/fixes (d171c45da874 media: hantro: Fix broken media c=
ontroller links)
Merging reset-fixes/reset/fixes (b460e0a9e240 reset: intel: add unspecified=
 HAS_IOMEM dependency)
Merging mips-fixes/mips-fixes (8e029eb0bcd6 MIPS: Fix CONFIG_MIPS_CMDLINE_D=
TB_EXTEND handling)
Merging at91-fixes/at91-fixes (54ecb8f7028c Linux 5.4-rc1)
Merging omap-fixes/fixes (b46b2b7ba6e1 ARM: dts: Fix dm814x Ethernet by cha=
nging to use rgmii-id mode)
Merging kvm-fixes/master (d718fdc3e752 KVM: x86: remove stale comment from =
struct x86_emulate_ctxt)
Merging kvms390-fixes/master (5ef8acbdd687 KVM: nVMX: Emulate MTF when perf=
orming instruction emulation)
Merging hwmon-fixes/hwmon (44f2f882909f hwmon: (adt7462) Fix an error retur=
n in ADT7462_REG_VOLT())
Merging nvdimm-fixes/libnvdimm-fixes (96222d53842d dax: pass NOWAIT flag to=
 iomap_apply)
Merging btrfs-fixes/next-fixes (5db834fa2a2b Merge branch 'misc-5.6' into n=
ext-fixes)
Merging vfs-fixes/fixes (bf4498ad3f9a tmpfs: deny and force are not huge mo=
unt options)
Merging dma-mapping-fixes/for-linus (9c24eaf81cc4 iommu/vt-d: Return the co=
rrect dma mask when we are bypassing the IOMMU)
Merging i3c-fixes/master (6fbc7275c7a9 Linux 5.2-rc7)
Merging drivers-x86-fixes/fixes (f8788d86ab28 Linux 5.6-rc3)
Merging samsung-krzk-fixes/fixes (bb6d3fb354c5 Linux 5.6-rc1)
Merging pinctrl-samsung-fixes/pinctrl-fixes (bb6d3fb354c5 Linux 5.6-rc1)
Merging devicetree-fixes/dt/linus (6198adeaf215 MAINTAINERS: update ALLWINN=
ER CPUFREQ DRIVER entry)
Merging scsi-fixes/fixes (03264ddde245 scsi: compat_ioctl: cdrom: Replace .=
ioctl with .compat_ioctl in four appropriate places)
Merging drm-fixes/drm-fixes (70b8ea1ab1d3 Merge tag 'mediatek-drm-fixes-5.6=
' of https://github.com/ckhu-mediatek/linux.git-tags into drm-fixes)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (169c0aa4bc17 drm/i915/gt: Dro=
p the timeline->mutex as we wait for retirement)
Merging mmc-fixes/fixes (31e43f31890c mmc: sdhci-pci-gli: Enable MSI interr=
upt for GL975x)
Merging rtc-fixes/rtc-fixes (bb6d3fb354c5 Linux 5.6-rc1)
Merging gnss-fixes/gnss-linus (f8788d86ab28 Linux 5.6-rc3)
Merging hyperv-fixes/hyperv-fixes (c1088d6c08fd HID: hyperv: NULL check bef=
ore some freeing functions is not needed.)
Merging soc-fsl-fixes/fix (5674a92ca4b7 soc/fsl/qe: Fix an error code in qe=
_pin_request())
Merging risc-v-fixes/fixes (0a91330b2af9 riscv: dts: Add GPIO reboot method=
 to HiFive Unleashed DTS file)
Merging pidfd-fixes/fixes (186e28a18aeb selftests: pidfd: Add pidfd_fdinfo_=
test in .gitignore)
Merging fpga-fixes/fixes (dec43da46f63 fpga: altera-ps-spi: Fix getting of =
optional confd gpio)
Merging spdx/spdx-linus (bb6d3fb354c5 Linux 5.6-rc1)
Merging gpio-intel-fixes/fixes (bb6d3fb354c5 Linux 5.6-rc1)
Merging pinctrl-intel-fixes/fixes (bb6d3fb354c5 Linux 5.6-rc1)
Merging erofs-fixes/fixes (d1eef1c61974 Linux 5.5-rc2)
Merging drm-misc-fixes/for-linux-next-fixes (e8dca30f7118 drm/bridge: dw-hd=
mi: fix AVI frame colorimetry)
Merging kspp-gustavo/for-next/kspp (d5180902be1c firmware: google: vpd: Rep=
lace zero-length array with flexible-array member)
Merging kbuild/for-next (d3a596779559 kbuild: Fix inconsistent comment)
Merging compiler-attributes/compiler-attributes (54ecb8f7028c Linux 5.4-rc1)
Merging leaks/leaks-next (9e98c678c2d6 Linux 5.1-rc1)
Merging dma-mapping/for-next (89bb6e2ac940 ARM/dma-mapping: merge __dma_sup=
ported into arm_dma_supported)
Merging asm-generic/master (060dc911501f nds32: fix build failure caused by=
 page table folding updates)
Merging arc/for-next (def9d2780727 Linux 5.5-rc7)
Merging arm/for-next (c0cf33e910fe Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm64/for-next/core (09a4d4c88c6e Merge branches 'for-next/memory-h=
otremove', 'for-next/arm_sdei' and 'for-next/misc' into for-next/core)
Merging arm-perf/for-next/perf (29cc4ceeac12 arm64: perf: Support new DT co=
mpatibles)
Merging arm-soc/for-next (09e7f9a4c8e2 Merge branch 'arm/fixes' into for-ne=
xt)
Merging amlogic/for-next (80e3ca9ddabf Merge branch 'v5.7/drivers' into tmp=
/aml-rebuild)
Merging aspeed/for-next (de285b938cf3 ARM: dts: aspeed: ast2600: Fix SCU IR=
Q controller nodes)
Merging at91/at91-next (e9c02c092dc5 Merge branches 'at91-soc', 'at91-dt' a=
nd 'at91-defconfig' into at91-next)
Merging imx-mxs/for-next (48b4bfe7105f Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (a1766a49fc90 Merge tag 'drivers_soc_for_5.6' into ne=
xt)
Merging mediatek/for-next (28f0b8961045 Merge branch 'v5.6-next/soc' into f=
or-next)
Merging mvebu/for-next (c0d03b53ef47 Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (a3ae5449fcf3 Merge branch 'omap-for-v5.7/omap1' into=
 for-next)
Merging qcom/for-next (21b265038f22 Merge branches 'arm64-for-5.7', 'arm64-=
defconfig-for-5.7', 'defconfig-for-5.7', 'drivers-for-5.7' and 'dts-for-5.7=
' into for-next)
Merging raspberrypi/for-next (ec3d259408ce ARM: bcm2835_defconfig: add supp=
ort for Raspberry Pi4)
Merging realtek/for-next (45698e00d5a9 Merge branch 'v5.6/dt' into next)
Merging renesas/next (ddd8444ef822 Merge branch 'renesas-arm-dt-for-v5.7' i=
nto renesas-next)
Merging reset/reset/next (04684708ce01 reset: imx7: Add support for i.MX8MP=
 SoC)
Merging rockchip/for-next (e815aa4ec694 Merge branch 'v5.7-armsoc/soc' into=
 for-next)
Merging samsung-krzk/for-next (2c3956ea5f5a Merge branch 'next/dt' into for=
-next)
Merging scmi/for-linux-next (6143a33281e2 Merge branch 'for-next/scmi' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-li=
nux-next)
Merging sunxi/sunxi/for-next (8944fe117069 Merge branch 'sunxi/dt-for-5.7' =
into sunxi/for-next)
Merging tegra/for-next (56568eebf45e Merge branch for-5.7/arm64/dt into for=
-next)
Merging clk/clk-next (7c45519cbf92 Merge branch 'clk-phase-errors' into clk=
-next)
Merging clk-samsung/for-next (54ecb8f7028c Linux 5.4-rc1)
Merging c6x/for-linux-next (8adcc59974b8 Merge branch 'work.misc' of git://=
git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging csky/linux-next (f8f35a5806f3 csky: Fixup init_fpu compile warning =
with __init)
Merging h8300/h8300-next (a5de8865cb3e h8300: move definition of __kernel_s=
ize_t etc. to posix_types.h)
Merging ia64/next (240b62d381fe ia64: remove stale paravirt leftovers)
Merging m68k/for-next (dff527e7a0a8 m68k: Switch to asm-generic/hardirq.h)
Merging m68knommu/for-next (ebff58339d77 m68k: Replace setup_irq() by reque=
st_irq())
Merging microblaze/next (519fa60b6007 microblaze: Use asm generic cmpxchg.h=
 for !SMP case)
Merging mips/mips-next (bea176fb39ec MIPS: reduce print level for cache inf=
ormation)
Merging nds32/next (d785c5a324cd nds32: configs: Cleanup CONFIG_CROSS_COMPI=
LE)
Merging nios2/for-next (051d75d3bb31 MAINTAINERS: Update Ley Foon Tan's ema=
il address)
Merging openrisc/for-next (d95b56c77efd openrisc: Cleanup copy_thread_tls d=
ocs and comments)
Merging parisc-hd/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging powerpc/next (247257b03b04 powerpc/numa: Remove late request for ho=
me node associativity)
Merging fsl/next (a76bea0287ce powerpc/kmcent2: add ranges to the pci bridg=
es)
Merging soc-fsl/next (6a7f10c79574 soc: fsl: dpio: fix dereference of point=
er p before null check)
Merging risc-v/for-next (abc71bf0a703 RISC-V: Stop using LOCAL for the uacc=
ess fixups)
Merging sifive/for-next (467e050e9760 Merge branch 'i2c/for-current' of git=
://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux)
Merging s390/features (5e674c308bab MAINTAINERS: Update s390/pci maintainer)
Merging sh/sh-next (a193018e5290 sh: add missing EXPORT_SYMBOL() for __dela=
y)
Merging sparc-next/master (b71acb0e3721 Merge branch 'linus' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6)
Merging uml/linux-next (d65197ad5249 um: Fix time-travel=3Dinf-cpu with xor=
/raid6)
Merging xtensa/xtensa-for-next (4aac2d8281e8 Merge branch 'xtensa-5.6-fixes=
' into xtensa-for-next)
Merging fscrypt/master (edc440e3d27f fscrypt: improve format of no-key name=
s)
Merging afs/afs-next (4fe171bb81b1 afs: Remove set but not used variable 'r=
et')
Merging btrfs/for-next (5a0a38f59535 Merge branch 'for-next-next-v5.6-20200=
228' into for-next-20200228)
Merging ceph/master (3b20bc2fe4c0 ceph: noacl mount option is effectively i=
gnored)
Merging cifs/for-next (ff6b61886d76 CIFS: Warn less noisily on default moun=
t)
Merging configfs/for-next (e2f238f7d5a1 configfs: calculate the depth of pa=
rent item)
Merging ecryptfs/next (8b614cb8f1dc Merge tag '5.6-rc4-smb3-fixes' of git:/=
/git.samba.org/sfrench/cifs-2.6)
Merging erofs/dev (aa99a76b40d6 erofs: handle corrupted images whose decomp=
ressed size less than it'd be)
Merging ext3/for_next (bc36dfffd5f3 ext2: Silence lockdep warning about rec=
laim under xattr_sem)
Merging ext4/dev (9db176bceb5c ext4: fix mount failure with quota configure=
d as module)
Merging f2fs/dev (30d167c6126b f2fs: fix to avoid use-after-free in f2fs_wr=
ite_multi_pages())
Merging fsverity/fsverity (da3a3da4e6c6 fs-verity: use u64_to_user_ptr())
Merging fuse/for-next (3e8cb8b2eaeb fuse: fix stack use after return)
Merging jfs/jfs-next (802a5017ffb2 jfs: remove unused MAXL2PAGES)
Merging nfs/linux-next (98d54f81e36b Linux 5.6-rc4)
Merging nfs-anna/linux-next (55dee1bc0d72 nfs: add minor version to nfs_ser=
ver_key for fscache)
Merging nfsd/nfsd-next (2653de9f0398 fs: nfsd: fileache.c: Use built-in RCU=
 list checking)
Merging orangefs/for-next (9f198a2ac543 help_next should increase position =
index)
Merging overlayfs/overlayfs-next (c2e87fd93396 ovl: allow remote upper)
Merging ubifs/linux-next (fe357dbae113 ubi: Fix an error pointer dereferenc=
e in error handling code)
Merging v9fs/9p-next (79fb9216b7be 9p: Remove unneeded semicolon)
Merging xfs/for-next (5680c3907361 xfs: switch xfs_attrmulti_attr_get to la=
zy attr buffer allocation)
Merging zonefs/for-next (0dda2ddb7ded zonefs: select FS_IOMAP)
Merging iomap/iomap-for-next (1ac994525b9d iomap: Remove pgoff from tracepo=
ints)
Merging djw-vfs/vfs-for-next (3253d9d09337 splice: only read in as much inf=
ormation as there is pipe buffer space)
Merging file-locks/locks-next (d0dc426625a3 locks: fix a potential use-afte=
r-free problem when wakeup a waiter)
Merging vfs/for-next (0fd169576648 fs: Add VirtualBox guest shared folder (=
vboxsf) support)
Merging printk/for-next (d34f14ae521f Merge branch 'for-5.7-preferred-conso=
le' into for-next)
Merging pci/next (daf98fffe4dc Merge branch 'pci/misc')
Merging pstore/for-next/pstore (6c871b7314dd pstore: pstore_ftrace_seq_next=
 should increase position index)
Merging hid/for-next (530c6c3b37e2 Merge branch 'for-5.6/upstream-fixes' in=
to for-next)
Merging i2c/i2c/for-next (b00b4779fbc5 Merge branch 'master' into i2c/for-n=
ext)
Merging i3c/i3c/next (cd851485ef29 i3c: master: Replace zero-length array w=
ith flexible-array member)
Merging dmi/master (6eaaa9e89719 firmware/dmi: Report DMI Bios & EC firmwar=
e release)
Merging hwmon-staging/hwmon-next (e1fa8adfbabf hwmon: (adt7475) Add support=
 for inverting pwm output)
Merging jc_docs/docs-next (0150aedda00e Merge branch 'mauro' into docs-next)
CONFLICT (content): Merge conflict in Documentation/filesystems/zonefs.rst
Merging v4l-dvb/master (00c43088aa68 media: meson: vdec: add VP9 decoder su=
pport)
Merging v4l-dvb-next/master (54ecb8f7028c Linux 5.4-rc1)
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (cf840f6c32df Merge branch 'pnp' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (4bd8459b6c3f cpufreq: imx6q: re=
ad OCOTP through nvmem for imx6q)
Merging cpupower/cpupower (2de7fb60a474 cpupower: avoid multiple definition=
 with gcc -fno-common)
Merging opp/opp/linux-next (03758d60265c opp: Replace list_kref with a loca=
l counter)
Merging thermal/thermal/linux-next (0bf3a650ab8d thermal: qoriq: Fix a comp=
iling issue)
Merging thermal-rzhang/next (54ecb8f7028c Linux 5.4-rc1)
Merging thermal-soc/next (6c375eccded4 thermal: db8500: Rewrite to be a pur=
e OF sensor)
Merging ieee1394/for-next (67f8e65e4fc1 firewire: net: remove set but not u=
sed variable 'guid')
Merging dlm/next (a48f9721e6db dlm: no need to check return value of debugf=
s_create functions)
Merging swiotlb/linux-next (4cdfb27ba80d xen/swiotlb: remember having calle=
d xen_create_contiguous_region())
Merging rdma/for-next (5e29d1443c46 RDMA/mlx5: Prevent UMR usage with RO on=
ly when we have RO caps)
Merging net-next/master (5de3a2386ec3 net: tulip: Replace zero-length array=
 with flexible-array member)
CONFLICT (content): Merge conflict in fs/sysfs/group.c
Merging bpf-next/master (3e7c67d90e3e bpf: Fix bpf_prog_test_run_tracing fo=
r !CONFIG_NET)
Merging ipsec-next/master (dda520c4d462 ESP: Export esp_output_fill_trailer=
 function)
Merging mlx5-next/mlx5-next (1326034b3ce7 net/mlx5: Expose raw packet pacin=
g APIs)
Merging netfilter-next/master (8a8bc4867583 netfilter: xt_IDLETIMER: clean =
up some indenting)
CONFLICT (content): Merge conflict in net/netfilter/ipset/ip_set_hash_gen.h
Merging nfc-next/master (1f008cfec5d5 NFC: fdp: Fix unused variable warning=
s)
CONFLICT (content): Merge conflict in drivers/nfc/st21nfca/se.c
Merging ipvs-next/master (d54725cd11a5 netfilter: nf_tables: support for mu=
ltiple devices per netdev hook)
Merging wireless-drivers-next/master (6065bb8a9c40 Merge tag 'mt76-for-kval=
o-2020-02-14' of https://github.com/nbd168/wireless)
Merging bluetooth/master (77131dfec6af Bluetooth: hci_qca: Replace devm_gpi=
od_get() with devm_gpiod_get_optional())
Merging mac80211-next/master (a862889b18ba cfg80211: fix documentation form=
at)
Merging gfs2/for-next (cc44457f1629 gfs2: leaf_dealloc needs to allocate on=
e more revoke)
Merging mtd/mtd/next (4575243c5c17 Merge tag 'nand/for-5.6' into mtd/next)
Merging nand/nand/next (d85339d9ea26 mtd: onenand: Rename omap2 driver to a=
void a build warning)
Merging spi-nor/spi-nor/next (2dcbfe365b13 mtd: spi-nor: Refactor spi_nor_r=
ead_id())
Merging crypto/master (1b44f93eb3e5 crypto: hisilicon - remove redundant as=
signment of pointer ctx)
Merging drm/drm-next (60347451ddb0 Merge tag 'drm-misc-next-2020-02-27' of =
git://anongit.freedesktop.org/drm/drm-misc into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/virtio/virtgpu_object=
.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_scheduler.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_drv.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gt/intel_lrc.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_di=
splay_power.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_dd=
i.c
Merging amdgpu/drm-next (0958890ffb2e drm/amdgpu: don't enable runtime pm o=
n navi12)
Merging drm-intel/for-linux-next (81dcef4ceebf drm/i915/execlists: Show the=
 "switch priority hint" in dumps)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gt/intel_workaro=
unds.c
Merging drm-tegra/drm/tegra/for-next (98ae41adb252 gpu: host1x: Set DMA dir=
ection only for DMA-mapped buffer objects)
Merging drm-misc/for-linux-next (e1cf35b94c5f drm/edid: fix building error)
Merging drm-msm/msm-next (5f9935f514d6 drm/msm: Fix error about comments wi=
thin a comment block)
Merging mali-dp/for-upstream/mali-dp (f634c6a80287 dt/bindings: display: Ad=
d optional property node define for Mali DP500)
Merging imx-drm/imx-drm/next (4d24376370fb gpu: ipu-v3: image-convert: only=
 sample into the next tile if necessary)
Merging etnaviv/etnaviv/next (1442d81fef99 drm/etnaviv: Replace zero-length=
 array with flexible-array member)
Merging regmap/for-next (d29456d34def Merge branch 'regmap-5.6' into regmap=
-linus)
Merging sound/for-next (2948f4a4e583 Merge branch 'topic/usb-uac2-effect-un=
it' into for-next)
Merging sound-asoc/for-next (b1a52f86cbf6 Merge branch 'asoc-5.7' into asoc=
-next)
Merging modules/modules-next (0f74226649fb kernel: module: Replace zero-len=
gth array with flexible-array member)
Merging input/next (c5ccf2ad3d33 Input: synaptics-rmi4 - switch to reduced =
reporting mode)
Merging block/for-next (e417079f484d Merge branch 'io_uring-buf-select' int=
o for-next)
Merging device-mapper/for-next (636be4241bdd dm: bump version of core and v=
arious targets)
Merging pcmcia/pcmcia-next (71705c611263 PCMCIA/i82092: remove #if 0 block)
Merging mmc/next (4361623c2bf0 mmc: mmc_test: Pass different sg lists for n=
on-blocking requests)
Merging md/for-next (e820d55cb99d md: fix raid10 hang issue caused by barri=
er)
Merging mfd/for-mfd-next (1129d6145ed5 mfd: Add support for Azoteq IQS620A/=
621/622/624/625)
Merging backlight/for-backlight-next (7af43a76695d backlight: qcom-wled: Fi=
x unsigned comparison to zero)
Merging battery/for-next (1c5dfc5e3f2d power: supply: sc27xx: Add POWER_SUP=
PLY_PROP_CHARGE_NOW attribute)
Merging regulator/for-next (385377acc5a1 Merge branch 'regulator-5.7' into =
regulator-next)
Merging security/next-testing (3e27a33932df security: remove duplicated inc=
lude from security.h)
Merging apparmor/apparmor-next (01df52d726b5 apparmor: remove duplicate che=
ck of xattrs on profile attachment.)
Merging integrity/next-integrity (96c82175d138 Merge branch 'next-integrity=
.logging-cleanup' into next-integrity)
Merging keys/keys-next (43672cf93c6d Merge branch 'notifications-pipe-core'=
 into keys-next)
CONFLICT (content): Merge conflict in fs/pipe.c
Applying: io_uring: fix up for get_pipe_info() API change
Merging selinux/next (34a2dab488bc selinux: clean up error path in policydb=
_init())
CONFLICT (content): Merge conflict in security/selinux/hooks.c
Merging smack/for-next (92604e825304 smack: use GFP_NOFS while holding inod=
e_smack::smk_lock)
Merging tomoyo/master (bb6d3fb354c5 Linux 5.6-rc1)
Merging tpmdd/next (2ba1c47a6b8c tpm_tis_spi: use new 'delay' structure for=
 SPI transfer delays)
Merging watchdog/master (44144c809e39 watchdog: da9062: Add dependency on I=
2C)
Merging iommu/next (3577d739bb74 Merge branches 'iommu/fixes', 'arm/qcom', =
'arm/omap', 'x86/amd', 'virtio' and 'core' into next)
Merging vfio/next (7b5372ba04ca vfio: platform: fix __iomem in vfio_platfor=
m_amdxgbe.c)
Merging audit/next (70b3eeed49e8 audit: CONFIG_CHANGE don't log internal bo=
okkeeping as an event)
Merging devicetree/for-next (f15652859cbe dt-bindings: pwm: Update bindings=
 for MT7629 SoC)
Merging mailbox/mailbox-for-next (c6c6bc6ea9fc mailbox: imx: add support fo=
r imx v1 mu)
Merging spi/for-next (ef026b0ebc03 Merge branch 'spi-5.7' into spi-next)
Merging tip/auto-latest (6f2bc932d8ff Merge branch 'core/objtool')
Merging clockevents/timers/drivers/next (cc2550b421aa clocksource: Replace =
setup_irq() by request_irq())
Merging edac/edac-for-next (ffa9a9758be2 Merge branch 'edac-urgent' into ed=
ac-for-next)
Merging irqchip/irq/irqchip-next (5186a6cc3ef5 irqchip/gic-v3-its: Rename V=
PENDBASER/VPROPBASER accessors)
Merging ftrace/for-next (2910b5aa6f54 bootconfig: Fix CONFIG_BOOTTIME_TRACI=
NG dependency issue)
Merging rcu/rcu/next (79a927f722b2 kcsan: Update API documentation in kcsan=
-checks.h)
Merging kvm/linux-next (a93236fcbe1d KVM: s390: rstify new ioctls in api.rs=
t)
Merging kvm-arm/next (e43f1331e2ef arm64: Ask the compiler to __always_inli=
ne functions used by KVM at HYP)
Merging kvm-ppc/kvm-ppc-next (fd24a8624eb2 KVM: PPC: Book3S PR: Fix -Werror=
=3Dreturn-type build failure)
Merging kvms390/next (cc674ef252f4 KVM: s390: introduce module parameter kv=
m.use_gisa)
Merging xen-tip/linux-next (4ab50af63d2e xen/blkfront: fix ring info addres=
sing)
Merging percpu/for-next (cfe2a689f755 Merge branch 'for-5.7' into for-next)
Merging workqueues/for-next (2dfaa4cc16d6 Merge branch 'for-5.7' into for-n=
ext)
Merging drivers-x86/for-next (8d92e160dd8f platform/x86: Kconfig: Fix a typ=
o)
Merging chrome-platform/for-next (7d3ca507fda9 platform/chrome: cros_ec_spi=
: Use new structure for SPI transfer delays)
Merging hsi/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging leds/for-next (dd47a83453e4 leds: pwm: convert to atomic PWM API)
Merging ipmi/for-next (b5b746bc0a6f drivers: char: ipmi: ipmi_msghandler: P=
ass lockdep expression to RCU lists)
Merging driver-core/driver-core-next (99c73ce158a4 drivers base/arch_topolo=
gy: Reformat topology_get_[cpu/freq]_scale() function name)
Merging usb/usb-next (6701adfa9693 usb: typec: driver for Intel PMC mux con=
trol)
Merging usb-gadget/next (bb6d3fb354c5 Linux 5.6-rc1)
Merging usb-serial/usb-next (0a68ec3d8a2c USB: serial: f81232: set F81534A =
serial port with RS232 mode)
Merging usb-chipidea-next/ci-for-usb-next (cbdfbda4a166 usb: chipidea: otg:=
 handling vbus disconnect event occurred during system suspend)
Merging phy-next/next (d66fa3548102 arm64: dts: mt2712: use non-empty range=
s for usb-phy)
Merging tty/tty-next (ba08cf452f34 Merge 5.6-rc3 into tty-next)
Merging char-misc/char-misc-next (1f836f5b10f2 Merge 5.6-rc3 into char-misc=
-next)
Merging extcon/extcon-next (87ccafd3bd64 extcon: palmas: Hide error message=
s if gpio returns -EPROBE_DEFER)
Merging soundwire/next (5de79ba865d7 soundwire: bus: provide correct return=
 value on error)
Merging thunderbolt/next (3084ea9ea889 thunderbolt: icm: Replace zero-lengt=
h array with flexible-array member)
Merging staging/staging-next (0fc6d4e4ce01 staging: wilc1000: use flexible-=
array member instead of zero-length array)
Merging mux/for-next (f356d58c3a04 Merge branch 'i2c-mux/for-next' into for=
-next)
Merging icc/icc-next (03c4e6186bbb interconnect: qcom: Add OSM L3 support o=
n SC7180)
Merging slave-dma/next (13a892d4aa24 dmaengine: ti: edma: fix null derefere=
nce because of a typo in pointer name)
Merging cgroup/for-next (9f7b2d1eba99 Merge branch 'for-5.6-fixes' into for=
-next)
Merging scsi/for-next (4ba1955b41a3 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (c892193c1ec5 scsi: iscsi: Add support for asynch=
ronous iSCSI session destruction)
Merging vhost/linux-next (370e2c82a4a5 vhost: use batched version by defaul=
t)
Merging rpmsg/for-next (5a87e60312a9 Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (9cd0c5e02ee4 Merge branch 'devel' into for-next)
Merging gpio-brgl/gpio/for-next (696eabb5a0c5 gpio: pl061: Warn when IRQ li=
ne has not been configured)
Merging gpio-intel/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging pinctrl/for-next (092e45c39a7b Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging pinctrl-samsung/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging pwm/for-next (9871abffc810 pwm: Remove set but not set variable 'pw=
m')
Merging userns/for-next (a0d4a141750d Proc mount option handling is broken,=
 and it has been since I accidentally broke it in the middle 2016.)
Merging ktest/for-next (9b5f852ae20d ktest: Make default build option oldco=
nfig not randconfig)
Merging random/dev (e00d996a4317 random: fix data races at timer_rand_state)
Merging kselftest/next (3032e3a7c7e3 selftests/resctrl: Add the test in MAI=
NTAINERS)
Merging y2038/y2038 (c4e71212a245 Revert "drm/etnaviv: reject timeouts with=
 tv_nsec >=3D NSEC_PER_SEC")
Merging livepatching/for-next (d28b4c1b2b3d Merge branch 'for-5.6/selftests=
' into for-next)
Merging coresight/next (749c4ad29ea7 coresight: cti: Remove unnecessary NUL=
L check in cti_sig_type_name)
Merging rtc/rtc-next (1cd0acd5b93a rtc: snvs: Improve Kconfig dependency)
Merging nvdimm/libnvdimm-for-next (7b27a8622f80 libnvdimm/e820: Retrieve an=
d populate correct 'target_node' info)
Merging at24/at24/for-next (4837621cd61e eeprom: at24: add TPF0001 ACPI ID =
for 24c1024 device)
Merging ntb/ntb-next (1ef512b16bc8 NTB: Fix an error in get link status)
Merging kspp/for-next/kspp (c79f46a28239 Linux 5.5-rc5)
Merging cisco/for-next (9e98c678c2d6 Linux 5.1-rc1)
Merging gnss/gnss-next (f8788d86ab28 Linux 5.6-rc3)
Merging fsi/next (2c01397b71c5 fsi: aspeed: Fix OPB0 byte order register va=
lues)
CONFLICT (content): Merge conflict in drivers/fsi/Kconfig
Merging slimbus/for-next (526eaf5d08a2 slimbus: Use the correct style for S=
PDX License Identifier)
Merging nvmem/for-next (b5051c8fd339 Documentation: ABI: nvmem: add documen=
tation for JZ4780 efuse ABI)
Merging xarray/xarray (d8e93e3f22d9 XArray: Optimise xas_sibling() if !CONF=
IG_XARRAY_MULTI)
Merging hyperv/hyperv-next (40d1d2d6e89e HID: hyperv: NULL check before som=
e freeing functions is not needed.)
Merging auxdisplay/auxdisplay (54ecb8f7028c Linux 5.4-rc1)
Merging kgdb/kgdb/for-next (5ea771abd5a3 kdb: Censor attempts to set PROMPT=
 without ENABLE_MEM_READ)
Merging pidfd/for-next (8d19f1c8e193 prctl: PR_{G,S}ET_IO_FLUSHER to suppor=
t controlling memory reclaim)
Merging devfreq/devfreq-next (d4aaf8643cff PM / devfreq: Fix a typo in a co=
mment)
Merging hmm/hmm (fdf8822d38ed mm/mmu_notifier: prevent unpaired invalidate_=
start and invalidate_end)
Merging fpga/for-next (2fb2e7cdfbb0 arm64: dts: agilex: correct service lay=
er driver's compatible value)
Merging kunit/test (bb6d3fb354c5 Linux 5.6-rc1)
Merging cel/cel-next (a99d8080aaf3 Linux 5.4-rc6)
Merging generic-ioremap/for-next (4bdc0d676a64 remove ioremap_nocache and d=
evm_ioremap_nocache)
Merging kunit-next/kunit (be886ba90cce kunit: run kunit_tool from any direc=
tory)
Merging akpm-current/current (5a40c2209523 ipc/mqueue.c: fix a brace coding=
 style issue)
CONFLICT (content): Merge conflict in arch/microblaze/include/asm/Kbuild
CONFLICT (content): Merge conflict in arch/m68k/include/asm/Kbuild
$ git checkout -b akpm remotes/origin/akpm/master
Applying: drivers/dma/tegra20-apb-dma.c: fix platform_get_irq.cocci warnings
Applying: mm/frontswap: mark various intentional data races
Applying: mm/page_io: mark various intentional data races
Applying: mm-page_io-mark-various-intentional-data-races-v2
Applying: mm/swap_state: mark various intentional data races
Applying: mm/filemap.c: fix a data race in filemap_fault()
Applying: mm/swapfile: fix and annotate various data races
Applying: mm-swapfile-fix-and-annotate-various-data-races-v2
Applying: mm/page_counter: fix various data races at memsw
Applying: mm/memcontrol: fix a data race in scan count
Applying: mm/list_lru: fix a data race in list_lru_count_one
Applying: mm/mempool: fix a data race in mempool_free()
Applying: mm/util.c: annotate an data race at vm_committed_as
Applying: mm/rmap: annotate a data race at tlb_flush_batched
Applying: mm: annotate a data race in page_zonenum()
Applying: mm/swap.c: annotate data races for lru_rotate_pvecs
Applying: mm/memory.c: refactor insert_page to prepare for batched-lock ins=
ert
Applying: mm: bring sparc pte_index() semantics inline with other platforms
Applying: mm: define pte_index as macro for x86
Applying: mm/memory.c: add vm_insert_pages()
Applying: mm-add-vm_insert_pages-fix
Applying: add missing page_count() check to vm_insert_pages().
Applying: mm: vm_insert_pages() checks if pte_index defined.
Applying: net-zerocopy: use vm_insert_pages() for tcp rcv zerocopy
Applying: net-zerocopy-use-vm_insert_pages-for-tcp-rcv-zerocopy-fix
Applying: arm/arm64: add support for folded p4d page tables
Applying: h8300: remove usage of __ARCH_USE_5LEVEL_HACK
Applying: hexagon: remove __ARCH_USE_5LEVEL_HACK
Applying: ia64: add support for folded p4d page tables
Applying: nios2: add support for folded p4d page tables
Applying: openrisc: add support for folded p4d page tables
Applying: powerpc/32: drop get_pteptr()
CONFLICT (content): Merge conflict in arch/powerpc/mm/pgtable_32.c
Applying: powerpc: add support for folded p4d page tables
CONFLICT (content): Merge conflict in arch/powerpc/mm/pgtable_32.c
CONFLICT (content): Merge conflict in arch/powerpc/mm/nohash/40x.c
CONFLICT (content): Merge conflict in arch/powerpc/mm/mem.c
CONFLICT (content): Merge conflict in arch/powerpc/mm/kasan/kasan_init_32.c
CONFLICT (content): Merge conflict in arch/powerpc/mm/book3s32/tlb.c
CONFLICT (content): Merge conflict in arch/powerpc/mm/book3s32/mmu.c
Applying: fix for "powerpc: add support for folded p4d page tables"
Applying: sh: fault: modernize printing of kernel messages
Applying: sh: drop __pXd_offset() macros that duplicate pXd_index() ones
Applying: sh: add support for folded p4d page tables
Applying: unicore32: remove __ARCH_USE_5LEVEL_HACK
Applying: asm-generic: remove pgtable-nop4d-hack.h
Applying: mm: remove __ARCH_HAS_5LEVEL_HACK and include/asm-generic/5level-=
fixup.h
Applying: fs/seq_file.c: seq_read(): add info message about buggy .next fun=
ctions
Applying: seq_read-info-message-about-buggy-next-functions-fix
Applying: kernel/gcov/fs.c: gcov_seq_next() should increase position index
Applying: ipc/util.c: sysvipc_find_ipc() should increase position index
Applying: drivers/tty/serial/sh-sci.c: suppress warning
Applying: drivers/media/platform/sti/delta/delta-ipc.c: fix read buffer ove=
rflow
Merging akpm/master (85397d697ac8 drivers/media/platform/sti/delta/delta-ip=
c.c: fix read buffer overflow)

--Sig_/oq6n2bk8EmHiHC5i_VRfdbw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5h8iQACgkQAVBC80lX
0Gz7bAf+I2KhGmn012ClygsrxwK7eyHd+iE82KCqgep0cYNTTWHPF5aFSMhRvIB4
oNAMhjVXvovQaX4UfDuNv3UjLn3RJBnHJ6zowA+dXOEkmS9h/jfj1WZAnmeYHTpB
8GujCXXYnp0+aeLLNG5cYMeM6Oa8T/ZJBPRnBBIpDlOmS1mAOZY1Afre3Fwc/IqL
qOmH7XNmwnUyVlmzbFuLptsvi+4Qp/wCJyzb2Le03xrGVdkIrSAAuWHIwo1lfsmw
qMm0nryl4ro2vIG+g4BQIX+QRXRE1zntkFaQz6jFRx+CCw1ba6gLHH/RcZogA+m8
B/XH+fa6bE9xxZLey8vYSVBygs0kTQ==
=gEQ6
-----END PGP SIGNATURE-----

--Sig_/oq6n2bk8EmHiHC5i_VRfdbw--
