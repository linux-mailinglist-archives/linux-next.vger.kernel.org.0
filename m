Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5242475BCF8
	for <lists+linux-next@lfdr.de>; Fri, 21 Jul 2023 05:51:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229671AbjGUDvj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 20 Jul 2023 23:51:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229646AbjGUDvi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 20 Jul 2023 23:51:38 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60F391BC1;
        Thu, 20 Jul 2023 20:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1689911490;
        bh=Cjkd+ZoshOHcH4rA9IT4KYYm/yrY8PUXmv89WlXiRFc=;
        h=Date:From:To:Cc:Subject:From;
        b=MDCfmABBk/QSpbFEMwXrM1N9Cn4behVqVrICeEmvaOnuknkSRS25lcO+xW4cLbMmR
         IGtekJ2yC9FTJnDwMZLL675G8azLfvoZxHy8p2brWTllPmgNPqp0HwQZt3ZqZKP1xE
         emM8lLm42yAQhIfLNmS4bWaI6nr+ukPVnAP+yGlqTn1tbnVsc1lCqqM7iiz+3F7hFt
         c21MjGBWhPVAlMOXpt2Os+nr0qXluSBZcN6RgyMN5Pr5raPKDUCEHwpGVsC6Jh5yw4
         iqSZEBXzAuw64cO8GKlAtxML2YuLRUkq+dkloSpsIai1jWHRmex041YFBLJUzY8Eo4
         owTupKo3EAHvw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4R6bFt46ZKz4wZw;
        Fri, 21 Jul 2023 13:51:30 +1000 (AEST)
Date:   Fri, 21 Jul 2023 13:40:49 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jul 21
Message-ID: <20230721134049.3259d35a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9/Tx28v7swTz++/=hlooOmj";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,LOCALPART_IN_SUBJECT,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/9/Tx28v7swTz++/=hlooOmj
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20230720:

The mm tree lost its build failure.

The cifs tree lost its build failure.

The bluetooth tree lost its build failure.

The chrome-platform tree lost its build failure.

The accel tree gained a conflict against the drm-fixes tree.

