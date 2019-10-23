Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75B62E11E6
	for <lists+linux-next@lfdr.de>; Wed, 23 Oct 2019 08:05:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725947AbfJWGFL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 23 Oct 2019 02:05:11 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:4746 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725796AbfJWGFL (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 23 Oct 2019 02:05:11 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id BDD0B32C85F897EA2BE4;
        Wed, 23 Oct 2019 14:05:07 +0800 (CST)
Received: from [127.0.0.1] (10.74.221.148) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.439.0; Wed, 23 Oct 2019
 14:05:04 +0800
Subject: Re: linux-next: Tree for Oct 23
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20191023155519.2d6765d4@canb.auug.org.au>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mark Salyzyn <salyzyn@android.com>
From:   Shaokun Zhang <zhangshaokun@hisilicon.com>
Message-ID: <d1a57062-24cb-e9c4-e1db-07406b1cea9a@hisilicon.com>
Date:   Wed, 23 Oct 2019 14:05:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <20191023155519.2d6765d4@canb.auug.org.au>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.74.221.148]
X-CFilter-Loop: Reflected
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

+Cc: Mark Salyzyn

There is a compiler failure on arm64 platform, as follow:
zhangshaokun@ubuntu:~/linux-next$ make -j64
  CALL    scripts/atomic/check-atomics.sh
  CC      arch/arm64/kernel/asm-offsets.s
In file included from ./include/linux/sysctl.h:30:0,
                 from ./include/linux/umh.h:9,
                 from ./include/linux/kmod.h:9,
                 from ./include/linux/module.h:13,
                 from ./include/linux/acpi.h:29,
                 from ./include/acpi/apei.h:9,
                 from ./include/acpi/ghes.h:5,
                 from ./include/linux/arm_sdei.h:8,
                 from arch/arm64/kernel/asm-offsets.c:10:
./include/uapi/linux/sysctl.h:561:29: error: expected ‘,’ or ‘}’ before ‘__attribute__’
  NET_IPV6_TEMP_PREFERED_LFT __attribute__((deprecated)) = /* NOTYPO */
                             ^
scripts/Makefile.build:99: recipe for target 'arch/arm64/kernel/asm-offsets.s' failed
make[1]: *** [arch/arm64/kernel/asm-offsets.s] Error 1
Makefile:1108: recipe for target 'prepare0' failed
make: *** [prepare0] Error 2

It's the commit <79f0cf35dccb> ("treewide: cleanup: replace prefered with preferred").

Thanks,
Shaokun


On 2019/10/23 12:55, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20191022:
> 
> Non-merge commits (relative to Linus' tree): 5530
>  5340 files changed, 192671 insertions(+), 90844 deletions(-)
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
> I am currently merging 310 trees (counting Linus' and 78 trees of bug
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

