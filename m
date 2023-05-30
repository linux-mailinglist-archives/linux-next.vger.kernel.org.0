Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA5617154EC
	for <lists+linux-next@lfdr.de>; Tue, 30 May 2023 07:30:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230100AbjE3FaF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 30 May 2023 01:30:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229915AbjE3FaE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 30 May 2023 01:30:04 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D915AAD;
        Mon, 29 May 2023 22:29:58 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4QVgvS5k8pz4x2c;
        Tue, 30 May 2023 15:29:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1685424597;
        bh=l+1xJLrBGx7kfs1sfUdNkOk7UJMXV/oLCoIxAxrGDZc=;
        h=Date:From:To:Cc:Subject:From;
        b=MGtqf0NZByT5LtcP6fcaaCpuD+jdYEKEmxwMIP6nx87Yf+WLk8Ml/1sCdfqd818sf
         1mBi8nsXBCdjx0NlX6CI/S2lg50tUerU3000MnCTlzyfyMjzaxNylI5CBLTg7mP+jp
         nnl3pPhtnCghPhpC4nZA5aRwfx5X7HdrpT0cDX0p0DlhooxHzGGs2YP7j91kDzeSwr
         j1sJ7m8JhN+i22/LUhnSZkokGieZNBztApyUe0oEVO01le65a6/HnWqFxYxfT8Bddz
         OMk6Bie8aiUPSiOVvapt5KSvsPpkGuE7uPPXtayoc0GJswvn5QoGmdiHXEBElS80E0
         zmest1WVXsfGA==
Date:   Tue, 30 May 2023 15:29:54 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for May 30
Message-ID: <20230530152954.72535fa4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/eng33N/kCG_aOGV.K.X97ho";
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

--Sig_/eng33N/kCG_aOGV.K.X97ho
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20230525:

The perf tree gained a build failure so I used the version from
next-20230525.

The broadcom tree gained a conflict against Linus' tree.

The drm-intel tree gained conflicts against the drm tree.

The ieee1394 tree gained a build failure so I used the version from
next-20230525.

The tip tree lost its boot failure on ppc.

The gpio-brgl tree gained a conflict against the arm-soc tree.

The efi tree gained a conflict against the efi-fixes tree.