Non-merge commits (relative to Linus' tree): 3276
 4556 files changed, 126643 insertions(+), 47774 deletions(-)

----------------------------------------------------------------------------

I have created today's linux-next tree at
git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
(patches at http://www.kernel.org/pub/linux/kernel/next/ ).  If you
are tracking the linux-next tree using git, you should not use "git pull"
to do so as that will try to merge the new linux-next release with the
old one.  You should use "git fetch" and checkout or reset to the new
master.

You can see which trees have been included by looking in the Next/Trees
file in the source.  There is also the merge.log file in the Next
directory.  Between each merge, the tree was built with a ppc64_defconfig
for powerpc, an allmodconfig for x86_64, a multi_v7_defconfig for arm
and a native build of tools/perf. After the final fixups (if any), I do
an x86_64 modules_install followed by builds for x86_64 allnoconfig,
powerpc allnoconfig (32 and 64 bit), ppc44x_defconfig, allyesconfig
and pseries_le_defconfig and i386, arm64, s390, sparc and sparc64
defconfig and htmldocs. And finally, a simple boot test of the powerpc
pseries_le_defconfig kernel in qemu (with and without kvm enabled).

Below is a summary of the state of the merge.

I am currently merging 360 trees (counting Linus' and 103 trees of bug
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
Merging origin/master (57f1f9dd3abe Merge tag 'net-6.5-rc3' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/netdev/net)
Merging fixes/fixes (d528014517f2 Revert ".gitignore: ignore *.cover and *.=
mbx")
Merging mm-hotfixes/mm-hotfixes-unstable (072ddd9f684d mm-shmem-fix-race-in=
-shmem_undo_range-w-thp-fix)
Merging kbuild-current/fixes (98507a160ac6 kbuild: rust: avoid creating tem=
porary files)
Merging arc-current/for-curr (30a0b95b1335 Linux 6.1-rc3)
Merging arm-current/fixes (2b951b0efbaa ARM: 9297/1: vfp: avoid unbalanced =
stack on 'success' return path)
Merging arm64-fixes/for-next/fixes (71e06e1acecb arm64: vdso: Clear common =
make C=3D2 warnings)
Merging arm-soc-fixes/arm/fixes (6722e46513e0 bus: ixp4xx: fix IXP4XX_EXP_T=
1_MASK)
Merging davinci-current/davinci/for-current (06c2afb862f9 Linux 6.5-rc1)
Merging drivers-memory-fixes/fixes (06c2afb862f9 Linux 6.5-rc1)
Merging tee-fixes/fixes (ceaa837f96ad Linux 6.2-rc8)
Merging m68k-current/for-linus (4055eabe04a2 m68k: defconfig: Update defcon=
figs for v6.4-rc1)
Merging powerpc-fixes/fixes (106ea7ffd56b Revert "powerpc/64s: Remove suppo=
rt for ELFv1 little endian userspace")
Merging s390-fixes/fixes (4cfca532ddc3 s390/zcrypt: fix reply buffer calcul=
ations for CCA replies)
Merging sparc/master (2d2b17d08bfc sparc: Unbreak the build)
Merging fscrypt-current/for-current (4bcf6f827a79 fscrypt: check for NULL k=
eyring in fscrypt_put_master_key_activeref())
Merging fsverity-current/for-current (a075bacde257 fsverity: don't drop pag=
ecache at end of FS_IOC_ENABLE_VERITY)
Merging net/main (57f1f9dd3abe Merge tag 'net-6.5-rc3' of git://git.kernel.=
org/pub/scm/linux/kernel/git/netdev/net)
Merging bpf/master (ac528649f7c6 Merge branch 'net-support-stp-on-bridge-in=
-non-root-netns')
Merging ipsec/master (6018a266279b ip_vti: fix potential slab-use-after-fre=
e in decode_session6)
Merging netfilter/main (9b39f758974f Merge tag 'nf-23-07-20' of https://git=
.kernel.org/pub/scm/linux/kernel/git/netfilter/nf)
Merging ipvs/main (1a7d09a737a0 Merge tag 'nf-23-06-27' of git://git.kernel=
.org/pub/scm/linux/kernel/git/netfilter/nf)
Merging wireless/for-next (ac528649f7c6 Merge branch 'net-support-stp-on-br=
idge-in-non-root-netns')
Merging wpan/master (9a43827e876c net: dpaa2-mac: add 25gbase-r support)
Merging rdma-fixes/for-rc (5c719d7aef29 RDMA/rxe: Fix an error handling pat=
h in rxe_bind_mw())
Merging sound-current/for-linus (5f69c65e07b9 Merge tag 'asoc-fix-v6.5-rc1-=
2' of https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound into fo=
r-linus)
Merging sound-asoc-fixes/for-linus (83d69d90744f Merge remote-tracking bran=
ch 'asoc/for-6.4' into asoc-linus)
Merging regmap-fixes/for-linus (0c9d2eb5e947 regmap: Account for register l=
ength in SMBus I/O limits)
Merging regulator-fixes/for-linus (d20ac7398255 Merge remote-tracking branc=
h 'regulator/for-6.4' into regulator-linus)
Merging spi-fixes/for-linus (4e9196433daa Merge remote-tracking branch 'spi=
/for-6.4' into spi-linus)
Merging pci-current/for-linus (7ece3fae5ff0 Revert "PCI: acpiphp: Reassign =
resources on bridge if necessary")
Merging driver-core.current/driver-core-linus (fdf0eaf11452 Linux 6.5-rc2)
Merging tty.current/tty-linus (690c8b804ad2 TIOCSTI: always enable for CAP_=
SYS_ADMIN)
Merging usb.current/usb-linus (fdf0eaf11452 Linux 6.5-rc2)
Merging usb-serial-fixes/usb-linus (d245aedc0077 USB: serial: simple: sort =
driver entries)
Merging phy/fixes (8932089b566c phy: qcom-snps-femto-v2: use qcom_snps_hsph=
y_suspend/resume error code)
Merging staging.current/staging-linus (fdf0eaf11452 Linux 6.5-rc2)
Merging iio-fixes/fixes-togreg (48faabfb3634 dt-bindings: iio: adi,ad74115:=
 remove ref from -nanoamp)
Merging counter-current/counter-current (272ffb925e20 counter: Fix menuconf=
ig "Counter support" submenu entries disappearance)
Merging char-misc.current/char-misc-linus (28f47693a920 Documentation: emba=
rgoed-hardware-issues.rst: clean out empty and unused entries)
Merging soundwire-fixes/fixes (7891d0a5ce6f soundwire: amd: Fix a check for=
 errors in probe())
Merging thunderbolt-fixes/fixes (6995e2de6891 Linux 6.4)
Merging input-current/for-linus (eb09074bdb05 Input: i8042 - add quirk for =
TUXEDO Gemini 17 Gen1/Clevo PD70PN)
Merging crypto-current/master (0b7ec177b589 crypto: algif_hash - Fix race b=
etween MORE and non-MORE sends)
Merging vfio-fixes/for-linus (4752354af710 vfio/type1: check pfn valid befo=
re converting to struct page)
Merging kselftest-fixes/fixes (569f8b501b17 selftests/arm64: fix build fail=
ure during the "emit_tests" step)
Merging modules-fixes/modules-linus (f412eef03938 Documentation: livepatch:=
 module-elf-format: Remove local klp_modinfo definition)
Merging dmaengine-fixes/fixes (d2a257684758 dmaengine: mcf-edma: Fix a pote=
ntial un-allocated memory access)
Merging backlight-fixes/for-backlight-fixes (88603b6dc419 Linux 6.2-rc2)
Merging mtd-fixes/mtd/fixes (ea690ad78dd6 mtd: rawnand: rockchip: Align hwe=
cc vs. raw page helper layouts)
Merging mfd-fixes/for-mfd-fixes (88603b6dc419 Linux 6.2-rc2)
Merging v4l-dvb-fixes/fixes (0cb1d9c84511 media: verisilicon: change confus=
ingly named relaxed register access)
Merging reset-fixes/reset/fixes (3a2390c6777e reset: uniphier-glue: Fix pos=
sible null-ptr-deref)
Merging mips-fixes/mips-fixes (06c2afb862f9 Linux 6.5-rc1)
Merging at91-fixes/at91-fixes (06c2afb862f9 Linux 6.5-rc1)
Merging omap-fixes/fixes (2a906db2824b Merge branch 'am5748-fix' into fixes)
Merging kvm-fixes/master (2623b3dc875a Merge tag 'kvmarm-fixes-6.4-4' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into HEAD)
Merging kvms390-fixes/master (c2fceb59bbda KVM: s390: pv: fix index value o=
f replaced ASCE)
Merging hwmon-fixes/hwmon (13558a2e6341 hwmon: (nct6775) Fix IN scaling fac=
tors for 6798/6799)
Merging nvdimm-fixes/libnvdimm-fixes (e98d14fa7315 tools/testing/nvdimm: Dr=
op empty platform remove function)
Merging cxl-fixes/fixes (91019b5bc7c2 cxl/acpi: Return 'rc' instead of '0' =
in cxl_parse_cfmws())
Merging btrfs-fixes/next-fixes (cbd3e5dd275a Merge branch 'misc-6.5' into n=
ext-fixes)
Merging vfs-fixes/fixes (609d54441493 fs: prevent out-of-bounds array specu=
lation when closing a file descriptor)
Merging dma-mapping-fixes/for-linus (bbb73a103fbb swiotlb: fix a braino in =
the alignment check fix)
Merging drivers-x86-fixes/fixes (676b7c5ecab3 platform/x86: serial-multi-in=
stantiate: Auto detect IRQ resource for CSC3551)
Merging samsung-krzk-fixes/fixes (06c2afb862f9 Linux 6.5-rc1)
Merging pinctrl-samsung-fixes/fixes (06c2afb862f9 Linux 6.5-rc1)
Merging devicetree-fixes/dt/linus (030d2a0ce5dc dt-bindings: hwmon: moortec=
,mr75203: fix multipleOf for coefficients)
Merging dt-krzk-fixes/fixes (06c2afb862f9 Linux 6.5-rc1)
Merging scsi-fixes/fixes (80b6051085c5 scsi: sg: Fix checking return value =
of blk_get_queue())
Merging drm-fixes/drm-fixes (78e9b217d78e accel/habanalabs: add more debugf=
s stub helpers)
Merging drm-intel-fixes/for-linux-next-fixes (2c27770a7bc8 Revert "drm/i915=
: use localized __diag_ignore_all() instead of per file")
Merging mmc-fixes/fixes (5def5c1c15bf mmc: sdhci-f-sdh30: Replace with sdhc=
i_pltfm)
Merging rtc-fixes/rtc-fixes (08279468a294 rtc: sunplus: fix format string f=
or printing resource)
Merging gnss-fixes/gnss-linus (fdf0eaf11452 Linux 6.5-rc2)
Merging hyperv-fixes/hyperv-fixes (55e544e1a922 x86/hyperv: Improve code fo=
r referencing hyperv_pcpu_input_arg)
Merging soc-fsl-fixes/fix (06c2afb862f9 Linux 6.5-rc1)
Merging risc-v-fixes/fixes (ab2dbc7acced RISC-V: Don't include Zicsr or Zif=
encei in I from ACPI)
Merging riscv-dt-fixes/riscv-dt-fixes (06c2afb862f9 Linux 6.5-rc1)
Merging riscv-soc-fixes/riscv-soc-fixes (06c2afb862f9 Linux 6.5-rc1)
Merging fpga-fixes/fixes (06c2afb862f9 Linux 6.5-rc1)
Merging spdx/spdx-linus (fdf0eaf11452 Linux 6.5-rc2)
Merging gpio-brgl-fixes/gpio/for-current (644ee70267a9 gpio: mvebu: fix irq=
 domain leak)
Merging gpio-intel-fixes/fixes (06c2afb862f9 Linux 6.5-rc1)
Merging pinctrl-intel-fixes/fixes (06c2afb862f9 Linux 6.5-rc1)
Merging erofs-fixes/fixes (fdf0eaf11452 Linux 6.5-rc2)
Merging kunit-fixes/kunit-fixes (06c2afb862f9 Linux 6.5-rc1)
Merging ubifs-fixes/fixes (2241ab53cbb5 Linux 6.2-rc5)
Merging memblock-fixes/fixes (647037adcad0 Revert "mm: Always release pages=
 to the buddy allocator in memblock_free_late().")
Merging nfsd-fixes/nfsd-fixes (f75546f58a70 nfsd: Remove incorrect check in=
 nfsd4_validate_stateid)
Merging irqchip-fixes/irq/irqchip-fixes (6fe5c68ee6a1 irqchip/gic-v3: Worka=
round for GIC-700 erratum 2941627)
Merging renesas-fixes/fixes (ab2866f12ca1 arm64: dts: renesas: r8a779g0: Fi=
x HSCIF0 interrupt number)
Merging broadcom-fixes/fixes (9abf2313adc1 Linux 6.1-rc1)
Merging perf-current/perf-tools (ccff6d117d8d Merge tag 'perf-tools-fixes-f=
or-v6.5-1-2023-07-18' of git://git.kernel.org/pub/scm/linux/kernel/git/perf=
/perf-tools)
Merging efi-fixes/urgent (36e4fc57fc16 efi: Bump stub image version for mac=
OS HVF compatibility)
Merging zstd-fixes/zstd-linus (6906598f1ce9 zstd: Fix definition of assert(=
))
Merging battery-fixes/fixes (205f4cf3136f power: supply: ab8500: Set typing=
 and props)
Merging uml-fixes/fixes (73a23d771033 um: harddog: fix modular build)
Merging asahi-soc-fixes/asahi-soc/fixes (568035b01cfb Linux 6.0-rc1)
Merging iommufd-fixes/for-rc (06c2afb862f9 Linux 6.5-rc1)
Merging rust-fixes/rust-fixes (ac9a78681b92 Linux 6.4-rc1)
Merging v9fs-fixes/fixes/next (e6ab0b914c12 fs/9p: Remove unused extern dec=
laration)
Merging w1-fixes/fixes (06c2afb862f9 Linux 6.5-rc1)
Merging drm-misc-fixes/for-linux-next-fixes (ea293f823a88 drm/nouveau/kms/n=
v50-: init hpd_irq_lock for PIOR DP)
Merging mm-stable/mm-stable (06c2afb862f9 Linux 6.5-rc1)
Merging mm-nonmm-stable/mm-nonmm-stable (06c2afb862f9 Linux 6.5-rc1)
Merging mm/mm-everything (b1139873c19c Merge branch 'mm-nonmm-unstable' int=
o mm-everything)
Merging kbuild/for-next (3685a5b63db1 kbuild: Enable -Wenum-conversion by d=
efault)
Merging clang-format/clang-format (06c2afb862f9 Linux 6.5-rc1)
Merging perf/perf-tools-next (ccff6d117d8d Merge tag 'perf-tools-fixes-for-=
v6.5-1-2023-07-18' of git://git.kernel.org/pub/scm/linux/kernel/git/perf/pe=
rf-tools)
Merging compiler-attributes/compiler-attributes (eeac8ede1755 Linux 6.3-rc2)
Merging dma-mapping/for-next (8ac04063354a swiotlb: reduce the number of ar=
eas to match actual memory pool size)
Merging asm-generic/master (4dd595c34c4b syscalls: Remove file path comment=
s from headers)
Merging arc/for-next (06c2afb862f9 Linux 6.5-rc1)
Merging arm/for-next (1faf70485ea9 Merge branches 'misc' and 'fixes' into f=
or-next)
Merging arm64/for-next/core (893b24181b4c arm64: sme: Use STR P to clear FF=
R context field in streaming SVE mode)
Merging arm-perf/for-next/perf (dea0f4146f66 docs: perf: Fix warning from '=
make htmldocs' in hisi-pmu.rst)
Merging arm-soc/for-next (6722e46513e0 bus: ixp4xx: fix IXP4XX_EXP_T1_MASK)
Merging amlogic/for-next (76483eaf2109 Merge branch 'v6.6/arm64-dt' into fo=
r-next)
Merging asahi-soc/asahi-soc/for-next (eaf935fa48ec soc: apple: mailbox: Ren=
ame config symbol to APPLE_MAILBOX)
Merging aspeed/for-next (a43f3e970a1d ARM: dts: aspeed: Add AST2600 VUARTs)
Merging at91/at91-next (12fe727585e3 Merge branch 'at91-dt' into at91-next)
Merging broadcom/next (0d8d8753ede0 Merge branch 'devicetree/next' into nex=
t)
Merging davinci/davinci/for-next (06c2afb862f9 Linux 6.5-rc1)
Merging drivers-memory/for-next (b71da9105a81 dt-bindings: net: davicom,dm9=
000: convert to DT schema)
Merging imx-mxs/for-next (5d9516e521cc Merge branch 'imx/defconfig' into fo=
r-next)
Merging mediatek/for-next (f6925844c82a Merge branch 'v6.4-next/soc' into f=
or-next)
Merging mvebu/for-next (54fbc0260c64 Merge branch 'mvebu/drivers' into mveb=
u/for-next)
Merging omap/for-next (f581c395fcb8 Merge branches 'omap-for-v6.5/ti-sysc' =
and 'omap-for-v6.5/cleanup' into for-next)
Merging qcom/for-next (a3066b67f2ea Merge branches 'arm64-defconfig-for-6.6=
', 'arm64-fixes-for-6.5', 'arm64-for-6.6', 'clk-for-6.6', 'drivers-for-6.6'=
 and 'dts-for-6.6' into for-next)
Merging renesas/next (d04ad80865d1 Merge branch 'renesas-dts-for-v6.6' into=
 renesas-next)
Merging reset/reset/next (afb39e2bd36a reset: mpfs: select AUXILIARY_BUS)
Merging rockchip/for-next (256b22ad54be Merge branch 'v6.6-armsoc/dts64' in=
to for-next)
Merging samsung-krzk/for-next (073795c53cb4 Merge branch 'next/soc' into fo=
r-next)
Merging scmi/for-linux-next (263641409cbd Merge branches 'for-next/juno/fix=
es', 'for-next/juno/updates', 'for-next/vexpress/updates', 'for-next/scmi/f=
ixes' and 'for-next/scmi/updates' of git://git.kernel.org/pub/scm/linux/ker=
nel/git/sudeep.holla/linux into for-linux-next)
Merging stm32/stm32-next (2f38de940f07 ARM: dts: stm32: Add missing detach =
mailbox for DHCOR SoM)
Merging sunxi/sunxi/for-next (1bcb932283c9 Merge branch 'sunxi/dt-for-6.5' =
into sunxi/for-next)
Merging tee/next (6a8b7e801054 tee: optee: Use kmemdup() to replace kmalloc=
 + memcpy)
Merging tegra/for-next (43483f57c83f Merge branch for-6.6/arm64/dt into for=
-next)
Merging ti/ti-next (18a70fe4eff4 Merge branch 'ti-k3-dts-next' into ti-next)
Merging xilinx/for-next (9335fe594d85 Merge branch 'zynq/soc' into for-next)
Merging clk/clk-next (4d7c2c61e5c5 Merge branch 'clk-versa' into clk-next)
Merging clk-imx/for-next (06c2afb862f9 Linux 6.5-rc1)
Merging clk-renesas/renesas-clk (bbceb13ce2c7 clk: renesas: rzg2l: Simplify=
 .determine_rate())
Merging csky/linux-next (6ee1ffdc1838 csky: pgtable: Fixup update_mmu_cache=
 for abiv2)
Merging loongarch/loongarch-next (f3a7aca1c0ab LoongArch: Allow building wi=
th kcov coverage)
Merging m68k/for-next (4055eabe04a2 m68k: defconfig: Update defconfigs for =
v6.4-rc1)
Merging m68knommu/for-next (5275b3ee7fad m68k: coldfire: dma_timer: ERROR: =
"foo __init bar" should be "foo __init bar")
Merging microblaze/next (0e9a2a228a1a microblaze: Explicitly include correc=
t DT includes)
Merging mips/mips-next (06c2afb862f9 Linux 6.5-rc1)
Merging openrisc/for-next (dceaafd66881 openrisc: Union fpcsr and oldmask i=
n sigcontext to unbreak userspace ABI)
Merging parisc-hd/for-next (6995e2de6891 Linux 6.4)
Merging powerpc/next (fdf0eaf11452 Linux 6.5-rc2)
Merging soc-fsl/next (fb9c384625dd bus: fsl-mc: fsl-mc-allocator: Drop a wr=
ite-only variable)
Merging risc-v/for-next (471aba2e4760 riscv: sigcontext: Correct the commen=
t of sigreturn)
Merging riscv-dt/riscv-dt-for-next (54ab0b6b85d4 riscv: dts: starfive: jh71=
10: Add temperature sensor node and thermal-zones)
Merging riscv-soc/riscv-soc-for-next (30fb4784483b soc: starfive: Add JH711=
0 AON PMU support)
Merging s390/for-next (06a037656f4c Merge branch 'fixes' into for-next)
Merging sh/for-next (06c2afb862f9 Linux 6.5-rc1)
Merging uml/next (6032aca0deb9 um: make stub data pages size tweakable)
Merging xtensa/xtensa-for-next (a160e9414d8a xtensa: fix unaligned and load=
/store configuration interaction)
Merging pidfd/for-next (a901a3568fd2 Merge tag 'iomap-6.5-merge-1' of git:/=
/git.kernel.org/pub/scm/fs/xfs/xfs-linux)
Merging fscrypt/for-next (324718ddddc4 fscrypt: improve the "Encryption mod=
es and usage" section)
Merging afs/afs-next (0a278bc196e7 afs: Automatically generate trace tag en=
ums)
Merging btrfs/for-next (d87da3181f02 Merge branch 'for-next-next-v6.5-20230=
720' into for-next-20230720)
Merging ceph/master (a282a2f10539 libceph: harden msgr2.1 frame segment len=
gth checks)
Merging cifs/for-next (ac0ce20fd8ea cifs: update internal module version nu=
mber for cifs.ko)
Merging configfs/for-next (77992f896745 configfs: remove mentions of commit=
table items)
Merging ecryptfs/next (a3d78fe3e1ae fs: ecryptfs: comment typo fix)
Merging erofs/dev (7d15c91a75aa erofs: fix wrong primary bvec selection on =
deduplicated extents)
Merging exfat/dev (ff84772fd45d exfat: release s_lock before calling dir_em=
it())
Merging ext3/for_next (eccf9ae28312 Pull patch forbiding superblock / mount=
 marks on internal kernel mounts.)
Merging ext4/dev (7c79210b15ef ext4: fix off by one issue in ext4_mb_choose=
_next_group_best_avail())
Merging f2fs/dev (10c7134ee440 f2fs: compress: don't {,de}compress non-full=
 cluster)
Merging fsverity/for-next (456ae5fe9b44 fsverity: move sysctl registration =
out of signature.c)
Merging fuse/for-next (6a567e920fd0 fuse: ioctl: translate ENOSYS in outarg)
Merging gfs2/for-next (c6fa6b6c07c8 gfs2: increase usage of folio_next_inde=
x() helper)
Merging jfs/jfs-next (6e2bda2c192d jfs: fix invalid free of JFS_IP(ipimap)-=
>i_imap in diUnmount)
Merging ksmbd/ksmbd-for-next (956cd69868ee ksmbd: check if a mount point is=
 crossed during path lookup)
Merging nfs/linux-next (5b4a82a0724a Revert "NFSv4: Retry LOCK on OLD_STATE=
ID during delegation return")
Merging nfs-anna/linux-next (43439d858bba NFSv4.2: Fix a potential double f=
ree with READ_PLUS)
Merging nfsd/nfsd-next (c9194156c103 SUNRPC: Reduce thread wake-up rate whe=
n receiving large RPC messages)
Merging ntfs3/master (44b4494d5c59 fs/ntfs3: Correct mode for label entry i=
nside /proc/fs/ntfs3/)
Merging orangefs/for-next (31720a2b109b orangefs: Fix kmemleak in orangefs_=
{kernel,client}_debug_init())
Merging overlayfs/overlayfs-next (0a3bf81dbcb2 ovl: auto generate uuid for =
new overlay filesystems)
Merging ubifs/next (b5fda08ef213 ubifs: Fix memleak when insert_old_idx() f=
ailed)
Merging v9fs/9p-next (4ec5183ec486 Linux 6.2-rc7)
Merging v9fs-ericvh/ericvh/for-next (06c2afb862f9 Linux 6.5-rc1)
Merging xfs/for-next (f6250e205691 xfs: convert flex-array declarations in =
xfs attr shortform objects)
Merging zonefs/for-next (8812387d0569 zonefs: set FMODE_CAN_ODIRECT instead=
 of a dummy direct_IO method)
Merging iomap/iomap-for-next (efa96cc99793 iomap: micro optimize the ki_pos=
 assignment in iomap_file_buffered_write)
Merging djw-vfs/vfs-for-next (59ba4fdd2d1f fs: wait for partially frozen fi=
lesystems)
Merging file-locks/locks-next (0d6aeec73f8c selftests: add OFD lock tests)
Merging iversion/iversion-next (63355b9884b3 cpumask: be more careful with =
'cpumask_setall()')
Merging vfs-brauner/vfs.all (c62e19541f8b Merge branches 'vfs.readdir', 'vf=
s.misc', 'vfs.ctime', 'vfs.fchmodat2' and 'fs.proc.uapi' into vfs.all)
Merging vfs/for-next (cff4b23c731a Merge branch 'work.lock_rename_child' in=
to for-next)
Merging printk/for-next (8ca06365afc4 Merge branch 'for-6.6-vsprintf-doc' i=
nto for-next)
Merging pci/next (692860726644 Merge branch 'pci/misc')
Merging pstore/for-next/pstore (438b805003a0 pstore: Replace crypto API com=
pression with zlib_deflate library calls)
Merging hid/for-next (5eb5c80feb93 Merge branch 'for-6.5/upstream-fixes' in=
to for-next)
Merging i2c/i2c/for-next (6537ed3904a3 i2c: mpc: Drop unused variable)
Merging i3c/i3c/next (49b472ebc61d i3c: master: svc: add NACK check after s=
tart byte sent)
Merging dmi/dmi-for-next (13a0ac816d22 firmware: dmi: Fortify entry point l=
ength checks)
Merging hwmon-staging/hwmon-next (c4be22597a36 hwmon: (nct6775) Add support=
 for 18 IN readings for nct6799)
Merging jc_docs/docs-next (67b3f564cb1e time: add kernel-doc in time.c)
Merging v4l-dvb/master (06c2afb862f9 Linux 6.5-rc1)
Merging v4l-dvb-next/master (d7b13edd4cb4 media: v4l2-core: Fix a potential=
 resource leak in v4l2_fwnode_parse_link())
Merging pm/linux-next (6384f300e9f3 Merge branch 'pm-cpuidle' into linux-ne=
xt)
Merging cpufreq-arm/cpufreq/arm/linux-next (fd459406b99d cpufreq: omap: Con=
vert to platform remove callback returning void)
Merging cpupower/cpupower (99481d2195bf cpupower: Fix cpuidle_set to accept=
 only numeric values for idle-set operation.)
Merging devfreq/devfreq-next (a83bfdca8b20 PM / devfreq: mtk-cci: Fix varia=
ble deferencing before NULL check)
Merging opp/opp/linux-next (06c2afb862f9 Linux 6.5-rc1)
Merging thermal/thermal/linux-next (57c9eaa4de53 thermal/drivers/qcom/temp-=
alarm: Use dev_err_probe)
Merging dlm/next (dc52cd2eff4a fs: dlm: fix F_CANCELLK to cancel pending re=
quest)
Merging rdma/for-next (b3d2b014b259 RDMA/irdma: Fix building without IPv6)
Merging net-next/main (59be3baa8dff Merge git://git.kernel.org/pub/scm/linu=
x/kernel/git/netdev/net)
Merging bpf-next/for-next (b44693495af8 tcp: add TCP_OLD_SEQUENCE drop reas=
on)
Merging ipsec-next/master (a94fd40a18ae xfrm: delete not-needed clear to ze=
ro of encap_oa)
Merging mlx5-next/mlx5-next (77f7eb9f3416 net/mlx5: Introduce other vport q=
uery for Q-counters)
Merging netfilter-next/main (b8e39b38487e netlink: Make use of __assign_bit=
() API)
Merging ipvs-next/main (61dc651cdfe8 Merge tag 'nf-next-23-06-26' of git://=
git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf-next)
Merging bluetooth/master (f0eecb651f96 bluetooth: Explicitly include correc=
t DT includes)
CONFLICT (content): Merge conflict in net/bluetooth/hci_core.c
Merging wireless-next/for-next (03b123debcbc tcp: tcp_enter_quickack_mode()=
 should be static)
Merging wpan-next/master (18b849f12dcc ieee802154: ca8210: Remove stray gpi=
od_unexport() call)
Merging wpan-staging/staging (18b849f12dcc ieee802154: ca8210: Remove stray=
 gpiod_unexport() call)
Merging mtd/mtd/next (de2a5d52f2c0 dt-bindings: mtd: Add SEAMA partition bi=
ndings)
Merging nand/nand/next (c3519aed2a3f dt-bindings: nand: meson: support for =
512B ECC step size)
Merging spi-nor/spi-nor/next (d4996700abc1 mtd: spi-nor: rename method for =
enabling or disabling octal DTR)
Merging crypto/master (b0ab0797f7ab crypto: hisilicon/hpre - ensure private=
 key less than n)
Merging drm/drm-next (6c7f27441d6a Merge tag 'drm-misc-next-2023-07-13' of =
git://anongit.freedesktop.org/drm/drm-misc into drm-next)
Merging drm-misc/for-linux-next (34d7edcf2214 drm: debugfs: Silence warning=
 from cast)
Merging amdgpu/drm-next (18cf073faaa9 drm/amdgpu: use a macro to define no =
xcp partition case)
Merging drm-intel/for-linux-next (a86c75dcdd03 drm/i915: Start using plane =
scale factor for relative data rate)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_di=
splay_power_well.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/selftests/mock_g=
em_device.c
Merging drm-tegra/for-next (2429b3c529da drm/tegra: Avoid potential 32-bit =
integer overflow)
Merging drm-msm/msm-next (cd036d542afb drm/msm/a6xx: Add A610 speedbin supp=
ort)
Merging drm-msm-lumag/msm-next-lumag (1275b21a6c54 drm/msm/dsi: Enable BURS=
T_MODE for command mode for DSI 6G v1.3+)
Merging etnaviv/etnaviv/next (88c31d2dd191 drm/etnaviv: fix error code in e=
vent_alloc())
Merging fbdev/for-next (e8812acb5bf7 fbdev: Explicitly include correct DT i=
ncludes)
Merging regmap/for-next (7d63f1b9adef Merge remote-tracking branch 'regmap/=
for-6.6' into regmap-next)
Merging sound/for-next (f056f2fef31e Merge tag 'tags/ctl-lock-fixes-6.6' in=
to for-next)
Merging ieee1394/for-next (06c2afb862f9 Linux 6.5-rc1)
Merging sound-asoc/for-next (a87023d45ec0 Merge remote-tracking branch 'aso=
c/for-6.6' into asoc-next)
Merging modules/modules-next (9ce170cef669 kernel: params: Remove unnecessa=
ry =E2=80=980=E2=80=99 values from err)
Merging input/next (bf93349b11ab Input: mms114 - add support for touch keys)
Merging block/for-next (458c977c2c47 Merge branch 'for-6.6/block' into for-=
next)
Merging device-mapper/for-next (7aa303bf1bd2 dm raid: protect md_stop() wit=
h 'reconfig_mutex')
Merging libata/for-next (5cff2dbd980d ata: pata_imx: Use devm_platform_get_=
and_ioremap_resource())
Merging pcmcia/pcmcia-next (15e74c6c1ce2 pcmcia: remove AT91RM9200 Compact =
Flash driver)
Merging mmc/next (e8e2c7b0e695 mmc: davinci: Make SDIO irq truly optional)
Merging mfd/for-mfd-next (b90e33b6116a mfd: wm8998: Update to use maple tre=
e register cache)
Merging backlight/for-backlight-next (a33677b9211b backlight: led_bl: Take =
led_access lock when required)
Merging battery/for-next (af73fd32b4f2 power: reset: oxnas-restart: remove =
obsolete restart driver)
Merging regulator/for-next (862b56287a25 Merge remote-tracking branch 'regu=
lator/for-6.6' into regulator-next)
Merging security/next (c31288e56c1a evm: Support multiple LSMs providing an=
 xattr)
Merging apparmor/apparmor-next (afad53575a93 apparmor: use passed in gfp fl=
ags in aa_alloc_null())
Merging integrity/next-integrity (95526d13038c ima: Fix build warnings)
Merging safesetid/safesetid-next (64b634830c91 LSM: SafeSetID: add setgroup=
s() testing to selftest)
Merging selinux/next (55a0e73806ec selinux: introduce SECURITY_SELINUX_DEBU=
G configuration)
Merging smack/next (2c085f3a8f23 smack: Record transmuting in smk_transmute=
d)
Merging tomoyo/master (fdf0eaf11452 Linux 6.5-rc2)
Merging tpmdd/next (8447ac1ca47b tpm: Switch i2c drivers back to use .probe=
())
Merging watchdog/master (fdf0eaf11452 Linux 6.5-rc2)
Merging iommu/next (a5003e75a171 Merge branches 'iommu/fixes', 'arm/rockchi=
p', 'x86/amd' and 'core' into next)
Merging audit/next (be4187faa8a4 audit: include security.h unconditionally)
Merging devicetree/for-next (1f5ce01d5d71 dt-bindings: crypto: qcom-qce: ad=
d SoC compatible string for ipq9574)
Merging dt-krzk/for-next (1193001081e9 arm64: dts: lg: add missing cache pr=
operties)
Merging mailbox/mailbox-for-next (1b712f18c461 mailbox: ti-msgmgr: Fill non=
-message tx data fields with 0x0)
Merging spi/for-next (be15b91155cd Merge remote-tracking branch 'spi/for-6.=
6' into spi-next)
Merging tip/master (8f4995b370a5 Merge branch into tip/master: 'sched/eevdf=
')
Merging clockevents/timers/drivers/next (8b5bf64c89c7 clocksource/drivers/c=
adence-ttc: Fix memory leak in ttc_timer_probe)
Merging edac/edac-for-next (852667c317ae Merge ras/edac-drivers into for-ne=
xt)
Merging irqchip/irq/irqchip-next (a82f3119d543 Merge branch irq/misc-6.5 in=
to irq/irqchip-next)
Merging ftrace/for-next (61c692f56fec Merge tools/for-next)
Merging rcu/rcu/next (523a97c01e72 torture: Share torture_random_state with=
 torture_shuffle_tasks())
Merging kvm/next (255006adb3da Merge tag 'kvm-x86-vmx-6.5' of https://githu=
b.com/kvm-x86/linux into HEAD)
Merging kvm-arm/next (192df2aa0113 KVM: arm64: Fix misuse of KVM_ARM_VCPU_P=
OWER_OFF bit index)
Merging kvms390/next (db54dfc9f71c s390/uv: Update query for secret-UVCs)
Merging kvm-riscv/riscv_kvm_next (07f225b58424 RISC-V: KVM: Remove unneeded=
 semicolon)
Merging kvm-x86/next (fdf0eaf11452 Linux 6.5-rc2)
Merging xen-tip/linux-next (fdf0eaf11452 Linux 6.5-rc2)
Merging percpu/for-next (b9819165bb45 Merge branch 'for-6.2' into for-next)
Merging workqueues/for-next (6dc917b44525 Merge branch 'for-6.5-fixes' into=
 for-next)
Merging drivers-x86/for-next (9204fc5071bf platform/x86: hp-bioscfg: MAINTA=
INERS)
Merging chrome-platform/for-next (06c2afb862f9 Linux 6.5-rc1)
Merging hsi/for-next (06c2afb862f9 Linux 6.5-rc1)
Merging leds/for-next (1b929c02afd3 Linux 6.2-rc1)
Merging leds-lj/for-leds-next (7a2b85a76b05 leds: simatic-ipc-leds-gpio: Fi=
x comment style in SPDX header)
Merging ipmi/for-next (b02bb79eee07 ipmi: fix potential deadlock on &kcs_bm=
c->lock)
Merging driver-core/driver-core-next (fdf0eaf11452 Linux 6.5-rc2)
Merging usb/usb-next (fdf0eaf11452 Linux 6.5-rc2)
Merging thunderbolt/next (481012b479fe thunderbolt: Add test case for 3 Dis=
playPort tunnels)
Merging usb-serial/usb-next (974e2f6a0554 USB: serial: xr: add TIOCGRS485 a=
nd TIOCSRS485 ioctls)
Merging tty/tty-next (fdf0eaf11452 Linux 6.5-rc2)
Merging char-misc/char-misc-next (fdf0eaf11452 Linux 6.5-rc2)
Merging accel/habanalabs-next (e4f79224af4f accel/habanalabs/gaudi2: prepar=
e to remove cpu_rst_status)
CONFLICT (content): Merge conflict in drivers/accel/habanalabs/common/haban=
alabs.h
Merging coresight/next (6c50384ef8b9 hwtracing: hisi_ptt: Fix potential sle=
ep in atomic context)
Merging fastrpc/for-next (06c2afb862f9 Linux 6.5-rc1)
Merging fpga/for-next (840208392d3d fpga: Explicitly include correct DT inc=
ludes)
Merging icc/icc-next (768c42cd9acb Merge branch 'icc-fixes' into icc-next)
Merging iio/togreg (3a06b2845a09 iio: adc: meson: support reading from chan=
nel 7 mux inputs)
Merging phy-next/next (f66782cff479 dt-bindings: phy: rockchip: add RK3588 =
PCIe v3 phy)
Merging soundwire/next (3f92da3ea448 soundwire: Explicitly include correct =
DT includes)
Merging extcon/extcon-next (94da3da96c35 dt-bindings: extcon: wlf,arizona: =
drop unneeded quotes)
Merging gnss/gnss-next (fdf0eaf11452 Linux 6.5-rc2)
Merging vfio/next (ff598081e5b9 vfio/mdev: Move the compat_class initializa=
tion to module init)
Merging w1/for-next (06c2afb862f9 Linux 6.5-rc1)
Merging staging/staging-next (fdf0eaf11452 Linux 6.5-rc2)
Merging counter-next/counter-next (272ffb925e20 counter: Fix menuconfig "Co=
unter support" submenu entries disappearance)
Merging mux/for-next (44c026a73be8 Linux 6.4-rc3)
Merging dmaengine/next (1b13e52c0c76 dmaengine: xilinx: dma: remove arch de=
pendency)
Merging cgroup/for-next (32bf85c60ca3 cgroup/misc: Change counters to be ex=
plicit 64bit types)
CONFLICT (content): Merge conflict in tools/testing/selftests/cgroup/.gitig=
nore
CONFLICT (content): Merge conflict in tools/testing/selftests/cgroup/Makefi=
le
Applying: Revert "cgroup: put cgroup_tryget_css() inside CONFIG_CGROUP_SCHE=
D"
Merging scsi/for-next (b3f5bb4227f4 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (e152a616c886 scsi: ufs: ufs-mediatek: Add MCQ su=
pport for MTK platform)
Merging vhost/linux-next (373abdba01d4 vdpa_sim: offer VHOST_BACKEND_F_ENAB=
LE_AFTER_DRIVER_OK)
CONFLICT (content): Merge conflict in drivers/net/virtio_net.c
Merging rpmsg/for-next (b666efef756a Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (ac9a78681b92 Linux 6.4-rc1)
Merging gpio-brgl/gpio/for-next (20591189c582 gpio: mxc: fix unused functio=
n warnings)
Merging gpio-intel/for-next (06c2afb862f9 Linux 6.5-rc1)
Merging pinctrl/for-next (060f03e95454 pinctrl: Explicitly include correct =
DT includes)
Merging pinctrl-intel/for-next (06c2afb862f9 Linux 6.5-rc1)
Merging pinctrl-renesas/renesas-pinctrl (bf8da305fef9 pinctrl: renesas: rzv=
2m: Use devm_clk_get_enabled())
Merging pinctrl-samsung/for-next (06c2afb862f9 Linux 6.5-rc1)
Merging pwm/for-next (92554cdd428f dt-bindings: pwm: convert pwm-bcm2835 bi=
ndings to YAML)
Merging userns/for-next (05bd6e0242b4 Merge of unpriv-ipc-sysctls-for-v6.2,=
 and fix-atomic_lock_inc_below-for-v6.2 for testing in linux-next)
Merging ktest/for-next (7dc8e24f0e09 ktest: Restore stty setting at first i=
n dodie)
Merging kselftest/next (feac01aaf677 selftests: prctl: Add new prctl test f=
or PR_SET_NAME)
Merging kunit/test (06c2afb862f9 Linux 6.5-rc1)
Merging kunit-next/kunit (64bd4641310c MAINTAINERS: add Rust KUnit files to=
 the KUnit entry)
Merging livepatching/for-next (ac4890f97211 Merge branch 'for-6.5/core' int=
o for-next)
Merging rtc/rtc-next (1b733a9ebc3d rtc: Add rtc driver for the Loongson fam=
ily chips)
Merging nvdimm/libnvdimm-for-next (fd774e36fe87 nvdimm: Explicitly include =
correct DT includes)
Merging at24/at24/for-next (06c2afb862f9 Linux 6.5-rc1)
Merging ntb/ntb-next (994def29acc5 ntb: Remove error checking for debugfs_c=
reate_dir())
Merging seccomp/for-next/seccomp (7d5cb68af638 perf/benchmark: add a new be=
nchmark for seccom_unotify)
Merging fsi/next (35af9fb49bc5 fsi: core: Check error number after calling =
ida_simple_get)
Merging slimbus/for-next (06c2afb862f9 Linux 6.5-rc1)
Merging nvmem/for-next (8fd85ce6cfdf dt-bindings: nvmem: qfprom: Add compat=
ible for MSM8226)
Merging xarray/main (69cb69ea5542 ida: Remove assertions that an ID was all=
ocated)
Merging hyperv/hyperv-next (a494aef23dfc PCI: hv: Replace retarget_msi_inte=
rrupt_params with hyperv_pcpu_input_arg)
Merging auxdisplay/auxdisplay (def85dce1451 auxdisplay: Switch i2c drivers =
back to use .probe())
Merging kgdb/kgdb/for-next (b6464883f45a kdb: move kdb_send_sig() declarati=
on to a better header file)
Merging hmm/hmm (06c2afb862f9 Linux 6.5-rc1)
Merging cfi/cfi/next (06c2afb862f9 Linux 6.5-rc1)
Merging mhi/mhi-next (d0184830e611 bus: mhi: host: use vmalloc_array and vc=
alloc)
Merging memblock/for-next (0f5e4adb608c memblock: report failures when memb=
lock_can_resize is not set)
Merging cxl/next (fe77cc2e5a6a cxl: Fix one kernel-doc comment)
Merging zstd/zstd-next (2aa14b1ab2c4 zstd: import usptream v1.5.2)
Merging efi/next (2e28a798c309 efi/libstub: Disable PCI DMA before grabbing=
 the EFI memory map)
Merging unicode/for-next (b500d6d7243d unicode: Handle memory allocation fa=
ilures in mkutf8data)
Merging slab/for-next (66489e5487b7 Merge branch 'slab/for-6.6/random_kmall=
oc' into slab/for-next)
Merging random/master (512dee0c00ad Merge tag 'x86-urgent-2023-01-04' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging landlock/next (35ca42399297 selftests/landlock: Add hostfs tests)
Merging rust/rust-next (341faf2b45ba rust: helpers: sort includes alphabeti=
cally in rust/helpers.c)
Merging sysctl/sysctl-next (06c2afb862f9 Linux 6.5-rc1)
Merging execve/for-next/execve (fdf0eaf11452 Linux 6.5-rc2)
Merging bitmap/bitmap-for-next (94b154766896 lib: test for_each_numa_cpus())
Merging hte/for-next (ac9a78681b92 Linux 6.4-rc1)
Merging kspp/for-next/kspp (8453e7924a1a soc: fsl: qe: Replace all non-retu=
rning strlcpy with strscpy)
Merging kspp-gustavo/for-next/kspp (6ae3f51825e3 fs: omfs: Use flexible-arr=
ay member in struct omfs_extent)
Merging iommufd/for-next (06c2afb862f9 Linux 6.5-rc1)

--Sig_/9/Tx28v7swTz++/=hlooOmj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmS5/kEACgkQAVBC80lX
0GwDhwf/WkXJrokX0avirtYVs06t7GXKyXTg1sTktJRSxFEBct7VHbDDi00wECm2
lHxMHAsuK/cUdzTkSmzWn0IjvncC6vuaF/fAFF9ZSqf/weoZa6DBM9Op1dU/I9Eu
ILYsMQCNdA8IiKdyFEn8eS3hVh4PkfIAkVs0Q9PGo+N1aZs/nRQyhNdQ5rwdIxPO
EVuo7KULSgVs+Raxn23P5l2FT0MCnoFMqYbiJILjizTFxPfCFrnRmT8MfLToGpDV
SsxWL0svhhwKlbn2NNvBb0g/2G6CffNFqYd1Dvarw/UIaYhxrUTDVQMwsK+5Rvmi
/YNzBSlupTGk3h/XoJpNWcDqtH8ZfQ==
=66kJ
-----END PGP SIGNATURE-----

--Sig_/9/Tx28v7swTz++/=hlooOmj--
