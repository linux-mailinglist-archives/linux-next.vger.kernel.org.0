Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2ECCA2D43E8
	for <lists+linux-next@lfdr.de>; Wed,  9 Dec 2020 15:08:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732884AbgLIOGd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Dec 2020 09:06:33 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2234 "EHLO
        frasgout.his.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729353AbgLIOGX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 9 Dec 2020 09:06:23 -0500
Received: from fraeml736-chm.china.huawei.com (unknown [172.18.147.201])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Crdzg3h15z67MD1;
        Wed,  9 Dec 2020 22:02:55 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml736-chm.china.huawei.com (10.206.15.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 9 Dec 2020 15:05:32 +0100
Received: from [10.210.171.175] (10.210.171.175) by
 lhreml724-chm.china.huawei.com (10.201.108.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 9 Dec 2020 14:05:31 +0000
Subject: Re: linux-next: Tree for Dec 9
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20201209214447.3bfdeb87@canb.auug.org.au>
From:   John Garry <john.garry@huawei.com>
Message-ID: <d6aab80c-c5e3-77cf-bb16-378b7de63f4e@huawei.com>
Date:   Wed, 9 Dec 2020 14:04:56 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20201209214447.3bfdeb87@canb.auug.org.au>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.210.171.175]
X-ClientProxiedBy: lhreml738-chm.china.huawei.com (10.201.108.188) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 09/12/2020 10:44, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20201208:

Just seeing this today:

john@localhost:~/linux-next> git checkout next-20201209
Previous HEAD position was bfd521e1af51 Add linux-next specific files 
for 20201203
HEAD is now at 2f1d5c77f13f Add linux-next specific files for 20201209
john@localhost:~/linux-next> make defconfig
*** Default configuration is based on 'defconfig'
/usr/bin/env: invalid option -- 'S'
Try '/usr/bin/env --help' for more information.
init/Kconfig:39: syntax error
init/Kconfig:38: invalid statement
make[1]: *** [scripts/kconfig/Makefile:81: defconfig] Error 1
make: *** [Makefile:602: defconfig] Error 2
john@localhost:~/linux-next>

next-20201203 was fine.

john@localhost:~/linux-next> git checkout next-20201203
Updating files: 100% (9420/9420), done.
Previous HEAD position was c062db039f40 iommu/vt-d: Update domain 
geometry in iommu_ops.at(de)tach_dev
HEAD is now at bfd521e1af51 Add linux-next specific files for 20201203
john@localhost:~/linux-next> git checkout next-20201203^C
john@localhost:~/linux-next> make defconfig
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/kconfig/conf.o
  HOSTCC  scripts/kconfig/confdata.o
  HOSTCC  scripts/kconfig/expr.o
  LEX     scripts/kconfig/lexer.lex.c
  YACC    scripts/kconfig/parser.tab.[ch]
  HOSTCC  scripts/kconfig/lexer.lex.o
  HOSTCC  scripts/kconfig/parser.tab.o
  HOSTCC  scripts/kconfig/preprocess.o
  HOSTCC  scripts/kconfig/symbol.o
  HOSTCC  scripts/kconfig/util.o
  HOSTLD  scripts/kconfig/conf
*** Default configuration is based on 'defconfig'
#
# configuration written to .config
#

Known issue? I did do a fetch and checkout.

Thanks,
John

> 
> The pm tree gained a build failure when building htmldocs.
> 
> The wireless-drivers-next tree lost its build failure.
> 
> The nand tree still had its build failure so I used the version from
> next-20201207.
> 
> The drm tree gained a semantic conflict against the drm-intel-fixes tree.
> 
> The scsi-mkp tree still had its build failure for which I applied a patch.
> 
> Non-merge commits (relative to Linus' tree): 11114
>   10115 files changed, 753493 insertions(+), 186283 deletions(-)
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
> I am currently merging 327 trees (counting Linus' and 85 trees of bug
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

