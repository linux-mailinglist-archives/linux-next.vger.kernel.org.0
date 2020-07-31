Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EE562341A5
	for <lists+linux-next@lfdr.de>; Fri, 31 Jul 2020 10:56:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731967AbgGaI4Z (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 31 Jul 2020 04:56:25 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:50060 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730268AbgGaI4Z (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 31 Jul 2020 04:56:25 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 15A4E2E03E6C6E63C568;
        Fri, 31 Jul 2020 16:56:22 +0800 (CST)
Received: from [127.0.0.1] (10.67.76.251) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0; Fri, 31 Jul 2020
 16:56:17 +0800
Subject: Re: linux-next: Tree for Jul 30 [build failure on arm64]
To:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Christoph Hellwig <hch@lst.de>
CC:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        "Arnd Bergmann" <arnd@arndb.de>, <lkft-triage@lists.linaro.org>
References: <20200730214659.0fbfdfc4@canb.auug.org.au>
 <72b073ba-ee41-1a1c-ce6c-ffd8b5936b09@hisilicon.com>
 <20200731140842.46abe589@canb.auug.org.au>
 <CA+G9fYvykg9Ly=tRXLrf4hvd4siYKAt5eM0EMnwMgqVDHnbVYQ@mail.gmail.com>
From:   Shaokun Zhang <zhangshaokun@hisilicon.com>
Message-ID: <9b46f27a-2e5b-8519-31b6-01eaa9e1d822@hisilicon.com>
Date:   Fri, 31 Jul 2020 16:56:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <CA+G9fYvykg9Ly=tRXLrf4hvd4siYKAt5eM0EMnwMgqVDHnbVYQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.76.251]
X-CFilter-Loop: Reflected
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

在 2020/7/31 16:30, Naresh Kamboju 写道:
> On Fri, 31 Jul 2020 at 09:38, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> Hi all,
>>
>> On Fri, 31 Jul 2020 10:46:52 +0800 Shaokun Zhang <zhangshaokun@hisilicon.com> wrote:
>>>
>>> There's a build failure on arm64:
>>>
>>> In file included from ./include/linux/compat.h:17:0,
>>>                  from ./arch/arm64/include/asm/stat.h:13,
>>>                  from ./include/linux/stat.h:6,
>>>                  from ./include/linux/sysfs.h:22,
>>>                  from ./include/linux/kobject.h:20,
>>>                  from ./include/linux/of.h:17,
>>>                  from ./include/linux/irqdomain.h:35,
>>>                  from ./include/linux/acpi.h:13,
>>>                  from ./include/acpi/apei.h:9,
>>>                  from ./include/acpi/ghes.h:5,
>>>                  from ./include/linux/arm_sdei.h:8,
>>>                  from arch/arm64/kernel/asm-offsets.c:10:
>>> ./include/linux/fs.h: In function ‘vfs_whiteout’:
>>> ./include/linux/fs.h:1709:32: error: ‘S_IFCHR’ undeclared (first use in this function)
>>>   return vfs_mknod(dir, dentry, S_IFCHR | WHITEOUT_MODE, WHITEOUT_DEV);
>>>                                 ^
>>> ./include/linux/fs.h:1709:32: note: each undeclared identifier is reported only once for each
>>> function it appears in
>>> ./include/linux/fs.h: At top level:
>>> ./include/linux/fs.h:1855:46: warning: ‘struct kstat’ declared inside parameter list
>>>   int (*getattr) (const struct path *, struct kstat *, u32, unsigned int);
>>>                                               ^
>>> ./include/linux/fs.h:1855:46: warning: its scope is only this definition or declaration, which is
>>> probably not what you want
>>> ./include/linux/fs.h: In function ‘__mandatory_lock’:
>>> ./include/linux/fs.h:2325:25: error: ‘S_ISGID’ undeclared (first use in this function)
>>>   return (ino->i_mode & (S_ISGID | S_IXGRP)) == S_ISGID;
>>>                          ^
>>> ./include/linux/fs.h:2325:35: error: ‘S_IXGRP’ undeclared (first use in this function)
>>>   return (ino->i_mode & (S_ISGID | S_IXGRP)) == S_ISGID;
>>>                                    ^
>>> ./include/linux/fs.h: In function ‘invalidate_remote_inode’:
>>> ./include/linux/fs.h:2588:6: error: implicit declaration of function ‘S_ISREG’
>>> [-Werror=implicit-function-declaration]
>>>   if (S_ISREG(inode->i_mode) || S_ISDIR(inode->i_mode) ||
>>>       ^
>>> ./include/linux/fs.h:2588:32: error: implicit declaration of function ‘S_ISDIR’
>>> [-Werror=implicit-function-declaration]
>>>   if (S_ISREG(inode->i_mode) || S_ISDIR(inode->i_mode) ||
>>>                                 ^
>>> ./include/linux/fs.h:2589:6: error: implicit declaration of function ‘S_ISLNK’
>>> [-Werror=implicit-function-declaration]
>>>       S_ISLNK(inode->i_mode))
>>>       ^
>>> ./include/linux/fs.h: In function ‘execute_ok’:
>>> ./include/linux/fs.h:2768:26: error: ‘S_IXUGO’ undeclared (first use in this function)
>>>   return (inode->i_mode & S_IXUGO) || S_ISDIR(inode->i_mode);
>>
>> Presumably caused by commit
>>
>>   b902bfb3f0e9 ("arm64: stop using <asm/compat.h> directly")
> 
> I have reverted this commit
>   b902bfb3f0e9 ("arm64: stop using <asm/compat.h> directly")
> 
> and rebuilt arm64 failed due to below errors/warnings.
> 
> make -sk KBUILD_BUILD_USER=TuxBuild -C/linux -j16 ARCH=arm64
> CROSS_COMPILE=aarch64-linux-gnu- HOSTCC=gcc CC="sccache
> aarch64-linux-gnu-gcc" O=build Image
> #
> In file included from ../include/linux/stat.h:6,
>                  from ../include/linux/sysfs.h:22,
>                  from ../include/linux/kobject.h:20,
>                  from ../include/linux/of.h:17,
>                  from ../include/linux/irqdomain.h:35,
>                  from ../include/linux/acpi.h:13,
>                  from ../include/acpi/apei.h:9,
>                  from ../include/acpi/ghes.h:5,
>                  from ../include/linux/arm_sdei.h:8,
>                  from ../arch/arm64/kernel/asm-offsets.c:10:
> ../arch/arm64/include/asm/stat.h:20:2: error: unknown type name ‘compat_u64’
>    20 |  compat_u64 st_dev;
>       |  

0a3a4497a1de <"compat: lift compat_s64 and compat_u64 to <linux/compat.h>">
has removed the compat_s64 and compat_u64.

Thanks,
Shaokun

^~~~~~~~~~
> ../arch/arm64/include/asm/stat.h:31:2: error: unknown type name ‘compat_u64’
>    31 |  compat_u64 st_rdev;
>       |  ^~~~~~~~~~
> ../arch/arm64/include/asm/stat.h:34:2: error: unknown type name ‘compat_s64’
>    34 |  compat_s64 st_size;
>       |  ^~~~~~~~~~
> ../arch/arm64/include/asm/stat.h:36:2: error: unknown type name ‘compat_u64’
>    36 |  compat_u64 st_blocks; /* Number of 512-byte blocks allocated. */
>       |  ^~~~~~~~~~
> ../arch/arm64/include/asm/stat.h:47:2: error: unknown type name ‘compat_u64’
>    47 |  compat_u64 st_ino;
>       |  ^~~~~~~~~~
> make[2]: *** [../scripts/Makefile.build:114:
> arch/arm64/kernel/asm-offsets.s] Error 1
> 
> - Naresh
> 
> .
> 

