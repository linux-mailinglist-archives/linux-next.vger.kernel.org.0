Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BE902C01F9
	for <lists+linux-next@lfdr.de>; Mon, 23 Nov 2020 10:06:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726979AbgKWJDH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 23 Nov 2020 04:03:07 -0500
Received: from ozlabs.org ([203.11.71.1]:33119 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726865AbgKWJDG (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 23 Nov 2020 04:03:06 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cfh4y1Rkjz9sTL;
        Mon, 23 Nov 2020 20:02:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606122178;
        bh=2lSeIYa9y3w8lFGRUZNFywauehlEtb1xs329eMg4kLg=;
        h=Date:From:To:Cc:Subject:From;
        b=qIHVuH8fCGYnaZ3bp9/46wG3kAhwDVaj9iTfqOgAljd88gqHIqpgHAGpOeYD8SoG/
         ciloURnT4fh9XhlWC0hcGRs7ytzae6R9UG7+TFPpFm+5v3gPa197zHJMxxLuknPPpm
         wxVY21ienTp3usFdCXZ+K+XkBVfjXpjiGLdNUrm5xB8hOmi5KLYWOa1gIo3QYh7J2/
         ivYqhXmxUhta1wBsJx9jm3MIU5f9Dfk0LeTVwaJIUJHt2WfUUeOj7Fd9viGxvX8F/E
         xbghHk4KmeVQFdEQku3gBfjbsHve3ea5veuBusilftuVo8eHhQ+DwgePuBZ764Wo9/
         6JlXrIBtRfMxA==
Date:   Mon, 23 Nov 2020 20:02:57 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Nov 23
Message-ID: <20201123200257.0bc68ac3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bZtuzaz/7F6bA3m/.XZfLoS";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/bZtuzaz/7F6bA3m/.XZfLoS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20201120:

Linus' tree gained a build failure for which I applied a patch.

The tip tree gained a conflict against the cpupower tree.

The akpm-current tree gained a conflict against the tip tree.

Non-merge commits (relative to Linus' tree): 6791
 6784 files changed, 580241 insertions(+), 111219 deletions(-)

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

I am currently merging 327 trees (counting Linus' and 85 trees of bug
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
Merging origin/master (a349e4c65960 Merge tag 'xfs-5.10-fixes-7' of git://g=
it.kernel.org/pub/scm/fs/xfs/xfs-linux)
Merging fixes/fixes (9123e3a74ec7 Linux 5.9-rc1)
Merging kbuild-current/fixes (d1889589a4f5 builddeb: Fix rootless build in =
setuid/setgid directory)
Merging arc-current/for-curr (3b57533b460c ARC: [plat-hsdk] Remap CCMs supe=
r early in asm boot trampoline)
Merging arm-current/fixes (9fa2e7af3d53 ARM: 9019/1: kprobes: Avoid fortify=
_panic() when copying optprobe template)
Merging arm64-fixes/for-next/fixes (23c216416056 arm64: cpu_errata: Apply E=
rratum 845719 to KRYO2XX Silver)
Merging arm-soc-fixes/arm/fixes (cc05af8e2e91 Merge tag 'imx-fixes-5.10-4' =
of git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into arm/fi=
xes)
Merging drivers-memory-fixes/fixes (3650b228f83a Linux 5.10-rc1)
Merging m68k-current/for-linus (50c5feeea0af ide/macide: Convert Mac IDE dr=
iver to platform driver)
Merging powerpc-fixes/fixes (cd81acc600a9 powerpc/64s/exception: KVM Fix fo=
r host DSI being taken in HPT guest MMU context)
Merging s390-fixes/fixes (78d732e1f326 s390/cpum_sf.c: fix file permission =
for cpum_sfb_size)
Merging sparc/master (0a95a6d1a4cd sparc: use for_each_child_of_node() macr=
o)
Merging fscrypt-current/for-stable (d19d8d345eec fscrypt: fix inline encryp=
tion not used on new files)
Merging net/master (f9b036532108 Merge branch 'ibmvnic-fixes-in-reset-path')
Merging bpf/master (537cf4e3cc2f xsk: Fix umem cleanup bug at socket destru=
ct)
Merging ipsec/master (48f486e13ffd net: xfrm: fix memory leak in xfrm_user_=
policy())
Merging netfilter/master (986fbd9842ba netfilter: nf_tables: avoid false-po=
stive lockdep splat)
Merging ipvs/master (986fbd9842ba netfilter: nf_tables: avoid false-postive=
 lockdep splat)
Merging wireless-drivers/master (fe56d05ee6c8 iwlwifi: mvm: fix kernel pani=
c in case of assert during CSA)
Merging mac80211/master (849920c70339 devlink: Add missing genlmsg_cancel()=
 in devlink_nl_sb_port_pool_fill())
Merging rdma-fixes/for-rc (ee415d73dcc2 tools/testing/scatterlist: Fix test=
 to compile and run)
Merging sound-current/for-linus (92666d45adcf ALSA: hda/realtek - Fixed Del=
l AIO wrong sound tone)
Merging sound-asoc-fixes/for-linus (5f6a9f110842 Merge remote-tracking bran=
ch 'asoc/for-5.10' into asoc-linus)
Merging regmap-fixes/for-linus (3650b228f83a Linux 5.10-rc1)
Merging regulator-fixes/for-linus (2ba546ebe0ce regulator: ti-abb: Fix arra=
y out of bound read access on the first transition)
Merging spi-fixes/for-linus (df3d781dfab3 Merge remote-tracking branch 'spi=
/for-5.10' into spi-linus)
Merging pci-current/for-linus (cce14622a703 PCI: Add function 1 DMA alias q=
uirk for Marvell 9215 SATA controller)
Merging driver-core.current/driver-core-linus (f8394f232b1e Linux 5.10-rc3)
Merging tty.current/tty-linus (425af483523b serial: ar933x_uart: disable cl=
k on error handling path in probe)
Merging usb.current/usb-linus (f3bc432aa8a7 USB: core: Change %pK for __use=
r pointers to %px)
Merging usb-gadget-fixes/fixes (129aa9734559 usb: raw-gadget: fix memory le=
ak in gadget_setup)
Merging usb-serial-fixes/usb-linus (5e4d659b10fd USB: serial: option: add F=
ibocom NL668 variants)
Merging usb-chipidea-fixes/for-usb-fixes (7b7f84797023 usb: cdns3: gadget: =
calculate TD_SIZE based on TD)
Merging phy/fixes (fb89b2544b64 phy: mediatek: fix spelling mistake in Kcon=
fig "veriosn" -> "version")
Merging staging.current/staging-linus (2dde2821b57f Merge tag 'iio-fixes-fo=
r-5.10a' of https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio into =
staging-linus)
Merging char-misc.current/char-misc-linus (09162bc32c88 Linux 5.10-rc4)
Merging soundwire-fixes/fixes (3650b228f83a Linux 5.10-rc1)
Merging thunderbolt-fixes/fixes (600c0849cf86 thunderbolt: Fix use-after-fr=
ee in remove_unplugged_switch())
Merging input-current/for-linus (ae3d6083acf6 Input: elan_i2c - fix firmwar=
e update on newer ICs)
Merging crypto-current/master (c3a98c3ad5c0 crypto: x86/poly1305 - add back=
 a needed assignment)
Merging ide/master (6800cd8cbc6e ide-acpi: use %*ph to print small buffer)
Merging vfio-fixes/for-linus (e4eccb853664 vfio/pci: Bypass IGD init in cas=
e of -ENODEV)
Merging kselftest-fixes/fixes (7d764b685ee1 selftests: binderfs: use SKIP i=
nstead of XFAIL)
Merging modules-fixes/modules-linus (57baec7b1b04 scripts/nsdeps: make sure=
 to pass all module source files to spatch)
Merging dmaengine-fixes/fixes (7e4be1290a38 dmaengine: fix error codes in c=
hannel_register())
Merging backlight-fixes/for-backlight-fixes (bbf5c979011a Linux 5.9)
Merging mtd-fixes/mtd/fixes (b36bf0a0fe5d mtd: rawnand: socrates: Move the =
ECC initialization to ->attach_chip())
Merging mfd-fixes/for-mfd-fixes (bbf5c979011a Linux 5.9)
Merging v4l-dvb-fixes/fixes (9215f6bb4705 media: venus: pm_helpers: Fix ker=
nel module reload)
Merging reset-fixes/reset/fixes (b460e0a9e240 reset: intel: add unspecified=
 HAS_IOMEM dependency)
Merging mips-fixes/mips-fixes (ac3b57adf87a MIPS: Alchemy: Fix memleak in a=
lchemy_clk_setup_cpu)
Merging at91-fixes/at91-fixes (54ecb8f7028c Linux 5.4-rc1)
Merging omap-fixes/fixes (05d5de6ba7db ARM: dts: dra76x: m_can: fix order o=
f clocks)
Merging kvm-fixes/master (c2b1209d852f MAINTAINERS: Update email address fo=
r Sean Christopherson)
Merging kvms390-fixes/master (735931f9a51a MAINTAINERS: add uv.c also to KV=
M/s390)
Merging hwmon-fixes/hwmon (60268b0e8258 hwmon: (amd_energy) modify the visi=
bility of the counters)
Merging nvdimm-fixes/libnvdimm-fixes (88b67edd7247 dax: Fix compilation for=
 CONFIG_DAX && !CONFIG_FS_DAX)
Merging btrfs-fixes/next-fixes (46630599693a Merge branch 'misc-5.10' into =
next-fixes)
Merging vfs-fixes/fixes (4bbf439b09c5 fix return values of seq_read_iter())
Merging dma-mapping-fixes/for-linus (892fc9f6835e dma-pool: Fix an uninitia=
lized variable bug in atomic_pool_expand())
Merging i3c-fixes/master (6fbc7275c7a9 Linux 5.2-rc7)
Merging drivers-x86-fixes/fixes (3650b228f83a Linux 5.10-rc1)
Merging samsung-krzk-fixes/fixes (cd12e4f14f7c CREDITS: remove trailing whi=
te spaces)
Merging pinctrl-samsung-fixes/fixes (3650b228f83a Linux 5.10-rc1)
Merging devicetree-fixes/dt/linus (bdac39a3bd28 dt-bindings: clock: imx5: f=
ix example)
Merging scsi-fixes/fixes (e92643db5148 scsi: ufs: Fix race between shutdown=
 and runtime resume flow)
Merging drm-fixes/drm-fixes (6600f9d52213 Merge tag 'drm-intel-fixes-2020-1=
1-19' of git://anongit.freedesktop.org/drm/drm-intel into drm-fixes)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (be33805c6529 drm/i915/gt: Fix=
up tgl mocs for PTE tracking)
Merging mmc-fixes/fixes (d06d60d52ec0 mmc: sdhci-of-arasan: Issue DLL reset=
 explicitly)
Merging rtc-fixes/rtc-fixes (9123e3a74ec7 Linux 5.9-rc1)
Merging gnss-fixes/gnss-linus (48778464bb7d Linux 5.8-rc2)
Merging hyperv-fixes/hyperv-fixes (5f1251a48c17 video: hyperv_fb: Fix the c=
ache type when mapping the VRAM)
Merging soc-fsl-fixes/fix (fe8fe7723a3a soc: fsl: dpio: register dpio irq h=
andlers after dpio create)
Merging risc-v-fixes/fixes (f52c08ea5fc8 RISC-V: fix barrier() use in <vdso=
/processor.h>)
Merging pidfd-fixes/fixes (aabe19b82793 nsproxy: use put_nsproxy() in switc=
h_task_namespaces())
Merging fpga-fixes/fixes (8614afd689df fpga: dfl: fix bug in port reset han=
dshake)
Merging spdx/spdx-linus (3cea11cd5e3b Linux 5.10-rc2)
Merging gpio-intel-fixes/fixes (3650b228f83a Linux 5.10-rc1)
Merging pinctrl-intel-fixes/fixes (5f714771d01e pinctrl: baytrail: Avoid cl=
earing debounce value when turning it off)
Merging erofs-fixes/fixes (a30573b3cdc7 erofs: fix setting up pcluster for =
temporary pages)
Merging integrity-fixes/fixes (843385694721 evm: Fix a small race in init_d=
esc())
Merging kunit-fixes/kunit-fixes (3084db0e0d50 kunit: fix display of failed =
expectations for strings)
Merging ubifs-fixes/fixes (78c7d49f55d8 ubifs: journal: Make sure to not di=
rty twice for auth nodes)
Merging memblock-fixes/fixes (b9bc36704cca ARM, xtensa: highmem: avoid clob=
bering non-page aligned memory reservations)
Merging drm-misc-fixes/for-linux-next-fixes (9fa1d7e60ad5 drm/vc4: hdmi: Di=
sable Wifi Frequencies)
Merging kspp-gustavo/for-next/kspp (36f9ff9e03de lib: Fix fall-through warn=
ings for Clang)
Merging kbuild/for-next (729e39a558eb kconfig: qconf: convert to Qt5 new si=
gnal/slot connection syntax)
Merging compiler-attributes/compiler-attributes (bbf5c979011a Linux 5.9)
Merging dma-mapping/for-next (48ab6d5d1f09 dma-mapping: fix 32-bit overflow=
 with CONFIG_ARM_LPAE=3Dn)
Merging asm-generic/master (8eb42bcea5ae Merge branch 'asm-generic-fixes' i=
nto asm-generic)
Merging arc/for-next (def9d2780727 Linux 5.5-rc7)
Merging arm/for-next (40bd54f12902 Merge branch 'devel-stable' into for-nex=
t)
Merging arm64/for-next/core (6b2bcbc5e3e0 Merge branch 'for-next/zone-dma-d=
efault-32-bit' into for-next/core)
Merging arm-perf/for-next/perf (887e2cff0f8d perf: arm-cmn: Fix conversion =
specifiers for node type)
Merging arm-soc/for-next (0d4a574f4e88 ARM: soc: document merges)
Merging amlogic/for-next (84a1411c7549 Merge branch 'v5.11/soc' into tmp/am=
l-rebuild)
Merging aspeed/for-next (41707a524026 Merge branches 'soc-for-v5.11' and 'd=
efconfig-for-v5.11' into for-next)
Merging at91/at91-next (0698efbb33ef Merge branches 'at91-soc', 'at91-dt' a=
nd 'at91-defconfig' into at91-next)
Merging drivers-memory/for-next (16228a46431a Merge branch 'for-v5.11/tegra=
-mc' into for-next)
Merging imx-mxs/for-next (24462a1e187c Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (b2a8f6ce4bdc Merge branch 'for_5.11/drivers-soc' int=
o next)
Merging mediatek/for-next (9c6658a0dd4f Merge branch 'v5.10-next/soc' into =
for-next)
Merging mvebu/for-next (f89c9685f6a1 Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (934c2dcf11c2 Merge branch 'omap-for-v5.11/soc' into =
for-next)
Merging qcom/for-next (d475c5711690 Merge branches 'arm64-for-5.11', 'arm64=
-defconfig-for-5.11', 'drivers-for-5.11' and 'dts-for-5.11' into for-next)
Merging raspberrypi/for-next (278407a53c3b ARM: dts: bcm283x: increase dwc2=
's RX FIFO size)
Merging realtek/for-next (486f29df6941 Merge branch 'v5.8/dt' into next)
Merging renesas/next (6215772bbe58 Merge branches 'renesas-arm-defconfig-fo=
r-v5.11' and 'renesas-arm-dt-for-v5.11' into renesas-next)
Merging reset/reset/next (3bfe8933f9d1 reset: meson: make it possible to bu=
ild as a module)
Merging rockchip/for-next (db4d9df43533 Merge branch 'v5.11-armsoc/drivers'=
 into for-next)
Merging samsung-krzk/for-next (66d6c136ac59 Merge branch 'next/dt' into for=
-next)
Merging scmi/for-linux-next (2cc906837637 Merge branch 'for-next/scmi-volta=
ge' of git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux int=
o for-linux-next)
Merging stm32/stm32-next (1926d571a413 ARM: dts: stm32: lxa-mc1: add OSD32M=
P15x to list of compatibles)
Merging sunxi/sunxi/for-next (12f6c7209fc3 Merge branch 'sunxi/dt-for-5.11'=
 into sunxi/for-next)
Merging tegra/for-next (cb2bdf8a18e7 Merge branch for-5.11/arm64/defconfig =
into for-next)
Merging ti-k3/ti-k3-next (1e3d655fe7b4 Merge branch 'ti-k3-config-next' int=
o ti-k3-next)
Merging ti-k3-new/ti-k3-next (5d8609e574be Merge branch 'ti-k3-dts-next' in=
to ti-k3-next)
Merging clk/clk-next (9dc1f9729380 Merge branch 'clk-qcom' into clk-next)
Merging clk-samsung/for-next (3650b228f83a Linux 5.10-rc1)
Merging csky/linux-next (d09101cb3c22 csky: Fixup show_regs doesn't contain=
 regs->usp)
Merging h8300/h8300-next (8808515be0ed h8300: Replace <linux/clk-provider.h=
> by <linux/of_clk.h>)
Merging ia64/next (c331649e6371 ia64: Use libata instead of the legacy ide =
driver in defconfigs)
Merging m68k/for-next (8ae0b65ac7e5 m68k: defconfig: Enable KUnit tests)
Merging m68knommu/for-next (509d8f92343a m68k: m68328: remove duplicate cod=
e)
Merging microblaze/next (e167a59c654a microblaze: Replace <linux/clk-provid=
er.h> by <linux/of_clk.h>)
Merging mips/mips-next (91c7a7e0656d MIPS: Loongson64: Fix wrong scache siz=
e when execute lscpu)
Merging nds32/next (54bde873682b nds32: Fix bogus reference to <asm/procinf=
o.h>)
Merging nios2/for-next (6b57fa4d374b nios2: signal: Mark expected switch fa=
ll-through)
Merging openrisc/for-next (d8398bf840f8 openrisc: add local64.h to fix blk-=
iocost build)
Merging parisc-hd/for-next (19621e5fd02b parisc: Switch to clockevent based=
 timers)
CONFLICT (content): Merge conflict in arch/parisc/kernel/time.c
Applying: revert the rest of "parisc: use legacy_timer_tick"
Merging powerpc/next (3cea11cd5e3b Linux 5.10-rc2)
Merging fsl/next (a76bea0287ce powerpc/kmcent2: add ranges to the pci bridg=
es)
Merging soc-fsl/next (d97b957e32b1 soc: fsl: qe: Remove unnessesary check i=
n ucc_set_tdm_rxtx_clk)
Merging risc-v/for-next (31564b8b6dba riscv: Add HAVE_IRQ_TIME_ACCOUNTING)
Merging s390/for-next (65b66076b315 Merge branch 'features' into for-next)
Merging sh/for-next (b0cfc315ff38 sh: fix syscall tracing)
Merging sparc-next/master (dd0d718152e4 Merge tag 'spi-fix-v5.8-rc2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging uml/linux-next (9a5085b3fad5 um: Call pgtable_pmd_page_dtor() in __=
pmd_free_tlb())
Merging xtensa/xtensa-for-next (dc293f210690 xtensa: uaccess: Add missing _=
_user to strncpy_from_user() prototype)
Merging fscrypt/master (3ceb6543e9cf fscrypt: remove kernel-internal consta=
nts from UAPI header)
Merging afs/afs-next (8409f67b6437 afs: Adjust the fileserver rotation algo=
rithm to reprobe/retry more quickly)
Merging btrfs/for-next (1885c92fa4d7 Merge branch 'for-next-next-v5.10-2020=
1116' into for-next-20201116)
Merging ceph/master (62575e270f66 ceph: check session state after bumping s=
ession->s_seq)
Merging cifs/for-next (1254100030b3 smb3: Handle error case during offload =
read path)
Merging configfs/for-next (65cdb4a214c0 configfs: fix kernel-doc markup iss=
ue)
Merging ecryptfs/next (8b614cb8f1dc Merge tag '5.6-rc4-smb3-fixes' of git:/=
/git.samba.org/sfrench/cifs-2.6)
Merging erofs/dev (1b2b66d55670 erofs: remove a void EROFS_VERSION macro se=
t in Makefile)
Merging exfat/dev (f9893351acae Merge tag 'kconfig-v5.10' of git://git.kern=
el.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild)
Merging ext3/for_next (d5dc76f9bb43 Merge ext2 cleanup from Ira Weiny.)
Merging ext4/dev (f902b2165010 ext4: fix bogus warning in ext4_update_dx_fl=
ag())
Merging f2fs/dev (6a4f706572b5 f2fs: Handle casefolding with Encryption)
Merging fsverity/fsverity (3410d9296a27 fs-verity: move structs needed for =
file signing to UAPI header)
Merging fuse/for-next (9d769e6aa252 fuse: support SB_NOSEC flag to improve =
write performance)
Merging jfs/jfs-next (c61b3e483900 jfs: Fix array index bounds check in dbA=
djTree)
Merging nfs/linux-next (4d02da974ea8 Merge tag 'net-5.10-rc5' of git://git.=
kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging nfs-anna/linux-next (11decaf8127b NFS: Remove unnecessary inode loc=
k in nfs_fsync_dir())
Merging nfsd/nfsd-next (c3213d260a23 SUNRPC: Fix oops in the rpc_xdr_buf ev=
ent class)
Merging cel/cel-next (390e71f29622 NFSD: Add SPDX header for fs/nfsd/trace.=
c)
Merging orangefs/for-next (e848643b524b orangefs: remove unnecessary assign=
ment to variable ret)
Merging overlayfs/overlayfs-next (c11faf32599f ovl: fix incorrect extent in=
fo in metacopy case)
Merging ubifs/next (e2a05cc7f822 ubifs: mount_ubifs: Release authentication=
 resource in error handling path)
Merging v9fs/9p-next (5bfe97d7382b 9p: Fix writeback fid incorrectly being =
attached to dentry)
Merging xfs/for-next (eb8409071a1d xfs: revert "xfs: fix rmap key and recor=
d comparison functions")
Merging zonefs/for-next (48bfd5c6fac1 zonefs: document the explicit-open mo=
unt option)
Merging iomap/iomap-for-next (1a31182edd00 iomap: Call inode_dio_end() befo=
re generic_write_sync())
Merging djw-vfs/vfs-for-next (9b8523423b23 vfs: move __sb_{start,end}_write=
* to fs.h)
Merging file-locks/locks-next (8d1ddb5e7937 fcntl: Fix potential deadlock i=
n send_sig{io, urg}())
Merging vfs/for-next (61c207915a76 Merge branches 'work.sparc', 'work.epoll=
', 'work.sparc32' and 'regset.followup' into for-next)
Merging printk/for-next (8eb431c1f8e2 Merge branch 'for-5.11-null-console' =
into for-next)
Merging pci/next (3e1f5615aa51 Merge branch 'remotes/lorenzo/pci/misc')
Merging pstore/for-next/pstore (137c6236aeec mailmap: Add WeiXiong Liao)
CONFLICT (content): Merge conflict in .mailmap
Merging hid/for-next (292cbdcc69fe Merge branch 'for-5.10/upstream-fixes' i=
nto for-next)
Merging i2c/i2c/for-next (c97e7615c15b Merge branch 'i2c/for-current' into =
i2c/for-next)
Merging i3c/i3c/next (abea14bfdebb i3c: master: Fix error return in cdns_i3=
c_master_probe())
Merging dmi/dmi-for-next (3cb4d29a2633 MAINTAINERS: The DMI/SMBIOS tree has=
 moved)
Merging hwmon-staging/hwmon-next (232937dc3569 docs: hwmon: (amd_energy) up=
date documentation)
Merging jc_docs/docs-next (ac7711427014 doc:it_IT: align Italian documentat=
ion)
Merging v4l-dvb/master (9463e07df8e0 media: v4l2-compat-ioctl32.c: add miss=
ing #ifdef CONFIG_COMPAT_32BIT_TIMEs)
CONFLICT (content): Merge conflict in drivers/media/platform/marvell-ccic/m=
mp-driver.c
Merging v4l-dvb-next/master (d0a9fffedca1 docs: fs: api-summary.rst: get ri=
d of kernel-doc include)
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (e98c22d03688 Merge branches 'acpi-misc' and 'acpi-re=
sources' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (32c855670808 cpufreq: vexpress-=
spc: Add missing MODULE_ALIAS)
Merging cpupower/cpupower (748f0d70087c cpupower: Provide online and offlin=
e CPU information)
Merging devfreq/devfreq-next (404d59c57b26 PM / devfreq: exynos-bus: Add re=
gistration of interconnect child device)
Merging opp/opp/linux-next (ed40e33c0b91 opp: Reduce the size of critical s=
ection in _opp_kref_release())
Merging thermal/thermal/linux-next (cb68a8580e20 thermal: amlogic: Add hwmo=
n support)
Merging thermal-rzhang/next (54ecb8f7028c Linux 5.4-rc1)
Merging thermal-soc/next (6c375eccded4 thermal: db8500: Rewrite to be a pur=
e OF sensor)
Merging ieee1394/for-next (67f8e65e4fc1 firewire: net: remove set but not u=
sed variable 'guid')
Merging dlm/next (4f19d071f9be fs: dlm: check on existing node address)
Merging swiotlb/linux-next (fc0021aa340a swiotlb: remove the tbl_dma_addr a=
rgument to swiotlb_tbl_map_single)
Merging rdma/for-next (172292be01db dma-mapping: remove dma_virt_ops)
Merging net-next/master (f9e425e99b07 octeontx2-af: Add support for RSS has=
hing based on Transport protocol field)
Merging bpf-next/for-next (91b2db27d3ff bpf: Simplify task_file_seq_get_nex=
t())
Merging ipsec-next/master (8be33ecfc1ff net: skb_vlan_untag(): don't reset =
transport offset if set by GRO layer)
Merging mlx5-next/mlx5-next (3650b228f83a Linux 5.10-rc1)
Merging netfilter-next/master (988187e88103 ipvs: replace atomic_add_return=
())
Merging ipvs-next/master (0064c5c1b3bf net: xfrm: use core API for updating=
/providing stats)
Merging wireless-drivers-next/master (1ccaa898868d rtw88: coex: simplify th=
e setting and condition about WLAN TX limitation)
Merging bluetooth/master (22fbcfc54705 Bluetooth: Replace BT_DBG with bt_de=
v_dbg in HCI request)
Merging mac80211-next/master (0064c5c1b3bf net: xfrm: use core API for upda=
ting/providing stats)
Merging gfs2/for-next (38f14dd13211 MAINTAINERS: Add gfs2 bug tracker link)
Merging mtd/mtd/next (22ca56a34b32 mtd: devices: powernv_flash: Add functio=
n names to headers and fix 'dev')
Merging nand/nand/next (b86bcb8f9999 mtd: rawnand: gpmi: fix reference coun=
t leak in gpmi ops)
Merging spi-nor/spi-nor/next (ad624dfd7bb6 mtd: spi-nor: micron-st: allow u=
sing MT35XU512ABA in Octal DTR mode)
Merging crypto/master (732b764099f6 crypto: sun8i-ce - fix two error path's=
 memory leak)
Merging drm/drm-next (31b05212360c Merge branch 'linux-5.11' of git://githu=
b.com/skeggsb/linux into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/nouveau/nouveau_bo.c
Merging amdgpu/drm-next (53c0adc43baf drm/amdgpu: Enable GPU reset for vang=
ogh)
CONFLICT (content): Merge conflict in drivers/gpu/drm/radeon/radeon_drv.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_ttm=
.c
Merging drm-intel/for-linux-next (f287c536d943 drm/i915/dg1: Enable ports)
Merging drm-tegra/drm/tegra/for-next (123f01a0c989 drm/tegra: output: Do no=
t put OF node twice)
Merging drm-misc/for-linux-next (04295bc3362d video: fbdev: pm2fb: Fix fall=
-through warnings for Clang)
Merging drm-msm/msm-next (e8c765811b10 drm/msm/dp: do not notify audio subs=
ystem if sink doesn't support audio)
CONFLICT (content): Merge conflict in include/drm/drm_crtc.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/msm/msm_drv.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/msm/disp/dpu1/dpu_crt=
c.c
Applying: drm/msm/gem: fix up for "drm/msm: Introduce GEM object funcs"
Merging imx-drm/imx-drm/next (099e5bde9bd2 drm/imx: depend on COMMON_CLK to=
 fix compile tests)
Merging etnaviv/etnaviv/next (4612bad5701e drm/etnaviv: Add lockdep annotat=
ions for context lock)
Merging regmap/for-next (f7d01359b0d9 regmap: Fix order of regmap write log)
Merging sound/for-next (9ac05523d38d ALSA: emu10k1: Use dma_set_mask_and_co=
herent to simplify code)
Merging sound-asoc/for-next (35dcd5205588 Merge remote-tracking branch 'aso=
c/for-5.11' into asoc-next)
Merging modules/modules-next (24b9f0d22081 module: fix comment style)
Merging input/next (3aa40a1ad367 Input: vmmouse - demote obvious abuse of k=
ernel-doc header)
Merging block/for-next (aa75ba0daa86 Merge branch 'for-5.11/io_uring' into =
for-next)
Merging device-mapper/for-next (3f5dba110d12 dm writecache: remove BUG() an=
d fail gracefully instead)
Merging pcmcia/pcmcia-next (46d079790663 pcmcia: make pccard_loop_tuple() s=
tatic)
Merging mmc/next (506f43994d4f Merge branch 'fixes' into next)
Merging mfd/for-mfd-next (14639a22de65 mfd: cpcap: Fix interrupt regression=
 with regmap clear_ack)
Merging backlight/for-backlight-next (789eb04b6c56 backlight: pwm_bl: Fix i=
nterpolation)
Merging battery/for-next (7007fab4ae82 power: reset: POWER_RESET_OCELOT_RES=
ET should depend on Ocelot or Sparx5)
Merging regulator/for-next (6b2fb99e829e Merge remote-tracking branch 'regu=
lator/for-5.11' into regulator-next)
Merging security/next-testing (3650b228f83a Linux 5.10-rc1)
Merging apparmor/apparmor-next (e37986097ba6 apparmor: Use true and false f=
or bool variable)
Merging integrity/next-integrity (b000d5cb954f ima: defer arch_ima_get_secu=
reboot() call to IMA init time)
Merging keys/keys-next (b6f61c314649 keys: Implement update for the big_key=
 type)
Merging safesetid/safesetid-next (03ca0ec13892 LSM: SafeSetID: Fix warnings=
 reported by test bot)
Merging selinux/next (b159e86b5a2a selinux: drop super_block backpointer fr=
om superblock_security_struct)
Merging smack/next (edd615371b66 Smack: Remove unnecessary variable initial=
ization)
Merging tomoyo/master (e991a40b3d00 tomoyo: Limit wildcard recursion depth.)
Merging tpmdd/next (8ffd778aff45 tpm: efi: Don't create binary_bios_measure=
ments file for an empty log)
Merging watchdog/master (3650b228f83a Linux 5.10-rc1)
Merging iommu/next (4dd6ce478003 iommu: Fix a check in iommu_check_bind_dat=
a())
Merging audit/next (6d915476e67d audit: trigger accompanying records when n=
o rules present)
Merging devicetree/for-next (616fde2dd60f dt-bindings: misc: convert fsl,dp=
aa2-console from txt to YAML)
Merging mailbox/mailbox-for-next (c7dacf5b0f32 mailbox: avoid timer start f=
rom callback)
Merging spi/for-next (aaea98a40a13 Merge remote-tracking branch 'spi/for-5.=
11' into spi-next)
Merging tip/auto-latest (9ea041b5e564 Merge branch 'ras/core')
CONFLICT (content): Merge conflict in tools/power/cpupower/utils/helpers/mi=
sc.c
Merging clockevents/timers/drivers/next (8da10e545406 clocksource/drivers/c=
adence_ttc: Fix memory leak in ttc_setup_clockevent())
Merging edac/edac-for-next (98e017cd50c8 Merge branches 'edac-misc' and 'ed=
ac-spr' into edac-for-next)
Merging irqchip/irq/irqchip-next (74cde1a53368 irqchip/gic-v3-its: Uncondit=
ionally save/restore the ITS state on suspend)
Merging ftrace/for-next (b111545d26c0 tracing: Remove the useless value ass=
ignment in test_create_synth_event())
Merging rcu/rcu/next (bd5fc4f66b3e rcu: Record kvfree_call_rcu() call stack=
 for KASAN)
Merging kvm/linux-next (e792415c5d3e KVM: MIPS/VZ: Fix build error caused b=
y 'kvm_run' cleanup)
Merging kvm-arm/next (ed4ffaf49bf9 KVM: arm64: Handle SCXTNUM_ELx traps)
Merging kvm-ppc/kvm-ppc-next (cf59eb13e151 KVM: PPC: Book3S: Fix symbol und=
eclared warnings)
Merging kvms390/next (efc0dc59b4c3 s390/gmap: make gmap memcg aware)
Merging xen-tip/linux-next (65cae18882f9 x86/xen: don't unbind uninitialize=
d lock_kicker_irq)
Merging percpu/for-next (eb4c8d15efda Merge branch 'for-5.11' into for-next)
Merging workqueues/for-next (10cdb1575954 workqueue: use BUILD_BUG_ON() for=
 compile time test instead of WARN_ON())
Merging drivers-x86/for-next (ce99a277644c MAINTAINERS: new panasonic-lapto=
p maintainer)
Merging chrome-platform/for-next (de0f49487db3 platform/chrome: cros_ec_typ=
ec: Register partner altmodes)
Merging hsi/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging leds/for-next (6c3e42616bf2 leds: various: add missing put_device()=
 call in netxbig_leds_get_of_pdata())
Merging ipmi/for-next (368ffd9adc7a ipmi: msghandler: Suppress suspicious R=
CU usage warning)
Merging driver-core/driver-core-next (33c0c9bdf7a5 drivers: base: fix some =
kernel-doc markups)
Merging usb/usb-next (52a0372a38b4 usb: typec: Fix num_altmodes kernel-doc =
error)
Merging usb-gadget/next (b2c586eb07ef usb: dwc2: Fix INTR OUT transfers in =
DDMA mode.)
Merging usb-serial/usb-next (053af9e6e817 USB: serial: mos7720: defer state=
 restore to a workqueue)
Merging usb-chipidea-next/for-usb-next (56d0cca62371 usb: chipidea: trace: =
fix the endian issue)
Merging phy-next/next (768a711e2d4b phy: samsung: phy-exynos-pcie: fix typo=
 'tunning')
CONFLICT (content): Merge conflict in MAINTAINERS
Merging tty/tty-next (660beb0ffdc9 serial: imx: Remove unused .id_table sup=
port)
Merging char-misc/char-misc-next (93c69b2d1737 Merge 5.10-rc4 into char-mis=
c-next)
Merging extcon/extcon-next (54589b557a8d extcon: fsa9480: Support TI TSU611=
1 variant)
Merging soundwire/next (3650b228f83a Linux 5.10-rc1)
Merging thunderbolt/next (4e58171aa93f MAINTAINERS: Add Isaac as maintainer=
 of Thunderbolt DMA traffic test driver)
Merging vfio/next (2e6cfd496f5b vfio iommu type1: Fix memory leak in vfio_i=
ommu_type1_pin_pages)
Merging staging/staging-next (0d79a48440f5 staging: vt6655: Remove useless =
else)
Merging mux/for-next (05f19f7f8944 mux: adgs1408: Add mod_devicetable.h and=
 remove of_match_ptr)
Merging icc/icc-next (017496af28e2 interconnect: fix memory trashing in of_=
count_icc_providers())
Merging dmaengine/next (f74faa0ca3d5 dmaengine: imx-sdma: Remove unused .id=
_table support)
CONFLICT (content): Merge conflict in drivers/dma/idxd/submit.c
CONFLICT (content): Merge conflict in drivers/dma/idxd/registers.h
CONFLICT (content): Merge conflict in drivers/dma/idxd/device.c
Merging cgroup/for-next (65026da59cda cgroup: Zero sized write should be no=
-op)
Merging scsi/for-next (64eeea415d1f Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (6998ff4e2161 scsi: lpfc: Fix variable 'vport' se=
t but not used in lpfc_sli4_abts_err_handler())
Merging vhost/linux-next (efd838fec17b vhost scsi: Add support for LUN rese=
ts.)
Merging rpmsg/for-next (e878e1baf0ca Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (0f2c7af45d7e gpio: mxc: Convert the driver to DT-onl=
y)
Merging gpio-brgl/gpio/for-next (f52d6d8b43e5 gpio: sifive: To get gpio irq=
 offset from device tree data)
Merging gpio-intel/for-next (e709a7b5a066 gpiolib: acpi: Make Intel GPIO tr=
ee official for GPIO ACPI work)
Merging pinctrl/for-next (826def369598 Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (0b74e40a4e41 pinctrl: baytrail: Avoid clear=
ing debounce value when turning it off)
Merging pinctrl-samsung/for-next (c5564a50d990 pinctrl: samsung: s3c24xx: r=
emove unneeded break)
Merging pwm/for-next (228fe8e4deb2 pwm: keembay: Fix build failure with -Os)
Merging userns/for-next (f5c06bde8dd8 signal: define the SA_EXPOSE_TAGBITS =
bit in sa_flags)
Merging ktest/for-next (ff131efff141 ktest.pl: Fix spelling mistake "Cant" =
-> "Can't")
Merging random/dev (ab9a7e27044b random: avoid warnings for !CONFIG_NUMA bu=
ilds)
Merging kselftest/next (c2e46f6b3e35 selftests/cgroup: Fix build on older d=
istros)
Merging y2038/y2038 (c4e71212a245 Revert "drm/etnaviv: reject timeouts with=
 tv_nsec >=3D NSEC_PER_SEC")
Merging livepatching/for-next (59fc1e476962 Merge branch 'for-5.10/flive-pa=
tching' into for-next)
Merging coresight/next (c04e5d7bbf6f coresight: tmc-etr: Assign boolean val=
ues to a bool variable)
Merging rtc/rtc-next (673536cc5f21 rtc: pcf8523: use BIT)
Merging nvdimm/libnvdimm-for-next (a1b8638ba132 Linux 5.9-rc7)
Merging at24/at24/for-next (3650b228f83a Linux 5.10-rc1)
Merging ntb/ntb-next (3650b228f83a Linux 5.10-rc1)
Merging seccomp/for-next/seccomp (7ef95e3dbcee Merge branch 'for-linus/secc=
omp' into for-next/seccomp)
Merging kspp/for-next/kspp (9b80e4c4ddac overflow: Add __must_check attribu=
te to check_*() helpers)
Merging gnss/gnss-next (48778464bb7d Linux 5.8-rc2)
Merging fsi/next (4a851d714ead fsi: aspeed: Support CFAM reset GPIO)
Merging slimbus/for-next (a90390d00529 slimbus: qcom-ngd-ctrl: add Protecti=
on Domain Restart Support)
Merging nvmem/for-next (436d15fbeaee nvmem: qfprom: Don't touch certain fus=
es)
Merging xarray/main (80c1dbebf308 XArray: Fix splitting to non-zero orders)
Merging hyperv/hyperv-next (14c685d9eb36 drivers: hv: vmbus: Fix call mslee=
p using < 20ms)
Merging auxdisplay/auxdisplay (351dcacc6d77 auxdisplay: panel: Remove redun=
dant charlcd_ops structures)
Merging kgdb/kgdb/for-next (d081a6e35316 kdb: Fix pager search for multi-li=
ne strings)
Merging pidfd/for-next (e06ce5515b74 Merge branch 'pidfd_o_nonblock' into f=
or-next)
Merging hmm/hmm (3650b228f83a Linux 5.10-rc1)
Merging fpga/for-next (aaf8fe39c952 Revert "fpga: dfl: fix the definitions =
of type & feature_id for dfl devices")
Merging kunit/test (3650b228f83a Linux 5.10-rc1)
Merging generic-ioremap/for-next (4bdc0d676a64 remove ioremap_nocache and d=
evm_ioremap_nocache)
Merging cfi/cfi/next (5de15b610f78 mtd: hyperbus: add Renesas RPC-IF driver)
Merging kunit-next/kunit (3650b228f83a Linux 5.10-rc1)
Merging trivial/for-next (9ff9b0d392ea Merge tag 'net-next-5.10' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging zx2c4/for-next (16fbf79b0f83 Linux 5.6-rc7)
Merging mhi/mhi-next (7b7e4cee0299 Merge branch 'mhi-ath11k-immutable' into=
 mhi-next)
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
CONFLICT (content): Merge conflict in arch/arm/tools/syscall.tbl
CONFLICT (content): Merge conflict in arch/alpha/kernel/syscalls/syscall.tbl
Applying: rest of merge fix up for syscall conflict
Merging memblock/for-next (5bdba520c1b3 mm: memblock: drop __init from memb=
lock functions to make it inline)
Merging init/init-user-pointers (38b082236e77 initramfs: use vfs_utimes in =
do_copy)
Merging counters/counters (3650b228f83a Linux 5.10-rc1)
Applying: powerpc/64s: using DECLARE_STATIC_KEY_FALSE needs linux/jump_tabl=
e.h
Merging akpm-current/current (1bb212794cef lib/lzo/lzo1x_compress.c: make l=
zogeneric1x_1_compress() static)
CONFLICT (content): Merge conflict in mm/filemap.c
CONFLICT (content): Merge conflict in include/linux/sched.h
CONFLICT (content): Merge conflict in include/linux/mm.h
CONFLICT (content): Merge conflict in arch/arc/Kconfig
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
Merging akpm/master (ba48aaa5dd88 mm/gup: assert that the mmap lock is held=
 in __get_user_pages())

--Sig_/bZtuzaz/7F6bA3m/.XZfLoS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+7esEACgkQAVBC80lX
0GyOlQf/RMg9/KEpXf6XCJaDFDhruPAy6k4mCH6ehTH+akkc3T1HKhNkNt4DCJ+4
k25nL+E4BtBwooD1SVK2PLLqEDe2G7bYf4xYzBu70VbwYTXrzs22QTNK+U93uBQg
XR7GB11Be0jk2M7AbpjcATNH64SaXQsEDGYlXpRdcMhSg9yZn4rreZtiUK1cHV/t
WBBsEFukKdS7IyoYQDG4ySoXb92yTaEdLEjrTaqZYY2f7EsU8fs+c9H/+0qcDr7/
bYpy6vZqFTgPWuRCLCSLgWgWBXQiYAc4FKkq7NuNvyhKFjctb0WmNMDLBwZwSSPB
Nqna/jk7FZVq0s50TARxl4KnEFJusg==
=mtY/
-----END PGP SIGNATURE-----

--Sig_/bZtuzaz/7F6bA3m/.XZfLoS--
