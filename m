Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A54041F902
	for <lists+linux-next@lfdr.de>; Sat,  2 Oct 2021 03:12:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232242AbhJBBOG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 1 Oct 2021 21:14:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231873AbhJBBOG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 1 Oct 2021 21:14:06 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3999AC061775;
        Fri,  1 Oct 2021 18:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=CA4RSoJs1M1MAz2mW+djAvJhr59wtG/s5cpWDlcvFvs=; b=xdR1Ji6i+2om4p73bLk15Zxu+w
        3WAjbNJprIrWH+iZX/vpRQhuxSF5peJatneCC59upuV3ZU33DjnyLKFxUBv+pQ+5wegaguzV738ww
        lfyN/JMlvGDHLrprMfxP/7EHHBiE0RaNMDC/jJLMOMEf5HIfKWXYiYVbmi6upgqj0XRxg4zW/eF2D
        13DZzD8wOO4vELkfgt18WbPuiWzQEJ/JVOwPS2NCmL1VyVnjDOQFJJtrdIIxuN9v60pI3/MUABznM
        CWdKDQ/8jj3dto6zaIzg8N5vcsEuFdiRrgrw5M1mEqZRPaxJxAosEbKwwfDNj2oLlEzDAF3txkuyt
        2KtlNBkw==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mWTZa-001gHr-8C; Sat, 02 Oct 2021 01:12:18 +0000
Subject: Re: swim3.c:1200:38: error: 'FLOPPY_MAJOR' undeclared (first use in
 this function)
To:     Jens Axboe <axboe@kernel.dk>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-block <linux-block@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        lkft-triage@lists.linaro.org
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>
References: <CA+G9fYsKjyOL1xj+GFC=Ab7Yw+b0Tg9jf8uvnN2tOc6OdupA-Q@mail.gmail.com>
 <250970e7-e430-e8fe-2844-5c7f627b0c26@kernel.dk>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <b2ed59e2-aed1-1a46-bb99-b7495de0dea7@infradead.org>
Date:   Fri, 1 Oct 2021 18:12:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <250970e7-e430-e8fe-2844-5c7f627b0c26@kernel.dk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10/1/21 12:57 PM, Jens Axboe wrote:
> On 10/1/21 4:49 AM, Naresh Kamboju wrote:
>> Following build errors noticed while building Linux next 20211001
>> with gcc-11 for powerpc architecture.
>>
>> kernel/sched/debug.c: In function 'print_cfs_group_stats':
>> kernel/sched/debug.c:460:41: warning: unused variable 'stats'
>> [-Wunused-variable]
>>    460 |                struct sched_statistics *stats =
>> __schedstats_from_se(se);
>>        |                                         ^~~~~
>> In file included from include/linux/blkdev.h:6,
>>                   from include/linux/blk-mq.h:5,
>>                   from drivers/block/swim3.c:24:
>> drivers/block/swim3.c: In function 'swim3_attach':
>> drivers/block/swim3.c:1200:38: error: 'FLOPPY_MAJOR' undeclared (first
>> use in this function)
>>   1200 |                 rc = register_blkdev(FLOPPY_MAJOR, "fd");
>>        |                                      ^~~~~~~~~~~~
>> include/linux/genhd.h:276:27: note: in definition of macro 'register_blkdev'
>>    276 |         __register_blkdev(major, name, NULL)
>>        |                           ^~~~~
>> drivers/block/swim3.c:1200:38: note: each undeclared identifier is
>> reported only once for each function it appears in
>>   1200 |                 rc = register_blkdev(FLOPPY_MAJOR, "fd");
>>        |                                      ^~~~~~~~~~~~
>> include/linux/genhd.h:276:27: note: in definition of macro 'register_blkdev'
>>    276 |         __register_blkdev(major, name, NULL)
>>        |                           ^~~~~
>> make[3]: *** [scripts/Makefile.build:288: drivers/block/swim3.o] Error 1
>> make[3]: Target '__build' not remade because of errors.
>> make[2]: *** [scripts/Makefile.build:571: drivers/block] Error 2
>> make[2]: Target '__build' not remade because of errors.
>> make[1]: *** [Makefile:2034: drivers] Error 2
>>
>> Build config:
>> https://builds.tuxbuild.com/1ytcB62L9I617oV0cveJtUhcpUu/config
>>
>> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>>
>> meta data:
>> -----------
>>      git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
>>      git_sha: a25006a77348ba06c7bc96520d331cd9dd370715
>>      git_short_log: a25006a77348 (\"Add linux-next specific files for 20211001\")
>>      kconfig:  ppc6xx_defconfig
>>      kernel_version: 5.15.0-rc3
>>      target_arch: powerpc
>>      toolchain: gcc-11
>>
>> steps to reproduce:
>> https://builds.tuxbuild.com/1ytcB62L9I617oV0cveJtUhcpUu/tuxmake_reproducer.sh
> 
> Does this fix it?

Yes, WorksForMe.

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Thanks.

> 
> diff --git a/drivers/block/swim3.c b/drivers/block/swim3.c
> index f7e3482e846b..4b91c9aa5892 100644
> --- a/drivers/block/swim3.c
> +++ b/drivers/block/swim3.c
> @@ -27,6 +27,7 @@
>   #include <linux/module.h>
>   #include <linux/spinlock.h>
>   #include <linux/wait.h>
> +#include <linux/major.h>
>   #include <asm/io.h>
>   #include <asm/dbdma.h>
>   #include <asm/prom.h>
> 


-- 
~Randy
