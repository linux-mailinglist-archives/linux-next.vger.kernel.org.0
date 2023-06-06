Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 303D272363C
	for <lists+linux-next@lfdr.de>; Tue,  6 Jun 2023 06:27:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231388AbjFFE14 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 6 Jun 2023 00:27:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232196AbjFFE1y (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Jun 2023 00:27:54 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 122A8E58;
        Mon,  5 Jun 2023 21:27:42 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4QZyBN1k1tz4x3g;
        Tue,  6 Jun 2023 14:27:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1686025660;
        bh=V4oBkdO+qXlkAc3c/Nl8qO48wNf9H/2rYjs1vA2eLow=;
        h=Date:From:To:Cc:Subject:From;
        b=EH1xNdLrpPdT1uUT3IPA1UKkaV/DaiF+AG4SXW0odMTVTERVOtOUW7MPoqW123zpO
         kgNM0JYKuMtMwNaX4S+Fnb+rRd4jOnOeUUax5zwZWe0HnLug6iAoYqx3T55FV+2jJU
         MHXg2D+RkfZXwipSit8axG0WvFhyOylPGW/b8y2u+G4o/3FEuR9vXE35dr5EjRGG69
         /6wOh65e9HITzdfcLnQGGdjsWRhAEifUNqxzXW53y8yNsx7GdJoTEtIHgjTshsv6HG
         cRBzWe6SD1lQTbsebXoxLQlz8TzVu17edlPRFsaynBiWNjO7IfmOIR/pKfT+5f0e8P
         gNQki3mBA5pxQ==
Date:   Tue, 6 Jun 2023 14:27:39 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jun 6
Message-ID: <20230606142739.1e08ee0c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ync92TkWDpBOzr1n01/qcf=";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,LOCALPART_IN_SUBJECT,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ync92TkWDpBOzr1n01/qcf=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20230605:

The asahi-soc tree lost its build failure.

The kvm-arm tree gained a conflict against the arm64 tree.

The landlock tree gained a build failure so I used the version from
next-20230605.

Non-merge commits (relative to Linus' tree): 6604
 7779 files changed, 274959 insertions(+), 101696 deletions(-)

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

I am currently merging 363 trees (counting Linus' and 103 trees of bug
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
Merging origin/master (f8dba31b0a82 Merge tag 'asym-keys-fix-for-linus-v6.4=
-rc5' of https://github.com/robertosassu/linux)
Merging fixes/fixes (ac9a78681b92 Linux 6.4-rc1)
Merging mm-hotfixes/mm-hotfixes-unstable (7c8e60ebde69 ocfs2: check new fil=
e size on fallocate call)
Merging kbuild-current/fixes (f1fcbaa18b28 Linux 6.4-rc2)
Merging arc-current/for-curr (30a0b95b1335 Linux 6.1-rc3)
Merging arm-current/fixes (2b951b0efbaa ARM: 9297/1: vfp: avoid unbalanced =
stack on 'success' return path)
Merging arm64-fixes/for-next/fixes (0e2aba694866 arm64: mm: pass original f=
ault address to handle_mm_fault() in PER_VMA_LOCK block)
Merging arm-soc-fixes/arm/fixes (4a672d500bfd ARM: dts: Fix erroneous ADS t=
ouchscreen polarities)
Merging davinci-current/davinci/for-current (ac9a78681b92 Linux 6.4-rc1)
Merging drivers-memory-fixes/fixes (ac9a78681b92 Linux 6.4-rc1)
Merging tee-fixes/fixes (ceaa837f96ad Linux 6.2-rc8)
Merging m68k-current/for-linus (b845b574f86d m68k: Move signal frame follow=
ing exception on 68020/030)
Merging powerpc-fixes/fixes (719dfd5925e1 powerpc/xmon: Use KSYM_NAME_LEN i=
n array size)
Merging s390-fixes/fixes (03c5c83b70dc s390/purgatory: disable branch profi=
ling)
Merging sparc/master (2d2b17d08bfc sparc: Unbreak the build)
Merging fscrypt-current/for-current (4bcf6f827a79 fscrypt: check for NULL k=
eyring in fscrypt_put_master_key_activeref())
Merging fsverity-current/for-current (a075bacde257 fsverity: don't drop pag=
ecache at end of FS_IOC_ENABLE_VERITY)
Merging net/main (fb928170e32e Merge branch 'mptcp-addr-adv-fixes')
Merging bpf/master (132328e8e851 bpf: netfilter: Add BPF_NETFILTER bpf_atta=
ch_type)
Merging ipsec/master (a287f5b0cfc6 xfrm: Ensure policies always checked on =
XFRM-I input path)
Merging netfilter/master (7fb0269720d7 Merge tag 'for-net-2022-05-23' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth)
Merging ipvs/main (ad42a35bdfc6 udplite: Fix NULL pointer dereference in __=
sk_mem_raise_allocated().)
Merging wireless/for-next (ead449023d3a wifi: mt76: mt7996: fix possible NU=
LL pointer dereference in mt7996_mac_write_txwi())
Merging wpan/master (bd4e3d82f4cc MAINTAINERS: Add wpan patchwork)
Merging rdma-fixes/for-rc (5842d1d9c1b0 RDMA/irdma: Fix Local Invalidate fe=
ncing)
Merging sound-current/for-linus (811dd426a9b1 ALSA: hda/realtek: Add quirks=
 for Asus ROG 2024 laptops using CS35L41)
Merging sound-asoc-fixes/for-linus (32cf0046a652 ASoC: fsl_sai: Enable BCI =
bit if SAI works on synchronous mode with BYP asserted)
Merging regmap-fixes/for-linus (0cc6578048e0 regmap: maple: Drop the RCU re=
ad lock while syncing registers)
Merging regulator-fixes/for-linus (7877cb91f108 Linux 6.4-rc4)
Merging spi-fixes/for-linus (0c331fd1dccf spi: qup: Request DMA before enab=
ling clocks)
Merging pci-current/for-linus (40994ce0ea01 MAINTAINERS: Add Chuanhua Lei a=
s Intel LGM GW PCIe maintainer)
Merging driver-core.current/driver-core-linus (9561de3a55be Linux 6.4-rc5)
Merging tty.current/tty-linus (9561de3a55be Linux 6.4-rc5)
Merging usb.current/usb-linus (592295e61b5c Merge tag 'thunderbolt-for-v6.4=
-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt =
into usb-linus)
Merging usb-serial-fixes/usb-linus (f1832e2b5e49 USB: serial: option: add Q=
uectel EM061KGL series)
Merging phy/fixes (2a881183dc5a phy: qcom-snps: correct struct qcom_snps_hs=
phy kerneldoc)
Merging staging.current/staging-linus (b3dad076a058 staging: octeon: delete=
 my name from TODO contact)
Merging iio-fixes/fixes-togreg (b410a9307bc3 iio: accel: fxls8962af: errata=
 bug only applicable for FXLS8962AF)
Merging counter-current/counter-current (ac9a78681b92 Linux 6.4-rc1)
Merging char-misc.current/char-misc-linus (9561de3a55be Linux 6.4-rc5)
Merging soundwire-fixes/fixes (99e09b9c0ab4 soundwire: qcom: add proper err=
or paths in qcom_swrm_startup())
Merging thunderbolt-fixes/fixes (9f9666e65359 thunderbolt: Mask ring interr=
upt on Intel hardware as well)
Merging input-current/for-linus (feee70f45686 Input: xpad - delete a Razer =
DeathAdder mouse VID/PID entry)
Merging crypto-current/master (6ab39f99927e crypto: x86/aria - Use 16 byte =
alignment for GFNI constant vectors)
Merging vfio-fixes/for-linus (4752354af710 vfio/type1: check pfn valid befo=
re converting to struct page)
Merging kselftest-fixes/fixes (dbcf76390eb9 selftests/ftrace: Improve integ=
ration with kselftest runner)
Merging modules-fixes/modules-linus (f412eef03938 Documentation: livepatch:=
 module-elf-format: Remove local klp_modinfo definition)
Merging dmaengine-fixes/fixes (e14fd2af7a1d dmaengine: at_hdmac: Extend the=
 Flow Controller bitfield to three bits)
Merging backlight-fixes/for-backlight-fixes (88603b6dc419 Linux 6.2-rc2)
Merging mtd-fixes/mtd/fixes (c4d28e30a8d0 mtd: rawnand: marvell: don't set =
the NAND frequency select)
Merging mfd-fixes/for-mfd-fixes (88603b6dc419 Linux 6.2-rc2)
Merging v4l-dvb-fixes/fixes (81f3affa19d6 media: uvcvideo: Don't expose uns=
upported formats to userspace)
Merging reset-fixes/reset/fixes (3a2390c6777e reset: uniphier-glue: Fix pos=
sible null-ptr-deref)
Merging mips-fixes/mips-fixes (4897a898a216 mips: Move initrd_start check a=
fter initrd address sanitisation.)
Merging at91-fixes/at91-fixes (6b0db163ff92 ARM: dts: at91: sama7g5ek: fix =
debounce delay property for shdwc)
Merging omap-fixes/fixes (2a906db2824b Merge branch 'am5748-fix' into fixes)
Merging kvm-fixes/master (f211b45057d8 Merge tag 'kvm-x86-fixes-6.4' of htt=
ps://github.com/kvm-x86/linux into HEAD)
Merging kvms390-fixes/master (21f27df85400 KVM: s390: pv: fix external inte=
rruption loop not always detected)
Merging hwmon-fixes/hwmon (0babf89c9cca hwmon: (f71882fg) prevent possible =
division by zero)
Merging nvdimm-fixes/libnvdimm-fixes (e5baf8c07707 libnvdimm: mark 'securit=
y_show' static again)
Merging cxl-fixes/fixes (a70fc4ed20a6 cxl/port: Fix NULL pointer access in =
devm_cxl_add_port())
Merging btrfs-fixes/next-fixes (ba564eb96411 Merge branch 'misc-6.4' into n=
ext-fixes)
Merging vfs-fixes/fixes (609d54441493 fs: prevent out-of-bounds array specu=
lation when closing a file descriptor)
Merging dma-mapping-fixes/for-linus (bbb73a103fbb swiotlb: fix a braino in =
the alignment check fix)
Merging drivers-x86-fixes/fixes (fb109fba7284 platform/x86: int3472: Avoid =
crash in unregistering regulator gpio)
Merging samsung-krzk-fixes/fixes (ac9a78681b92 Linux 6.4-rc1)
Merging pinctrl-samsung-fixes/fixes (ac9a78681b92 Linux 6.4-rc1)
Merging devicetree-fixes/dt/linus (6997f847cbb7 MAINTAINERS: add Conor as a=
 dt-bindings maintainer)
Merging dt-krzk-fixes/fixes (8bbec86ce6d6 dt-bindings: PCI: fsl,imx6q: fix =
assigned-clocks warning)
Merging scsi-fixes/fixes (6d074ce23177 scsi: stex: Fix gcc 13 warnings)
Merging drm-fixes/drm-fixes (b6ccf213d95e Merge tag 'drm-intel-fixes-2023-0=
6-01' of git://anongit.freedesktop.org/drm/drm-intel into drm-fixes)
Merging drm-intel-fixes/for-linux-next-fixes (2d6f2f79e065 drm/i915: Use 18=
 fast wake AUX sync len)
Merging mmc-fixes/fixes (0b5d5c436a5c mmc: pwrseq: sd8787: Fix WILC CHIP_EN=
 and RESETN toggling order)
Merging rtc-fixes/rtc-fixes (08279468a294 rtc: sunplus: fix format string f=
or printing resource)
Merging gnss-fixes/gnss-linus (44c026a73be8 Linux 6.4-rc3)
Merging hyperv-fixes/hyperv-fixes (ec97e112985c Drivers: hv: vmbus: Call hv=
_synic_free() if hv_synic_alloc() fails)
Merging soc-fsl-fixes/fix (4b0986a3613c Linux 5.18)
Merging risc-v-fixes/fixes (6966d7988c4f riscv: Implement missing huge_ptep=
_get)
Merging riscv-dt-fixes/riscv-dt-fixes (ac9a78681b92 Linux 6.4-rc1)
Merging riscv-soc-fixes/riscv-soc-fixes (a7a041f2ddf3 soc: microchip: mpfs:=
 handle failed system service requests)
Merging fpga-fixes/fixes (44c026a73be8 Linux 6.4-rc3)
Merging spdx/spdx-linus (9561de3a55be Linux 6.4-rc5)
Merging gpio-brgl-fixes/gpio/for-current (7877cb91f108 Linux 6.4-rc4)
Merging gpio-intel-fixes/fixes (ac9a78681b92 Linux 6.4-rc1)
Merging pinctrl-intel-fixes/fixes (7877cb91f108 Linux 6.4-rc4)
Merging erofs-fixes/fixes (7877cb91f108 Linux 6.4-rc4)
Merging kunit-fixes/kunit-fixes (ac9a78681b92 Linux 6.4-rc1)
Merging ubifs-fixes/fixes (2241ab53cbb5 Linux 6.2-rc5)
Merging memblock-fixes/fixes (647037adcad0 Revert "mm: Always release pages=
 to the buddy allocator in memblock_free_late().")
Merging nfsd-fixes/nfsd-fixes (c034203b6a9d nfsd: fix double fget() bug in =
__write_ports_addfd())
Merging irqchip-fixes/irq/irqchip-fixes (91539341a3b6 irqchip/gic: Correctl=
y validate OF quirk descriptors)
Merging renesas-fixes/fixes (ab2866f12ca1 arm64: dts: renesas: r8a779g0: Fi=
x HSCIF0 interrupt number)
Merging broadcom-fixes/fixes (9abf2313adc1 Linux 6.1-rc1)
Merging perf-current/perf/urgent (48b1320a674e Merge tag 'for-6.4-rc4-tag' =
of git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux)
Merging efi-fixes/urgent (36e4fc57fc16 efi: Bump stub image version for mac=
OS HVF compatibility)
Merging zstd-fixes/zstd-linus (6906598f1ce9 zstd: Fix definition of assert(=
))
Merging battery-fixes/fixes (95339f40a8b6 power: supply: Fix logic checking=
 if system is running from battery)
Merging uml-fixes/fixes (73a23d771033 um: harddog: fix modular build)
Merging asahi-soc-fixes/asahi-soc/fixes (568035b01cfb Linux 6.0-rc1)
Merging iommufd-fixes/for-rc (f1fcbaa18b28 Linux 6.4-rc2)
Merging rust-fixes/rust-fixes (ac9a78681b92 Linux 6.4-rc1)
Merging v9fs-fixes/fixes/next (36896bc97c0e fs/9p: Fix a datatype used with=
 V9FS_DIRECT_IO)
Merging w1-fixes/fixes (ac9a78681b92 Linux 6.4-rc1)
Merging drm-misc-fixes/for-linux-next-fixes (3692ababa322 drm/ast: Fix mode=
set failed on DisplayPort)
Merging mm-stable/mm-stable (7877cb91f108 Linux 6.4-rc4)
Merging mm-nonmm-stable/mm-nonmm-stable (7877cb91f108 Linux 6.4-rc4)
Merging mm/mm-everything (8c684f3689c7 Merge branch 'mm-nonmm-unstable' int=
o mm-everything)
Merging kbuild/for-next (feb843a469fb kbuild: add $(CLANG_FLAGS) to KBUILD_=
CPPFLAGS)
Merging clang-format/clang-format (781121a7f6d1 clang-format: Fix space aft=
er for_each macros)
Merging perf/perf-tools-next (fe8e04348727 perf script: Increase PID/TID wi=
dth for output)
Merging compiler-attributes/compiler-attributes (eeac8ede1755 Linux 6.3-rc2)
Merging dma-mapping/for-next (ec274aff21b6 swiotlb: Omit total_used and use=
d_hiwater if !CONFIG_DEBUG_FS)
Merging asm-generic/master (3b1ddbb62e7e Merge tag 'virt-to-pfn-for-arch-v6=
.5-2' of git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integra=
tor into asm-generic)
Merging arc/for-next (f2906aa86338 Linux 5.19-rc1)
Merging arm/for-next (fc6750b0d4a9 Merge branches 'misc' and 'fixes' into f=
or-next)
Merging arm64/for-next/core (47e71020b890 Merge branch 'for-next/feat_s1pie=
' into for-next/core)
Merging arm-perf/for-next/perf (8be3593b9efa drivers/perf: apple_m1: Force =
63bit counters for M2 CPUs)
Merging arm-soc/for-next (1f7f554cd76c soc: document merges)
Merging amlogic/for-next (8fb90cd6a66f Merge branch 'v6.5/arm-dt' into for-=
next)
Merging asahi-soc/asahi-soc/for-next (eaf935fa48ec soc: apple: mailbox: Ren=
ame config symbol to APPLE_MAILBOX)
Merging aspeed/for-next (7d4f0b0df7c5 ARM: dts: aspeed-g6: Add UDMA node)
Merging at91/at91-next (9c8457a847fa Merge branch 'clk-microchip' into at91=
-next)
Merging broadcom/next (1ada87a05856 Merge branch 'devicetree/next' into nex=
t)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging davinci/davinci/for-next (ac9a78681b92 Linux 6.4-rc1)
Merging drivers-memory/for-next (d3369a4b6f01 memory: atmel-sdramc: remove =
the driver)
Merging imx-mxs/for-next (a5f80078e832 Merge branch 'imx/defconfig' into fo=
r-next)
Merging mediatek/for-next (672ca768b9da Merge branch 'v6.4-next/soc' into f=
or-next)
Merging mvebu/for-next (64687391f64d Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (972e3fc791a8 Merge branch 'omap-for-v6.5/cleanup' in=
to for-next)
Merging qcom/for-next (8d5a57ea6a0b Merge branches 'arm64-defconfig-for-6.5=
', 'arm64-fixes-for-6.4', 'arm64-for-6.5', 'clk-for-6.5', 'drivers-fixes-fo=
r-6.4', 'drivers-for-6.5', 'dts-fixes-for-6.4' and 'dts-for-6.5' into for-n=
ext)
Merging renesas/next (256ba57a94d6 Merge branches 'renesas-arm-defconfig-fo=
r-v6.5' and 'renesas-dts-for-v6.5' into renesas-next)
Merging reset/reset/next (afb39e2bd36a reset: mpfs: select AUXILIARY_BUS)
Merging rockchip/for-next (ed555596bf75 Merge branch 'v6.5-armsoc/dts64' in=
to for-next)
Merging samsung-krzk/for-next (a3119e95a0d1 Merge branch 'next/dt' into for=
-next)
Merging scmi/for-linux-next (64c5bedc3298 Merge branch 'for-next/ffa/fixes'=
 of git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into f=
or-linux-next)
Merging stm32/stm32-next (9da2bf3bcd8b ARM: dts: stm32: add required suppli=
es of ov5640 in stm32mp157c-ev1)
Merging sunxi/sunxi/for-next (1bcb932283c9 Merge branch 'sunxi/dt-for-6.5' =
into sunxi/for-next)
Merging tee/next (86dfcfab4fe0 Merge branch 'optee_fix_async_notif_for-v6.3=
' into next)
Merging tegra/for-next (b3a2be8d906b Merge branch for-6.5/arm64/dt into for=
-next)
Merging ti/ti-next (e97291c9d23f Merge branch 'ti-drivers-soc-next' into ti=
-next)
Merging xilinx/for-next (a736607599a5 Merge branch 'zynqmp/soc' into for-ne=
xt)
Merging clk/clk-next (be2033a8660c Merge branch 'clk-i2cid' into clk-next)
Merging clk-imx/for-next (632c60ecd25d clk: imx: scu: use _safe list iterat=
or to avoid a use after free)
Merging clk-renesas/renesas-clk (7df8eea64a41 clk: renesas: rzg2l: Convert =
to readl_poll_timeout_atomic())
Merging clk-samsung/for-next (b35f27fe73d8 clk: samsung: exynosautov9: add =
cmu_peric1 clock support)
Merging csky/linux-next (ac9a78681b92 Linux 6.4-rc1)
Merging loongarch/loongarch-next (f1fcbaa18b28 Linux 6.4-rc2)
Merging m68k/for-next (72b44f6577f1 nubus: Don't list slot resources by def=
ault)
Merging m68knommu/for-next (9561de3a55be Linux 6.4-rc5)
Merging microblaze/next (fe15c26ee26e Linux 6.3-rc1)
Merging mips/mips-next (c5e4d83872ae mips: dts: ingenic: x1000: Add AIC dev=
ice tree node)
Merging openrisc/for-next (c91b4a07655d openrisc: Add floating point regset)
Merging parisc-hd/for-next (fc49c9672cda parisc: Check if IRQs are disabled=
 when calling arch_local_irq_restore())
Merging powerpc/next (7d3ee229ea51 powerpc: Drop MPC5200 LocalPlus bus FIFO=
 driver)
Merging soc-fsl/next (7b1a78babd0d soc/fsl/qe: fix usb.c build errors)
Merging risc-v/for-next (90502d51ab90 Merge patch series "Add basic ACPI su=
pport for RISC-V")
CONFLICT (content): Merge conflict in MAINTAINERS
Merging riscv-dt/riscv-dt-for-next (b087f59779b0 dt-bindings: interrupt-con=
troller: sifive,plic: Sort compatible values)
Merging riscv-soc/riscv-soc-for-next (ac9a78681b92 Linux 6.4-rc1)
Merging s390/for-next (f8bc4ce9f353 Merge branch 'pkey' into for-next)
Merging sh/for-next (bc9d1f0cecd2 sh: j2: Use ioremap() to translate device=
 tree address into kernel memory)
Merging uml/next (6032aca0deb9 um: make stub data pages size tweakable)
Merging xtensa/xtensa-for-next (d0f94ebe1864 xtensa: add asm-prototypes.h)
Merging pidfd/for-next (757777eef55b pid: Replace struct pid 1-element arra=
y with flex-array)
Merging fscrypt/for-next (d617ef039fb8 fscrypt: Replace 1-element array wit=
h flexible array)
Merging fscache/fscache-next (0885eacdc81f Merge tag 'nfsd-5.19-1' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/cel/linux)
Merging afs/afs-next (0a278bc196e7 afs: Automatically generate trace tag en=
ums)
Merging btrfs/for-next (8c81e8c3153f Merge branch 'for-next-next-v6.4-20230=
606' into for-next-20230606)
CONFLICT (content): Merge conflict in fs/btrfs/file.c
Merging ceph/master (df00abd9a792 rbd: get snapshot context after exclusive=
 lock is ensured to be held)
Merging cifs/for-next (9561de3a55be Linux 6.4-rc5)
Merging configfs/for-next (77992f896745 configfs: remove mentions of commit=
table items)
Merging ecryptfs/next (a3d78fe3e1ae fs: ecryptfs: comment typo fix)
Merging erofs/dev (a050c691305b erofs: fix compact 4B support for 16k block=
 size)
Merging exfat/dev (fe15c26ee26e Linux 6.3-rc1)
Merging ext3/for_next (a811aa4333eb Merge fixes for quota issues found by s=
yzbot.)
Merging ext4/dev (571bc93d3e2e ext4: Give symbolic names to mballoc criteri=
as)
Merging f2fs/dev (7aa6ef440cd7 f2fs: add async reset zone command support)
Merging fsverity/for-next (c61c38330e58 fsverity: use shash API instead of =
ahash API)
Merging fuse/for-next (c68ea140050e fuse: remove duplicate check for nodeid)
Merging gfs2/for-next (6ddd5e9eaadf gfs2: Don't remember delete unless it's=
 successful)
Merging jfs/jfs-next (fad376fce0af fs/jfs: fix shift exponent db_agl2size n=
egative)
Merging ksmbd/ksmbd-for-next (a55d20f1379e ksmbd: use kvzalloc instead of k=
vmalloc)
Merging nfs/linux-next (9561de3a55be Linux 6.4-rc5)
Merging nfs-anna/linux-next (43439d858bba NFSv4.2: Fix a potential double f=
ree with READ_PLUS)
Merging nfsd/nfsd-next (8d855ffb92d8 lockd: drop inappropriate svc_get() fr=
om locked_get())
Merging ntfs3/master (1f60ec888102 fs/ntfs3: Add support /proc/fs/ntfs3/<de=
v>/volinfo and /proc/fs/ntfs3/<dev>/label)
Merging orangefs/for-next (31720a2b109b orangefs: Fix kmemleak in orangefs_=
{kernel,client}_debug_init())
Merging overlayfs/overlayfs-next (4f11ada10d0a ovl: fail on invalid uid/gid=
 mapping at copy up)
Merging ubifs/next (b5fda08ef213 ubifs: Fix memleak when insert_old_idx() f=
ailed)
Merging v9fs/9p-next (4ec5183ec486 Linux 6.2-rc7)
Merging v9fs-ericvh/ericvh/for-next (ac9a78681b92 Linux 6.4-rc1)
Merging xfs/for-next (d4d12c02bf5f xfs: collect errors from inodegc for unl=
inked inode recovery)
Merging zonefs/for-next (7d6f61ae0354 zonefs: use iomap for synchronous dir=
ect writes)
Merging iomap/iomap-for-next (3fd41721cd5c iomap: Add DIO tracepoints)
Merging djw-vfs/vfs-for-next (a79168a0c00d fs/remap_range: avoid spurious w=
riteback on zero length request)
Merging file-locks/locks-next (63355b9884b3 cpumask: be more careful with '=
cpumask_setall()')
Merging iversion/iversion-next (63355b9884b3 cpumask: be more careful with =
'cpumask_setall()')
Merging vfs-brauner/vfs.all (ef2920cc14b4 Merge branch 'vfs.rename.locking'=
 into vfs.all)
Merging vfs/for-next (cff4b23c731a Merge branch 'work.lock_rename_child' in=
to for-next)
Merging printk/for-next (16bff6f075a1 Merge branch 'for-6.4' into for-next)
Merging pci/next (a40140c9f009 Merge branch 'pci/controller/vmd')
Merging pstore/for-next/pstore (48f2c681df43 pstore/ram: Convert to platfor=
m remove callback returning void)
Merging hid/for-next (462d72fec9cd Merge branch 'for-6.4/upstream-fixes' in=
to for-next)
Merging i2c/i2c/for-next (6cd5bf0c57f6 Merge branch 'i2c/for-mergewindow' i=
nto i2c/for-next)
Merging i3c/i3c/next (49b472ebc61d i3c: master: svc: add NACK check after s=
tart byte sent)
Merging dmi/dmi-for-next (13a0ac816d22 firmware: dmi: Fortify entry point l=
ength checks)
Merging hwmon-staging/hwmon-next (473595b01086 hwmon: (hp-wmi-sensors) fix =
debugfs check)
Merging jc_docs/docs-next (a1d2c9b3029d docs: process: fix a typoed cross-r=
eference)
Merging v4l-dvb/master (a23a3041c733 Merge tag 'v6.4-rc2' into media_stage)
Merging v4l-dvb-next/master (aafeeaf3d2a8 media: video-mux: update driver t=
o active state)
Merging pm/linux-next (eb13f81a5367 Merge branches 'pm-domains' and 'pm-sle=
ep' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (3b062a086984 cpufreq: dt-platde=
v: Support building as module)
Merging cpupower/cpupower (25891bc945f7 cpupower: Bump soname version)
Merging devfreq/devfreq-next (a83bfdca8b20 PM / devfreq: mtk-cci: Fix varia=
ble deferencing before NULL check)
Merging opp/opp/linux-next (b2a2ab039bd5 opp: Fix use-after-free in lazy_op=
p_tables after probe deferral)
Merging thermal/thermal/linux-next (2afa82d1fc64 dt-bindings: thermal: qcom=
-tsens: Correct unit address)
Merging dlm/next (57e2c2f2d94c fs: dlm: fix mismatch of plock results from =
userspace)
Merging rdma/for-next (8c1ee346da58 RDMA/bnxt_re: Remove unnecessary checks)
Merging net-next/main (28cfea989d6f Merge tag 'mlx5-updates-2023-05-31' of =
git://git.kernel.org/pub/scm/linux/kernel/git/saeed/linux)
CONFLICT (content): Merge conflict in net/ipv4/sysctl_net_ipv4.c
Merging bpf-next/for-next (3d272c2fa804 selftests/bpf: Add missing selftest=
s kconfig options)
Merging ipsec-next/master (b2cbac9b9b28 net: Remove low_thresh in ip defrag)
Merging mlx5-next/mlx5-next (77f7eb9f3416 net/mlx5: Introduce other vport q=
uery for Q-counters)
Merging netfilter-next/master (677fb7525331 Merge git://git.kernel.org/pub/=
scm/linux/kernel/git/netdev/net)
Merging ipvs-next/main (4f325e26277b ipvs: dynamically limit the connection=
 hash table)
Merging bluetooth/master (817efd3cad74 Bluetooth: hci_sock: Forward credent=
ials to monitor)
Merging wireless-next/for-next (8012ec4a0e64 wifi: brcmutil: use helper fun=
ction pktq_empty() instead of open code)
Merging wpan-next/master (1af3de62f03f ieee802154: ca8210: Flag the driver =
as being limited)
Merging wpan-staging/staging (1af3de62f03f ieee802154: ca8210: Flag the dri=
ver as being limited)
Merging mtd/mtd/next (a2c2690f0d74 mtd: st_spi_fsm: Use the devm_clk_get_en=
abled() helper function)
Merging nand/nand/next (ef1560b670bd mtd: spinand: gigadevice: add support =
for GD5F2GQ5xExxH)
Merging spi-nor/spi-nor/next (df6def86b9dc mtd: spi-nor: spansion: Add supp=
ort for s25hl02gt and s25hs02gt)
Merging crypto/master (1d217fa26680 dt-bindings: qcom-qce: Add compatibles =
for SM6115 and QCM2290)
Merging drm/drm-next (2e1492835e43 Merge tag 'drm-misc-next-2023-06-01' of =
git://anongit.freedesktop.org/drm/drm-misc into drm-next)
Merging drm-misc/for-linux-next (013413cdfeec drm/bridge: imx: turn imx8{qm=
,qxp}-ldb into single-object modules)
Merging amdgpu/drm-next (8dede80c4510 drm/amdgpu: fix xclk freq on CHIP_STO=
NEY)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_dev=
ice.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/Kconfig
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/amdgpu_dm=
/dc_fpu.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/dcn31/=
dcn31_hwseq.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/dcn32/=
dcn32_hwseq.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/dml/dc=
n32/dcn32_fpu.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/dml/dc=
n32/dcn32_fpu.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/dml/dc=
n32/display_mode_vba_32.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/dml/dc=
n32/display_mode_vba_32.h
CONFLICT (content): Merge conflict in include/drm/display/drm_dp.h
Merging drm-intel/for-linux-next (718551bbed3c drm/i915: Fix error handling=
 if driver creation fails during probe)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_hd=
cp.c
Merging drm-tegra/for-next (2429b3c529da drm/tegra: Avoid potential 32-bit =
integer overflow)
Merging drm-msm/msm-next (ac7e7c9c65ec drm/msm/dpu: drop unused macros from=
 hw catalog)
Merging drm-msm-lumag/msm-next-lumag (125c32ef4cac Merge branches 'msm-next=
-lumag-core', 'msm-next-lumag-dpu', 'msm-next-lumag-dp', 'msm-next-lumag-ds=
i' and 'msm-next-lumag-mdp5' into msm-next-lumag)
Merging imx-drm/imx-drm/next (927d8fd465ad drm/imx: ipuv3-plane: Remove red=
undant color encoding and range initialisation)
Merging etnaviv/etnaviv/next (4c22c61e429f drm/etnaviv: show number of NN c=
ores in GPU debugfs info)
Merging fbdev/for-next (79a3908d1ea6 fbdev: omapfb: lcd_mipid: Fix an error=
 handling path in mipid_spi_probe())
Merging regmap/for-next (469859394c49 Merge remote-tracking branch 'regmap/=
for-6.5' into regmap-next)
Merging sound/for-next (1a764994102b Merge branch 'topic/midi20' into for-n=
ext)
Merging ieee1394/for-next (06f45435d985 firewire: core: obsolete usage of G=
FP_ATOMIC at building node tree)
Merging sound-asoc/for-next (e65432dd9b82 Merge remote-tracking branch 'aso=
c/for-6.5' into asoc-next)
Merging modules/modules-next (4f521bab5bfc kallsyms: remove unsed API looku=
p_symbol_attrs)
Merging input/next (b00315628095 Input: tests - add test to cover all input=
_grab_device() function)
Merging block/for-next (35bbd38f8a13 Merge branch 'for-6.5/block' into for-=
next)
Merging device-mapper/for-next (38d11da522aa dm: don't lock fs when the map=
 is NULL in process of resume)
Merging libata/for-next (371b74c8ba8f ata: libata-sata: Simplify ata_change=
_queue_depth())
Merging pcmcia/pcmcia-next (15e74c6c1ce2 pcmcia: remove AT91RM9200 Compact =
Flash driver)
Merging mmc/next (aee09fd99934 Merge branch 'fixes' into next)
Merging mfd/for-mfd-next (84009765adb3 dt-bindings: mfd: Add bindings for A=
XP192 MFD device)
Merging backlight/for-backlight-next (29554f2e9138 backlight: Switch i2c dr=
ivers back to use .probe())
Merging battery/for-next (fe20b1dcd2de power: supply: Switch i2c drivers ba=
ck to use .probe())
Merging regulator/for-next (23a4bbdb8d85 Merge remote-tracking branch 'regu=
lator/for-6.5' into regulator-next)
Merging security/next (4432b507445a lsm: fix a number of misspellings)
Merging apparmor/apparmor-next (c96a8a8c021b apparmor: aa_buffer: Convert 1=
-element array to flexible array)
Merging integrity/next-integrity (9df6a4870dc3 integrity: Fix possible mult=
iple allocation in integrity_inode_get())
Merging safesetid/safesetid-next (64b634830c91 LSM: SafeSetID: add setgroup=
s() testing to selftest)
Merging selinux/next (447a5688005e selinux: avoid bool as identifier name)
CONFLICT (content): Merge conflict in security/selinux/Makefile
Merging smack/next (2c085f3a8f23 smack: Record transmuting in smk_transmute=
d)
Merging tomoyo/master (933fd4391e3d workqueue: Emit runtime message when fl=
ush_scheduled_work() is called)
Merging tpmdd/next (14d723483fb7 integrity: Enforce digitalSignature usage =
in the ima and evm keyrings)
Merging watchdog/master (fc4354c6e5c2 Merge tag 'mm-stable-2023-05-06-10-49=
' of git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm)
Merging iommu/next (d11370bf64c5 Merge branches 'iommu/fixes', 'ppc/pamu', =
'virtio', 'x86/amd' and 'core' into next)
Merging audit/next (e455ca40dbcf audit: avoid missing-prototype warnings)
Merging devicetree/for-next (c50eb01940c7 Merge branch 'dt/address-cleanups=
' into dt/next)
Merging dt-krzk/for-next (0ff3c07556e6 Merge branch 'next/dt64' into for-ne=
xt)
Merging mailbox/mailbox-for-next (8fe72b76db79 mailbox: mailbox-test: fix a=
 locking issue in mbox_test_message_write())
Merging spi/for-next (8098a931c080 spi: spl022: Probe defer is no error)
Merging tip/master (a82b4db12187 Merge ras/core into tip/master)
CONFLICT (content): Merge conflict in tools/perf/arch/x86/include/arch-test=
s.h
CONFLICT (content): Merge conflict in tools/perf/arch/x86/tests/arch-tests.c
Merging clockevents/timers/drivers/next (158009f1b4a3 timekeeping: Fix refe=
rences to nonexistent ktime_get_fast_ns())
Merging edac/edac-for-next (6c79e42169fe EDAC/amd64: Add support for ECC on=
 family 19h model 60h-7Fh)
Merging irqchip/irq/irqchip-next (2b384e01fd12 Merge branch irq/gic-v3-asr8=
601 into irq/irqchip-next)
Merging ftrace/for-next (3862f86c1529 Merge tools/for-next)
Merging rcu/rcu/next (83545df658f6 rcuscale: Add kfree_by_call_rcu and kfre=
e_mult to documentation)
Applying: fixup for "RDMA/rxe: Add error messages"
Merging kvm/next (39428f6ea9ea Merge tag 'kvmarm-fixes-6.4-1' of git://git.=
kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into HEAD)
Merging kvm-arm/next (532b2ecfa547 Merge branch kvm-arm64/misc into kvmarm/=
next)
CONFLICT (content): Merge conflict in arch/arm64/kernel/cpufeature.c
Merging kvms390/next (85ae3d09f862 KVM: s390: selftests: add selftest for C=
MMA migration)
Merging kvm-riscv/riscv_kvm_next (2f4d58f7635a RISC-V: KVM: Virtualize per-=
HART AIA CSRs)
Merging kvm-x86/next (31b4fc3bc64a Merge branches 'generic', 'misc', 'mmu',=
 'selftests', 'svm' and 'vmx')
Merging xen-tip/linux-next (335b4223466d x86/pci/xen: populate MSI sysfs en=
tries)
Merging percpu/for-next (b9819165bb45 Merge branch 'for-6.2' into for-next)
Merging workqueues/for-next (ee360b1c5001 Merge branch 'for-6.5-cleanup-ord=
ered' into for-next)
Merging drivers-x86/for-next (e34cd89a6af7 platform/x86: lenovo-yogabook: a=
dd I2C dependency)
Merging chrome-platform/for-next (f5bb4e381290 platform/chrome: Switch i2c =
drivers back to use .probe())
Merging hsi/for-next (42877c38ac78 HSI: omap_ssi_port: Drop error checking =
for debugfs_create_dir)
Merging leds/for-next (1b929c02afd3 Linux 6.2-rc1)
Merging leds-lj/for-leds-next (e338a05e76ca dt-bindings: leds: Add binding =
for AW200xx)
Merging ipmi/for-next (e64c82b80641 ipmi: Switch i2c drivers back to use .p=
robe())
Merging driver-core/driver-core-next (16b58423b4c3 Merge 6.4-rc5 into drive=
r-core-next)
Merging usb/usb-next (d37537a1f7cf Merge 6.4-rc5 into usb-next)
Merging thunderbolt/next (033c2d8ab283 thunderbolt: Log DisplayPort adapter=
 rate and lanes on discovery)
Merging usb-serial/usb-next (7877cb91f108 Linux 6.4-rc4)
Merging tty/tty-next (2076b2a4a6b7 Merge 6.4-rc5 into tty-next)
Merging char-misc/char-misc-next (5959fe74c993 Merge 6.4-rc5 into char-misc=
-next)
Merging accel/habanalabs-next (6e0dd9fb1c24 accel/habanalabs: refactor erro=
r info reset)
Merging coresight/next (7877cb91f108 Linux 6.4-rc4)
Merging fastrpc/for-next (ac9a78681b92 Linux 6.4-rc1)
Merging fpga/for-next (148efa63bab3 fpga: dfl-fme: constify pointers to hwm=
on_channel_info)
Merging icc/icc-next (63cf621fde8c Merge branch 'icc-qos' into icc-next)
Merging iio/togreg (12a875055c15 iio: temperature: tmp006: Add OF device ma=
tching support)
Merging phy-next/next (1eac0f956608 dt-bindings: phy: qcom,qmp-usb: fix bin=
dings error)
Merging soundwire/next (94f89950850e soundwire: cadence: revisit parity inj=
ection)
Merging extcon/extcon-next (bcfa8e33064f extcon: Switch i2c drivers back to=
 use .probe())
Merging gnss/gnss-next (44c026a73be8 Linux 6.4-rc3)
Merging vfio/next (d9824f70e52c vfio/pci: Also demote hiding standard cap m=
essages)
Merging w1/for-next (b332af5398a3 w1: Replace usage of found with dedicated=
 list iterator variable)
Merging staging/staging-next (c6e9da9d5566 staging: rtl8192e: clean unneces=
sary braces warning on r8192E_phy.c)
Merging counter-next/counter-next (98ffe0252911 counter: 104-quad-8: Migrat=
e to the regmap API)
Merging mux/for-next (44c026a73be8 Linux 6.4-rc3)
Merging dmaengine/next (907514a7dc4c dmaengine: sprd: Don't set chancnt)
Merging cgroup/for-next (f32b14ba70a9 Merge branch 'for-6.4-fixes' into for=
-next)
Merging scsi/for-next (28646fd24f4e Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (467e6cc73ef2 Merge patch series "UFS host contro=
ller driver patches")
Merging vhost/linux-next (853b05e8d8d9 vp_vdpa: Check queue number of vdpa =
device from add_config)
Merging rpmsg/for-next (1ca04f21b204 remoteproc: stm32: Fix error code in s=
tm32_rproc_parse_dt())
Merging gpio/for-next (ac9a78681b92 Linux 6.4-rc1)
Merging gpio-brgl/gpio/for-next (7ce8d39e3421 gpio: Fix dependency for gpio=
-delay)
Merging gpio-intel/for-next (ac9a78681b92 Linux 6.4-rc1)
Merging pinctrl/for-next (4ab0b8b35718 Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (0633dc4a5423 pinctrl: cherryview: Don't use=
 IRQ core constanst for invalid IRQ)
Merging pinctrl-renesas/renesas-pinctrl (5d32cead772c pinctrl: renesas: Fix=
 spaces followed by tabs)
Merging pinctrl-samsung/for-next (ac9a78681b92 Linux 6.4-rc1)
Merging pwm/for-next (247ee6c78040 pwm: Remove unused radix tree)
Merging userns/for-next (05bd6e0242b4 Merge of unpriv-ipc-sysctls-for-v6.2,=
 and fix-atomic_lock_inc_below-for-v6.2 for testing in linux-next)
Merging ktest/for-next (7dc8e24f0e09 ktest: Restore stty setting at first i=
n dodie)
Merging kselftest/next (d909ae0a8562 kselftests: Sort the collections list =
to avoid duplicate tests)
Merging kunit/test (ac9a78681b92 Linux 6.4-rc1)
Merging kunit-next/kunit (260755184cbd kunit: Move kunit_abort() call out o=
f kunit_do_failed_assertion())
Merging livepatching/for-next (ac4890f97211 Merge branch 'for-6.5/core' int=
o for-next)
Merging rtc/rtc-next (ac9a78681b92 Linux 6.4-rc1)
Merging nvdimm/libnvdimm-for-next (305a72efa791 Merge branch 'for-6.1/nvdim=
m' into libnvdimm-for-next)
Merging at24/at24/for-next (a3c10035d12f eeprom: at24: Use dev_err_probe fo=
r nvmem register failure)
Merging ntb/ntb-next (942cc9ceccb6 ntb: intel: Remove redundant pci_clear_m=
aster)
Merging seccomp/for-next/seccomp (0fb0624b15d2 seccomp: fix kernel-doc func=
tion name warning)
Merging fsi/next (35af9fb49bc5 fsi: core: Check error number after calling =
ida_simple_get)
Merging slimbus/for-next (ac9a78681b92 Linux 6.4-rc1)
Merging nvmem/for-next (05f53e3c22a7 dt-bindings: nvmem: mediatek: efuse: a=
dd support for mt7986)
Merging xarray/main (69cb69ea5542 ida: Remove assertions that an ID was all=
ocated)
Merging hyperv/hyperv-next (a494aef23dfc PCI: hv: Replace retarget_msi_inte=
rrupt_params with hyperv_pcpu_input_arg)
Merging auxdisplay/auxdisplay (def85dce1451 auxdisplay: Switch i2c drivers =
back to use .probe())
Merging kgdb/kgdb/for-next (c1cb81429df4 kdb: Fix the putarea helper functi=
on)
Merging hmm/hmm (ac9a78681b92 Linux 6.4-rc1)
Merging cfi/cfi/next (312310928417 Linux 5.18-rc1)
Merging mhi/mhi-next (a196d7ad4ca5 bus: mhi: host: pci_generic: Add support=
 for IP_SW0 channels)
Merging memblock/for-next (de649e7f5edb memblock: Update nid info in memblo=
ck debugfs)
Merging cxl/next (a70fc4ed20a6 cxl/port: Fix NULL pointer access in devm_cx=
l_add_port())
Merging zstd/zstd-next (2aa14b1ab2c4 zstd: import usptream v1.5.2)
Merging efi/next (13c21ab8038d efi/esrt: Allow ESRT access without CAP_SYS_=
ADMIN)
Merging unicode/for-next (b500d6d7243d unicode: Handle memory allocation fa=
ilures in mkutf8data)
Merging slab/for-next (05f241409090 Merge branch 'slab/for-6.5/slab_no_merg=
e' into slab/for-next)
Merging random/master (512dee0c00ad Merge tag 'x86-urgent-2023-01-04' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging landlock/next (33ccf2aa6175 landlock: Document Landlock's network s=
upport)
$ git reset --hard HEAD^
Merging next-20230605 version of landlock
Merging rust/rust-next (d09a61024f6b rust: task: add `Send` marker to `Task=
`)
Merging sysctl/sysctl-next (01e6aac78b1c signal: move show_unhandled_signal=
s sysctl to its own file)
Merging execve/for-next/execve (36650a357eac binfmt: Slightly simplify elf_=
fdpic_map_file())
Merging bitmap/bitmap-for-next (714f3af11b21 cpumask: fix function descript=
ion kernel-doc notation)
CONFLICT (content): Merge conflict in include/linux/cpumask.h
Merging hte/for-next (ac9a78681b92 Linux 6.4-rc1)
Merging kspp/for-next/kspp (b2f10148ec1e kobject: Use return value of strre=
place())
Merging kspp-gustavo/for-next/kspp (4cac30138e5e media: venus: hfi_cmds: Re=
place fake flex-arrays with flexible-array members)
Merging iommufd/for-next (f1fcbaa18b28 Linux 6.4-rc2)

--Sig_/ync92TkWDpBOzr1n01/qcf=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmR+tbsACgkQAVBC80lX
0GzMewf/ezrty4jUuwagpnOlP6l8d7rmNFZmzZ4qAaxCykvIQnJhx7jX3U4RflL7
EOpiPg9N00pds/IbPM3/a/AxzRobQLR77cyhJreNh8onyVCfgxA9dVOA+/ONInIY
3VbuNxSfs8HO3zrCEsgwD1oCKIMQtmI42rldTiAvIVZgz0eAl+gqEzHyfv/iWPvc
y7qy+OAUpEc6eDYshBRYFgnHBSFt11wnGaqte+Pb4TzPyO6EYPmwUOgKuMC/4uxI
MBvFQTwE3RmIKHjdQQHYo0/hW0pEUN9LKlFnyXy1ImDoVhvYkyZ8qXsOHLSxBeWm
GUBrl9ryNgQx2ahELNXY6Q8SFjDmsg==
=7Ahl
-----END PGP SIGNATURE-----

--Sig_/ync92TkWDpBOzr1n01/qcf=--
