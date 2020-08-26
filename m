Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E45425368F
	for <lists+linux-next@lfdr.de>; Wed, 26 Aug 2020 20:19:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727919AbgHZSTS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 26 Aug 2020 14:19:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727991AbgHZSTQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 26 Aug 2020 14:19:16 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5456C061756
        for <linux-next@vger.kernel.org>; Wed, 26 Aug 2020 11:19:15 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id i10so3490468ljn.2
        for <linux-next@vger.kernel.org>; Wed, 26 Aug 2020 11:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=mOhAHhkrdaAHtsO4c0EOBQxGmEe0DMj2GJAc+FcwXHw=;
        b=BgxX1iFkx2M6fJm9JY71zqTLVV2i7zpicygHPqDgUl8llbaFXCAJo2RvwTiTIXH8h1
         UUqvAFYYWnenDaSWkFXhxkrAV4zE0dJ1aETC54wJ/1s+HnNY2TgV1H5DXbbK9mfvOabk
         t3SqqBH5N//SnUNCn2ZDEF62U15f87u4o2WzpxoXolfJuiM8O15dAxuXUrTLaPguSl4q
         bcecf51DFgLFEeHJdib5QRGZwYZKErtz3UOjuBbJ8fHS+0kCLapj/wbQZi849qDUMTf8
         Isy4c9kU1hI/gZV300Py2hAS643Sr6AW303WRyMnw1jA2WhwDxC8EASMOaFOZX4rNfrU
         i4Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=mOhAHhkrdaAHtsO4c0EOBQxGmEe0DMj2GJAc+FcwXHw=;
        b=oLS+v+I0QuEJ/lo0kyP3fYsdrvwg2kzYW6aA4bC+hSSoELVjt4USH9ua38osP+mMv1
         6FbyY4H55X9M68e7ZZmePAUDwwNBjl/Ateb333I0kKnS0JCEyZhymVb1L134ZhvHEjec
         KsejBHoPQ3iPmstyye0INuE8iRyJhf/sKrF0UVymSkU5sr+N83zRGW8Q21pT+bfzHCzA
         kjG/Ow8Q20cjJDCI+xuWZ6ZWaRujnuRLyXuLzcxUn3STfNEkOFQE5PYDXFrMszmxqHgu
         hDBkUTxfl5Z9JcvFylkkvULQdDFWiBcKyFZSUmNImdkeAmUVoioe+3FQKz5kepm9s0ey
         kAXQ==
X-Gm-Message-State: AOAM533UBjRrAmScPPmjXVqLbw9UeGHG9zhpW6ohQhy1WrC0eqFxK9Xt
        I+fQfTpQdJJmSsJ3k4IkfNmdCK2PdJRozj6UHYF+FTVWfA/qGpRr
X-Google-Smtp-Source: ABdhPJxdHIgFz1hPxy/90D6DMDcDakCmqVUIi0ffkLOJ9f+5wOdrtwVs9tfOzrg6gznPVKYzKQ8Un9P/Na5hz0dDt4M=
X-Received: by 2002:a2e:9b8f:: with SMTP id z15mr7345713lji.215.1598465952192;
 Wed, 26 Aug 2020 11:19:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200826163330.16e5b0d4@canb.auug.org.au>
