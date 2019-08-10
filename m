Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EA2488C38
	for <lists+linux-next@lfdr.de>; Sat, 10 Aug 2019 18:23:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726116AbfHJQX1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 10 Aug 2019 12:23:27 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:40161 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726024AbfHJQX1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 10 Aug 2019 12:23:27 -0400
Received: by mail-lj1-f195.google.com with SMTP id m8so61203573lji.7
        for <linux-next@vger.kernel.org>; Sat, 10 Aug 2019 09:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RuWuPn+0eaObzEFQS/9ZteFbP9Dj6R4HQSV5D8ksW5g=;
        b=NV0lVMPzMdPBtICafVmzz3Do+gN9rq7+uZCmH2d6WOIwHjjRSpR1NgXKiCpLf/Rmm0
         Vrg7+83DWp/kO90Yr8X8iYoNWK8hx+wYQjuVA0pYMwQsOz4MYwHGudgWJYcipthQUzzC
         UQUGMi4IKfwEKXhACtBHrAD6p1FGIzmFfcTzX0G5C1fEbqVS7AHIJTGoKCv+8axYLNEv
         7t7dwuUgTN/BoCe+PdK4bUACjQEE5UR7HlpqUah/b0IsvSDcYPrW2o+mwBkNWwPbfbMG
         HBI2Og+Xj92/C10DMfDwk3f2Hp01RxduZQ175anvGo1oungwbh0VmuD6bwbtapcKe8Du
         sPkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RuWuPn+0eaObzEFQS/9ZteFbP9Dj6R4HQSV5D8ksW5g=;
        b=LeXQ8xLw02duF72G9L8IVTMyw74YyhEkJyDXAFSlkxpyxTzoCmhrw52Tj5KkKsPBOH
         xZ+LbgnjKEWpynpKscHHyZdbp8vaqs6txgW2RzT2qOtxeBa4Ya7wwiuqhAg6qX9O6N6L
         huVomlwdSSYkmWFqPKvZgA0/G3CLL7IdqOuFV6Lu+4WNK3wvFVAM0A3z0aPaIZ1Xv3oM
         Zgkoaz28WK8uHG0F3UGkqkrxIB6HS9TuOYf1F4Zkypjdl5NASCLXTbdifoe7RczAJBXx
         SA6O3zNsk6j7/d3zSHST1Y4bI5YkgqOrwAUEnLW+UgNecVaMJFkiYls8i+BrAy5+lV6z
         MbCw==
X-Gm-Message-State: APjAAAWwFl+aRdosPrEaBFqPgQWtwGhQoRAWLyUy5FTbdUFQv8PD45Rz
        FkovgnH28w+NJTRi7jI0hdQidpNLDs740y8pDDOwRA==
X-Google-Smtp-Source: APXvYqxhWiC+g8xM2Wt7ILBVBbHInOBTEwE3zMaxMWvuKtjNGQY9vZEiEDoHY5lCzZ6HzjfBvPqVvqEr+r//RsDzT+k=
X-Received: by 2002:a2e:9bc6:: with SMTP id w6mr2610952ljj.156.1565454202088;
 Sat, 10 Aug 2019 09:23:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190809180350.5cf09351@canb.auug.org.au>