Non-merge commits (relative to Linus' tree): 5110
 6124 files changed, 206885 insertions(+), 75740 deletions(-)

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
Merging origin/master (8b817fded42d Merge tag 'trace-v6.4-rc3' of git://git=
.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace)
Merging fixes/fixes (ac9a78681b92 Linux 6.4-rc1)
Merging mm-hotfixes/mm-hotfixes-unstable (c11d6b81528e mm/gup_test: fix ioc=
tl fail for compat task)
Merging kbuild-current/fixes (f1fcbaa18b28 Linux 6.4-rc2)
Merging arc-current/for-curr (30a0b95b1335 Linux 6.1-rc3)
Merging arm-current/fixes (2b951b0efbaa ARM: 9297/1: vfp: avoid unbalanced =
stack on 'success' return path)
Merging arm64-fixes/for-next/fixes (fd2d1cb8c545 arm64: Make the ARCH_FORCE=
_MAX_ORDER config input prompt unconditional)
Merging arm-soc-fixes/arm/fixes (abf5422e821f Merge tag 'ffa-fixes-6.4' of =
git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into arm/f=
ixes)
Merging davinci-current/davinci/for-current (ac9a78681b92 Linux 6.4-rc1)
Merging drivers-memory-fixes/fixes (ac9a78681b92 Linux 6.4-rc1)
Merging tee-fixes/fixes (ceaa837f96ad Linux 6.2-rc8)
Merging m68k-current/for-linus (b845b574f86d m68k: Move signal frame follow=
ing exception on 68020/030)
Merging powerpc-fixes/fixes (358e526a1648 powerpc/mm: Reinstate ARCH_FORCE_=
MAX_ORDER ranges)
Merging s390-fixes/fixes (89c0c62e947a s390/cio: unregister device when the=
 only path is gone)
Merging sparc/master (2d2b17d08bfc sparc: Unbreak the build)
Merging fscrypt-current/for-current (4bcf6f827a79 fscrypt: check for NULL k=
eyring in fscrypt_put_master_key_activeref())
Merging fsverity-current/for-current (a075bacde257 fsverity: don't drop pag=
ecache at end of FS_IOC_ENABLE_VERITY)
Merging net/main (9b9e46aa0727 nfcsim.c: Fix error checking for debugfs_cre=
ate_dir)
Merging bpf/master (ad42a35bdfc6 udplite: Fix NULL pointer dereference in _=
_sk_mem_raise_allocated().)
Merging ipsec/master (67caf26d769e Merge tag 'for-net-2023-05-19' of git://=
git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth)
Merging netfilter/master (7fb0269720d7 Merge tag 'for-net-2022-05-23' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth)
Merging ipvs/main (ad42a35bdfc6 udplite: Fix NULL pointer dereference in __=
sk_mem_raise_allocated().)
Merging wireless/for-next (30bc32c7c1f9 wifi: mt76: mt7615: fix possible ra=
ce in mt7615_mac_sta_poll)
Merging wpan/master (bd4e3d82f4cc MAINTAINERS: Add wpan patchwork)
Merging rdma-fixes/for-rc (ffe14de98325 MAINTAINERS: Update maintainer of A=
mazon EFA driver)
Merging sound-current/for-linus (4ca110cab465 ALSA: hda/realtek: Enable hea=
dset onLenovo M70/M90)
Merging sound-asoc-fixes/for-linus (8938f75a5e35 ASoC: simple-card: Add mis=
sing of_node_put() in case of error)
Merging regmap-fixes/for-linus (0cc6578048e0 regmap: maple: Drop the RCU re=
ad lock while syncing registers)
Merging regulator-fixes/for-linus (a511637502b1 regulator: mt6359: add read=
 check for PMIC MT6359)
Merging spi-fixes/for-linus (4be47a5d59cb spi: mt65xx: make sure operations=
 completed before unloading)
Merging pci-current/for-linus (3b8803494a06 PCI/DPC: Quirk PIO log size for=
 Intel Ice Lake Root Ports)
Merging driver-core.current/driver-core-linus (44c026a73be8 Linux 6.4-rc3)
Merging tty.current/tty-linus (44c026a73be8 Linux 6.4-rc3)
Merging usb.current/usb-linus (44d0fb387b53 mm: page_table_check: Ensure us=
er pages are not slab pages)
Merging usb-serial-fixes/usb-linus (44c026a73be8 Linux 6.4-rc3)
Merging phy/fixes (2a881183dc5a phy: qcom-snps: correct struct qcom_snps_hs=
phy kerneldoc)
Merging staging.current/staging-linus (b3dad076a058 staging: octeon: delete=
 my name from TODO contact)
Merging iio-fixes/fixes-togreg (a408ffbb2a9e iio: addac: ad74413: don't set=
 DIN_SINK for functions other than digital input)
Merging counter-current/counter-current (ac9a78681b92 Linux 6.4-rc1)
Merging char-misc.current/char-misc-linus (46248400d81e misc: fastrpc: reje=
ct new invocations during device removal)
Merging soundwire-fixes/fixes (99e09b9c0ab4 soundwire: qcom: add proper err=
or paths in qcom_swrm_startup())
Merging thunderbolt-fixes/fixes (3fe95742af29 thunderbolt: Do not touch CL =
state configuration during discovery)
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
Merging mtd-fixes/mtd/fixes (87dee04f3c82 mtd: rawnand: marvell: don't set =
the NAND frequency select)
Merging mfd-fixes/for-mfd-fixes (88603b6dc419 Linux 6.2-rc2)
Merging v4l-dvb-fixes/fixes (a05e9aabd9dc media: staging: media: atomisp: i=
nit high & low vars)
Merging reset-fixes/reset/fixes (3a2390c6777e reset: uniphier-glue: Fix pos=
sible null-ptr-deref)
Merging mips-fixes/mips-fixes (4897a898a216 mips: Move initrd_start check a=
fter initrd address sanitisation.)
Merging at91-fixes/at91-fixes (6b0db163ff92 ARM: dts: at91: sama7g5ek: fix =
debounce delay property for shdwc)
Merging omap-fixes/fixes (2a906db2824b Merge branch 'am5748-fix' into fixes)
Merging kvm-fixes/master (b9846a698c9a KVM: VMX: add MSR_IA32_TSX_CTRL into=
 msrs_to_save)
Merging kvms390-fixes/master (21f27df85400 KVM: s390: pv: fix external inte=
rruption loop not always detected)
Merging hwmon-fixes/hwmon (0babf89c9cca hwmon: (f71882fg) prevent possible =
division by zero)
Merging nvdimm-fixes/libnvdimm-fixes (e5baf8c07707 libnvdimm: mark 'securit=
y_show' static again)
Merging cxl-fixes/fixes (a70fc4ed20a6 cxl/port: Fix NULL pointer access in =
devm_cxl_add_port())
Merging btrfs-fixes/next-fixes (36fff9d2a195 Merge branch 'misc-6.4' into n=
ext-fixes)
Merging vfs-fixes/fixes (609d54441493 fs: prevent out-of-bounds array specu=
lation when closing a file descriptor)
Merging dma-mapping-fixes/for-linus (bbb73a103fbb swiotlb: fix a braino in =
the alignment check fix)
Merging drivers-x86-fixes/fixes (3279decb2c3c platform/x86/intel/ifs: Annot=
ate work queue on stack so object debug does not complain)
Merging samsung-krzk-fixes/fixes (ac9a78681b92 Linux 6.4-rc1)
Merging pinctrl-samsung-fixes/fixes (ac9a78681b92 Linux 6.4-rc1)
Merging devicetree-fixes/dt/linus (6997f847cbb7 MAINTAINERS: add Conor as a=
 dt-bindings maintainer)
Merging dt-krzk-fixes/fixes (8bbec86ce6d6 dt-bindings: PCI: fsl,imx6q: fix =
assigned-clocks warning)
Merging scsi-fixes/fixes (d54820b22e40 scsi: qla2xxx: Fix NULL pointer dere=
ference in target mode)
Merging drm-fixes/drm-fixes (7877cb91f108 Linux 6.4-rc4)
Merging drm-intel-fixes/for-linux-next-fixes (7877cb91f108 Linux 6.4-rc4)
Merging mmc-fixes/fixes (0b5d5c436a5c mmc: pwrseq: sd8787: Fix WILC CHIP_EN=
 and RESETN toggling order)
Merging rtc-fixes/rtc-fixes (08279468a294 rtc: sunplus: fix format string f=
or printing resource)
Merging gnss-fixes/gnss-linus (44c026a73be8 Linux 6.4-rc3)
Merging hyperv-fixes/hyperv-fixes (ec97e112985c Drivers: hv: vmbus: Call hv=
_synic_free() if hv_synic_alloc() fails)
Merging soc-fsl-fixes/fix (4b0986a3613c Linux 5.18)
Merging risc-v-fixes/fixes (3b90b09af5be riscv: Fix orphan section warnings=
 caused by kernel/pi)
Merging riscv-dt-fixes/riscv-dt-fixes (ac9a78681b92 Linux 6.4-rc1)
Merging riscv-soc-fixes/riscv-soc-fixes (a7a041f2ddf3 soc: microchip: mpfs:=
 handle failed system service requests)
Merging fpga-fixes/fixes (d8bdc50012fe dt-bindings: fpga: replace Ivan Born=
yakov maintainership)
Merging spdx/spdx-linus (d635f6cc934b Merge tag 'drm-fixes-2023-05-20' of g=
it://anongit.freedesktop.org/drm/drm)
Merging gpio-brgl-fixes/gpio/for-current (3002b8642f01 gpio-f7188x: fix chi=
p name and pin count on Nuvoton chip)
Merging gpio-intel-fixes/fixes (fe15c26ee26e Linux 6.3-rc1)
Merging pinctrl-intel-fixes/fixes (7877cb91f108 Linux 6.4-rc4)
Merging erofs-fixes/fixes (cf7f2732b4b8 erofs: use HIPRI by default if per-=
cpu kthreads are enabled)
Merging kunit-fixes/kunit-fixes (ac9a78681b92 Linux 6.4-rc1)
Merging ubifs-fixes/fixes (2241ab53cbb5 Linux 6.2-rc5)
Merging memblock-fixes/fixes (647037adcad0 Revert "mm: Always release pages=
 to the buddy allocator in memblock_free_late().")
Merging nfsd-fixes/nfsd-fixes (d53d70084d27 nfsd: make a copy of struct iat=
tr before calling notify_change)
Merging irqchip-fixes/irq/irqchip-fixes (cddb536a73ef irqchip/mbigen: Unify=
 the error handling in mbigen_of_create_domain())
Merging renesas-fixes/fixes (ab2866f12ca1 arm64: dts: renesas: r8a779g0: Fi=
x HSCIF0 interrupt number)
Merging broadcom-fixes/fixes (9abf2313adc1 Linux 6.1-rc1)
Merging perf-current/perf/urgent (c041d33bf7ec perf evsel: Separate bpf_cou=
nter_list and bpf_filters, can be used at the same time)
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
Merging drm-misc-fixes/for-linux-next-fixes (e79d85c6c217 drm/fb-helper: Fi=
x height, width, and accel_flags in fb_var)
Merging mm-stable/mm-stable (44c026a73be8 Linux 6.4-rc3)
Merging mm-nonmm-stable/mm-nonmm-stable (44c026a73be8 Linux 6.4-rc3)
Merging mm/mm-everything (39ff09d6a99e Merge branch 'mm-nonmm-unstable' int=
o mm-everything)
Merging kbuild/for-next (1df380ff3018 modpost: remove *_sections[] arrays)
Merging clang-format/clang-format (781121a7f6d1 clang-format: Fix space aft=
er for_each macros)
Merging perf/perf-tools-next (200323768787 libsubcmd: Avoid two path static=
s, removing 8192 bytes from .bss)
$ git reset --hard HEAD^
Merging next-20230525 version of perf
Merging compiler-attributes/compiler-attributes (eeac8ede1755 Linux 6.3-rc2)
Merging dma-mapping/for-next (ec274aff21b6 swiotlb: Omit total_used and use=
d_hiwater if !CONFIG_DEBUG_FS)
Merging asm-generic/master (6e542e9820c2 Merge tag 'virt-to-pfn-for-arch-v6=
.5' of git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrato=
r into asm-generic)
Merging arc/for-next (f2906aa86338 Linux 5.19-rc1)
Merging arm/for-next (fc6750b0d4a9 Merge branches 'misc' and 'fixes' into f=
or-next)
Merging arm64/for-next/core (fd346f5fd1ab Merge branches 'for-next/kpti', '=
for-next/missing-proto-warn', 'for-next/iss2-decode', 'for-next/kselftest' =
and 'for-next/misc' into for-next/core)
Merging arm-perf/for-next/perf (257aedb72e73 drivers/perf: hisi: add NULL c=
heck for name)
Merging arm-soc/for-next (1f2b89101d84 soc: document merges)
Merging amlogic/for-next (0618cb14da6a Merge branch 'v6.5/arm-dt' into for-=
next)
Merging asahi-soc/asahi-soc/for-next (f41aba157819 Merge branch 'asahi-soc/=
dt' into asahi-soc/for-next)
Merging aspeed/for-next (7d4f0b0df7c5 ARM: dts: aspeed-g6: Add UDMA node)
Merging at91/at91-next (9c8457a847fa Merge branch 'clk-microchip' into at91=
-next)
Merging broadcom/next (904c82a93013 Merge branch 'maintainers/next' into ne=
xt)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging davinci/davinci/for-next (ac9a78681b92 Linux 6.4-rc1)
Merging drivers-memory/for-next (3d56c7364389 memory: renesas-rpc-if: Fix P=
HYCNT.STRTIM setting)
Merging imx-mxs/for-next (b20b0e97fc47 Merge branch 'imx/defconfig' into fo=
r-next)
Merging mediatek/for-next (4ee843a581b3 Merge branch 'v6.4-next/soc' into f=
or-next)
Merging mvebu/for-next (64687391f64d Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (c45167f4f5cf Merge branch 'omap-for-v6.4/dt' into fo=
r-next)
Merging qcom/for-next (d554e1803f51 Merge branches 'arm64-defconfig-for-6.5=
', 'arm64-fixes-for-6.4', 'arm64-for-6.5', 'clk-for-6.5', 'drivers-fixes-fo=
r-6.4', 'drivers-for-6.5', 'dts-fixes-for-6.4' and 'dts-for-6.5' into for-n=
ext)
Merging renesas/next (21330625d0f5 Merge branches 'renesas-arm-defconfig-fo=
r-v6.5' and 'renesas-drivers-for-v6.5' into renesas-next)
Merging reset/reset/next (afb39e2bd36a reset: mpfs: select AUXILIARY_BUS)
Merging rockchip/for-next (ed555596bf75 Merge branch 'v6.5-armsoc/dts64' in=
to for-next)
Merging samsung-krzk/for-next (5b248db78d1a Merge branch 'next/dt64' into f=
or-next)
Merging scmi/for-linux-next (1aae3c9ccf14 Merge branch 'for-next/scmi/updat=
es' of git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux int=
o for-linux-next)
Merging stm32/stm32-next (3b1583868691 ARM: dts: stm32: fix m4_rproc refere=
nces to use SCMI for stm32mp15)
Merging sunxi/sunxi/for-next (7554aa0897a3 Merge branch 'sunxi/dt-for-6.5' =
into sunxi/for-next)
Merging tee/next (86dfcfab4fe0 Merge branch 'optee_fix_async_notif_for-v6.3=
' into next)
Merging tegra/for-next (31df55477fe7 Merge branch for-6.5/arm64/dt into for=
-next)
Merging ti/ti-next (6bb0b834e3c2 Merge branch 'ti-drivers-soc-next' into ti=
-next)
Merging xilinx/for-next (6c363be08288 Merge branch 'zynqmp/soc' into for-ne=
xt)
Merging clk/clk-next (be2033a8660c Merge branch 'clk-i2cid' into clk-next)
Merging clk-imx/for-next (632c60ecd25d clk: imx: scu: use _safe list iterat=
or to avoid a use after free)
Merging clk-renesas/renesas-clk (d1c20885d3b0 clk: renesas: rzg2l: Fix CPG_=
SIPLL5_CLK1 register write)
Merging clk-samsung/for-next (b35f27fe73d8 clk: samsung: exynosautov9: add =
cmu_peric1 clock support)
Merging csky/linux-next (ac9a78681b92 Linux 6.4-rc1)
Merging loongarch/loongarch-next (f1fcbaa18b28 Linux 6.4-rc2)
Merging m68k/for-next (72b44f6577f1 nubus: Don't list slot resources by def=
ault)
Merging m68knommu/for-next (7877cb91f108 Linux 6.4-rc4)
Merging microblaze/next (fe15c26ee26e Linux 6.3-rc1)
Merging mips/mips-next (c5e4d83872ae mips: dts: ingenic: x1000: Add AIC dev=
ice tree node)
Merging openrisc/for-next (c91b4a07655d openrisc: Add floating point regset)
Merging parisc-hd/for-next (b623c8436064 parisc: Add cacheflush() syscall)
Merging powerpc/next (7d3ee229ea51 powerpc: Drop MPC5200 LocalPlus bus FIFO=
 driver)
Merging soc-fsl/next (4b0986a3613c Linux 5.18)
Merging risc-v/for-next (ac9a78681b92 Linux 6.4-rc1)
Merging riscv-dt/riscv-dt-for-next (b087f59779b0 dt-bindings: interrupt-con=
troller: sifive,plic: Sort compatible values)
Merging riscv-soc/riscv-soc-for-next (ac9a78681b92 Linux 6.4-rc1)
Merging s390/for-next (0f97c70a021b Merge branch 'pkey' into for-next)
Merging sh/for-next (bc9d1f0cecd2 sh: j2: Use ioremap() to translate device=
 tree address into kernel memory)
Merging uml/next (6032aca0deb9 um: make stub data pages size tweakable)
Merging xtensa/xtensa-for-next (d0f94ebe1864 xtensa: add asm-prototypes.h)
Merging pidfd/for-next (ad0ff58dc959 pid: Replace struct pid 1-element arra=
y with flex-array)
Merging fscrypt/for-next (d617ef039fb8 fscrypt: Replace 1-element array wit=
h flexible array)
Merging fscache/fscache-next (0885eacdc81f Merge tag 'nfsd-5.19-1' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/cel/linux)
Merging afs/afs-next (0a278bc196e7 afs: Automatically generate trace tag en=
ums)
Merging btrfs/for-next (bebbb1f5d0b4 Merge branch 'for-next-next-v6.4-20230=
529' into for-next-20230529)
Merging ceph/master (4cafd0400bcb ceph: force updating the msg pointer in n=
on-split case)
Merging cifs/for-next (fdd7d1fff4e3 cifs: address unused variable warning)
Merging configfs/for-next (77992f896745 configfs: remove mentions of commit=
table items)
Merging ecryptfs/next (a3d78fe3e1ae fs: ecryptfs: comment typo fix)
Merging erofs/dev (ac9a78681b92 Linux 6.4-rc1)
Merging exfat/dev (fe15c26ee26e Linux 6.3-rc1)
Merging ext3/for_next (51fbfb96c048 Pull updated version of ext2 highmem ha=
ndling cleanups from Al.)
Merging ext4/dev (781c858c35c8 ext4: enable the lazy init thread when remou=
nting read/write)
Merging f2fs/dev (8b1be8160277 f2fs: renew value of F2FS_FEATURE_*)
Merging fsverity/for-next (c61c38330e58 fsverity: use shash API instead of =
ahash API)
Merging fuse/for-next (c68ea140050e fuse: remove duplicate check for nodeid)
Merging gfs2/for-next (6ddd5e9eaadf gfs2: Don't remember delete unless it's=
 successful)
Merging jfs/jfs-next (fad376fce0af fs/jfs: fix shift exponent db_agl2size n=
egative)
Merging ksmbd/ksmbd-for-next (6fe55c2799bc ksmbd: call putname after using =
the last component)
Merging nfs/linux-next (7877cb91f108 Linux 6.4-rc4)
Merging nfs-anna/linux-next (43439d858bba NFSv4.2: Fix a potential double f=
ree with READ_PLUS)
Merging nfsd/nfsd-next (304d003fa565 NFSD: enable support for write delegat=
ion)
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
Merging xfs/for-next (2254a7396a0c xfs: fix xfs_inodegc_stop racing with mo=
d_delayed_work)
Merging zonefs/for-next (2b188a2cfc4d zonefs: make kobj_type structure cons=
tant)
Merging iomap/iomap-for-next (3fd41721cd5c iomap: Add DIO tracepoints)
Merging djw-vfs/vfs-for-next (a79168a0c00d fs/remap_range: avoid spurious w=
riteback on zero length request)
Merging file-locks/locks-next (63355b9884b3 cpumask: be more careful with '=
cpumask_setall()')
Merging iversion/iversion-next (63355b9884b3 cpumask: be more careful with =
'cpumask_setall()')
Merging vfs-brauner/vfs.all (da4e876407c4 Merge branch 'fs.ntfs' into vfs.a=
ll)
Merging vfs/for-next (cff4b23c731a Merge branch 'work.lock_rename_child' in=
to for-next)
Merging printk/for-next (16bff6f075a1 Merge branch 'for-6.4' into for-next)
Merging pci/next (a40140c9f009 Merge branch 'pci/controller/vmd')
Merging pstore/for-next/pstore (48f2c681df43 pstore/ram: Convert to platfor=
m remove callback returning void)
Merging hid/for-next (c88f8e44a663 Merge branch 'for-6.5/core' into for-nex=
t)
Merging i2c/i2c/for-next (03230ddddf9d Merge branch 'i2c/for-current' into =
i2c/for-next)
Merging i3c/i3c/next (6b496a94c590 i3c: ast2600: set variable ast2600_i3c_o=
ps storage-class-specifier to static)
Merging dmi/dmi-for-next (13a0ac816d22 firmware: dmi: Fortify entry point l=
ength checks)
Merging hwmon-staging/hwmon-next (70e0b7722c58 hwmon: (pmbus/adm1266) Drop =
unnecessary error check for debugfs_create_dir)
Merging jc_docs/docs-next (a1d2c9b3029d docs: process: fix a typoed cross-r=
eference)
Merging v4l-dvb/master (a23a3041c733 Merge tag 'v6.4-rc2' into media_stage)
Merging v4l-dvb-next/master (aafeeaf3d2a8 media: video-mux: update driver t=
o active state)
Merging pm/linux-next (49b12f874524 Merge branches 'pm-domains' and 'pm-sle=
ep' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (b79ead08a7d9 dt-bindings: cpufr=
eq: qcom-cpufreq-nvmem: document IPQ8074)
Merging cpupower/cpupower (25891bc945f7 cpupower: Bump soname version)
Merging devfreq/devfreq-next (a83bfdca8b20 PM / devfreq: mtk-cci: Fix varia=
ble deferencing before NULL check)
Merging opp/opp/linux-next (9e28f7a74581 OPP: rate-limit debug messages whe=
n no change in OPP is required)
Merging thermal/thermal/linux-next (2afa82d1fc64 dt-bindings: thermal: qcom=
-tsens: Correct unit address)
Merging dlm/next (57e2c2f2d94c fs: dlm: fix mismatch of plock results from =
userspace)
Merging rdma/for-next (a7dae5daf4bf RDMA/irdma: Move iw device ops initiali=
zation)
Merging net-next/main (75455b906d82 Merge tag 'for-netdev' of https://git.k=
ernel.org/pub/scm/linux/kernel/git/bpf/bpf-next)
Merging bpf-next/for-next (4266f41feaee bpf: Fix bad unlock balance on free=
ze_mutex)
Merging ipsec-next/master (b2cbac9b9b28 net: Remove low_thresh in ip defrag)
Merging mlx5-next/mlx5-next (77f7eb9f3416 net/mlx5: Introduce other vport q=
uery for Q-counters)
Merging netfilter-next/master (677fb7525331 Merge git://git.kernel.org/pub/=
scm/linux/kernel/git/netdev/net)
Merging ipvs-next/main (dcbe4ea1985d Merge branch '1GbE' of git://git.kerne=
l.org/pub/scm/linux/kernel/git/tnguy/next-queue)
Merging bluetooth/master (a088d769ef3a Bluetooth: L2CAP: Fix use-after-free)
Merging wireless-next/for-next (1f1784a59caf wifi: rtw88: usb: silence log =
flooding error message)
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
Merging crypto/master (66dd59b7aa55 crypto: Kconfig - warn about performanc=
e overhead of CRYPTO_STATS)
Merging drm/drm-next (85d712f033d2 Merge tag 'drm-intel-gt-next-2023-05-24'=
 of git://anongit.freedesktop.org/drm/drm-intel into drm-next)
Merging drm-misc/for-linux-next (67d0109fb7ae drm: lcdif: Add i.MX93 LCDIF =
compatible string)
Merging amdgpu/drm-next (a6c4e4f3134e drm/amd/display: remove unused defini=
tion)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_dev=
ice.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/Kconfig
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/amdgpu_dm=
/dc_fpu.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/dcn30/=
dcn30_hwseq.c
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
Merging drm-intel/for-linux-next (47d56cadb9e2 drm/i915: Implement CTM prop=
erty support for VLV)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_drv.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_pci.c
Merging drm-tegra/for-next (2429b3c529da drm/tegra: Avoid potential 32-bit =
integer overflow)
Merging drm-msm/msm-next (ac7e7c9c65ec drm/msm/dpu: drop unused macros from=
 hw catalog)
Merging drm-msm-lumag/msm-next-lumag (584d8826077d Merge branches 'msm-next=
-lumag-core', 'msm-next-lumag-dpu', 'msm-next-lumag-dp' and 'msm-next-lumag=
-dsi' into msm-next-lumag)
Merging imx-drm/imx-drm/next (927d8fd465ad drm/imx: ipuv3-plane: Remove red=
undant color encoding and range initialisation)
Merging etnaviv/etnaviv/next (4c22c61e429f drm/etnaviv: show number of NN c=
ores in GPU debugfs info)
Merging fbdev/for-next (d78bd6cc6827 fbcon: Fix null-ptr-deref in soft_curs=
or)
Merging regmap/for-next (f6fa16ab9ee6 Merge remote-tracking branch 'regmap/=
for-6.5' into regmap-next)
Merging sound/for-next (f7241589f7bc Merge branch 'topic/midi20' into for-n=
ext)
Merging ieee1394/for-next (fe971f9163b6 firewire: cdev: implement new event=
 relevant to phy packet with time stamp)
$ git reset --hard HEAD^
Merging next-20230525 version of ieee1394
Merging sound-asoc/for-next (21cdb7ebdca3 Merge remote-tracking branch 'aso=
c/for-6.5' into asoc-next)
Merging modules/modules-next (4f521bab5bfc kallsyms: remove unsed API looku=
p_symbol_attrs)
Merging input/next (b00315628095 Input: tests - add test to cover all input=
_grab_device() function)
Merging block/for-next (05ab4411bd69 Merge branch 'for-6.5/io_uring' into f=
or-next)
Merging device-mapper/for-next (38d11da522aa dm: don't lock fs when the map=
 is NULL in process of resume)
Merging libata/for-next (a5ae12c87df6 ata: pata_parport: Fix on26 module co=
de indentation and style)
Merging pcmcia/pcmcia-next (15e74c6c1ce2 pcmcia: remove AT91RM9200 Compact =
Flash driver)
Merging mmc/next (aee09fd99934 Merge branch 'fixes' into next)
Merging mfd/for-mfd-next (84009765adb3 dt-bindings: mfd: Add bindings for A=
XP192 MFD device)
Merging backlight/for-backlight-next (29554f2e9138 backlight: Switch i2c dr=
ivers back to use .probe())
Merging battery/for-next (eae36cb82440 power: reset: add HAS_IOPORT depende=
ncies)
Merging regulator/for-next (fb8b96b03d4b Merge remote-tracking branch 'regu=
lator/for-6.5' into regulator-next)
Merging security/next (4432b507445a lsm: fix a number of misspellings)
Merging apparmor/apparmor-next (0bb84cff96af apparmor: fix missing error ch=
eck for rhashtable_insert_fast)
Merging integrity/next-integrity (db1d1e8b9867 IMA: use vfs_getattr_nosec t=
o get the i_version)
Merging safesetid/safesetid-next (64b634830c91 LSM: SafeSetID: add setgroup=
s() testing to selftest)
Merging selinux/next (8bfbd046a3a8 selinux: deprecated fs ocon)
Merging smack/next (2c085f3a8f23 smack: Record transmuting in smk_transmute=
d)
Merging tomoyo/master (933fd4391e3d workqueue: Emit runtime message when fl=
ush_scheduled_work() is called)
Merging tpmdd/next (9668133e7875 tpm: tpm_vtpm_proxy: fix a race condition =
in /dev/vtpmx creation)
Merging watchdog/master (fc4354c6e5c2 Merge tag 'mm-stable-2023-05-06-10-49=
' of git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm)
Merging iommu/next (79456bb95a2f Merge branches 'iommu/fixes', 'virtio', 'x=
86/amd' and 'core' into next)
Merging audit/next (e455ca40dbcf audit: avoid missing-prototype warnings)
Merging devicetree/for-next (c50eb01940c7 Merge branch 'dt/address-cleanups=
' into dt/next)
Merging dt-krzk/for-next (0ff3c07556e6 Merge branch 'next/dt64' into for-ne=
xt)
Merging mailbox/mailbox-for-next (d396133dced4 dt-bindings: mailbox: qcom: =
add compatible for IPQ9574 SoC)
Merging spi/for-next (8c42f294fea9 Merge remote-tracking branch 'spi/for-6.=
5' into spi-next)
Merging tip/master (a261567a74fb Merge branch into tip/master: 'x86/tdx')
CONFLICT (content): Merge conflict in tools/perf/arch/x86/include/arch-test=
s.h
CONFLICT (content): Merge conflict in tools/perf/arch/x86/tests/arch-tests.c
Merging clockevents/timers/drivers/next (158009f1b4a3 timekeeping: Fix refe=
rences to nonexistent ktime_get_fast_ns())
Merging edac/edac-for-next (6c79e42169fe EDAC/amd64: Add support for ECC on=
 family 19h model 60h-7Fh)
Merging irqchip/irq/irqchip-next (2ff1b0839ddd Merge branch irq/misc-6.4 in=
to irq/irqchip-next)
Merging ftrace/for-next (3862f86c1529 Merge tools/for-next)
Merging rcu/rcu/next (60901dadfadc rcuscale: Measure grace-period kthread C=
PU time)
Applying: fixup for "RDMA/rxe: Add error messages"
Merging kvm/next (39428f6ea9ea Merge tag 'kvmarm-fixes-6.4-1' of git://git.=
kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into HEAD)
Merging kvm-arm/next (cad58a69de18 Merge branch kvm-arm64/misc into kvmarm/=
next)
Merging kvms390/next (8a46df7cd135 KVM: s390: pci: fix virtual-physical con=
fusion on module unload/load)
Merging kvm-riscv/riscv_kvm_next (2f4d58f7635a RISC-V: KVM: Virtualize per-=
HART AIA CSRs)
Merging kvm-x86/next (39428f6ea9ea Merge tag 'kvmarm-fixes-6.4-1' of git://=
git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into HEAD)
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
Merging leds-lj/for-leds-next (8f38f8fa7261 led: qcom-lpg: Fix resource lea=
ks in for_each_available_child_of_node() loops)
Merging ipmi/for-next (e64c82b80641 ipmi: Switch i2c drivers back to use .p=
robe())
Merging driver-core/driver-core-next (44c026a73be8 Linux 6.4-rc3)
Merging usb/usb-next (b4a4be847184 USB: fix up merge of 6.4-rc4 into usb-ne=
xt)
Merging thunderbolt/next (f1138fda1b0d thunderbolt: Drop retimer vendor che=
ck)
Merging usb-serial/usb-next (44c026a73be8 Linux 6.4-rc3)
Merging tty/tty-next (0e4daea31d83 Merge 6.4-rc3 into tty-next)
Merging char-misc/char-misc-next (8a29f74b7498 Merge v6.4-rc4 into char-mis=
c-next)
Merging accel/habanalabs-next (4b116d95c433 accel/habanalabs: refactor erro=
r info reset)
Merging coresight/next (18996a113f25 coresight: etm_pmu: Set the module fie=
ld)
Merging fastrpc/for-next (3f6b4c6f0bd0 fastrpc: Don't assert held reservati=
on lock for dma-buf mmapping)
Merging fpga/for-next (148efa63bab3 fpga: dfl-fme: constify pointers to hwm=
on_channel_info)
Merging icc/icc-next (3d2fc686ed93 Merge branch 'icc-qos' into icc-next)
Merging iio/togreg (f3ae82534ab2 iio: imu: inv_icm42600: avoid frequent tim=
estamp jitter)
Merging phy-next/next (50da4496761b dt-bindings: phy: qcom,qmp-ufs: fix the=
 sc8180x regs)
Merging soundwire/next (94f89950850e soundwire: cadence: revisit parity inj=
ection)
Merging extcon/extcon-next (93e60cd5e00e extcon: Drop unneeded assignments)
Merging gnss/gnss-next (44c026a73be8 Linux 6.4-rc3)
Merging vfio/next (d9824f70e52c vfio/pci: Also demote hiding standard cap m=
essages)
Merging w1/for-next (b332af5398a3 w1: Replace usage of found with dedicated=
 list iterator variable)
Merging staging/staging-next (1f3413dc8eb0 staging: rtl8192e: Refactor tmp_=
ofdm_index variable assignment)
Merging counter-next/counter-next (98ffe0252911 counter: 104-quad-8: Migrat=
e to the regmap API)
Merging mux/for-next (213700a8b96f dt-bindings: ti-serdes-mux: Add defines =
for J784S4 SoC)
Merging dmaengine/next (907514a7dc4c dmaengine: sprd: Don't set chancnt)
Merging cgroup/for-next (39ad5a5ef95e Merge branch 'for-6.5' into for-next)
Merging scsi/for-next (d8975ee303e6 Merge branch 'fixes' into for-next)
Merging scsi-mkp/for-next (f047d1e38bdf scsi: docs: sym53c8xx_2: Shorten ch=
apter heading)
Merging vhost/linux-next (ebddc00f450d vhost_net: revert upend_idx only on =
retriable error)
Merging rpmsg/for-next (1ca04f21b204 remoteproc: stm32: Fix error code in s=
tm32_rproc_parse_dt())
Merging gpio/for-next (ac9a78681b92 Linux 6.4-rc1)
Merging gpio-brgl/gpio/for-next (b2b56a163230 gpio: tegra186: Check GPIO pi=
n permission before access.)
CONFLICT (content): Merge conflict in drivers/gpio/gpio-twl4030.c
Merging gpio-intel/for-next (782eea0c89f7 gpiolib: acpi: Add a ignore wakeu=
p quirk for Clevo NL5xNU)
Merging pinctrl/for-next (5a2694fd5866 Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (7877cb91f108 Linux 6.4-rc4)
Merging pinctrl-renesas/renesas-pinctrl (5d32cead772c pinctrl: renesas: Fix=
 spaces followed by tabs)
Merging pinctrl-samsung/for-next (ac9a78681b92 Linux 6.4-rc1)
Merging pwm/for-next (247ee6c78040 pwm: Remove unused radix tree)
Merging userns/for-next (05bd6e0242b4 Merge of unpriv-ipc-sysctls-for-v6.2,=
 and fix-atomic_lock_inc_below-for-v6.2 for testing in linux-next)
Merging ktest/for-next (7dc8e24f0e09 ktest: Restore stty setting at first i=
n dodie)
Merging kselftest/next (3ecb4a459a1e selftests/ftrace: Add new test case wh=
ich checks for optimized probes)
Merging kunit/test (ac9a78681b92 Linux 6.4-rc1)
Merging kunit-next/kunit (b1eaa8b2a55c kunit: Update kunit_print_ok_not_ok =
function)
Merging livepatching/for-next (5e36be5973b6 Merge branch 'for-6.4/core' int=
o for-next)
Merging rtc/rtc-next (e99ab4abebf8 rtc: armada38x: use devm_platform_iorema=
p_resource_byname())
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
Merging nvmem/for-next (ac9a78681b92 Linux 6.4-rc1)
Merging xarray/main (69cb69ea5542 ida: Remove assertions that an ID was all=
ocated)
Merging hyperv/hyperv-next (a494aef23dfc PCI: hv: Replace retarget_msi_inte=
rrupt_params with hyperv_pcpu_input_arg)
Merging auxdisplay/auxdisplay (ddf75a86aba2 auxdisplay: hd44780: Fix potent=
ial memory leak in hd44780_remove())
Merging kgdb/kgdb/for-next (c1cb81429df4 kdb: Fix the putarea helper functi=
on)
Merging hmm/hmm (ac9a78681b92 Linux 6.4-rc1)
Merging cfi/cfi/next (312310928417 Linux 5.18-rc1)
Merging mhi/mhi-next (1d1493bdc25f bus: mhi: host: Use mhi_tryset_pm_state(=
) for setting fw error state)
Merging memblock/for-next (493f349e38d0 memblock: Add flags and nid info in=
 memblock debugfs)
Merging cxl/next (a70fc4ed20a6 cxl/port: Fix NULL pointer access in devm_cx=
l_add_port())
Merging zstd/zstd-next (2aa14b1ab2c4 zstd: import usptream v1.5.2)
Merging efi/next (ac3bb6e23bbb efi: Add tee-based EFI variable driver)
CONFLICT (content): Merge conflict in include/linux/efi.h
Merging unicode/for-next (b500d6d7243d unicode: Handle memory allocation fa=
ilures in mkutf8data)
Merging slab/for-next (145535b7fbef Merge branch 'slab/for-6.5/slab-depreca=
te' into slab/for-next)
Merging random/master (512dee0c00ad Merge tag 'x86-urgent-2023-01-04' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging landlock/next (ed35e2f2f0de landlock: Clarify documentation for the=
 LANDLOCK_ACCESS_FS_REFER right)
Merging rust/rust-next (ac9a78681b92 Linux 6.4-rc1)
Merging sysctl/sysctl-next (0f1ee7aa1826 signal: move show_unhandled_signal=
s sysctl to its own file)
Merging execve/for-next/execve (60592fb6b67c coredump, vmcore: Set p_align =
to 4 for PT_NOTE)
Merging bitmap/bitmap-for-next (714f3af11b21 cpumask: fix function descript=
ion kernel-doc notation)
CONFLICT (content): Merge conflict in include/linux/cpumask.h
Merging hte/for-next (ac9a78681b92 Linux 6.4-rc1)
Merging kspp/for-next/kspp (d78e5c1ed790 ftrace: Replace all non-returning =
strlcpy with strscpy)
Merging kspp-gustavo/for-next/kspp (4cac30138e5e media: venus: hfi_cmds: Re=
place fake flex-arrays with flexible-array members)
Merging iommufd/for-next (f1fcbaa18b28 Linux 6.4-rc2)

--Sig_/eng33N/kCG_aOGV.K.X97ho
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmR1idIACgkQAVBC80lX
0GyH7gf/URJaLJrEkm5vrgEVxi69i42UbdLNai6t9Ads2RQ3SN8S3KZTMTCMNTQX
prDdG1QYRI9ww56wpHsRbYOs1DhQI28ZgUZSCQHGo9a+QpgM0lQw7iguBC1SF/iG
pSvWDslKPyLEPcexdKM69iIisv3lh3BH017QimymPKoSXvMjRzBZEgpGV7zsWGdA
u4Wz+8r1++QNtlFhBp62+uO3BMUOEJZJUvHu0R58rkRtiIvfGoSStV04s/rWFoRQ
ZQuC9VIwH+MVa1rtXucYvwGBfJ4ZxLMW+7SciWnqjlI/h6RK2ihjS2E5FQppjScJ
4myJiSgAbEMxIe+66PncgMEGyg+whQ==
=KfBr
-----END PGP SIGNATURE-----

--Sig_/eng33N/kCG_aOGV.K.X97ho--
