Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EED82160997
	for <lists+linux-next@lfdr.de>; Mon, 17 Feb 2020 05:18:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726656AbgBQES7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 16 Feb 2020 23:18:59 -0500
Received: from ozlabs.org ([203.11.71.1]:41515 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726591AbgBQES6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 16 Feb 2020 23:18:58 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48LW2P5lXGz9sPk;
        Mon, 17 Feb 2020 15:18:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1581913133;
        bh=VnE9+tJ+kB2RhA+jJlv3V6xUjFXNmTw1Qi3xYK2OFVw=;
        h=Date:From:To:Cc:Subject:From;
        b=u8utAnl4Y9LfKzTQGbuMiENSvnXVapMfNhyc/HxQ5EqY5VkFhfbAhoSjmahEYJTAN
         s9bkcoWAaL7NrQxe8sI/SIO2OdHn0redQaWDGjfZUW6cvcFECFye9upDNP9ZV/KwPC
         WEieK+IbsDL2umDhIkzN3IzqVxtXVnC1fjd2eNHjV1xjpwWhn+qagG7rsakOyiSB5R
         vQLiqN0RJFiU18JAo8GxYmC9KwDPIpGRGii/Ze+jSXjtJNPldmbLy8JVx842ID0wV8
         aJ8qdcGG+5bTDRAz4RIr/Nq0GVoNoyRdBm81z8m15aZ6rJOiWs/XRsJpuGIMjro5Gc
         RNWIpmuAQ2rwQ==
Date:   Mon, 17 Feb 2020 15:18:53 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Feb 17
Message-ID: <20200217151853.5d12776f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/d597+_VL4P4dCauyO2=L=dC";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/d597+_VL4P4dCauyO2=L=dC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20200214:

The amlogic tree gained a build failure so I used the version from
next-20200214.

The akpm-current tree gained a conflict against the csky tree and a
build failure for which I reverted a series of commits. There was another
reported build failure for which I applied a supplied patch.

Non-merge commits (relative to Linus' tree): 1847
 1780 files changed, 67867 insertions(+), 55111 deletions(-)

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

I am currently merging 315 trees (counting Linus' and 78 trees of bug
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
Merging origin/master (713db3560410 Merge tag 'for-5.6-rc1-tag' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/kdave/linux)
Merging fixes/master (ba954bf6cb38 evh_bytechan: fix out of bounds accesses)
Merging kbuild-current/fixes (0bf999f9c5e7 linux/pipe_fs_i.h: fix kernel-do=
c warnings after @wait was split)
Merging arc-current/for-curr (0acdf63d2296 ARC: fpu: fix randconfig build e=
rror reported by 0-day test service)
Merging arm-current/fixes (6849b5eba196 ARM: 8955/1: virt: Relax arch timer=
 version check during early boot)
Merging arm-soc-fixes/arm/fixes (3bf3c9744694 bus: moxtet: fix potential st=
ack buffer overflow)
Merging arm64-fixes/for-next/fixes (d91771848f0a arm64: time: Replace <linu=
x/clk-provider.h> by <linux/of_clk.h>)
Merging m68k-current/for-linus (6aabc1facdb2 m68k: Implement copy_thread_tl=
s())
Merging powerpc-fixes/fixes (d4bf905307a1 powerpc: Fix CONFIG_TRACE_IRQFLAG=
S with CONFIG_VMAP_STACK)
Merging s390-fixes/fixes (c7ff8573ad21 crypto/testmgr: enable selftests for=
 paes-s390 ciphers)
Merging sparc/master (11648b8339f8 sparc64: fix adjtimex regression)
Merging fscrypt-current/for-stable (ae64f9bd1d36 Linux 4.15-rc2)
Merging net/master (2019fc96af22 Merge git://git.kernel.org/pub/scm/linux/k=
ernel/git/netdev/net)
Merging bpf/master (eecd618b4516 selftests/bpf: Mark SYN cookie test skippe=
d for UDP sockets)
Merging ipsec/master (a1a7e3a36e01 xfrm: add the missing verify_sec_ctx_len=
 check in xfrm_add_acquire)
Merging netfilter/master (a7da92c2c8a1 netfilter: flowtable: skip offload s=
etup if disabled)
Merging ipvs/master (c24b75e0f923 ipvs: move old_secure_tcp into struct net=
ns_ipvs)
Merging wireless-drivers/master (a9149d243f25 iwlwifi: mvm: Do not require =
PHY_SKU NVM section for 3168 devices)
Merging mac80211/master (2019fc96af22 Merge git://git.kernel.org/pub/scm/li=
nux/kernel/git/netdev/net)
Merging rdma-fixes/for-rc (685eff513183 IB/mlx5: Use div64_u64 for num_var_=
hw_entries calculation)
Merging sound-current/for-linus (dfa9a5efe8b9 ALSA: rawmidi: Avoid bit fiel=
ds for state flags)
Merging sound-asoc-fixes/for-linus (d7aa029b173b Merge branch 'asoc-5.6' in=
to asoc-linus)
Merging regmap-fixes/for-linus (bb6d3fb354c5 Linux 5.6-rc1)
Merging regulator-fixes/for-linus (e361130b31aa Merge branch 'regulator-5.6=
' into regulator-linus)
Merging spi-fixes/for-linus (db33c6a8314b Merge branch 'spi-5.6' into spi-l=
inus)
Merging pci-current/for-linus (bb6d3fb354c5 Linux 5.6-rc1)
Merging driver-core.current/driver-core-linus (ae91c9256549 debugfs: remove=
 return value of debugfs_create_regset32())
Merging tty.current/tty-linus (07e6124a1a46 vt: selection, close sel_buffer=
 race)
Merging usb.current/usb-linus (450c52c7847b Merge tag 'fixes-for-v5.6-rc1' =
of git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb into usb-linus)
Merging usb-gadget-fixes/fixes (42cd5ffe46c1 usb: dwc3: debug: fix string p=
osition formatting mixup with ret and len)
Merging usb-serial-fixes/usb-linus (7c3d02285ad5 USB: serial: ch341: fix re=
ceiver regression)
Merging usb-chipidea-fixes/ci-for-usb-stable (16009db47c51 usb: chipidea: u=
dc: workaround for endpoint conflict issue)
Merging phy/fixes (4f510aa10468 phy/rockchip: inno-hdmi: round clock rate d=
own to closest 1000 Hz)
Merging staging.current/staging-linus (9a4556bd8f23 staging: rtl8723bs: Rem=
ove unneeded goto statements)
Merging char-misc.current/char-misc-linus (3da627073b56 Documentation/proce=
ss: Swap out the ambassador for Canonical)
Merging soundwire-fixes/fixes (bb6d3fb354c5 Linux 5.6-rc1)
Merging thunderbolt-fixes/fixes (da0f3e0201b8 MAINTAINERS: Sort entries in =
database for THUNDERBOLT)
Merging input-current/for-linus (3dbae1553897 Input: cyapa - replace zero-l=
ength array with flexible-array member)
Merging crypto-current/master (c9cc0517bba9 crypto: chacha20poly1305 - prev=
ent integer overflow on large input)
Merging ide/master (94f2630b1897 Merge tag '5.6-rc-small-smb3-fix-for-stabl=
e' of git://git.samba.org/sfrench/cifs-2.6)
Merging vfio-fixes/for-linus (95f89e090618 vfio/type1: Initialize resv_msi_=
base)
Merging kselftest-fixes/fixes (9a0584f05687 selftests: openat2: fix build e=
rror on newer glibc)
Merging modules-fixes/modules-linus (57baec7b1b04 scripts/nsdeps: make sure=
 to pass all module source files to spatch)
Merging slave-dma-fixes/fixes (2227ab4216cd dmaengine: idxd: Fix error hand=
ling in idxd_wq_cdev_dev_setup())
Merging backlight-fixes/for-backlight-fixes (219d54332a09 Linux 5.4)
Merging mtd-fixes/mtd/fixes (def9d2780727 Linux 5.5-rc7)
Merging mfd-fixes/for-mfd-fixes (603d9299da32 mfd: mt6397: Fix probe after =
changing mt6397-core)
Merging v4l-dvb-fixes/fixes (1697d9812481 media: staging/intel-ipu3: remove=
 TODO item about acronyms)
Merging reset-fixes/reset/fixes (b460e0a9e240 reset: intel: add unspecified=
 HAS_IOMEM dependency)
Merging mips-fixes/mips-fixes (bef8e2dfceed MIPS: VPE: Fix a double free an=
d a memory leak in 'release_vpe()')
Merging at91-fixes/at91-fixes (54ecb8f7028c Linux 5.4-rc1)
Merging omap-fixes/fixes (b0b039515445 ARM: dts: am43x-epos-evm: set data p=
in directions for spi0 and spi1)
Merging kvm-fixes/master (ead68df94d24 KVM: x86: enable -Werror)
Merging kvms390-fixes/master (fe33a928bfcd KVM: s390: ENOTSUPP -> EOPNOTSUP=
P fixups)
Merging hwmon-fixes/hwmon (205447fa9e0a hwmon: (pmbus/xdpe12284) fix typo i=
n compatible strings)
Merging nvdimm-fixes/libnvdimm-fixes (96222d53842d dax: pass NOWAIT flag to=
 iomap_apply)
Merging btrfs-fixes/next-fixes (f620b78f8b33 Merge branch 'misc-5.6' into n=
ext-fixes)
Merging vfs-fixes/fixes (d0cb50185ae9 do_last(): fetch directory ->i_mode a=
nd ->i_uid before it's too late)
Merging dma-mapping-fixes/for-linus (9c24eaf81cc4 iommu/vt-d: Return the co=
rrect dma mask when we are bypassing the IOMMU)
Merging i3c-fixes/master (6fbc7275c7a9 Linux 5.2-rc7)
Merging drivers-x86-fixes/fixes (bb6d3fb354c5 Linux 5.6-rc1)
Merging samsung-krzk-fixes/fixes (bb6d3fb354c5 Linux 5.6-rc1)
Merging pinctrl-samsung-fixes/pinctrl-fixes (bb6d3fb354c5 Linux 5.6-rc1)
Merging devicetree-fixes/dt/linus (04dbd86539fd dt-bindings: Fix paths in s=
chema $id fields)
Merging scsi-fixes/fixes (bb6d3fb354c5 Linux 5.6-rc1)
Merging drm-fixes/drm-fixes (6f4134b30b6e Merge tag 'drm-intel-next-fixes-2=
020-02-13' of git://anongit.freedesktop.org/drm/drm-intel into drm-fixes)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (d5226fa6dbae Linux 5.5)
Merging mmc-fixes/fixes (9051db381fab mmc: sdhci-msm: Mark sdhci_msm_cqe_di=
sable static)
Merging rtc-fixes/rtc-fixes (bb6d3fb354c5 Linux 5.6-rc1)
Merging gnss-fixes/gnss-linus (bb6d3fb354c5 Linux 5.6-rc1)
Merging hyperv-fixes/hyperv-fixes (af42d3466bdc Linux 5.4-rc8)
Merging soc-fsl-fixes/fix (5674a92ca4b7 soc/fsl/qe: Fix an error code in qe=
_pin_request())
Merging risc-v-fixes/fixes (def9d2780727 Linux 5.5-rc7)
Merging pidfd-fixes/fixes (0bef168e8859 exit: Fix Sparse errors and warning=
s)
Merging fpga-fixes/fixes (dec43da46f63 fpga: altera-ps-spi: Fix getting of =
optional confd gpio)
Merging spdx/spdx-linus (bb6d3fb354c5 Linux 5.6-rc1)
Merging gpio-intel-fixes/fixes (bb6d3fb354c5 Linux 5.6-rc1)
Merging pinctrl-intel-fixes/fixes (bb6d3fb354c5 Linux 5.6-rc1)
Merging erofs-fixes/fixes (d1eef1c61974 Linux 5.5-rc2)
Merging drm-misc-fixes/for-linux-next-fixes (dde2bb2da01e drm/panfrost: per=
fcnt: Reserve/use the AS attached to the perfcnt MMU context)
Merging kspp-gustavo/for-next/kspp (bb6d3fb354c5 Linux 5.6-rc1)
Merging kbuild/for-next (0bf999f9c5e7 linux/pipe_fs_i.h: fix kernel-doc war=
nings after @wait was split)
Merging compiler-attributes/compiler-attributes (54ecb8f7028c Linux 5.4-rc1)
Merging leaks/leaks-next (9e98c678c2d6 Linux 5.1-rc1)
Merging dma-mapping/for-next (75467ee48a5e dma-direct: improve DMA mask ove=
rflow reporting)
Merging asm-generic/master (060dc911501f nds32: fix build failure caused by=
 page table folding updates)
Merging arc/for-next (def9d2780727 Linux 5.5-rc7)
Merging arm/for-next (29cd07a400ae Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm64/for-next/core (e533dbe9dcb1 arm64: acpi: fix DAIF manipulatio=
n with pNMI)
Merging arm-perf/for-next/perf (8703317ae576 drivers/perf: hisi: update the=
 sccl_id/ccl_id for certain HiSilicon platform)
Merging arm-soc/for-next (f07849b2ac77 ARM: Document merges)
Merging amlogic/for-next (7ef59ea6bce0 Merge branch 'v5.7/drivers' into tmp=
/aml-rebuild)
$ git reset --hard HEAD^
Merging next-20200214 version of amlogic
Merging aspeed/for-next (5a020d80bbef ARM: dts: aspeed: g4: add video engin=
e support)
Merging at91/at91-next (1bf257001079 Merge branches 'at91-soc', 'at91-dt' a=
nd 'at91-defconfig' into at91-next)
Merging bcm2835/for-next (f14234184671 Merge branch 'bcm2835-maintainers-ne=
xt' into for-next)
Merging imx-mxs/for-next (c65228f2fe91 Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (a1766a49fc90 Merge tag 'drivers_soc_for_5.6' into ne=
xt)
Merging mediatek/for-next (fdef5207b966 Merge branch 'v5.5-next/soc' into f=
or-next)
Merging mvebu/for-next (c0d03b53ef47 Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (f9f5267ec296 Merge branch 'omap-for-v5.6/dt' into fo=
r-next)
Merging qcom/for-next (bc50f20a31b1 Merge branches 'arm64-for-5.7', 'defcon=
fig-for-5.7', 'drivers-for-5.7' and 'dts-for-5.7' into for-next)
Merging realtek/for-next (45698e00d5a9 Merge branch 'v5.6/dt' into next)
Merging renesas/next (c8b8fcddf94a Merge branches 'renesas-arm-dt-for-v5.7'=
, 'renesas-arm-soc-for-v5.7' and 'renesas-arm64-dt-for-v5.7' into renesas-n=
ext)
Merging reset/reset/next (4e0b9bc98c4a dt-bindings: reset: meson: add gxl i=
nternal dac reset)
Merging rockchip/for-next (152f9a049efc Merge branch 'v5.6-clk/fixes' into =
for-next)
Merging samsung-krzk/for-next (735478fc8a89 Merge branch 'next/dt' into for=
-next)
Merging scmi/for-linux-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging sunxi/sunxi/for-next (8033917515c7 Merge branches 'sunxi/clk-for-5.=
7', 'sunxi/core-for-5.7' and 'sunxi/dt-for-5.7' into sunxi/for-next)
Merging tegra/for-next (108f7e5e9478 Merge branch for-5.6/clk into for-next)
Merging clk/clk-next (931cfff0458a Merge branch 'clk-socfpga' into clk-next)
Merging clk-samsung/for-next (54ecb8f7028c Linux 5.4-rc1)
Merging c6x/for-linux-next (8adcc59974b8 Merge branch 'work.misc' of git://=
git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging csky/linux-next (85ea1329d674 csky: Replace <linux/clk-provider.h> =
by <linux/of_clk.h>)
Merging h8300/h8300-next (a5de8865cb3e h8300: move definition of __kernel_s=
ize_t etc. to posix_types.h)
Merging ia64/next (240b62d381fe ia64: remove stale paravirt leftovers)
Merging m68k/for-next (dff527e7a0a8 m68k: Switch to asm-generic/hardirq.h)
Merging m68knommu/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging microblaze/next (6aa71ef9bcf9 microblaze: Add ID for Microblaze v11)
Merging mips/mips-next (2c4288719806 MIPS: PCI: Add detection of IOC3 on IO=
7, IO8, IO9 and Fuel)
Merging nds32/next (a7f96fce201c MAINTAINERS: add nds32 maintainer)
Merging nios2/for-next (051d75d3bb31 MAINTAINERS: Update Ley Foon Tan's ema=
il address)
Merging openrisc/for-next (fc74d7166005 openrisc: use mmgrab)
Merging parisc-hd/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging powerpc/next (71c3a888cbca Merge tag 'powerpc-5.6-1' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/powerpc/linux)
Merging fsl/next (a76bea0287ce powerpc/kmcent2: add ranges to the pci bridg=
es)
Merging soc-fsl/next (6e62bd36e9ad soc: fsl: qe: remove set but not used va=
riable 'mm_gc')
Merging risc-v/for-next (b2389902f6fd riscv: Use flush_icache_mm for flush_=
icache_user_range)
Merging sifive/for-next (467e050e9760 Merge branch 'i2c/for-current' of git=
://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux)
Merging s390/features (55d0a513a0e2 s390/pkey/zcrypt: Support EP11 AES secu=
re keys)
Merging sh/sh-next (a193018e5290 sh: add missing EXPORT_SYMBOL() for __dela=
y)
Merging sparc-next/master (b71acb0e3721 Merge branch 'linus' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6)
Merging uml/linux-next (d65197ad5249 um: Fix time-travel=3Dinf-cpu with xor=
/raid6)
Merging xtensa/xtensa-for-next (362961f4063f Merge branch 'xtensa-5.6-fixes=
' into xtensa-for-next)
Merging fscrypt/master (edc440e3d27f fscrypt: improve format of no-key name=
s)
Merging afs/afs-next (4fe171bb81b1 afs: Remove set but not used variable 'r=
et')
Merging btrfs/for-next (455808a18dbf Merge branch 'for-next-next-v5.6-20200=
211' into for-next-20200211)
Merging ceph/master (3b20bc2fe4c0 ceph: noacl mount option is effectively i=
gnored)
Merging cifs/for-next (0fc6b1c269d1 cifs: plumb smb2 POSIX dir enumeration)
Merging configfs/for-next (e2f238f7d5a1 configfs: calculate the depth of pa=
rent item)
Merging ecryptfs/next (2c2a7552dd64 ecryptfs: replace BUG_ON with error han=
dling code)
Merging erofs/dev (bb6d3fb354c5 Linux 5.6-rc1)
Merging ext3/for_next (daf1cd925487 Pull macro cleanup patches.)
Merging ext4/dev (c96dceeabf76 jbd2: do not clear the BH_Mapped flag when f=
orgetting a metadata buffer)
Merging f2fs/dev (b19e8c684703 Merge tag 'arm64-fixes' of git://git.kernel.=
org/pub/scm/linux/kernel/git/arm64/linux)
Merging fsverity/fsverity (da3a3da4e6c6 fs-verity: use u64_to_user_ptr())
Merging fuse/for-next (3e8cb8b2eaeb fuse: fix stack use after return)
Merging jfs/jfs-next (802a5017ffb2 jfs: remove unused MAXL2PAGES)
Merging nfs/linux-next (11a48a5a18c6 Linux 5.6-rc2)
Merging nfs-anna/linux-next (5d63944f8206 NFSv4: Ensure the delegation cred=
 is pinned when we call delegreturn)
Merging nfsd/nfsd-next (3d96208c30f8 sunrpc: expiry_time should be seconds =
not timeval)
Merging orangefs/for-next (9f198a2ac543 help_next should increase position =
index)
Merging overlayfs/overlayfs-next (a4ac9d45c0cd ovl: fix lseek overflow on 3=
2bit)
Merging ubifs/linux-next (fe357dbae113 ubi: Fix an error pointer dereferenc=
e in error handling code)
Merging v9fs/9p-next (79fb9216b7be 9p: Remove unneeded semicolon)
Merging xfs/for-next (cdbcf82b86ea xfs: fix xfs_buf_ioerror_alert location =
reporting)
Merging zonefs/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging iomap/iomap-for-next (243145bc4336 fs: Fix page_mkwrite off-by-one =
errors)
Merging djw-vfs/vfs-for-next (3253d9d09337 splice: only read in as much inf=
ormation as there is pipe buffer space)
Merging file-locks/locks-next (98ca480a8f22 locks: print unsigned ino in /p=
roc/locks)
Merging vfs/for-next (0fd169576648 fs: Add VirtualBox guest shared folder (=
vboxsf) support)
Merging printk/for-next (f93598b8c76f Merge branch 'for-5.7' into for-next)
Merging pci/next (bb6d3fb354c5 Linux 5.6-rc1)
Merging pstore/for-next/pstore (e163fdb3f7f8 pstore/ram: Regularize prz lab=
el allocation lifetime)
Merging hid/for-next (9d7e22b27ba7 Merge branch 'for-5.6/upstream-fixes' in=
to for-next)
Merging i2c/i2c/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging i3c/i3c/next (3952cf8ff2f7 i3c: master: dw: reattach device on firs=
t available location of address table)
Merging dmi/master (6eaaa9e89719 firmware/dmi: Report DMI Bios & EC firmwar=
e release)
Merging hwmon-staging/hwmon-next (b4542671cafc hwmon: (pmbus/tps53679) Add =
documentation)
Merging jc_docs/docs-next (2e5b1886e9ba Documentation: bootconfig: fix Sphi=
nx block warning)
Merging v4l-dvb/master (bb6d3fb354c5 Linux 5.6-rc1)
Merging v4l-dvb-next/master (d45331b00ddb Linux 5.3-rc4)
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (00b838d60ec4 Merge branch 'pm-qos' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (0ea4fb29c689 cpufreq: ti-cpufre=
q: Add support for OPP_PLUS)
Merging cpupower/cpupower (bb6d3fb354c5 Linux 5.6-rc1)
Merging opp/opp/linux-next (03758d60265c opp: Replace list_kref with a loca=
l counter)
Merging thermal/thermal/linux-next (eefb85077bfe ARM: configs: Build BCM271=
1 thermal as module)
CONFLICT (add/add): Merge conflict in Documentation/driver-api/thermal/cpu-=
idle-cooling.rst
CONFLICT (add/add): Merge conflict in Documentation/devicetree/bindings/the=
rmal/brcm,avs-ro-thermal.yaml
Merging thermal-rzhang/next (54ecb8f7028c Linux 5.4-rc1)
Merging thermal-soc/next (6c375eccded4 thermal: db8500: Rewrite to be a pur=
e OF sensor)
Merging ieee1394/for-next (67f8e65e4fc1 firewire: net: remove set but not u=
sed variable 'guid')
Merging dlm/next (a48f9721e6db dlm: no need to check return value of debugf=
s_create functions)
Merging swiotlb/linux-next (4cdfb27ba80d xen/swiotlb: remember having calle=
d xen_create_contiguous_region())
Merging rdma/for-next (beb205dd67aa RDMA/siw: Fix setting active_mtu attrib=
ute)
Merging net-next/master (2019fc96af22 Merge git://git.kernel.org/pub/scm/li=
nux/kernel/git/netdev/net)
Merging bpf-next/master (2019fc96af22 Merge git://git.kernel.org/pub/scm/li=
nux/kernel/git/netdev/net)
Merging ipsec-next/master (9f68e3655aae Merge tag 'drm-next-2020-01-30' of =
git://anongit.freedesktop.org/drm/drm)
Merging mlx5-next/mlx5-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging netfilter-next/master (fdfa3a6778b1 Merge tag 'scsi-misc' of git://=
git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi)
Merging nfc-next/master (1f008cfec5d5 NFC: fdp: Fix unused variable warning=
s)
CONFLICT (content): Merge conflict in drivers/nfc/st21nfca/se.c
Merging ipvs-next/master (d54725cd11a5 netfilter: nf_tables: support for mu=
ltiple devices per netdev hook)
Merging wireless-drivers-next/master (932183aa35c6 mwifiex: change license =
text from MARVELL to NXP)
Merging bluetooth/master (e22998f53a1e Bluetooth: Fix a typo in Kconfig)
Merging mac80211-next/master (1f6e0baa703d mac80211: allow setting queue_le=
n for drivers not using wake_tx_queue)
Merging gfs2/for-next (6e5e41e2dc4e gfs2: fix O_SYNC write handling)
Merging mtd/mtd/next (4575243c5c17 Merge tag 'nand/for-5.6' into mtd/next)
Merging nand/nand/next (d85339d9ea26 mtd: onenand: Rename omap2 driver to a=
void a build warning)
Merging spi-nor/spi-nor/next (bb6d3fb354c5 Linux 5.6-rc1)
Merging crypto/master (7f19380b2cfd crypto: qce - handle AES-XTS cases that=
 qce fails)
Merging drm/drm-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging amdgpu/drm-next (05b5ff30d31f drm/amdgpu: drop legacy drm load and =
unload callbacks)
Merging drm-intel/for-linux-next (2aaaa5ee1c3d drm/i915: Mark the removal o=
f the i915_request from the sched.link)
Merging drm-tegra/drm/tegra/for-next (98ae41adb252 gpu: host1x: Set DMA dir=
ection only for DMA-mapped buffer objects)
Merging drm-misc/for-linux-next (e1cf35b94c5f drm/edid: fix building error)
Merging drm-msm/msm-next (5f9935f514d6 drm/msm: Fix error about comments wi=
thin a comment block)
Merging mali-dp/for-upstream/mali-dp (f634c6a80287 dt/bindings: display: Ad=
d optional property node define for Mali DP500)
Merging imx-drm/imx-drm/next (4d24376370fb gpu: ipu-v3: image-convert: only=
 sample into the next tile if necessary)
Merging etnaviv/etnaviv/next (22567d017c2c dt-bindings: etnaviv: Add #cooli=
ng-cells)
Merging regmap/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging sound/for-next (8dc5efe3d17c ALSA: usb-audio: Add support for Preso=
nus Studio 1810c)
Merging sound-asoc/for-next (9a75894088b4 Merge branch 'asoc-5.7' into asoc=
-next)
Merging modules/modules-next (6080d608eeff module.h: Annotate mod_kallsyms =
with __rcu)
Merging input/next (c5ccf2ad3d33 Input: synaptics-rmi4 - switch to reduced =
reporting mode)
Merging block/for-next (6b6eb301e976 Merge branch 'io_uring-5.6' into for-n=
ext)
Merging device-mapper/for-next (47ace7e012b9 dm: fix potential for q->make_=
request_fn NULL pointer)
Merging pcmcia/pcmcia-next (71705c611263 PCMCIA/i82092: remove #if 0 block)
Merging mmc/next (84f371938735 Merge branch 'fixes' into next)
Merging md/for-next (e820d55cb99d md: fix raid10 hang issue caused by barri=
er)
Merging mfd/for-mfd-next (5312f321a67c mfd: syscon: Fix syscon_regmap_looku=
p_by_phandle_args() dummy)
Merging backlight/for-backlight-next (7af43a76695d backlight: qcom-wled: Fi=
x unsigned comparison to zero)
Merging battery/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging regulator/for-next (695a430a62d7 Merge branch 'regulator-5.7' into =
regulator-next)
Merging security/next-testing (10c2d111c906 security: remove EARLY_LSM_COUN=
T which never used)
Merging apparmor/apparmor-next (01df52d726b5 apparmor: remove duplicate che=
ck of xattrs on profile attachment.)
Merging integrity/next-integrity (d54e17b40666 Merge branch 'next-integrity=
.defer-measuring-keys' into next-integrity)
Merging keys/keys-next (bda7978b1956 Merge branch 'keys-acl' into keys-next)
Merging selinux/next (253050f57c7a selinux: factor out loop body from filen=
ame_trans_read())
CONFLICT (content): Merge conflict in security/selinux/ss/services.c
CONFLICT (content): Merge conflict in security/selinux/include/security.h
CONFLICT (content): Merge conflict in security/selinux/hooks.c
Merging smack/for-next (92604e825304 smack: use GFP_NOFS while holding inod=
e_smack::smk_lock)
Merging tomoyo/master (bb6d3fb354c5 Linux 5.6-rc1)
Merging tpmdd/next (7307384af28c tpm: Revert tpm_tis_spi_mod.ko to tpm_tis_=
spi.ko.)
Merging watchdog/master (057b52b4b3d5 watchdog: da9062: make restart handle=
r atomic safe)
Merging iommu/next (e3b5ee0cfb65 Merge branches 'iommu/fixes', 'arm/smmu', =
'x86/amd', 'x86/vt-d' and 'core' into next)
Merging vfio/next (7b5372ba04ca vfio: platform: fix __iomem in vfio_platfor=
m_amdxgbe.c)
Merging audit/next (70b3eeed49e8 audit: CONFIG_CHANGE don't log internal bo=
okkeeping as an event)
Merging devicetree/for-next (90aeca875f8a dt-bindings: display: Convert etn=
aviv to json-schema)
CONFLICT (modify/delete): Documentation/devicetree/bindings/display/etnaviv=
/etnaviv-drm.txt deleted in devicetree/for-next and modified in HEAD. Versi=
on HEAD of Documentation/devicetree/bindings/display/etnaviv/etnaviv-drm.tx=
t left in tree.
$ git rm -f Documentation/devicetree/bindings/display/etnaviv/etnaviv-drm.t=
xt
Merging mailbox/mailbox-for-next (c6c6bc6ea9fc mailbox: imx: add support fo=
r imx v1 mu)
Merging spi/for-next (4639f5458b84 Merge branch 'spi-5.7' into spi-next)
Merging tip/auto-latest (3dd52b69caf4 Merge branch 'perf/urgent')
Merging clockevents/timers/drivers/next (e4c3b4213b79 clocksource/hyperv: S=
et TSC clocksource as default w/ InvariantTSC)
Merging edac/edac-for-next (4d59588c09f2 EDAC/sysfs: Remove csrow objects o=
n errors)
Merging irqchip/irq/irqchip-next (5186a6cc3ef5 irqchip/gic-v3-its: Rename V=
PENDBASER/VPROPBASER accessors)
Merging ftrace/for-next (7276531d4036 tracing: Consolidate trace() function=
s)
Merging rcu/rcu/next (508332b08c08 kcsan, trace: Make KCSAN compatible with=
 tracing)
Merging kvm/linux-next (ead68df94d24 KVM: x86: enable -Werror)
Merging kvm-arm/next (51b2569402a3 KVM: arm/arm64: Fix up includes for trac=
e.h)
Merging kvm-ppc/kvm-ppc-next (fd24a8624eb2 KVM: PPC: Book3S PR: Fix -Werror=
=3Dreturn-type build failure)
Merging kvms390/next (b35e8878e1d3 KVM: s390/interrupt: do not pin adapter =
interrupt pages)
Merging xen-tip/linux-next (8557bbe5156e xen/blkback: Consistently insert o=
ne empty line between functions)
Merging percpu/for-next (9391e7a9a1e2 Merge branch 'for-5.6' into for-next)
Merging workqueues/for-next (1cd27003497a workqueue: don't use wq_select_un=
bound_cpu() for bound works)
Merging drivers-x86/for-next (7adb1e8aeeb5 platform/x86: intel_pmc_core: Ad=
d debugfs support to access live status registers)
Merging chrome-platform/for-next (42cd0ab476e2 platform/chrome: cros_ec: Qu=
ery EC protocol version if EC transitions between RO/RW)
Merging hsi/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging leds/for-next (260718b3a35d leds: lm3692x: Disable chip on brightne=
ss 0)
Merging ipmi/for-next (7342db125413 drivers: char: ipmi: ipmi_msghandler: P=
ass lockdep expression to RCU lists)
Merging driver-core/driver-core-next (901cff7cb961 firmware_loader: load fi=
les from the mount namespace of init)
Merging usb/usb-next (ca065bf12771 USB: apple-mfi-fastcharge: fix endianess=
 issue in probe)
Merging usb-gadget/next (bb6d3fb354c5 Linux 5.6-rc1)
Merging usb-serial/usb-next (2c0bee081315 USB: serial: digi_acceleport: rem=
ove redundant assignment to pointer priv)
Merging usb-chipidea-next/ci-for-usb-next (4d6141288c33 usb: chipidea: imx:=
 pinctrl for HSIC is optional)
Merging phy-next/next (a5c86c557fe9 phy: mapphone-mdm6600: Fix write timeou=
ts with shorter GPIO toggle interval)
Merging tty/tty-next (02042a4cf472 serial: 8250_pci: Replace zero-length ar=
ray with flexible-array member)
Merging char-misc/char-misc-next (239a5791ffd5 dynamic_debug: allow to work=
 if debugfs is disabled)
Merging extcon/extcon-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging soundwire/next (bfaa3549541c soundwire: stream: don't program ports=
 when a stream that has not been prepared)
Merging thunderbolt/next (3084ea9ea889 thunderbolt: icm: Replace zero-lengt=
h array with flexible-array member)
Merging staging/staging-next (8ef0c4f06432 Revert "staging/octeon: Mark Eth=
ernet driver as BROKEN")
CONFLICT (content): Merge conflict in MAINTAINERS
Merging mux/for-next (f356d58c3a04 Merge branch 'i2c-mux/for-next' into for=
-next)
Merging icc/icc-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging slave-dma/next (acd624185d20 dmaengine: ti: dma-crossbar: convert t=
o devm_platform_ioremap_resource())
Merging cgroup/for-next (9bd5910d7f3d selftests/cgroup: add tests for cloni=
ng into cgroups)
Merging scsi/for-next (145e5a8a5cbd scsi: lpfc: Copyright updates for 12.6.=
0.4 patches)
Merging scsi-mkp/for-next (145e5a8a5cbd scsi: lpfc: Copyright updates for 1=
2.6.0.4 patches)
Merging vhost/linux-next (370e2c82a4a5 vhost: use batched version by defaul=
t)
Merging rpmsg/for-next (5a87e60312a9 Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (53803ecac78b Merge branch 'devel' into for-next)
Merging gpio-brgl/gpio/for-next (33f0c47b8fb4 tools: gpio: implement gpio-w=
atch)
Merging gpio-intel/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging pinctrl/for-next (c93214689f0c MAINTAINERS: Sort entries in databas=
e for PIN CONTROLLER)
Merging pinctrl-intel/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging pinctrl-samsung/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging pwm/for-next (9871abffc810 pwm: Remove set but not set variable 'pw=
m')
Merging userns/for-next (61a47c1ad3a4 sysctl: Remove the sysctl system call)
Merging ktest/for-next (9b5f852ae20d ktest: Make default build option oldco=
nfig not randconfig)
Merging random/dev (4cb760b02419 s390x: Mark archrandom.h functions __must_=
check)
Merging kselftest/next (3032e3a7c7e3 selftests/resctrl: Add the test in MAI=
NTAINERS)
Merging y2038/y2038 (c4e71212a245 Revert "drm/etnaviv: reject timeouts with=
 tv_nsec >=3D NSEC_PER_SEC")
Merging livepatching/for-next (d28b4c1b2b3d Merge branch 'for-5.6/selftests=
' into for-next)
Merging coresight/next (bb6d3fb354c5 Linux 5.6-rc1)
Merging rtc/rtc-next (4594d082dbe6 rtc: zynqmp: Clear alarm interrupt statu=
s before interrupt enable)
Merging nvdimm/libnvdimm-for-next (46cf053efec6 Linux 5.5-rc3)
Merging at24/at24/for-next (4837621cd61e eeprom: at24: add TPF0001 ACPI ID =
for 24c1024 device)
Merging ntb/ntb-next (1ef512b16bc8 NTB: Fix an error in get link status)
Merging kspp/for-next/kspp (c79f46a28239 Linux 5.5-rc5)
Merging cisco/for-next (9e98c678c2d6 Linux 5.1-rc1)
Merging gnss/gnss-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging fsi/next (2c01397b71c5 fsi: aspeed: Fix OPB0 byte order register va=
lues)
CONFLICT (content): Merge conflict in drivers/fsi/Kconfig
Merging slimbus/for-next (526eaf5d08a2 slimbus: Use the correct style for S=
PDX License Identifier)
Merging nvmem/for-next (4a81ae0c43bc nvmem: add QTI SDAM driver)
Merging xarray/xarray (3a00e7c47c38 ida: remove abandoned macros)
Merging hyperv/hyperv-next (54e19d34011f hv_utils: Add the support of hiber=
nation)
Merging auxdisplay/auxdisplay (54ecb8f7028c Linux 5.4-rc1)
Merging kgdb/kgdb/for-next (fcf2736c82ca Revert "kdb: Get rid of confusing =
diag msg from "rd" if current task has no regs")
Merging pidfd/for-next (8d19f1c8e193 prctl: PR_{G,S}ET_IO_FLUSHER to suppor=
t controlling memory reclaim)
Merging devfreq/devfreq-next (a454401a57ed PM / devfreq: Change to DEVFREQ_=
GOV_UPDATE_INTERVAL event name)
Merging hmm/hmm (bb6d3fb354c5 Linux 5.6-rc1)
Merging fpga/for-next (28910cee898c fpga: xilinx-pr-decoupler: Remove clk_g=
et error message for probe defer)
Merging kunit/test (bb6d3fb354c5 Linux 5.6-rc1)
Merging cel/cel-next (a99d8080aaf3 Linux 5.4-rc6)
Merging kasan-bitops/topic/kasan-bitops (4f4afc2c9599 docs/core-api: Remove=
 possibly confusing sub-headings from Bit Operations)
Merging generic-ioremap/for-next (4bdc0d676a64 remove ioremap_nocache and d=
evm_ioremap_nocache)
Merging kunit-next/kunit (e20d8e81a0e0 Documentation: kunit: fixed sphinx e=
rror in code block)
Merging akpm-current/current (517b5dc37962 init/Kconfig: clean up ANON_INOD=
ES and old IO schedulers options)
CONFLICT (content): Merge conflict in arch/m68k/include/asm/Kbuild
CONFLICT (content): Merge conflict in arch/csky/include/asm/Kbuild
$ git checkout -b akpm remotes/origin/akpm/master
Applying: mm/frontswap: mark various intentional data races
Applying: mm/page_io: mark various intentional data races
Applying: mm-page_io-mark-various-intentional-data-races-v2
Applying: mm/swap_state: mark various intentional data races
Applying: mm/kmemleak: annotate various data races obj->ptr
Applying: mm/filemap.c: fix a data race in filemap_fault()
Applying: mm/swapfile: fix and annotate various data races
Applying: mm-swapfile-fix-and-annotate-various-data-races-v2
Applying: mm/page_counter: fix various data races at memsw
Applying: mm/memcontrol: fix a data race in scan count
Applying: mm/list_lru: fix a data race in list_lru_count_one
Applying: mm/mempool: fix a data race in mempool_free()
Applying: mm/util.c: annotate an data race at vm_committed_as
Applying: mm/rmap: annotate a data race at tlb_flush_batched
Applying: drivers/tty/serial/sh-sci.c: suppress warning
Applying: drivers/media/platform/sti/delta/delta-ipc.c: fix read buffer ove=
rflow
Merging akpm/master (13d06fbc4958 drivers/media/platform/sti/delta/delta-ip=
c.c: fix read buffer overflow)
Applying: Revert "net-zerocopy-use-vm_insert_pages-for-tcp-rcv-zerocopy-fix"
Applying: Revert "net-zerocopy: use vm_insert_pages() for tcp rcv zerocopy"
Applying: Revert "add missing page_count() check to vm_insert_pages()."
Applying: Revert "mm-add-vm_insert_pages-fix"
Applying: Revert "mm/memory.c: add vm_insert_pages()"
Applying: hugetlb: fix CONFIG_CGROUP_HUGETLB ifdefs

--Sig_/d597+_VL4P4dCauyO2=L=dC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5KFC0ACgkQAVBC80lX
0GyuRgf/aAZzumEF8AyBi+qpwXzVFZUe1oOd0RKFhO8nBzIGtSSI9A68QVEyOi1Z
hGIFNn0Ob5HxCCpHjz/ntpjnuCsVTsf01W1sAlWRcv75i80OiKpYhUeTbzyp3/lr
zlKJes7qcMpYtfwGkjS6IIZDeYby4Y0doXHKzbp9/8erV9ABtp9ZIIb7Iq9EiIW4
SzF87TGQH3dBLw9V2zCHbyhxagWmCHFKTkz6FdkH+p9LJAsGPztgwXfQq3npik+C
mNMVmZHhfoBfi+fFlH3bAQE0RW8mSk/Yj/nEfagqMGpKuTYt54n9URXJl/czgw7G
r7qfrFNkK/zf6OZ9XYrLt276FJQMVw==
=lkZs
-----END PGP SIGNATURE-----

--Sig_/d597+_VL4P4dCauyO2=L=dC--
