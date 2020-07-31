Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65115233D74
	for <lists+linux-next@lfdr.de>; Fri, 31 Jul 2020 04:46:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731184AbgGaCq6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 30 Jul 2020 22:46:58 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:54982 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731166AbgGaCq6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 30 Jul 2020 22:46:58 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 22E119063A47108A3EA6;
        Fri, 31 Jul 2020 10:46:56 +0800 (CST)
Received: from [127.0.0.1] (10.67.76.251) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.487.0; Fri, 31 Jul 2020
 10:46:52 +0800
Subject: Re: linux-next: Tree for Jul 30 [build failure on arm64]
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200730214659.0fbfdfc4@canb.auug.org.au>
From:   Shaokun Zhang <zhangshaokun@hisilicon.com>
Message-ID: <72b073ba-ee41-1a1c-ce6c-ffd8b5936b09@hisilicon.com>
Date:   Fri, 31 Jul 2020 10:46:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200730214659.0fbfdfc4@canb.auug.org.au>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.76.251]
X-CFilter-Loop: Reflected
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

There's a build failure on arm64:

In file included from ./include/linux/compat.h:17:0,
                 from ./arch/arm64/include/asm/stat.h:13,
                 from ./include/linux/stat.h:6,
                 from ./include/linux/sysfs.h:22,
                 from ./include/linux/kobject.h:20,
                 from ./include/linux/of.h:17,
                 from ./include/linux/irqdomain.h:35,
                 from ./include/linux/acpi.h:13,
                 from ./include/acpi/apei.h:9,
                 from ./include/acpi/ghes.h:5,
                 from ./include/linux/arm_sdei.h:8,
                 from arch/arm64/kernel/asm-offsets.c:10:
./include/linux/fs.h: In function ‘vfs_whiteout’:
./include/linux/fs.h:1709:32: error: ‘S_IFCHR’ undeclared (first use in this function)
  return vfs_mknod(dir, dentry, S_IFCHR | WHITEOUT_MODE, WHITEOUT_DEV);
                                ^
./include/linux/fs.h:1709:32: note: each undeclared identifier is reported only once for each
function it appears in
./include/linux/fs.h: At top level:
./include/linux/fs.h:1855:46: warning: ‘struct kstat’ declared inside parameter list
  int (*getattr) (const struct path *, struct kstat *, u32, unsigned int);
                                              ^
./include/linux/fs.h:1855:46: warning: its scope is only this definition or declaration, which is
probably not what you want
./include/linux/fs.h: In function ‘__mandatory_lock’:
./include/linux/fs.h:2325:25: error: ‘S_ISGID’ undeclared (first use in this function)
  return (ino->i_mode & (S_ISGID | S_IXGRP)) == S_ISGID;
                         ^
./include/linux/fs.h:2325:35: error: ‘S_IXGRP’ undeclared (first use in this function)
  return (ino->i_mode & (S_ISGID | S_IXGRP)) == S_ISGID;
                                   ^
./include/linux/fs.h: In function ‘invalidate_remote_inode’:
./include/linux/fs.h:2588:6: error: implicit declaration of function ‘S_ISREG’
[-Werror=implicit-function-declaration]
  if (S_ISREG(inode->i_mode) || S_ISDIR(inode->i_mode) ||
      ^
./include/linux/fs.h:2588:32: error: implicit declaration of function ‘S_ISDIR’
[-Werror=implicit-function-declaration]
  if (S_ISREG(inode->i_mode) || S_ISDIR(inode->i_mode) ||
                                ^
./include/linux/fs.h:2589:6: error: implicit declaration of function ‘S_ISLNK’
[-Werror=implicit-function-declaration]
      S_ISLNK(inode->i_mode))
      ^
./include/linux/fs.h: In function ‘execute_ok’:
./include/linux/fs.h:2768:26: error: ‘S_IXUGO’ undeclared (first use in this function)
  return (inode->i_mode & S_IXUGO) || S_ISDIR(inode->i_mode);

Thanks,
Shaokun

在 2020/7/30 19:46, Stephen Rothwell 写道:
> Hi all,
> 
> Changes since 20200729:
> 
> My fixes tree contains:
> 
>   dbf24e30ce2e ("device_cgroup: Fix RCU list debugging warning")
> 
> Linus' tree gained a build failure for which I revertd a commit.
> 
> The vfs tree lost its build failure.
> 
> The printk tree lost its build failure.
> 
> The net-next tree lost its build failure.
> 
> The security tree still had its build failure for which I reverted
> 3 commits.
> 
> The iommu tree gained a conflict against the dma-mapping tree.
> 
> The tip tree still had its build failure for which I reverted a
> commit.
> 
> The vhost tree lost its build failure but gained more for which I applied
> a patch.
> 
> The hmm tree gained conflicts against the drm and kvm-ppc trees.
> 
> Non-merge commits (relative to Linus' tree): 11751
>  12254 files changed, 603002 insertions(+), 226737 deletions(-)
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
> I am currently merging 328 trees (counting Linus' and 85 trees of bug
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