In-Reply-To: <20190809180350.5cf09351@canb.auug.org.au>
From:   Anders Roxell <anders.roxell@linaro.org>
Date:   Sat, 10 Aug 2019 18:23:10 +0200
Message-ID: <CADYN=9LPrQyCqWyUG-SUZircE=0rjkeQaASqUtAM--5CoaZCiw@mail.gmail.com>
Subject: Re: linux-next: Tree for Aug 9
To:     Stephen Rothwell <sfr@canb.auug.org.au>, hch@lst.de
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 9 Aug 2019 at 10:04, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Changes since 20190808:
>
> The amdgpu-fixes tree gained a conflict against the drm-fixes tree.
>
> The dma-mapping-fixes tree lost its build failure.
>
> The crypto tree lost its build failure.
>
> The sound tree gained a build failure for which I applied a patch.
>
> The sound-asoc tree gained a build failure so I used the version from
> next-20190808.  The older version then gained conflicts against the
> aound tree.
>
> The tip tree lost its build failure.
>
> The usb tree gained a conflict against the net-next tree.
>
> Non-merge commits (relative to Linus' tree): 4769
>  5242 files changed, 277055 insertions(+), 125563 deletions(-)
>
> ----------------------------------------------------------------------------
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
> and sparc64 defconfig. And finally, a simple boot test of the powerpc
> pseries_le_defconfig kernel in qemu (with and without kvm enabled).
>
> Below is a summary of the state of the merge.
>
> I am currently merging 304 trees (counting Linus' and 74 trees of bug
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
> Merging origin/master (ecb095bff5d4 Merge tag 'hwmon-for-v5.3-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging)
> Merging fixes/master (609488bc979f Linux 5.3-rc2)
> Merging kbuild-current/fixes (258e2ed6c44a kbuild: show hint if subdir-y/m is used to visit module Makefile)
> Merging arc-current/for-curr (e86d94fdda8e ARC: unwind: Mark expected switch fall-throughs)
> Merging arm-current/fixes (c5d0e49e8d8f ARM: 8867/1: vdso: pass --be8 to linker if necessary)
> Merging arm-soc-fixes/arm/fixes (7bd9d465140a Merge tag 'imx-fixes-5.3' of git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into arm/fixes)
> Merging arm64-fixes/for-next/fixes (30e235389faa arm64: mm: add missing PTE_SPECIAL in pte_mkdevmap on arm64)
> Merging m68k-current/for-linus (f28a1f16135c m68k: Don't select ARCH_HAS_DMA_PREP_COHERENT for nommu or coldfire)
> Merging powerpc-fixes/fixes (d7e23b887f67 powerpc/kasan: fix early boot failure on PPC32)
> Merging s390-fixes/fixes (739bacbf7aa2 s390/build: use size command to perform empty .bss check)
> Merging sparc/master (038029c03e21 sparc: remove unneeded uapi/asm/statfs.h)
> Merging fscrypt-current/for-stable (ae64f9bd1d36 Linux 4.15-rc2)
> Merging net/master (f6649feb264e Merge tag 'batadv-net-for-davem-20190808' of git://git.open-mesh.org/linux-merge)
> Merging bpf/master (f1fc7249dddc selftests/bpf: tests for jmp to 1st insn)
> Merging ipsec/master (22d6552f827e xfrm interface: fix management of phydev)
> Merging netfilter/master (589b474a4b7c netfilter: nf_flow_table: fix offload for flows that are subject to xfrm)
> Merging ipvs/master (58e8b37069ff Merge branch 'net-phy-dp83867-add-some-fixes')
> Merging wireless-drivers/master (1f6607250331 iwlwifi: dbg_ini: fix compile time assert build errors)
> Merging mac80211/master (d8a1de3d5bb8 isdn: hfcsusb: Fix mISDN driver crash caused by transfer buffer on the stack)
> Merging rdma-fixes/for-rc (e21a712a9685 Linux 5.3-rc3)
> Merging sound-current/for-linus (1be3c1fae6c1 ALSA: firewire: fix a memory leak bug)
> Merging sound-asoc-fixes/for-linus (8cbd5eb1a884 Merge branch 'asoc-5.3' into asoc-linus)
> Merging regmap-fixes/for-linus (609488bc979f Linux 5.3-rc2)
> Merging regulator-fixes/for-linus (a13693b86ac7 Merge branch 'regulator-5.3' into regulator-linus)
> Merging spi-fixes/for-linus (c95d020fb6ea Merge branch 'spi-5.3' into spi-linus)
> Merging pci-current/for-linus (5f9e832c1370 Linus 5.3-rc1)
> Merging driver-core.current/driver-core-linus (8097c43bcbec Revert "kernfs: fix memleak in kernel_ops_readdir()")
> Merging tty.current/tty-linus (81eaadcae81b kgdboc: disable the console lock when in kgdb)
> Merging usb.current/usb-linus (27709ae4e2fe usb: setup authorized_default attributes using usb_bus_notify)
> Merging usb-gadget-fixes/fixes (42de8afc40c9 usb: dwc2: Use generic PHY width in params setup)
> Merging usb-serial-fixes/usb-linus (552573e42aab USB: serial: option: add D-Link DWM-222 device ID)
> Merging usb-chipidea-fixes/ci-for-usb-stable (16009db47c51 usb: chipidea: udc: workaround for endpoint conflict issue)
> Merging phy/fixes (609488bc979f Linux 5.3-rc2)
> Merging staging.current/staging-linus (09f6109ff4f8 Merge tag 'iio-fixes-for-5.3a' of git://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio into staging-linus)
> Merging char-misc.current/char-misc-linus (5511c0c309db coresight: Fix DEBUG_LOCKS_WARN_ON for uninitialized attribute)
> Merging soundwire-fixes/fixes (664b16589f88 soundwire: cadence_master: fix definitions for INTSTAT0/1)
> Merging thunderbolt-fixes/fixes (e21a712a9685 Linux 5.3-rc3)
> Merging input-current/for-linus (849f5ae3a513 Input: iforce - add sanity checks)
> Merging crypto-current/master (e2664ecbb2f2 crypto: ccp - Ignore tag length when decrypting GCM ciphertext)
> Merging ide/master (baf6722aa0cb ide: Use dev_get_drvdata where possible)
> Merging vfio-fixes/for-linus (5715c4dd66a3 vfio/mdev: Synchronize device create/remove with parent removal)
> Merging kselftest-fixes/fixes (fbb01c52471c selftests/livepatch: push and pop dynamic debug config)
> Merging modules-fixes/modules-linus (be71eda5383f module: Fix display of wrong module .text address)
> Merging slave-dma-fixes/fixes (39c71a5b8212 dmaengine: stm32-mdma: Fix a possible null-pointer dereference in stm32_mdma_irq_handler())
> Merging backlight-fixes/for-backlight-fixes (e93c9c99a629 Linux 5.1)
> Merging mtd-fixes/mtd/fixes (2b372a9685a7 mtd: hyperbus: Add hardware dependency to AM654 driver)
> Merging mfd-fixes/for-mfd-fixes (63b2de12b7ee mfd: stmfx: Fix an endian bug in stmfx_irq_handler())
> Merging v4l-dvb-fixes/fixes (92f5b0313e37 media: vivid: fix missing cec adapter name)
> Merging reset-fixes/reset/fixes (a71dcd3757e2 reset: remove redundant null check on pointer dev)
> Merging mips-fixes/mips-fixes (74034a09267c MIPS: BCM63XX: Mark expected switch fall-through)
> Merging at91-fixes/at91-fixes (5f9e832c1370 Linus 5.3-rc1)
> Merging omap-fixes/fixes (fb59ee37cfe2 ARM: dts: am57xx: Disable voltage switching for SD card)
> Merging kvm-fixes/master (30cd8604323d KVM: x86: Add fixed counters to PMU filter)
> Merging kvms390-fixes/master (a86cb413f4bf KVM: s390: Do not report unusabled IDs via KVM_CAP_MAX_VCPU_ID)
> Merging hwmon-fixes/hwmon (3cfa5c97f41f hwmon: pmbus: ucd9000: remove unneeded include)
> Merging nvdimm-fixes/libnvdimm-fixes (d75996dd022b dax: dax_layout_busy_page() should not unmap cow pages)
> Merging btrfs-fixes/next-fixes (efa6b617e067 Merge branch 'misc-5.3' into next-fixes)
> Merging vfs-fixes/fixes (47a7a8b34ec7 configfs: fix a deadlock in configfs_symlink())
> Merging dma-mapping-fixes/for-linus (8e9d01dcef6b dma-direct: don't truncate dma_required_mask to bus addressing capabilities)
> Merging i3c-fixes/master (6fbc7275c7a9 Linux 5.2-rc7)
> Merging drivers-x86-fixes/fixes (f14312a93b34 platform/x86: pcengines-apuv2: use KEY_RESTART for front button)
> Merging samsung-krzk-fixes/fixes (5f9e832c1370 Linus 5.3-rc1)
> Merging pinctrl-samsung-fixes/pinctrl-fixes (5f9e832c1370 Linus 5.3-rc1)
> Merging devicetree-fixes/dt/linus (740ce365a4dc dt-bindings: Fix generated example files getting added to schemas)
> Merging scsi-fixes/fixes (a86c71ba3022 scsi: lpfc: Fix crash when cpu count is 1 and null irq affinity mask)
> Merging drm-fixes/drm-fixes (f536579c1482 Merge tag 'drm-fixes-5.3-2019-08-07' of git://people.freedesktop.org/~agd5f/linux into drm-fixes)
> Merging amdgpu-fixes/drm-fixes (b066c77636c0 Revert "drm/amdgpu: fix transform feedback GDS hang on gfx10 (v2)")
> CONFLICT (content): Merge conflict in include/uapi/linux/kfd_ioctl.h
> CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> Merging drm-intel-fixes/for-linux-next-fixes (73a0ff0b30af drm/i915: Fix wrong escape clock divisor init for GLK)
> Merging mmc-fixes/fixes (b803974a8603 mmc: cavium: Add the missing dma unmap when the dma has finished.)
> Merging rtc-fixes/rtc-fixes (5f9e832c1370 Linus 5.3-rc1)
> Merging gnss-fixes/gnss-linus (f2c7c76c5d0a Linux 5.2-rc3)
> Merging hyperv-fixes/hyperv-fixes (5d14de4c6ce5 hv: Use the correct style for SPDX License Identifier)
> Merging soc-fsl-fixes/fix (5674a92ca4b7 soc/fsl/qe: Fix an error code in qe_pin_request())
> Merging risc-v-fixes/fixes (5496bf3d0431 RISC-V: Remove udivdi3)
> Merging pidfd-fixes/fixes (97112e283da5 exit: make setting exit_state consistent)
> Merging fpga-fixes/fixes (7721f61d2e76 fpga: altera-ps-spi: Fix getting of optional confd gpio)
> Merging drm-misc-fixes/for-linux-next-fixes (f7ccbed656f7 drm/rockchip: Suspend DP late)
> Merging kspp-gustavo/for-next/kspp (09995c8ababa ARM: ep93xx: Mark expected switch fall-through)
> Merging kbuild/for-next (cc6ff7162ef4 Kbuild: Handle PREEMPT_RT for version string and magic)
> Merging compiler-attributes/compiler-attributes (6c4d6bc54864 auxdisplay: Fix a typo in cfag12864b-example.c)
> Merging leaks/leaks-next (9e98c678c2d6 Linux 5.1-rc1)
> Merging dma-mapping/for-next (ad3c7b18c5b3 arm: use swiotlb for bounce buffering on LPAE configs)
> Merging asm-generic/master (7f3a8dff1219 asm-generic: remove ptrace.h)
> Merging arc/for-next (6fbc7275c7a9 Linux 5.2-rc7)
> Merging arm/for-next (b7a735f3a606 Merge branch 'for-arm-soc' into for-next)
> Merging arm64/for-next/core (ea5ddd41d0d2 Merge branch 'for-next/tbi' into for-next/core)
> Merging arm-perf/for-next/perf (228f855fb57a perf: Remove dev_err() usage after platform_get_irq())
> Merging arm-soc/for-next (1439dbf17e9e Merge branch 'arm/fixes' into for-next)
> Merging actions/for-next (fb9c1c1deb5e Merge branch 'v4.20/drivers+s900-sps' into next)
> Merging amlogic/for-next (5f2581d1bbf1 Merge branch 'v5.4/drivers' into tmp/aml-rebuild)
> Merging aspeed/for-next (34bab04663d5 Merge branch 'dt-for-v5.4' into for-next)
> Merging at91/at91-next (90fbe456b5f0 Merge branch 'at91-dt' into at91-next)
> Merging bcm2835/for-next (f83e5000db15 Merge branch 'bcm2835-dt-next' into for-next)
> Merging imx-mxs/for-next (8b3e0af8ab56 Merge branch 'imx/defconfig' into for-next)
> Merging keystone/next (78145dbeaea1 Merge branch 'for_5.3/driver-soc' into next)
> Merging mediatek/for-next (73ade6a62931 Merge branch 'v5.1-next/soc' into for-next)
> Merging mvebu/for-next (e1b0b32a5ad6 Merge branch 'mvebu/dt64' into mvebu/for-next)
> Merging omap/for-next (7376d6a65730 Merge branch 'fixes' into for-next)
> Merging qcom/for-next (e8cf1988f521 Merge branches 'arm64-for-5.4' and 'drivers-for-5.3' into for-next)
> Merging renesas/next (a16ecb14d0b0 Merge branches 'arm-dt-for-v5.3', 'arm-soc-for-v5.3', 'arm-defconfig-for-v5.3', 'arm64-defconfig-for-v5.3', 'arm64-dt-for-v5.3' and 'dt-bindings-for-v5.3' into next)
> Merging renesas-geert/next (383704e3e3ec Merge branch 'renesas-dt-bindings-for-v5.4' into renesas-next)
> Merging reset/reset/next (ea651ffd4f7f reset: Add DesignWare IP support to simple reset)
> Merging rockchip/for-next (30b2ea80df59 Merge branch 'v5.4-armsoc/dts32' into for-next)
> Merging samsung-krzk/for-next (468b887c767e Merge branch 'next/defconfig' into for-next)
> Merging scmi/for-linux-next (b9ab2ad24a89 Merge remote-tracking branches 'korg_sudeep/for-next/juno', 'korg_sudeep/for-next/vexpress', 'korg_sudeep/for-next/vexpress-dt' and 'korg_sudeep/scmi_updates' into for-linux-next)
> Merging sunxi/sunxi/for-next (6c7312f8d13e Merge branches 'sunxi/dt-for-5.4' and 'sunxi/drivers-for-5.4' into sunxi/for-next)
> Merging tegra/for-next (6290ae1fb7e2 Merge branch for-5.4/firmware into for-next)
> Merging clk/clk-next (03d7036efa4a Merge branch 'clk-fixes' into clk-next)
> Merging clk-samsung/for-next (a188339ca5a3 Linux 5.2-rc1)
> Merging c6x/for-linux-next (8adcc59974b8 Merge branch 'work.misc' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
> Merging csky/linux-next (ada384a7fd2d csky: Optimize arch_sync_dma_for_cpu/device with dma_inv_range)
> Merging h8300/h8300-next (a5de8865cb3e h8300: move definition of __kernel_size_t etc. to posix_types.h)
> Merging ia64/next (c5e5c48c1642 ia64:unwind: fix double free for mod->arch.init_unw_table)
> Merging m68k/for-next (f28a1f16135c m68k: Don't select ARCH_HAS_DMA_PREP_COHERENT for nommu or coldfire)
> Merging m68knommu/for-next (e21a712a9685 Linux 5.3-rc3)
> Merging microblaze/next (226a893bbb1f microblaze: no need to check return value of debugfs_create functions)
> Merging mips/mips-next (6393e6064486 mips: fix vdso32 build, again)
> CONFLICT (content): Merge conflict in arch/mips/include/asm/vdso/vdso.h
> Merging nds32/next (932296120543 nds32: add new emulations for floating point instruction)
> Merging nios2/for-next (f017da5c7077 nios2: configs: Remove useless UEVENT_HELPER_PATH)
> Merging openrisc/for-next (57ce8ba0fd3a openrisc: Fix broken paths to arch/or32)
> Merging parisc-hd/for-next (83af58f8068e parisc: Add assembly implementations for memset, strlen, strcpy, strncpy and strcat)
> Merging powerpc/next (5f9e832c1370 Linus 5.3-rc1)
> Merging fsl/next (63d86876f324 Revert "powerpc/fsl_pci: simplify fsl_pci_dma_set_mask")
> Merging soc-fsl/next (21560067fb1f soc: fsl: qe: fold qe_get_num_of_snums into qe_snums_init)
> Merging risc-v/for-next (f51edcec5288 MAINTAINERS: Add an entry for generic architecture topology)
> Merging sifive/for-next (467e050e9760 Merge branch 'i2c/for-current' of git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux)
> Merging s390/features (56accf7fd7bf s390/pci: PCI_IOV_RESOURCES loop refactoring in zpci_map_resources)
> Merging sh/sh-next (cd10afbc932d sh: remove unneeded uapi asm-generic wrappers)
> CONFLICT (modify/delete): arch/sh/include/uapi/asm/types.h deleted in sh/sh-next and modified in HEAD. Version HEAD of arch/sh/include/uapi/asm/types.h left in tree.
> CONFLICT (modify/delete): arch/sh/include/uapi/asm/setup.h deleted in sh/sh-next and modified in HEAD. Version HEAD of arch/sh/include/uapi/asm/setup.h left in tree.
> $ git rm -f arch/sh/include/uapi/asm/setup.h arch/sh/include/uapi/asm/types.h
> Merging sparc-next/master (b71acb0e3721 Merge branch 'linus' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6)
> Merging uml/linux-next (b482e48d29f1 um: fix build without CONFIG_UML_TIME_TRAVEL_SUPPORT)
> Merging xtensa/xtensa-for-next (1386dcaa9226 Merge branch 'xtensa-5.3' into xtensa-for-next)
> Merging fscrypt/master (0564336329f0 fscrypt: document testing with xfstests)
> Merging afs/afs-next (b214b2d8f277 rxrpc: Don't use skb_cow_data() in rxkad)
> Merging btrfs/next (29dcea88779c Linux 4.17)
> Merging btrfs-kdave/for-next (a668d8d6543c Merge branch 'cleanup/sysfs-refactoring' into for-next-20190805)
> CONFLICT (content): Merge conflict in fs/btrfs/extent-tree.c
> CONFLICT (content): Merge conflict in fs/btrfs/ctree.h
> Applying: btrfs: merge fix up for "Btrfs: fix sysfs warning and missing raid sysfs directories"
> Merging ceph/master (d31d07b97a5e ceph: fix end offset in truncate_inode_pages_range call)
> Merging cifs/for-next (6f552656e128 smb3: Incorrect size for netname negotiate context)
> Merging configfs/for-next (f6122ed2a4f9 configfs: Fix use-after-free when accessing sd->s_dentry)
> Merging ecryptfs/next (7451c54abc91 ecryptfs: Change return type of ecryptfs_process_flags)
> Merging ext3/for_next (56db1991690f udf: prevent allocation beyond UDF partition)
> Merging ext4/dev (96fcaf86c3cb ext4: fix coverity warning on error path of filename setup)
> Merging f2fs/dev (11f3567662e0 f2fs: Support case-insensitive file name lookups)
> Merging fsverity/fsverity (60d7bf0f790f f2fs: add fs-verity support)
> CONFLICT (content): Merge conflict in fs/f2fs/inode.c
> CONFLICT (content): Merge conflict in fs/f2fs/file.c
> Merging fuse/for-next (e7d6cd694383 fuse: cleanup fuse_wait_on_page_writeback)
> Merging jfs/jfs-next (a5fdd713d256 jfs: fix bogus variable self-initialization)
> Merging nfs/linux-next (67e7b52d44e3 NFSv4: Ensure state recovery handles ETIMEDOUT correctly)
> Merging nfs-anna/linux-next (68f461593f76 NFS/flexfiles: Use the correct TCP timeout for flexfiles I/O)
> Merging nfsd/nfsd-next (64a38e840ce5 SUNRPC: Track writers of the 'channel' file to improve cache_listeners_exist)
> Merging orangefs/for-next (e65682b55956 orangefs: eliminate needless variable assignments)
> Merging overlayfs/overlayfs-next (0be0bfd2de9d ovl: fix regression caused by overlapping layers detection)
> Merging ubifs/linux-next (8009ce956c3d ubifs: Don't leak orphans on memory during commit)
> Merging v9fs/9p-next (80a316ff1627 9p/xen: Add cleanup path in p9_trans_xen_init)
> Merging xfs/for-next (afa1d96d1430 xfs: Fix possible null-pointer dereferences in xchk_da_btree_block_check_sibling())
> Merging iomap/iomap-for-next (5d907307adc1 iomap: move internal declarations into fs/iomap/)
> Merging djw-vfs/vfs-for-next (7e328e5930ad mm/fs: don't allow writes to immutable files)
> Merging file-locks/locks-next (43e4cb942e88 locks: Fix procfs output for file leases)
> Merging vfs/for-next (dad5ea4bac62 ceph_real_mount(): missing initialization)
> CONFLICT (content): Merge conflict in fs/ubifs/super.c
> CONFLICT (content): Merge conflict in fs/gfs2/super.c
> CONFLICT (content): Merge conflict in fs/ceph/super.c
> CONFLICT (modify/delete): Documentation/filesystems/vfs.txt deleted in HEAD and modified in vfs/for-next. Version vfs/for-next of Documentation/filesystems/vfs.txt left in tree.
> $ git rm -f Documentation/filesystems/vfs.txt
> Applying: docs: filesystems: vfs: update for "vfs: Kill mount_single()"
> Merging printk/for-next (ba174ef6d224 Merge branch 'for-5.3-fixes' into for-next)
> Merging pci/next (882e5d3f6fe0 Merge branch 'pci/trivial')
> CONFLICT (content): Merge conflict in drivers/pci/hotplug/ibmphp_res.c
> Merging pstore/for-next/pstore (609488bc979f Linux 5.3-rc2)
> Merging hid/for-next (7773e1130551 Merge branch 'for-5.3/upstream-fixes' into for-next)
> Merging i2c/i2c/for-next (d4b7c7304363 Merge branch 'i2c/for-5.4' into i2c/for-next)
> Merging i3c/i3c/next (934d24a5e150 i3c: move i3c_device_match_id to device.c and export it)
> Merging dmi/master (57361846b52b Linux 4.19-rc2)
> Merging hwmon-staging/hwmon-next (1eb9cc35e638 hwmon: (lm75) Modularize lm75_write and make hwmon_chip writable)
> Merging jc_docs/docs-next (aa48e31b8747 mailmap: add entry for Jaegeuk Kim)
> CONFLICT (content): Merge conflict in Documentation/admin-guide/cifs/todo.rst
> Merging v4l-dvb/master (97299a303532 media: Remove dev_err() usage after platform_get_irq())
> Merging v4l-dvb-next/master (5f9e832c1370 Linus 5.3-rc1)
> Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo in imxfb_probe())
> Merging pm/linux-next (c07e4dc1af49 Merge branch 'acpi-apei' into linux-next)
> Merging cpufreq-arm/cpufreq/arm/linux-next (07e44f922529 Merge branch 'cpufreq/qcom-updates' into cpufreq/arm/linux-next)
> Merging cpupower/cpupower (04507c0a9385 cpupower : frequency-set -r option misses the last cpu in related cpu list)
> Merging opp/opp/linux-next (0203c0343a1f Merge branch 'opp/qcom-updates' into opp/linux-next)
> Merging thermal/next (d093f91ff7d0 Merge branch 'for-rc' into next)
> CONFLICT (rename/add): Rename Documentation/thermal/index.rst->Documentation/driver-api/thermal/index.rst in HEAD. Documentation/driver-api/thermal/index.rst added in thermal/next
> Merging thermal-soc/next (4cb9f043447e thermal: thermal_mmio: remove some dead code)
> Merging ieee1394/for-next (812cd88749e0 firewire: mark expected switch fall-throughs)
> Merging dlm/next (a48f9721e6db dlm: no need to check return value of debugfs_create functions)
> Merging swiotlb/linux-next (4cdfb27ba80d xen/swiotlb: remember having called xen_create_contiguous_region())
> Merging rdma/for-next (cfa1f5f27c79 RDMA/efa: Rate limit admin queue error prints)
> Merging net-next/master (61552d2ce861 Merge branch 'net-batched-receive-in-GRO-path')
> CONFLICT (content): Merge conflict in net/rxrpc/call_object.c
> Merging bpf-next/master (b707659213d3 tools/bpf: fix core_reloc.c compilation error)
> CONFLICT (content): Merge conflict in tools/lib/bpf/libbpf.c
> Merging ipsec-next/master (c7b37c769d2a xfrm: remove get_mtu indirection from xfrm_type)
> Merging mlx5-next/mlx5-next (94f3e14e00fd mlx5: Use refcount_t for refcount)
> Merging netfilter-next/master (1b90af292e71 ipvs: Improve robustness to the ipvs sysctl)
> Merging nfc-next/master (1f008cfec5d5 NFC: fdp: Fix unused variable warnings)
> CONFLICT (content): Merge conflict in drivers/nfc/st21nfca/se.c
> Merging ipvs-next/master (1b0b807dd746 Merge branch 'r8169-fw')
> Merging wireless-drivers-next/master (6004cf298a41 b43legacy: Remove pointless cond_resched() wrapper)
> Merging bluetooth/master (fa9ccaf84f5d Bluetooth: hidp: Let hidp_send_message return number of queued bytes)
> Merging mac80211-next/master (6a7ce95d752e staging/octeon: Fix build error without CONFIG_NETDEVICES)
> Merging gfs2/for-next (0edfa8b7fb57 gfs2: Always mark inode dirty in fallocate)
> Merging mtd/mtd/next (5f9e832c1370 Linus 5.3-rc1)
> Merging nand/nand/next (80107e764846 mtd: rawnand: remove redundant assignment to variable ret)
> Merging spi-nor/spi-nor/next (5f9e832c1370 Linus 5.3-rc1)
> Merging crypto/master (b7a2758f2025 hwrng: n2-drv - fix typo)
> Merging drm/drm-next (dce14e36aea2 Merge tag 'drm-intel-next-2019-07-30' of git://anongit.freedesktop.org/drm/drm-intel into drm-next)
> Merging amdgpu/drm-next (6edb98330e88 drm/amdgpu: replace readq/writeq with atomic64 operations)
> CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/powerplay/navi10_ppt.c
> CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h
> CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
> CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
> CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/core/dc_stream.c
> CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c
> CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
> CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h
> CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> Merging drm-intel/for-linux-next (5b5efdf79abf drm/i915: Make debugfs/per_file_stats scale better)
> Merging drm-tegra/drm/tegra/for-next (2a6fc3cb5cb6 drm/tegra: Fix gpiod_get_from_of_node() regression)
> Merging drm-misc/for-linux-next (013b65101315 drm/panfrost: Add madvise and shrinker support)
> CONFLICT (content): Merge conflict in drivers/gpu/drm/ttm/ttm_bo.c
> Applying: drm/amdgpu: fix up for "drm/amdgpu: switch driver from bo->resv to bo->base.resv"
> Merging drm-msm/msm-next (4cf643a39221 Merge tag 'drm-next-5.3-2019-06-27' of git://people.freedesktop.org/~agd5f/linux into drm-next)
> Merging hdlcd/for-upstream/hdlcd (d664b851eb2b drm/arm/hdlcd: Reject atomic commits that disable only the plane)
> Merging mali-dp/for-upstream/mali-dp (4cf643a39221 Merge tag 'drm-next-5.3-2019-06-27' of git://people.freedesktop.org/~agd5f/linux into drm-next)
> Merging imx-drm/imx-drm/next (c23ef285fc67 drm/imx: Drop unused imx-ipuv3-crtc.o build)
> Merging etnaviv/etnaviv/next (facb180d3a51 drm/etnaviv: Use devm_platform_ioremap_resource())
> Merging regmap/for-next (5a6660ea31e5 Merge branch 'regmap-5.4' into regmap-next)
> Merging sound/for-next (3a76a41ffbf9 Merge branch 'topic/hda-bus-ops-cleanup' into for-next)
> Applying: ALSA: hda: readl/writel need linux/io.h
> Merging sound-asoc/for-next (5351215cc229 Merge branch 'asoc-5.4' into asoc-next)
> $ git reset --hard HEAD^
> Merging next-20190808 version of sound-asoc
> CONFLICT (content): Merge conflict in sound/soc/sof/intel/hda-dsp.c
> CONFLICT (content): Merge conflict in sound/soc/intel/skylake/skl.h
> CONFLICT (content): Merge conflict in sound/soc/intel/skylake/skl.c
> CONFLICT (content): Merge conflict in sound/soc/intel/skylake/skl-nhlt.c
> [master a29f10f4f4e9] next-20190808/sound-asoc
> Applying: ASoc: SOF: Intel: hda: merge fix up for "ALSA: hda: Direct MMIO accesses"
> [master 4be6325875d3] next-20190808/sound-asoc
> Merging modules/modules-next (38f054d549a8 modules: always page-align module section allocations)
> Merging input/next (c394159310d0 Input: soc_button_array - add support for newer surface devices)
> Merging block/for-next (7e18f2715875 Merge branch 'for-5.4/block' into for-next)
> Merging device-mapper/for-next (9c50a98f55f4 dm table: fix various whitespace issues with recent DAX code)
> Merging pcmcia/pcmcia-next (95691e3eddc4 pcmcia: Implement CLKRUN protocol disabling for Ricoh bridges)
> Merging mmc/next (9637eb6749b9 Merge branch 'fixes' into next)
> Merging kgdb/kgdb-next (3bd67b37e350 kdb: print real address of pointers instead of hashed addresses)
> CONFLICT (content): Merge conflict in kernel/debug/kdb/kdb_bt.c
> Merging md/for-next (e820d55cb99d md: fix raid10 hang issue caused by barrier)
> Merging mfd/for-mfd-next (b5e29aa880be mfd: davinci_voicecodec: Remove pointless #include)
> Merging backlight/for-backlight-next (73fbfc499448 backlight: pwm_bl: Fix heuristic to determine number of brightness levels)
> Merging battery/for-next (5f9e832c1370 Linus 5.3-rc1)
> Merging regulator/for-next (1a4405d68862 Merge branch 'regulator-5.4' into regulator-next)
> Merging security/next-testing (286e47a07799 Merge branch 'next-lsm' into next-testing)
> Merging apparmor/apparmor-next (136db994852a apparmor: increase left match history buffer size)
> Merging integrity/next-integrity (70433f67ec3a MODSIGN: make new include file self contained)
> Merging keys/keys-next (8cf8684e0d24 Merge branch 'keys-acl' into keys-next)
> CONFLICT (content): Merge conflict in include/linux/key.h
> CONFLICT (content): Merge conflict in fs/afs/security.c
> Applying: fsverity: merge fix for keyring_alloc API change
> Merging selinux/next (9b80c36353ed selinux: always return a secid from the network caches if we find one)
> Merging tpmdd/next (fa4f99c05320 tpm: tpm_ibm_vtpm: Fix unallocated banks)
> Merging watchdog/master (a18670f4617d watchdog: ath79_wdt: fix a typo in the name of a function)
> Merging iommu/next (66929812955b iommu/amd: Add support for X2APIC IOMMU interrupts)
> Merging vfio/next (1e4d09d2212d mdev: Send uevents around parent device registration)
> Merging audit/next (5f9e832c1370 Linus 5.3-rc1)
> Merging devicetree/for-next (bf1c0ac6a8bc docs: writing-schema.md: convert from markdown to ReST)
> Merging mailbox/mailbox-for-next (25777e5784a7 mailbox: handle failed named mailbox channel request)
> Merging spi/for-next (c3bb423d3618 Merge branch 'spi-5.4' into spi-next)
> Merging tip/auto-latest (c3b678607da5 Merge branch 'x86/mm')
> Merging clockevents/clockevents/next (b0c74b96d177 clocksource/drivers/davinci: Add support for clocksource)
> Merging edac/edac-for-next (82413e562ea6 EDAC, mellanox: Add ECC support for BlueField DDR4)
> Merging irqchip/irq/irqchip-next (3dae67ce600c irqchip/gic-pm: Remove PM_CLK dependency)
> Merging ftrace/for-next (6d54ceb539aa tracing: Fix user stack trace "??" output)
> Merging rcu/rcu/next (b989ff070574 Merge LKMM and RCU commits)
> Merging kvm/linux-next (30cd8604323d KVM: x86: Add fixed counters to PMU filter)
> Merging kvm-arm/next (1e0cf16cdad1 KVM: arm/arm64: Initialise host's MPIDRs by reading the actual register)
> Merging kvm-ppc/kvm-ppc-next (3bda7f0ae0f7 KVM: PPC: Book3S PR: Fix software breakpoints)
> Merging kvms390/next (a049a377164c KVM: selftests: Enable dirty_log_test on s390x)
> Merging xen-tip/linux-next (b877ac9815a8 xen/swiotlb: remember having called xen_create_contiguous_region())
> Merging percpu/for-next (03ed70fb0e5e Merge branch 'for-5.3' into for-next)
> Merging workqueues/for-next (be69d00d9769 workqueue: Remove GPF argument from alloc_workqueue_attrs())
> Merging drivers-x86/for-next (e3168b874321 platform/x86: asus-wmi: fix CPU fan control on recent products)
> Merging chrome-platform/for-next (5f9e832c1370 Linus 5.3-rc1)
> Merging hsi/for-next (c1030cd45619 HSI: Remove dev_err() usage after platform_get_irq())
> Merging leds/for-next (3881a72f8d06 leds: pca953x: Include the right header)
> Merging ipmi/for-next (340ff31ab00b ipmi_si: Only schedule continuously in the thread in maintenance mode)
> Merging driver-core/driver-core-next (5adf5781019d of/platform: Fix device_links_supplier_sync_state_resume() warning)
> Merging usb/usb-next (b6fd94883249 MAINTAINERS: mark wusbcore and UWB as obsolete)
> CONFLICT (content): Merge conflict in drivers/staging/Makefile
> CONFLICT (content): Merge conflict in drivers/staging/Kconfig
> Merging usb-gadget/next (b2357839c56a usb: renesas_usbhs: add a workaround for a race condition of workqueue)
> Merging usb-serial/usb-next (e21a712a9685 Linux 5.3-rc3)
> Merging usb-chipidea-next/ci-for-usb-next (034252e37b31 usb: chipidea: msm: Use devm_platform_ioremap_resource())
> Merging phy-next/next (609488bc979f Linux 5.3-rc2)
> Merging tty/tty-next (a4ba050dbc88 serial: 8250_dw: Use a unified new dev variable in remove)
> Merging char-misc/char-misc-next (f51cf9e23b70 misc: Remove spear13xx pcie gadget driver)
> Merging extcon/extcon-next (a3fc57233977 extcon: adc-jack: Remove dev_err() usage after platform_get_irq())
> Merging soundwire/next (15ed3ea2280e soundwire: bus: split handling of Device0 events)
> Merging thunderbolt/next (04f7745300ed thunderbolt: Show key using %*pE not %*pEp)
> Merging staging/staging-next (36d042bd6865 staging: rtl8192e: Make use kmemdup)
> Merging mux/for-next (05fb8284a417 Merge branch 'i2c-mux/for-next' into for-next)
> Merging icc/icc-next (83fdb2dfb0c2 interconnect: convert to DEFINE_SHOW_ATTRIBUTE)
> Merging slave-dma/next (ba1cab79cfc6 dmaengine: fsl-edma: implement .device_synchronize callback)
> Merging cgroup/for-next (653a23ca7e1e Use kvmalloc in cgroups-v1)
> Merging scsi/for-next (9f335c083095 Merge branch 'misc' into for-next)
> Merging scsi-mkp/for-next (6e0b7ca281d7 scsi: mpt3sas: Update driver version to 31.100.00.00)
> Merging vhost/linux-next (73f628ec9e6b vhost: disable metadata prefetch optimization)
> Merging rpmsg/for-next (7f1345e9efcc Merge branches 'hwspinlock-next', 'rpmsg-next' and 'rproc-next' into for-next)
> Merging gpio/for-next (6926e30f09db Merge branch 'devel' into for-next)
> Merging gpio-brgl/gpio/for-next (f4160faac98c gpio: pca953x: Drop %s for constant string literals)
> Merging pinctrl/for-next (b0f0e8f55fa8 Merge branch 'devel' into for-next)
> Merging pinctrl-samsung/for-next (10971e2ab6eb pinctrl: samsung: Fix device node refcount leaks in init code)
> Merging pwm/for-next (6cf9481b440d pwm: Fallback to the static lookup-list when acpi_pwm_get fails)
> Merging userns/for-next (318759b4737c signal/x86: Move tsk inside of CONFIG_MEMORY_FAILURE in do_sigbus)
> Merging ktest/for-next (aecea57f84b0 ktest: Fix some typos in config-bisect.pl)
> Merging random/dev (58be0106c530 random: fix soft lockup when trying to read from an uninitialized blocking pool)
> Merging kselftest/next (5f9e832c1370 Linus 5.3-rc1)
> Merging y2038/y2038 (a2318b6a16a8 riscv: Use latest system call ABI)
> CONFLICT (content): Merge conflict in arch/riscv/include/uapi/asm/unistd.h
> Merging livepatching/for-next (28f28ea4343a Merge branch 'for-5.3-core' into for-next)
> Merging coresight/next (a04d8683f577 coresight: etm4x: improve clarity of etm4_os_unlock comment)
> Merging rtc/rtc-next (06c8e550a84e rtc: s5m: convert to i2c_new_dummy_device)
> Merging nvdimm/libnvdimm-for-next (cb3110f7452d Merge branch 'for-5.3/dax' into libnvdimm-for-next)
> Merging at24/at24/for-next (10742fee98eb eeprom: at24: remove unneeded include)
> Merging ntb/ntb-next (5f9e832c1370 Linus 5.3-rc1)
> Merging kspp/for-next/kspp (60f2c82ed20b randstruct: Check member structs in is_pure_ops_struct())
> Merging cisco/for-next (9e98c678c2d6 Linux 5.1-rc1)
> Merging gnss/gnss-next (f2c7c76c5d0a Linux 5.2-rc3)
> Merging fsi/next (371975b0b075 fsi/core: Fix error paths on CFAM init)
> Merging siox/siox/next (1e4b044d2251 Linux 4.18-rc4)
> Merging slimbus/for-next (0a43bffb7e21 slimbus: fix slim_tid_txn())
> Merging nvmem/for-next (e018ed6ecebf nvmem: meson-mx-efuse: allow reading data smaller than word_size)
> Merging xarray/xarray (91abab83839a XArray: Fix xas_next() with a single entry at 0)
> Merging hyperv/hyperv-next (221f6df008ab hv_balloon: Reorganize the probe function)
> Merging auxdisplay/auxdisplay (f4bb1f895aa0 auxdisplay/ht16k33.c: Convert to use vm_map_pages_zero())
> Merging kgdb-dt/kgdb/for-next (ca976bfb3154 kdb: Fix bound check compiler warning)
> Merging pidfd/for-next (aed5a8df3dbb tests: add pidfd poll tests)
> Merging devfreq/for-next (27c17be8e488 PM / devfreq: tegra20: add COMMON_CLK dependency)
> Merging hmm/hmm (9c240a7bb337 mm/hmm: make HMM_MIRROR an implicit option)
> Merging fpga/for-next (7d62460b4060 MAINTAINERS: Move linux-fpga tree to new location)
> Merging akpm-current/current (c78d30d327b7 ipc/msg.c: consolidate all xxxctl_down() functions)
> CONFLICT (content): Merge conflict in arch/arm64/include/asm/processor.h
> $ git checkout -b akpm remotes/origin/akpm/master
> Applying: pinctrl: fix pxa2xx.c build warnings
> Applying: mm: treewide: clarify pgtable_page_{ctor,dtor}() naming
> Applying: drivers/tty/serial/sh-sci.c: suppress warning
> Applying: drivers/media/platform/sti/delta/delta-ipc.c: fix read buffer overflow
> Merging akpm/master (85617d74d23e drivers/media/platform/sti/delta/delta-ipc.c: fix read buffer overflow)

I got this error when trying to this tag for arm using this config [1]
and I got this error:

| /srv/oe/build/tmp-lkft-glibc/work-shared/am57xx-evm/kernel-source/arch/arm/mm/dma-mapping.c:2425:19:
error: redefinition of 'atomic_pool_init'
|  static int __init atomic_pool_init(void)
|                    ^~~~~~~~~~~~~~~~
| /srv/oe/build/tmp-lkft-glibc/work-shared/am57xx-evm/kernel-source/arch/arm/mm/dma-mapping.c:373:19:
note: previous definition of 'atomic_pool_init' was here
|  static int __init atomic_pool_init(void)
|                    ^~~~~~~~~~~~~~~~
| In file included from
/srv/oe/build/tmp-lkft-glibc/work-shared/am57xx-evm/kernel-source/include/linux/printk.h:6:0,
|                  from
/srv/oe/build/tmp-lkft-glibc/work-shared/am57xx-evm/kernel-source/include/linux/kernel.h:15,
|                  from
/srv/oe/build/tmp-lkft-glibc/work-shared/am57xx-evm/kernel-source/include/linux/list.h:9,
|                  from
/srv/oe/build/tmp-lkft-glibc/work-shared/am57xx-evm/kernel-source/include/linux/module.h:9,
|                  from
/srv/oe/build/tmp-lkft-glibc/work-shared/am57xx-evm/kernel-source/arch/arm/mm/dma-mapping.c:9:
| /srv/oe/build/tmp-lkft-glibc/work-shared/am57xx-evm/kernel-source/include/linux/init.h:196:20:
error: redefinition of '__initcall_atomic_pool_init2'
|   static initcall_t __initcall_##fn##id __used \
|                     ^
| /srv/oe/build/tmp-lkft-glibc/work-shared/am57xx-evm/kernel-source/include/linux/init.h:200:35:
note: in expansion of macro '___define_initcall'
|  #define __define_initcall(fn, id) ___define_initcall(fn, id, .initcall##id)
|                                    ^~~~~~~~~~~~~~~~~~
| /srv/oe/build/tmp-lkft-glibc/work-shared/am57xx-evm/kernel-source/include/linux/init.h:220:32:
note: in expansion of macro '__define_initcall'
|  #define postcore_initcall(fn)  __define_initcall(fn, 2)
|                                 ^~~~~~~~~~~~~~~~~
| /srv/oe/build/tmp-lkft-glibc/work-shared/am57xx-evm/kernel-source/arch/arm/mm/dma-mapping.c:2429:1:
note: in expansion of macro 'postcore_initcall'
|  postcore_initcall(atomic_pool_init);
|  ^~~~~~~~~~~~~~~~~
| /srv/oe/build/tmp-lkft-glibc/work-shared/am57xx-evm/kernel-source/include/linux/init.h:196:20:
note: previous definition of '__initcall_atomic_pool_init2' was here
|   static initcall_t __initcall_##fn##id __used \
|                     ^
| /srv/oe/build/tmp-lkft-glibc/work-shared/am57xx-evm/kernel-source/include/linux/init.h:200:35:
note: in expansion of macro '___define_initcall'
|  #define __define_initcall(fn, id) ___define_initcall(fn, id, .initcall##id)
|                                    ^~~~~~~~~~~~~~~~~~
| /srv/oe/build/tmp-lkft-glibc/work-shared/am57xx-evm/kernel-source/include/linux/init.h:220:32:
note: in expansion of macro '__define_initcall'
|  #define postcore_initcall(fn)  __define_initcall(fn, 2)
|                                 ^~~~~~~~~~~~~~~~~
| /srv/oe/build/tmp-lkft-glibc/work-shared/am57xx-evm/kernel-source/arch/arm/mm/dma-mapping.c:422:1:
note: in expansion of macro 'postcore_initcall'
|  postcore_initcall(atomic_pool_init);
|  ^~~~~~~~~~~~~~~~~
| /srv/oe/build/tmp-lkft-glibc/work-shared/am57xx-evm/kernel-source/scripts/Makefile.build:280:
recipe for target 'arch/arm/mm/dma-mapping.o' failed
| make[2]: *** [arch/arm/mm/dma-mapping.o] Error 1
| make[2]: *** Waiting for unfinished jobs....

I have CONFIG_SWIOTLB enabled and I reverted commit c8faf6c92ac5
("arm: initialize the dma-remap atomic pool for LPAE configs")

Cheers,
Anders
[1] http://people.linaro.org/~anders.roxell/arm-next-20190809.config
