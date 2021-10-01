Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF27D41F5FB
	for <lists+linux-next@lfdr.de>; Fri,  1 Oct 2021 21:58:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229492AbhJAT7p (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 1 Oct 2021 15:59:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231186AbhJAT7p (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 1 Oct 2021 15:59:45 -0400
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73722C06177F
        for <linux-next@vger.kernel.org>; Fri,  1 Oct 2021 12:58:00 -0700 (PDT)
Received: by mail-io1-xd2f.google.com with SMTP id i62so13005342ioa.6
        for <linux-next@vger.kernel.org>; Fri, 01 Oct 2021 12:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=s6pRFF/X8rzKRYzB08v21cTq+o2ffnNGgmWS4AC7+Xg=;
        b=hxBkz1LaiDsMz+JPw/3iMZLO7QG2xgZBZpo8J2ySjCsRtBKMs7d8JhpKpHsSRw1d3r
         zwjFbl56NkLEDbWYJveXejMjKcKlhDTUAi2s17bWrrhPzVghzS+PIeXrZVwCUh+xoqTt
         RmBKhiQxygIX/REqG29GMJdZaTOK6rmwKwQ4tDXzIAbsOBb83fQZafmoWwdWekzmQo22
         UVLUkZ/2Pcxxs19v+Zodx65lm8YciEGrxA7H5BIVT65rQ52TXa+7A4u+fZmLDbEHR8Tz
         /sIus1C3i5R2OH7QQSjmi7fnkVnld6F7x0WyrFLkBIrmCDbDDw1J9JEipBhjFtpjRsnh
         l+Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=s6pRFF/X8rzKRYzB08v21cTq+o2ffnNGgmWS4AC7+Xg=;
        b=MxIHcZwNmDQfX+kPZquKXHD7LuUU42MmI3cL6er5LWZDbLTuFx49mqEEeL9dFa733a
         K4foilAo3dkxCcOb2S+DnvP2EL1hJ6BbgG/5Cr4XBtMPtjLT1RJRPf+x56rhLkUZh6bP
         Ap/UuWc+hVCoLLuTgppP2JKae7yzbr5EjwPiZLP4HPMFWk8PHo5LZyWU0/DGzDOLm2Be
         LuDIse4wIqVuiZX8/keanqTviA7UoE5oSvw8Dj3jFmiln4B9wgce8EG99CeAmvaa8OgX
         cXQ/w2aNjILBHPJPdnBzbFN0+LBpGbwggHHPz4W7Q7ZAP0CJo56fFIL/lq+Xg48cOXHD
         d4rg==
X-Gm-Message-State: AOAM5316EA53jKaG3W9OFdjDQye8sHaxIy3Qn8AYWp9QLf7NlSFyCIXR
        xJITPR7sEfdWe/rQKbx9tnG7QZCJmmUq5g==
X-Google-Smtp-Source: ABdhPJyJnfMffDAo6OzdHBoErcW15s034VdkP0Asp1YuINROuGgHNXlevHd2e3Rdyv6qRTvnwOw4PQ==
X-Received: by 2002:a5d:9d15:: with SMTP id j21mr9589505ioj.121.1633118279526;
        Fri, 01 Oct 2021 12:57:59 -0700 (PDT)
Received: from [192.168.1.116] ([66.219.217.159])
        by smtp.gmail.com with ESMTPSA id z6sm4329725iox.28.2021.10.01.12.57.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Oct 2021 12:57:59 -0700 (PDT)
Subject: Re: swim3.c:1200:38: error: 'FLOPPY_MAJOR' undeclared (first use in
 this function)
To:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-block <linux-block@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        lkft-triage@lists.linaro.org
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>
References: <CA+G9fYsKjyOL1xj+GFC=Ab7Yw+b0Tg9jf8uvnN2tOc6OdupA-Q@mail.gmail.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <250970e7-e430-e8fe-2844-5c7f627b0c26@kernel.dk>
Date:   Fri, 1 Oct 2021 13:57:52 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CA+G9fYsKjyOL1xj+GFC=Ab7Yw+b0Tg9jf8uvnN2tOc6OdupA-Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10/1/21 4:49 AM, Naresh Kamboju wrote:
> Following build errors noticed while building Linux next 20211001
> with gcc-11 for powerpc architecture.
> 
> kernel/sched/debug.c: In function 'print_cfs_group_stats':
> kernel/sched/debug.c:460:41: warning: unused variable 'stats'
> [-Wunused-variable]
>   460 |                struct sched_statistics *stats =
> __schedstats_from_se(se);
>       |                                         ^~~~~
> In file included from include/linux/blkdev.h:6,
>                  from include/linux/blk-mq.h:5,
>                  from drivers/block/swim3.c:24:
> drivers/block/swim3.c: In function 'swim3_attach':
> drivers/block/swim3.c:1200:38: error: 'FLOPPY_MAJOR' undeclared (first
> use in this function)
>  1200 |                 rc = register_blkdev(FLOPPY_MAJOR, "fd");
>       |                                      ^~~~~~~~~~~~
> include/linux/genhd.h:276:27: note: in definition of macro 'register_blkdev'
>   276 |         __register_blkdev(major, name, NULL)
>       |                           ^~~~~
> drivers/block/swim3.c:1200:38: note: each undeclared identifier is
> reported only once for each function it appears in
>  1200 |                 rc = register_blkdev(FLOPPY_MAJOR, "fd");
>       |                                      ^~~~~~~~~~~~
> include/linux/genhd.h:276:27: note: in definition of macro 'register_blkdev'
>   276 |         __register_blkdev(major, name, NULL)
>       |                           ^~~~~
> make[3]: *** [scripts/Makefile.build:288: drivers/block/swim3.o] Error 1
> make[3]: Target '__build' not remade because of errors.
> make[2]: *** [scripts/Makefile.build:571: drivers/block] Error 2
> make[2]: Target '__build' not remade because of errors.
> make[1]: *** [Makefile:2034: drivers] Error 2
> 
> Build config:
> https://builds.tuxbuild.com/1ytcB62L9I617oV0cveJtUhcpUu/config
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> meta data:
> -----------
>     git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
>     git_sha: a25006a77348ba06c7bc96520d331cd9dd370715
>     git_short_log: a25006a77348 (\"Add linux-next specific files for 20211001\")
>     kconfig:  ppc6xx_defconfig
>     kernel_version: 5.15.0-rc3
>     target_arch: powerpc
>     toolchain: gcc-11
> 
> steps to reproduce:
> https://builds.tuxbuild.com/1ytcB62L9I617oV0cveJtUhcpUu/tuxmake_reproducer.sh

Does this fix it?


diff --git a/drivers/block/swim3.c b/drivers/block/swim3.c
index f7e3482e846b..4b91c9aa5892 100644
--- a/drivers/block/swim3.c
+++ b/drivers/block/swim3.c
@@ -27,6 +27,7 @@
 #include <linux/module.h>
 #include <linux/spinlock.h>
 #include <linux/wait.h>
+#include <linux/major.h>
 #include <asm/io.h>
 #include <asm/dbdma.h>
 #include <asm/prom.h>

-- 
Jens Axboe

