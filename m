Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4ADCC41F923
	for <lists+linux-next@lfdr.de>; Sat,  2 Oct 2021 03:26:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232108AbhJBB1q (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 1 Oct 2021 21:27:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231907AbhJBB1q (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 1 Oct 2021 21:27:46 -0400
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E887C061775
        for <linux-next@vger.kernel.org>; Fri,  1 Oct 2021 18:26:01 -0700 (PDT)
Received: by mail-io1-xd2f.google.com with SMTP id d18so13636527iof.13
        for <linux-next@vger.kernel.org>; Fri, 01 Oct 2021 18:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Kw2EQT4OwtFSYkrrYyMi89jNPuGjX5Pm5VnDT6BIPTo=;
        b=iftskyZrQnblM5IeQbZ6UuCPH+aCmDe7PMu732bOeM5q5vFBs4rD1xSeoLwVhqWtX8
         k6pib6gKKEO48cWsGpsqj44TyyFTbWtM4UOOK1M0Mwb2+y8LSffdgLB2dkpgCYnH2lF6
         VKHwUUjHXZovjI5uvRXKc7MH7WwGVdt/heIO1yyMxzro85Ds0uMAp0Rw080U9t+0yuB8
         K8+eDRvxuy1meShdi+fhOF8kfL3jAh6CjylbAJEpLTi8oPyEWQeo3a8KYpUVmjfKR0fk
         9AyhQHj8klR7aV+CYyrPoFM6/JihOh2vHlhwZi/R3DOtPu27vI8gDw93dsX4IZ+vM4mz
         JWMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Kw2EQT4OwtFSYkrrYyMi89jNPuGjX5Pm5VnDT6BIPTo=;
        b=vPEirCfYqQrujaKqj0malKvr7/f/vFrFhZHKp4FZfjPXAqsOVb23ccc2KIHpxfkNOt
         N3g2gV0KXmky3UnAI4HzP/717JyjTUeWoxvUdLEbYC9ZgJraJc6tyb5jx/n0DBi2ma1D
         ahOvo83GFJH3UtpFpSjTxPTxGpDuJXbVViFVdJ+5YiNX85pMTaex2x8QnoOgijEN49u5
         T0zWxn/FTcpEXm4T86LZwcCbxzMB8PwCMMBVjGKdT4Z3fpyJ7zpwn8wgm/Mtj+42P4Mw
         9I0y0OxSsqsZQ4XYP31A0PRSCGPad9mri4Bzh57sYVXJApsq28RXFE/9N3fYoUDAnubg
         i58g==
X-Gm-Message-State: AOAM530mHn2fBjyMKY/FkIAoq8Cs69U4ZBITgFW7lYIVEKjnFqf2C5Yi
        vXtjiFCLkWO9WNiKOMUK1JsUR6EBqYzVjQ==
X-Google-Smtp-Source: ABdhPJwoqXKAX+NayArtKBl7Z/qDro3Fo4FiXW4w323FcZM2bZd0Jeg5aYb9qMoOBQdl0k+EZUJVpA==
X-Received: by 2002:a05:6638:25cd:: with SMTP id u13mr890296jat.114.1633137960552;
        Fri, 01 Oct 2021 18:26:00 -0700 (PDT)
Received: from [192.168.1.116] ([66.219.217.159])
        by smtp.gmail.com with ESMTPSA id u18sm4468860ilj.24.2021.10.01.18.25.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Oct 2021 18:26:00 -0700 (PDT)
Subject: Re: swim3.c:1200:38: error: 'FLOPPY_MAJOR' undeclared (first use in
 this function)
To:     Randy Dunlap <rdunlap@infradead.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-block <linux-block@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        lkft-triage@lists.linaro.org
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>
References: <CA+G9fYsKjyOL1xj+GFC=Ab7Yw+b0Tg9jf8uvnN2tOc6OdupA-Q@mail.gmail.com>
 <250970e7-e430-e8fe-2844-5c7f627b0c26@kernel.dk>
 <b2ed59e2-aed1-1a46-bb99-b7495de0dea7@infradead.org>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <d8d446be-97da-1ea2-56ea-6f2c74b85273@kernel.dk>
Date:   Fri, 1 Oct 2021 19:25:59 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b2ed59e2-aed1-1a46-bb99-b7495de0dea7@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10/1/21 7:12 PM, Randy Dunlap wrote:
> On 10/1/21 12:57 PM, Jens Axboe wrote:
>> On 10/1/21 4:49 AM, Naresh Kamboju wrote:
>>> Following build errors noticed while building Linux next 20211001
>>> with gcc-11 for powerpc architecture.
>>>
>>> kernel/sched/debug.c: In function 'print_cfs_group_stats':
>>> kernel/sched/debug.c:460:41: warning: unused variable 'stats'
>>> [-Wunused-variable]
>>>    460 |                struct sched_statistics *stats =
>>> __schedstats_from_se(se);
>>>        |                                         ^~~~~
>>> In file included from include/linux/blkdev.h:6,
>>>                   from include/linux/blk-mq.h:5,
>>>                   from drivers/block/swim3.c:24:
>>> drivers/block/swim3.c: In function 'swim3_attach':
>>> drivers/block/swim3.c:1200:38: error: 'FLOPPY_MAJOR' undeclared (first
>>> use in this function)
>>>   1200 |                 rc = register_blkdev(FLOPPY_MAJOR, "fd");
>>>        |                                      ^~~~~~~~~~~~
>>> include/linux/genhd.h:276:27: note: in definition of macro 'register_blkdev'
>>>    276 |         __register_blkdev(major, name, NULL)
>>>        |                           ^~~~~
>>> drivers/block/swim3.c:1200:38: note: each undeclared identifier is
>>> reported only once for each function it appears in
>>>   1200 |                 rc = register_blkdev(FLOPPY_MAJOR, "fd");
>>>        |                                      ^~~~~~~~~~~~
>>> include/linux/genhd.h:276:27: note: in definition of macro 'register_blkdev'
>>>    276 |         __register_blkdev(major, name, NULL)
>>>        |                           ^~~~~
>>> make[3]: *** [scripts/Makefile.build:288: drivers/block/swim3.o] Error 1
>>> make[3]: Target '__build' not remade because of errors.
>>> make[2]: *** [scripts/Makefile.build:571: drivers/block] Error 2
>>> make[2]: Target '__build' not remade because of errors.
>>> make[1]: *** [Makefile:2034: drivers] Error 2
>>>
>>> Build config:
>>> https://builds.tuxbuild.com/1ytcB62L9I617oV0cveJtUhcpUu/config
>>>
>>> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>>>
>>> meta data:
>>> -----------
>>>      git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
>>>      git_sha: a25006a77348ba06c7bc96520d331cd9dd370715
>>>      git_short_log: a25006a77348 (\"Add linux-next specific files for 20211001\")
>>>      kconfig:  ppc6xx_defconfig
>>>      kernel_version: 5.15.0-rc3
>>>      target_arch: powerpc
>>>      toolchain: gcc-11
>>>
>>> steps to reproduce:
>>> https://builds.tuxbuild.com/1ytcB62L9I617oV0cveJtUhcpUu/tuxmake_reproducer.sh
>>
>> Does this fix it?
> 
> Yes, WorksForMe.
> 
> Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Thanks, now added to my for-next branch.

-- 
Jens Axboe

