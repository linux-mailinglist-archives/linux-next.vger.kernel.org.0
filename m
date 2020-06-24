Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A6E2206FBA
	for <lists+linux-next@lfdr.de>; Wed, 24 Jun 2020 11:09:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387704AbgFXJJE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 24 Jun 2020 05:09:04 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:58040 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387970AbgFXJJD (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 24 Jun 2020 05:09:03 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 2A210F29391C60BDD3BD;
        Wed, 24 Jun 2020 17:09:00 +0800 (CST)
Received: from [127.0.0.1] (10.67.76.251) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0; Wed, 24 Jun 2020
 17:08:55 +0800
Subject: Re: linux-next: Tree for Jun 24 [build failure on arm64]
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Will Deacon <will@kernel.org>
References: <20200624165323.3dffcde5@canb.auug.org.au>
From:   Shaokun Zhang <zhangshaokun@hisilicon.com>
Message-ID: <7a7e31a8-9a7b-2428-ad83-2264f20bdc2d@hisilicon.com>
Date:   Wed, 24 Jun 2020 17:08:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200624165323.3dffcde5@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.76.251]
X-CFilter-Loop: Reflected
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

+Will Deacon,

Hi Will,

There's a build failure on arm64:

  CALL    scripts/atomic/check-atomics.sh
  CALL    scripts/checksyscalls.sh
  LD      arch/arm64/kernel/vdso/vdso.so.dbg
ld: unrecognized option '--no-eh-frame-hdr'
ld: use the --help option for usage information
arch/arm64/kernel/vdso/Makefile:64: recipe for target
'arch/arm64/kernel/vdso/vdso.so.dbg' failed
make[1]: *** [arch/arm64/kernel/vdso/vdso.so.dbg] Error 1
arch/arm64/Makefile:175: recipe for target 'vdso_prepare' failed
make: *** [vdso_prepare] Error 2

GCC version is followed:
gcc (Ubuntu/Linaro 5.4.0-6ubuntu1~16.04.12) 5.4.0 20160609

It seems caused by
87676cfca141 arm64: vdso: Disable dwarf unwinding through the sigreturn
trampoline

Thanks,
Shaokun

在 2020/6/24 14:53, Stephen Rothwell 写道:
> Hi all,
> 
> Changes since 20200623:
> 
> Renamed trees:	slave-dma{,-fixes} -> dmaengine{,-fixes}
> 
> My fixes tree contains:
> 
>   466d58f824f1 ("device_cgroup: Fix RCU list debugging warning")
>   9bd7b7c45d71 ("sched: Fix RANDSTRUCT build fail")
>   2f437faecf71 ("powerpc/boot/dts: Fix dtc "pciex" warnings")
> 
> The printk tree lost its build failure.
> 
> The hid tree still had its build failure so I used the version from
> next-20200618.
> 
> The amdgpu tree lost its build failure.
> 
> The tip tree still had one build failure for which I reverted a commit.
> 
> The rcu tree gained a conflict against the tip tree.
> 
> Non-merge commits (relative to Linus' tree): 3015
>  3371 files changed, 258238 insertions(+), 58359 deletions(-)
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
> and sparc64 defconfig and htmldocs. And finally, a simple boot test
> of the powerpc pseries_le_defconfig kernel in qemu (with and without
> kvm enabled).
> 
> Below is a summary of the state of the merge.
> 
> I am currently merging 321 trees (counting Linus' and 82 trees of bug
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