In-Reply-To: <20200826163330.16e5b0d4@canb.auug.org.au>
From:   Anders Roxell <anders.roxell@linaro.org>
Date:   Wed, 26 Aug 2020 20:19:01 +0200
Message-ID: <CADYN=9KQcdLH=BfXZ2riuH0icw7d+2HbfPxvww7fiJG2G=8ALQ@mail.gmail.com>
Subject: Re: linux-next: Tree for Aug 26
To:     Stephen Rothwell <sfr@canb.auug.org.au>, paulmck@kernel.org
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 26 Aug 2020 at 08:33, Stephen Rothwell <sfr@canb.auug.org.au> wrote=
:
>
> Hi all,
>
> News:  There will be no linux-next releases next Monday or Tuesday.
>
> Changes since 20200825:
>
> The bpf-next tree lost its build failure.
>
> The drm-misc tree gained conflicts against Linus' tree and the amdgpu
> tree.  It also gained a semantic conflict against the drm-misc-fixes tree=
.
>
> Non-merge commits (relative to Linus' tree): 2773
>  3346 files changed, 94589 insertions(+), 35418 deletions(-)
>
> -------------------------------------------------------------------------=
---
>
> I have created today's linux-next tree at
> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> (patches at http://www.kernel.org/pub/linux/kernel/next/ ).  If you
> are tracking the linux-next tree using git, you should not use "git pull"
> to do so as that will try to merge the new linux-next release with the
> old one.  You should use "git fetch" and checkout or reset to the new
> master.
>
> You can see which trees have been included by looking in the Next/Trees
> file in the source.  There are also quilt-import.log and merge.log
> files in the Next directory.  Between each merge, the tree was built
> with a ppc64_defconfig for powerpc, an allmodconfig for x86_64, a
> multi_v7_defconfig for arm and a native build of tools/perf. After
> the final fixups (if any), I do an x86_64 modules_install followed by
> builds for x86_64 allnoconfig, powerpc allnoconfig (32 and 64 bit),
> ppc44x_defconfig, allyesconfig and pseries_le_defconfig and i386, sparc
> and sparc64 defconfig and htmldocs. And finally, a simple boot test
> of the powerpc pseries_le_defconfig kernel in qemu (with and without
> kvm enabled).
>
> Below is a summary of the state of the merge.
>
> I am currently merging 328 trees (counting Linus' and 86 trees of bug
> fix patches pending for the current merge release).
>
> Stats about the size of the tree over time can be seen at
> http://neuling.org/linux-next-size.html .
>
> Status of my local build tests will be at
> http://kisskb.ellerman.id.au/linux-next .  If maintainers want to give
> advice about cross compilers/configs that work, we are always open to add
> more builds.
>
> Thanks to Randy Dunlap for doing many randconfig builds.  And to Paul
> Gortmaker for triage and bug fixes.
>
> --
> Cheers,
> Stephen Rothwell
>
> $ git checkout master
> $ git reset --hard stable
> Merging origin/master (abb3438d69fb Merge tag 'm68knommu-for-v5.9-rc3' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu)
> Merging fixes/master (9123e3a74ec7 Linux 5.9-rc1)
> Merging kbuild-current/fixes (510bc3cb1ddc kconfig: qconf: replace deprec=
ated QString::sprintf() with QTextStream)
> Merging arc-current/for-curr (37016ab49214 irqchip/eznps: Fix build error=
 for !ARC700 builds)
> Merging arm-current/fixes (5c6360ee4a0e ARM: 8988/1: mmu: fix crash in EF=
I calls due to p4d typo in create_mapping_late())
> Merging arm64-fixes/for-next/fixes (8d75785a8142 ARM64: vdso32: Install v=
dso32 from vdso_install)
> Merging arm-soc-fixes/arm/fixes (9c8b0a9c37b7 Merge tag 'imx-fixes-5.9' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into arm/fix=
es)
> Merging uniphier-fixes/fixes (48778464bb7d Linux 5.8-rc2)
> Merging drivers-memory-fixes/fixes (7ff3a2a626f7 memory: jz4780_nemc: Fix=
 an error pointer vs NULL check in probe())
> Merging m68k-current/for-linus (382f429bb559 m68k: defconfig: Update defc=
onfigs for v5.8-rc3)
> Merging powerpc-fixes/fixes (64ef8f2c4791 powerpc/perf/hv-24x7: Move cpum=
ask file to top folder of hv-24x7 driver)
> Merging s390-fixes/fixes (b97bf44f9915 s390/pci: fix PF/VF linking on hot=
 plug)
> Merging sparc/master (0a95a6d1a4cd sparc: use for_each_child_of_node() ma=
cro)
> Merging fscrypt-current/for-stable (2b4eae95c736 fscrypt: don't evict dir=
ty inodes after removing key)
> Merging net/master (2c6500e82e51 net: ethernet: ti: cpsw_new: fix clean u=
p of vlan mc entries for host port)
> Merging bpf/master (7787b6fc938e bpf, sysctl: Let bpf_stats_handler take =
a kernel pointer buffer)
> Merging ipsec/master (4eb2e1341575 espintcp: restore IP CB before handing=
 the packet to xfrm)
> Merging netfilter/master (3622adb02623 ipv6: ndisc: adjust ndisc_ifinfo_s=
ysctl_change prototype)
> Merging ipvs/master (7c7ab580db49 net: Convert to use the fallthrough mac=
ro)
> Merging wireless-drivers/master (9a2a0862d973 brcmfmac: reserve tx credit=
 only when txctl is ready to send)
> Merging mac80211/master (fce2ff728f95 nl80211: fix NL80211_ATTR_HE_6GHZ_C=
APABILITY usage)
> Merging rdma-fixes/for-rc (60b1af64eb35 RDMA/rxe: Fix the parent sysfs re=
ad when the interface has 15 chars)
> Merging sound-current/for-linus (eed8f88b109a Revert "ALSA: hda: Add supp=
ort for Loongson 7A1000 controller")
> Merging sound-asoc-fixes/for-linus (d062085d61b1 ASoC: ti: fixup ams_delt=
a_mute() function name)
> Merging regmap-fixes/for-linus (d012a7190fc1 Linux 5.9-rc2)
> Merging regulator-fixes/for-linus (3bec5b6aae83 Merge tag 'v5.9-rc2' into=
 regulator-5.9)
> Merging spi-fixes/for-linus (d1770b49661f Merge remote-tracking branch 's=
pi/for-5.9' into spi-linus)
> Merging pci-current/for-linus (7c2308f79fc8 PCI/P2PDMA: Fix build without=
 DMA ops)
> Merging driver-core.current/driver-core-linus (9123e3a74ec7 Linux 5.9-rc1=
)
> Merging tty.current/tty-linus (ea1fc02e12b6 tty: serial: imx: add depende=
nce and build for earlycon)
> Merging usb.current/usb-linus (23e26d057753 usb: typec: tcpm: Fix Fix sou=
rce hard reset response for TDA 2.3.1.1 and TDA 2.3.1.2 failures)
> Merging usb-gadget-fixes/fixes (bc9a2e226ea9 usb: dwc3: gadget: Handle ZL=
P for sg requests)
> Merging usb-serial-fixes/usb-linus (6ccc48e0eb2f USB: serial: ftdi_sio: a=
dd IDs for Xsens Mti USB converter)
> Merging usb-chipidea-fixes/ci-for-usb-stable (2d79b3360dcc usb: chipidea:=
 core: add wakeup support for extcon)
> Merging phy/fixes (afd55e6d1bd3 phy: qcom-qmp: Use correct values for ipq=
8074 PCIe Gen2 PHY init)
> Merging staging.current/staging-linus (1dffeb8b8b4c staging: greybus: aud=
io: fix uninitialized value issue)
> Merging char-misc.current/char-misc-linus (9c97cecab0d4 Merge tag 'misc-h=
abanalabs-fixes-2020-08-22' of git://people.freedesktop.org/~gabbayo/linux =
into char-misc-linus)
> Merging soundwire-fixes/fixes (f8d0168e035f soundwire: bus: fix typo in c=
omment on INTSTAT registers)
> Merging thunderbolt-fixes/fixes (813050e0a9b8 thunderbolt: Use maximum US=
B3 link rate when reclaiming if link is not up)
> Merging input-current/for-linus (9e8238020c5b Merge branch 'next' into fo=
r-linus)
> Merging crypto-current/master (bfe8fe939a04 crypto: sa2ul - add Kconfig s=
elects to fix build error)
> Merging ide/master (6800cd8cbc6e ide-acpi: use %*ph to print small buffer=
)
> Merging vfio-fixes/for-linus (aae7a75a821a vfio/type1: Add proper error u=
nwind for vfio_iommu_replay())
> Merging kselftest-fixes/fixes (5c1e4f7e9e49 selftests/timers: Turn off ti=
meout setting)
> Merging modules-fixes/modules-linus (57baec7b1b04 scripts/nsdeps: make su=
re to pass all module source files to spatch)
> Merging dmaengine-fixes/fixes (6d6018fc30be drivers/dma/dma-jz4780: Fix r=
ace condition between probe and irq handler)
> Merging backlight-fixes/for-backlight-fixes (219d54332a09 Linux 5.4)
> Merging mtd-fixes/mtd/fixes (f7e6b19bc764 mtd: properly check all write i=
octls for permissions)
> Merging mfd-fixes/for-mfd-fixes (dddf4ddc3971 mfd: mfd-core: Ensure disab=
led devices are ignored without error)
> Merging v4l-dvb-fixes/fixes (0d6db85131e0 Revert "media: atomisp: keep th=
e ISP powered on when setting it")
> Merging reset-fixes/reset/fixes (b460e0a9e240 reset: intel: add unspecifi=
ed HAS_IOMEM dependency)
> Merging mips-fixes/mips-fixes (91dbd73a1739 mips/oprofile: Fix fallthroug=
h placement)
> Merging at91-fixes/at91-fixes (54ecb8f7028c Linux 5.4-rc1)
> Merging omap-fixes/fixes (6542e2b613c2 ARM: dts: omap5: Fix DSI base addr=
ess and clocks)
> Merging kvm-fixes/master (b5331379bc62 KVM: arm64: Only reschedule if MMU=
_NOTIFIER_RANGE_BLOCKABLE is not set)
> Merging kvms390-fixes/master (774911290c58 KVM: s390: reduce number of IO=
 pins to 1)
> Merging hwmon-fixes/hwmon (cecf7560f00a hwmon: (applesmc) check status ea=
rlier.)
> Merging nvdimm-fixes/libnvdimm-fixes (c2affe920b0e dax: do not print erro=
r message for non-persistent memory block device)
> Merging btrfs-fixes/next-fixes (c9f8e44ec4a5 Merge branch 'misc-5.9' into=
 next-fixes)
> Merging vfs-fixes/fixes (9d682ea6bcc7 vboxsf: Fix the check for the old b=
inary mount-arguments struct)
> Merging dma-mapping-fixes/for-linus (7dc6fd0f3b84 Merge branch 'i2c/for-c=
urrent' of git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux)
> Merging i3c-fixes/master (6fbc7275c7a9 Linux 5.2-rc7)
> Merging drivers-x86-fixes/fixes (9123e3a74ec7 Linux 5.9-rc1)
> Merging samsung-krzk-fixes/fixes (9123e3a74ec7 Linux 5.9-rc1)
> Merging pinctrl-samsung-fixes/pinctrl-fixes (9123e3a74ec7 Linux 5.9-rc1)
> Merging devicetree-fixes/dt/linus (5cd841d2676a dt-bindings: vendor-prefi=
xes: Remove trailing whitespace)
> Merging scsi-fixes/fixes (75d46c6d15ef scsi: scsi_debug: Remove superfluo=
us close zone in resp_open_zone())
> Merging drm-fixes/drm-fixes (d012a7190fc1 Linux 5.9-rc2)
> Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_sm=
c_cac() failed issue)
> Merging drm-intel-fixes/for-linux-next-fixes (d012a7190fc1 Linux 5.9-rc2)
> Merging mmc-fixes/fixes (710d4d916e6d dt-bindings: mmc: Add missing descr=
iption for clk_in/out_sd1)
> Merging rtc-fixes/rtc-fixes (9123e3a74ec7 Linux 5.9-rc1)
> Merging gnss-fixes/gnss-linus (48778464bb7d Linux 5.8-rc2)
> Merging hyperv-fixes/hyperv-fixes (b46b4a8a57c3 hv_utils: drain the times=
ync packets on onchannelcallback)
> Merging soc-fsl-fixes/fix (fe8fe7723a3a soc: fsl: dpio: register dpio irq=
 handlers after dpio create)
> Merging risc-v-fixes/fixes (0981b50cd6c7 riscv/mm: Simplify retry logic i=
n do_page_fault())
> Merging pidfd-fixes/fixes (bda4c60d02e9 sys: Convert to the new fallthrou=
gh notation)
> Merging fpga-fixes/fixes (8614afd689df fpga: dfl: fix bug in port reset h=
andshake)
> Merging spdx/spdx-linus (9123e3a74ec7 Linux 5.9-rc1)
> Merging gpio-intel-fixes/fixes (9123e3a74ec7 Linux 5.9-rc1)
> Merging pinctrl-intel-fixes/fixes (9123e3a74ec7 Linux 5.9-rc1)
> Merging erofs-fixes/fixes (9ebcfadb0610 Linux 5.8-rc3)
> Merging integrity-fixes/fixes (843385694721 evm: Fix a small race in init=
_desc())
> Merging kunit-fixes/kunit-fixes (9123e3a74ec7 Linux 5.9-rc1)
> Merging ubifs-fixes/fixes (f37e99aca03f Merge tag 's390-5.8-6' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/s390/linux into master)
> Merging memblock-fixes/fixes (bd05220c7be3 arch/ia64: Restore arch-specif=
ic pgd_offset_k implementation)
> Merging drm-misc-fixes/for-linux-next-fixes (7fd5b25499bc drm/omap: fix i=
ncorrect lock state)
> Merging kspp-gustavo/for-next/kspp (df561f6688fe treewide: Use fallthroug=
h pseudo-keyword)
> Merging kbuild/for-next (514bad879fdb Merge branch 'kconfig' into for-nex=
t)
> CONFLICT (content): Merge conflict in scripts/kconfig/qconf.h
> Merging compiler-attributes/compiler-attributes (98d54f81e36b Linux 5.6-r=
c4)
> Merging dma-mapping/for-next (d7e673ec2c8e dma-pool: Only allocate from C=
MA when in same memory zone)
> Merging asm-generic/master (060dc911501f nds32: fix build failure caused =
by page table folding updates)
> Merging arc/for-next (def9d2780727 Linux 5.5-rc7)
> Merging arm/for-next (4dffbda6a996 Merge branches 'fixes' and 'misc' into=
 for-next)
> Merging arm64/for-next/core (3df14264ad99 recordmcount: Fix build failure=
 on non arm64)
> Merging arm-perf/for-next/perf (55fdc1f44cd6 arm64: perf: Expose some new=
 events via sysfs)
> Merging arm-soc/for-next (2694ca73fa41 ARM: Document merges)
> Merging amlogic/for-next (c943b84fab78 Merge branch 'v5.10/dt64' into tmp=
/aml-rebuild)
> Merging aspeed/for-next (7c32a9d95c9a ARM: dts: aspeed: wedge40: Update U=
ART4 pin settings)
> Merging at91/at91-next (b68f43873b72 Merge branch 'at91-soc' into at91-ne=
xt)
> Merging drivers-memory/for-next (f42ae4bbf94c memory: brcmstb_dpfe: fix a=
rray index out of bounds)
> Merging imx-mxs/for-next (427954264555 Merge branch 'imx/defconfig' into =
for-next)
> Merging keystone/next (50c950e2c8b6 Merge branch 'for_5.9/driver-soc' int=
o next)
> Merging mediatek/for-next (647a84d1e4dc Merge branch 'v5.8-next/soc' into=
 for-next)
> Merging mvebu/for-next (29bd9d8c2ac1 Merge branch 'mvebu/dt64' into mvebu=
/for-next)
> Merging omap/for-next (390f789055a0 Merge branch 'omap-for-v5.10/dt' into=
 for-next)
> Merging qcom/for-next (9123e3a74ec7 Linux 5.9-rc1)
> Merging raspberrypi/for-next (9123e3a74ec7 Linux 5.9-rc1)
> Merging realtek/for-next (486f29df6941 Merge branch 'v5.8/dt' into next)
> Merging renesas/next (15c95b417a9c Merge branches 'renesas-arm-defconfig-=
for-v5.10', 'renesas-arm-dt-for-v5.10' and 'renesas-drivers-for-v5.10' into=
 renesas-next)
> Merging reset/reset/next (2983e2385ff6 reset: imx7: add the cm4 reset for=
 i.MX8MQ)
> CONFLICT (content): Merge conflict in drivers/reset/reset-imx7.c
> Merging rockchip/for-next (088d74f51158 Merge branch 'v5.9-clk/next' into=
 for-next)
> Merging samsung-krzk/for-next (f609c46be3ca Merge branch 'next/soc-s3c-cl=
eanup' into for-next)
> Merging scmi/for-linux-next (d012a7190fc1 Linux 5.9-rc2)
> Merging sunxi/sunxi/for-next (9123e3a74ec7 Linux 5.9-rc1)
> Merging tegra/for-next (8617339892a6 Merge branch for-5.9/arm64/dt into f=
or-next)
> Merging ti-k3/ti-k3-next (1e3d655fe7b4 Merge branch 'ti-k3-config-next' i=
nto ti-k3-next)
> Merging ti-k3-new/ti-k3-next (9123e3a74ec7 Linux 5.9-rc1)
> Merging uniphier/for-next (4f8fb65af529 Merge branch 'dt64' into for-next=
)
> Merging clk/clk-next (24907ec54702 Merge branch 'clk-fixes' into clk-next=
)
> Merging clk-samsung/for-next (3d77e6a8804a Linux 5.7)
> Merging csky/linux-next (bdcd93ef9afb csky: Add context tracking support)
> Merging h8300/h8300-next (8808515be0ed h8300: Replace <linux/clk-provider=
.h> by <linux/of_clk.h>)
> Merging ia64/next (1a9d3c34c593 x86/cpu: Add Lakefield, Alder Lake and Ro=
cket Lake to Intel family)
> Merging m68k/for-next (382f429bb559 m68k: defconfig: Update defconfigs fo=
r v5.8-rc3)
> Merging m68knommu/for-next (0fdaa525ea1c binfmt_flat: revert "binfmt_flat=
: don't offset the data start")
> Merging microblaze/next (b3a9e3b9622a Linux 5.8-rc1)
> Merging mips/mips-next (625326ea9c84 MIPS: Remove PNX833x alias NXP_STB22=
x)
> Merging nds32/next (0a2e478902c7 nds32: use get_kernel_nofault in dump_me=
m)
> Merging nios2/for-next (6b57fa4d374b nios2: signal: Mark expected switch =
fall-through)
> Merging openrisc/for-next (55b2662ec665 openrisc: uaccess: Add user addre=
ss space check to access_ok)
> Merging parisc-hd/for-next (bcf876870b95 Linux 5.8)
> Merging powerpc/next (9123e3a74ec7 Linux 5.9-rc1)
> Merging fsl/next (a76bea0287ce powerpc/kmcent2: add ranges to the pci bri=
dges)
> Merging soc-fsl/next (e9e4ef9116b1 soc: fsl: dpio: Remove unused inline f=
unction qbman_write_eqcr_am_rt_register)
> Merging risc-v/for-next (f75fa0a51b8b efi: Rename arm-init to efi-init co=
mmon for all arch)
> Merging s390/features (9123e3a74ec7 Linux 5.9-rc1)
> Merging sh/for-next (0c64a0dce51f sh: landisk: Add missing initialization=
 of sh_io_port_base)
> Merging sparc-next/master (dd0d718152e4 Merge tag 'spi-fix-v5.8-rc2' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
> Merging uml/linux-next (f6e8c474390b um: virtio: Replace zero-length arra=
y with flexible-array)
> Merging xtensa/xtensa-for-next (a0fc1436f1f4 xtensa: add missing exclusiv=
e access state management)
> Merging fscrypt/master (55e32c54bbd5 fscrypt: don't load ->i_crypt_info b=
efore it's known to be valid)
> Merging afs/afs-next (8409f67b6437 afs: Adjust the fileserver rotation al=
gorithm to reprobe/retry more quickly)
> Merging btrfs/for-next (e36d3dfd9828 Merge branch 'for-next-next-v5.9-202=
00824' into for-next-20200824)
> Merging ceph/master (496ceaf12432 ceph: don't allow setlease on cephfs)
> Merging cifs/for-next (d012a7190fc1 Linux 5.9-rc2)
> Merging configfs/for-next (059ccbfff8a8 configfs: use flush file op to co=
mmit writes to a binary file)
> Merging ecryptfs/next (8b614cb8f1dc Merge tag '5.6-rc4-smb3-fixes' of git=
://git.samba.org/sfrench/cifs-2.6)
> Merging erofs/dev (cfcedfe21820 erofs: avoid duplicated permission check =
for "trusted." xattrs)
> Merging exfat/dev (34d41dbe5455 exfat: use i_blocksize() to get blocksize=
)
> Merging ext3/for_next (de575ac602ab Pull reiserfs spelling fixes.)
> Merging ext4/dev (27bc446e2def ext4: limit the length of per-inode preall=
oc list)
> Merging f2fs/dev (da0815f3bce1 f2fs: Use generic casefolding support)
> Merging fsverity/fsverity (f3db0bed4583 fs-verity: use smp_load_acquire()=
 for ->i_verity_info)
> Merging fuse/for-next (9e9e23bd2d36 fuse: update project homepage)
> Merging jfs/jfs-next (7aba5dcc2346 jfs: Replace zero-length array with fl=
exible-array member)
> Merging nfs/linux-next (d012a7190fc1 Linux 5.9-rc2)
> Merging nfs-anna/linux-next (65caafd0d214 SUNRPC reverting d03727b248d0 (=
"NFSv4 fix CLOSE not waiting for direct IO compeletion"))
> Merging nfsd/nfsd-next (9123e3a74ec7 Linux 5.9-rc1)
> Merging cel/cel-next (ad112aa8b1ac SUNRPC: remove duplicate include)
> Merging orangefs/for-next (e848643b524b orangefs: remove unnecessary assi=
gnment to variable ret)
> Merging overlayfs/overlayfs-next (4518dfcf761e ovl: fix lookup of indexed=
 hardlinks with metacopy)
> Merging ubifs/next (798b7347e4f2 jffs2: fix UAF problem)
> Merging v9fs/9p-next (2ed0b7578170 9p: Remove unneeded cast from memory a=
llocation)
> Merging xfs/for-next (96cf2a2c7556 xfs: Fix UBSAN null-ptr-deref in xfs_s=
ysfs_init)
> Merging zonefs/for-next (2f4b7462d2fa zonefs: update documentation to ref=
lect zone size vs capacity)
> Merging iomap/iomap-for-next (60263d5889e6 iomap: fall back to buffered w=
rites for invalidation failures)
> Merging djw-vfs/vfs-for-next (e4f9ba20d3b8 fs/xfs: Update xfs_ioctl_setat=
tr_dax_invalidate())
> Merging file-locks/locks-next (c0842fbc1b18 random32: move the pseudo-ran=
dom 32-bit definitions to prandom.h)
> Merging vfs/for-next (bcf876870b95 Linux 5.8)
> Merging printk/for-next (20d6ee092831 Merge branch 'for-5.10' into for-ne=
xt)
> Merging pci/next (9123e3a74ec7 Linux 5.9-rc1)
> Merging pstore/for-next/pstore (137c6236aeec mailmap: Add WeiXiong Liao)
> CONFLICT (content): Merge conflict in .mailmap
> Merging hid/for-next (de11ec5fedd9 Merge branch 'for-5.9/upstream-fixes' =
into for-next)
> Merging i2c/i2c/for-next (3f7462407ce3 Merge branch 'i2c/for-current' int=
o i2c/for-next)
> Merging i3c/i3c/next (9da36a7ec421 i3c: master add i3c_master_attach_boar=
dinfo to preserve boardinfo)
> Merging dmi/dmi-for-next (a3d13a0a23ea Replace HTTP links with HTTPS ones=
: DMI/SMBIOS SUPPORT)
> Merging hwmon-staging/hwmon-next (314119a53803 dt-bindings: hwmon: Add bi=
ndings for ADM1266)
> Merging jc_docs/docs-next (92001bc0365a Documentation: laptops: thinkpad-=
acpi: fix underline length build warning)
> Merging v4l-dvb/master (9a538b83612c media: venus: core: Add support for =
opp tables/perf voting)
> Merging v4l-dvb-next/master (0d6db85131e0 Revert "media: atomisp: keep th=
e ISP powered on when setting it")
> Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typ=
o in imxfb_probe())
> Merging pm/linux-next (4958dfca3d0f Merge branch 'pm-cpufreq' into linux-=
next)
> Merging cpufreq-arm/cpufreq/arm/linux-next (99bcfd231280 cpufreq: tegra18=
6: Fix initial frequency)
> Merging cpupower/cpupower (527b7779e5ec cpupower: speed up generating git=
 version string)
> Merging devfreq/devfreq-next (9123e3a74ec7 Linux 5.9-rc1)
> Merging opp/opp/linux-next (8c6269534d00 opp: Set required OPPs in revers=
e order when scaling down)
> Merging thermal/thermal/linux-next (6f55be9fd5ee Merge branch 'thermal/fi=
xes' into thermal/linux-next)
> Merging thermal-rzhang/next (54ecb8f7028c Linux 5.4-rc1)
> Merging thermal-soc/next (6c375eccded4 thermal: db8500: Rewrite to be a p=
ure OF sensor)
> Merging ieee1394/for-next (67f8e65e4fc1 firewire: net: remove set but not=
 used variable 'guid')
> Merging dlm/next (fa601a9ebd49 fs: dlm: implement tcp graceful shutdown)
> Merging swiotlb/linux-next (4cdfb27ba80d xen/swiotlb: remember having cal=
led xen_create_contiguous_region())
> CONFLICT (content): Merge conflict in drivers/xen/swiotlb-xen.c
> Merging rdma/for-next (c0f4979e90ea RDMA/cm: Remove unused cm_class)
> Merging net-next/master (ca65a280fb4b sunrpc: Avoid comma separated state=
ments)
> Merging bpf-next/master (cd04b04de119 selftests/bpf: Add set test to reso=
lve_btfids)
> CONFLICT (content): Merge conflict in tools/lib/bpf/libbpf.c
> Merging ipsec-next/master (da7955405fb2 sfc: Fix build with CONFIG_RFS_AC=
CEL disabled.)
> Merging mlx5-next/mlx5-next (9123e3a74ec7 Linux 5.9-rc1)
> Merging netfilter-next/master (d0a84e1f38d9 ethtool: allow flow-type ethe=
r without IP protocol field)
> Merging ipvs-next/master (bfdd5aaa54b0 Merge tag 'Smack-for-5.9' of git:/=
/github.com/cschaufler/smack-next)
> Merging wireless-drivers-next/master (eb77802e0daa Merge ath-next from gi=
t://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git)
> Merging bluetooth/master (3b799254cf6f Bluetooth: hci_uart: Cancel init w=
ork before unregistering)
> Merging mac80211-next/master (e5b15f5af21a Merge branch 'ptp-Add-generic-=
helper-functions')
> Merging gfs2/for-next (e28c02b94f9e gfs2: When gfs2_dirty_inode gets a gl=
ock error, dump the glock)
> Merging mtd/mtd/next (6a1380271b75 Merge tag 'nand/for-5.9' of git://git.=
kernel.org/pub/scm/linux/kernel/git/mtd/linux into mtd/next)
> Merging nand/nand/next (da151e3458c8 dt-bindings: mtd: fsl-upm-nand: Depr=
ecate chip-delay and fsl, upm-wait-flags)
> Merging spi-nor/spi-nor/next (e93a977367b2 mtd: revert "spi-nor: intel: p=
rovide a range for poll_timout")
> Merging crypto/master (6779d0e6b0fe crypto: arm/curve25519 - include <lin=
ux/scatterlist.h>)
> Merging drm/drm-next (62975d27d647 drm/ttm: revert "drm/ttm: make TT crea=
tion purely optional v3")
> Merging amdgpu/drm-next (65ecc6928926 drm/amdgpu: add a wrapper for atom =
asic_init)
> CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/pm/swsmu/smu11/=
sienna_cichlid_ppt.c
> CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/pm/inc/smu_v11_=
0.h
> CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/pm/inc/smu11_dr=
iver_if_sienna_cichlid.h
> CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/dml/=
display_mode_vba.c
> CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/core=
/dc_link.c
> CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/bios=
/command_table2.c
> CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/amdgpu_=
dm/amdgpu_dm_debugfs.c
> CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/amdgpu_=
dm/amdgpu_dm.c
> Merging drm-intel/for-linux-next (ced026e959be drm/i915: Update DRIVER_DA=
TE to 20200824)
> Merging drm-tegra/drm/tegra/for-next (4fba6d22ca9a drm/tegra: plane: Supp=
ort 180=C2=B0 rotation)
> Merging drm-misc/for-linux-next (ebb21aa1882f drm/ttm: drop bus.size from=
 bus placement.)
> CONFLICT (content): Merge conflict in drivers/video/fbdev/savage/savagefb=
_driver.c
> CONFLICT (content): Merge conflict in drivers/video/fbdev/atmel_lcdfb.c
> CONFLICT (content): Merge conflict in drivers/video/fbdev/arcfb.c
> CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_v=
ram_mgr.c
> CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_t=
tm.h
> CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_t=
tm.c
> CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_g=
tt_mgr.c
> Applying: fix interaction with drm-misc-fix commit
> Merging drm-msm/msm-next (5e0c22d4a9dd drm/msm/a6xx: fix frequency not al=
ways being restored on GMU resume)
> Merging mali-dp/for-upstream/mali-dp (f634c6a80287 dt/bindings: display: =
Add optional property node define for Mali DP500)
> Merging imx-drm/imx-drm/next (efd5a93d2a89 drm/imx: drop explicit drm_mod=
e_config_cleanup)
> Merging etnaviv/etnaviv/next (c5d5a32ead1e drm/etnaviv: fix ref count lea=
k via pm_runtime_get_sync)
> Merging regmap/for-next (d012a7190fc1 Linux 5.9-rc2)
> Merging sound/for-next (14b51ccd2674 ALSA: usb-audio: Correct wrongly mat=
ching entries with audio class)
> Merging sound-asoc/for-next (cd018773c645 Merge remote-tracking branch 'a=
soc/for-5.10' into asoc-next)
> Merging modules/modules-next (262e6ae7081d modules: inherit TAINT_PROPRIE=
TARY_MODULE)
> Merging input/next (9b5fbad1dcee Input: MT - avoid comma separated statem=
ents)
> Merging block/for-next (86cfccb66937 Merge tag 'dlm-5.9' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/teigland/linux-dlm)
> Merging device-mapper/for-next (a9cb9f4148ef dm: don't call report zones =
for more than the user requested)
> Merging pcmcia/pcmcia-next (46d079790663 pcmcia: make pccard_loop_tuple()=
 static)
> Merging mmc/next (10a70e0d4edd Merge branch 'fixes' into next)
> Merging mfd/for-mfd-next (c563a66537d2 mfd: rn5t618: Add a power supply s=
ubdevice)
> Merging backlight/for-backlight-next (7eb99a39ef76 video: backlight: cr_b=
llcd: Remove unused variable 'intensity')
> Merging battery/for-next (ef805f217709 dt-bindings: power: reset: Convert=
 reboot-mode to YAML)
> Merging regulator/for-next (79bb4ac46a7f Merge remote-tracking branch 're=
gulator/for-5.10' into regulator-next)
> Merging security/next-testing (bc62d68e2a0a device_cgroup: Fix RCU list d=
ebugging warning)
> Merging apparmor/apparmor-next (e37986097ba6 apparmor: Use true and false=
 for bool variable)
> Merging integrity/next-integrity (d012a7190fc1 Linux 5.9-rc2)
> Merging keys/keys-next (b6f61c314649 keys: Implement update for the big_k=
ey type)
> Merging safesetid/safesetid-next (0476c865ded6 LSM: SafeSetID: Fix warnin=
gs reported by test bot)
> Merging selinux/next (1b8b31a2e612 selinux: convert policy read-write loc=
k to RCU)
> Merging smack/next (42a2df3e829f Smack: prevent underflow in smk_set_cips=
o())
> Merging tomoyo/master (9123e3a74ec7 Linux 5.9-rc1)
> Merging tpmdd/next (9123e3a74ec7 Linux 5.9-rc1)
> Merging watchdog/master (18445bf405cb Merge tag 'spi-fix-v5.9-rc1' of git=
://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
> Merging iommu/next (e46b3c0d011e Merge tag 'arm-smmu-updates' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/will/linux into next)
> Merging vfio/next (ccd59dce1a21 vfio/type1: Refactor vfio_iommu_type1_ioc=
tl())
> Merging audit/next (265c32072b0c audit: uninitialize variable audit_sig_s=
id)
> Merging devicetree/for-next (7ba58fff001d dt-bindings: Validate DT bindin=
g schema in a single call)
> Merging mailbox/mailbox-for-next (884996986347 mailbox: mediatek: cmdq: c=
lear task in channel before shutdown)
> Merging spi/for-next (410c081be7ac Merge remote-tracking branch 'spi/for-=
5.10' into spi-next)
> Merging tip/auto-latest (21f294e9c2da Merge branch 'perf/core')
> Merging clockevents/timers/drivers/next (9fba22584e54 clocksource: Ingeni=
c: Add support for the Ingenic X1000 OST.)
> Merging edac/edac-for-next (e9b46cc8e3eb Merge branch 'edac-misc' into ed=
ac-for-next)
> Merging irqchip/irq/irqchip-next (821fc9e261f3 irqchip/ingenic: Leave par=
ent IRQ unmasked on suspend)
> Merging ftrace/for-next (38ce2a9e33db tracing: Add trace_array_init_print=
k() to initialize instance trace_printk() buffers)
> Merging rcu/rcu/next (72cc80705122 rcu: Remove unused "cpu" parameter fro=
m rcu_report_qs_rdp())

I've built and run an arm64 allmodconfig kernel where I use the
defconfig as the base, I do this for testing purposes.
I can see the following call trace [1]:

[ 2595.811453][    T1] Running tests on all trace events:
[ 2595.860933][    T1] Testing all events:
[ 4316.066072][    T8] kworker/dying (8) used greatest stack depth:
27056 bytes left
[ 8561.924871][    C0] watchdog: BUG: soft lockup - CPU#0 stuck for
22s! [migration/0:14]
[ 8561.934498][    C0] Modules linked in:
[ 8561.942303][    C0] irq event stamp: 4044
[ 8561.949044][    C0] hardirqs last  enabled at (4043):
[<ffffa000126b530c>] _raw_spin_unlock_irqrestore+0xac/0x138
[ 8561.960848][    C0] hardirqs last disabled at (4044):
[<ffffa000126a89f8>] __schedule+0xf8/0x7e0
[ 8561.971418][    C0] softirqs last  enabled at (3698):
[<ffffa00010001b04>] __do_softirq+0x524/0x5f8
[ 8561.982191][    C0] softirqs last disabled at (3689):
[<ffffa000101216c8>] __irq_exit_rcu+0x128/0x1a0
[ 8561.993068][    C0] CPU: 0 PID: 14 Comm: migration/0 Tainted: G
   W         5.9.0-rc2-next-20200826-00005-g24628bb4c0bf #1
[ 8562.005684][    C0] Hardware name: linux,dummy-virt (DT)
[ 8562.013247][    C0] pstate: 80400005 (Nzcv daif +PAN -UAO BTYPE=3D--)
[ 8562.021657][    C0] pc : arch_local_irq_enable+0x58/0x80
[ 8562.029323][    C0] lr : _raw_spin_unlock_irq+0x84/0xc0
[ 8562.036739][    C0] sp : ffff0000698efaa0
[ 8562.042984][    C0] x29: ffff0000698efaa0 x28: ffff00006ad0f270
[ 8562.053814][    C0] x27: ffff00006ad0f248 x26: ffff0000698d4718
[ 8562.064687][    C0] x25: ffff00006ad0e798 x24: ffffa000139e3a40
[ 8562.075506][    C0] x23: 0000000000000001 x22: ffffa000154f5000
[ 8562.086425][    C0] x21: ffff00006ad0e798 x20: ffff00006ad0e780
[ 8562.097255][    C0] x19: ffffa000126a905c x18: 00000000000014c0
[ 8562.108071][    C0] x17: 0000000000001500 x16: 0000000000001440
[ 8562.118918][    C0] x15: 00000000f1f1f1f1 x14: 003d090000000000
[ 8562.129739][    C0] x13: 00003d0900000000 x12: ffff80000d31df41
[ 8562.140544][    C0] x11: 1fffe0000d31df40 x10: ffff80000d31df40
[ 8562.151366][    C0] x9 : dfffa00000000000 x8 : ffff0000698efa07
[ 8562.162247][    C0] x7 : 0000000000000001 x6 : 00007ffff2ce20c0
[ 8562.173072][    C0] x5 : ffff0000698d4040 x4 : dfffa00000000000
[ 8562.183954][    C0] x3 : ffffa0001040f904 x2 : 0000000000000007
[ 8562.194811][    C0] x1 : ffffa00014080000 x0 : 00000000000000e0
[ 8562.205858][    C0] Call trace:
[ 8562.211739][    C0]  arch_local_irq_enable+0x58/0x80
[ 8562.219076][    C0]  _raw_spin_unlock_irq+0x84/0xc0
[ 8562.226394][    C0]  __schedule+0x75c/0x7e0
[ 8562.233074][    C0]  preempt_schedule_notrace+0x64/0xc0
[ 8562.268210][    C0]  ftrace_ops_list_func+0x494/0x4e0
[ 8562.275735][    C0]  ftrace_graph_call+0x0/0x4
[ 8562.282647][    C0]  preempt_count_add+0xc/0x240
[ 8562.289686][    C0]  schedule+0xe4/0x160
[ 8562.296187][    C0]  smpboot_thread_fn+0x47c/0x540
[ 8562.303377][    C0]  kthread+0x23c/0x260
[ 8562.309906][    C0]  ret_from_fork+0x10/0x18
[ 8562.316604][    C0] Kernel panic - not syncing: softlockup: hung tasks
[ 8562.325230][    C0] CPU: 0 PID: 14 Comm: migration/0 Tainted: G
   W    L    5.9.0-rc2-next-20200826-00005-g24628bb4c0bf #1
[ 8562.337861][    C0] Hardware name: linux,dummy-virt (DT)
[ 8562.345374][    C0] Call trace:
[ 8562.351228][    C0]  dump_backtrace+0x0/0x320
[ 8562.358070][    C0]  show_stack+0x38/0x60
[ 8562.364728][    C0]  dump_stack+0x1c0/0x280
[ 8562.371447][    C0]  panic+0x32c/0x614
[ 8562.377868][    C0]  watchdog_timer_fn+0x49c/0x560
[ 8562.385076][    C0]  __run_hrtimer+0x1cc/0x360
[ 8562.392021][    C0]  __hrtimer_run_queues+0x1a0/0x220
[ 8562.399500][    C0]  hrtimer_interrupt+0x1f8/0x440
[ 8562.406807][    C0]  arch_timer_handler_virt+0x68/0xa0
[ 8562.414338][    C0]  handle_percpu_devid_irq+0x118/0x2a0
[ 8562.421992][    C0]  __handle_domain_irq+0x150/0x1c0
[ 8562.429315][    C0]  gic_handle_irq+0x98/0x120
[ 8562.436297][    C0]  el1_irq+0xd4/0x1c0
[ 8562.442748][    C0]  arch_local_irq_enable+0x58/0x80
[ 8562.450116][    C0]  _raw_spin_unlock_irq+0x84/0xc0
[ 8562.457360][    C0]  __schedule+0x75c/0x7e0
[ 8562.464142][    C0]  preempt_schedule_notrace+0x64/0xc0
[ 8562.471745][    C0]  ftrace_ops_list_func+0x494/0x4e0
[ 8562.479195][    C0]  ftrace_graph_call+0x0/0x4
[ 8562.486159][    C0]  preempt_count_add+0xc/0x240
[ 8562.493210][    C0]  schedule+0xe4/0x160
[ 8562.499737][    C0]  smpboot_thread_fn+0x47c/0x540
[ 8562.506960][    C0]  kthread+0x23c/0x260
[ 8562.513496][    C0]  ret_from_fork+0x10/0x18
[ 8562.521052][    C0] Kernel Offset: disabled
[ 8562.527725][    C0] CPU features: 0x0240002,20002004
[ 8562.534950][    C0] Memory Limit: none
[ 8562.543830][    C0] ---[ end Kernel panic - not syncing:
softlockup: hung tasks ]---

When I tested to checkout and build e6df9766894d ("Merge remote-tracking br=
anch
'irqchip/irq/irqchip-next' into master") that was merged into today's
tag I was able to
boot [2]. When I checked out 25e6e115dd1d ("Merge remote-tracking
branch 'rcu/rcu/next' into master") and built and tested that I was
able to boot [3] after a
looong time. To clarify, the rcu merge comes after the irqchip merge.

I also tried to only revert the rcu tree from todays next tag like this:
"git diff e6df9766894d..25e6e115dd1d | patch -Rp1". When I built that
I was able to
boot [4] too.

Any idea what's going on here?

Cheers,
Anders
[1] https://people.linaro.org/~anders.roxell/output-next-20200826.log
[2] https://people.linaro.org/~anders.roxell/output-next-20200826-bisect-e6=
df9766894d.log
[3] https://people.linaro.org/~anders.roxell/output-next-20200826-bisect-25=
e6e115dd1d.log
[4] https://people.linaro.org/~anders.roxell/output-next-20200826-bisect-re=
vert-e6df9766894d-25e6e115dd1d.log
