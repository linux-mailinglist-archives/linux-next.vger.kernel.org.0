Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E3A43A9B39
	for <lists+linux-next@lfdr.de>; Wed, 16 Jun 2021 14:55:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232890AbhFPM5d (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 16 Jun 2021 08:57:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232827AbhFPM5c (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 16 Jun 2021 08:57:32 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECDF6C061574
        for <linux-next@vger.kernel.org>; Wed, 16 Jun 2021 05:55:25 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id h24-20020a9d64180000b029036edcf8f9a6so2365247otl.3
        for <linux-next@vger.kernel.org>; Wed, 16 Jun 2021 05:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PgLISmcrZ4XM/HOFb1fJH8XxUGoU+n7XQHgYaHGSqys=;
        b=ZKSiaKe16ivMGnUkPtYNXHZsEj2iL5FH7PfcadHkyV0ZaDhcB45PIHklFleKHjjoxa
         AXKQbIMY2oXU3A4j61l5TSYYyxZ0U0KARAcYvXNqrOtOYm8WZ2nykTU5JdyL90UZH9V4
         Z8d2nPLY/qVCdg62pc9IEr6l0JA8C8rlviN1v0p5kuIiOK8GHqAN7+B+KWOlx2PjSJTd
         EEimTm1Op1//H1N03froTpFkDSxo8rlcENWAF1T0P3pspMFpxuwFMMzunvoXhS3Ubm1H
         jn8Qho2gs6B+Qw9zn7KqYjwqAdYpn4Md3Od4d/P34p9D59VBCT8SuqWoN69NZ1uBrTRY
         Yn4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PgLISmcrZ4XM/HOFb1fJH8XxUGoU+n7XQHgYaHGSqys=;
        b=ijZhtVcsSyu+F9w6HUzLj13BWjMLhTb2kFT8NGJqJz5vXFTdRrBf92dVs9BfVyO2rn
         8UPnOHB1pJQT90f57r5WJ5YNp0uD73KKlMjW+DZbMBCkLB4dpuQuo6RbJnHYM7ckKcxw
         l0sH4eoP5dPYO+3EkWyck/DzuX2kMoQKRQXxMZ3OsruAJDFg2LfwU4M3k3Hw1u0jx9f2
         hhLuZuPgLWQsG7nhNo3Ybqfz/sabDS4ERWdV6k8Qih3eOgCiel1GsHpKYO6wuJ7o6Hzp
         B49smLSAzPmT4AlVBB7aMUhDTx0gruU4Dmx4obmQ1KL4ZBuNIBRmq9Koavv/3gE2q/Gd
         2d+w==
X-Gm-Message-State: AOAM530siuC2tto5HCaoHMkwLcicr5/f1gBaom3NCGYGH4qC+PM3vz4+
        FTKSCvrruB7M5fInLlHIOEeNnQ==
X-Google-Smtp-Source: ABdhPJwlJqfUC8TYFQy3FQWg8dl+UQEjY6y+2Pk638TwMuM0H39Ad/v0RUhCZd9JSSrCr3CdInG3yg==
X-Received: by 2002:a05:6830:18c2:: with SMTP id v2mr3859219ote.153.1623848125288;
        Wed, 16 Jun 2021 05:55:25 -0700 (PDT)
Received: from [192.168.1.134] ([198.8.77.61])
        by smtp.gmail.com with ESMTPSA id c205sm412111oib.20.2021.06.16.05.55.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jun 2021 05:55:24 -0700 (PDT)
Subject: Re: [next] [arm64] Unable to handle kernel NULL pointer dereference
 at virtual address 0000000000000068
To:     Andrew Morton <akpm@linux-foundation.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        Will Deacon <will@kernel.org>, lkft-triage@lists.linaro.org,
        regressions@lists.linux.dev,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>,
        Ard Biesheuvel <ardb@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
References: <CA+G9fYurEcTfV7Z=co2Ki-TubF4d-Ext7ivZPaQT9SR5XazUtQ@mail.gmail.com>
 <20210615162641.be9d7a676df5885394713d25@linux-foundation.org>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <957d58f1-a99c-42ed-b508-086e8141285d@kernel.dk>
Date:   Wed, 16 Jun 2021 06:55:22 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210615162641.be9d7a676df5885394713d25@linux-foundation.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 6/15/21 5:26 PM, Andrew Morton wrote:
> (cc Jens)
> 
> On Tue, 15 Jun 2021 16:49:50 +0530 Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> 
>> Following kernel crash reported while booting linux next 20210615 tag
>> on qemu_arm64.
>>
>> Crash log:
>> -------------
>> [    0.767379] Unable to handle kernel NULL pointer dereference at
>> virtual address 0000000000000068
>> [    0.769815] Mem abort info:
>> [    0.770735]   ESR = 0x96000004
>> [    0.771598]   EC = 0x25: DABT (current EL), IL = 32 bits
>> [    0.773008]   SET = 0, FnV = 0
>> [    0.773865]   EA = 0, S1PTW = 0
>> [    0.774844]   FSC = 0x04: level 0 translation fault
>> [    0.776195] Data abort info:
>> [    0.776968]   ISV = 0, ISS = 0x00000004
>> [    0.778010]   CM = 0, WnR = 0
>> [    0.778961] [0000000000000068] user address but active_mm is swapper
>> [    0.780643] Internal error: Oops: 96000004 [#1] PREEMPT SMP
>> [    0.782189] Modules linked in:
>> [    0.783098] CPU: 2 PID: 1 Comm: swapper/0 Not tainted
>> 5.13.0-rc6-next-20210615 #1
>> [    0.785239] Hardware name: linux,dummy-virt (DT)
>> [    0.786626] pstate: 00000005 (nzcv daif -PAN -UAO -TCO BTYPE=--)
>> [    0.788352] pc : blk_finish_plug+0x88/0x270
>> [    0.789598] lr : blk_queue_write_cache+0x34/0x80
>> [    0.790997] sp : ffff800012aeb9d0
>> [    0.791981] x29: ffff800012aeb9d0 x28: ffff0000c088eeb0 x27: ffff800011a27110
>> [    0.794067] x26: ffff0000c18511a0 x25: ffff8000114ecaa8 x24: 0000000005a00000
>> [    0.796127] x23: ffff8000114ed3c8 x22: 0000000000000000 x21: ffff0000c088fa00
>> [    0.798208] x20: 0000000000000000 x19: 0000000000000000 x18: 0000000000000001
>> [    0.800239] x17: 7265727574636166 x16: 756e614d202e6b6e x15: ffff0000c0290488
>> [    0.802308] x14: ffffffffffffffff x13: ffff0000c088fa2c x12: ffff0000c088fa14
>> [    0.804341] x11: 0000000000000026 x10: 0000000000000401 x9 : ffff80001058247c
>> [    0.806408] x8 : ffff0000c088fa2c x7 : 0000000000000008 x6 : 0000000000000001
>> [    0.808429] x5 : ffff80001258a000 x4 : ffff80001258a260 x3 : 0000000000000068
>> [    0.810492] x2 : 0000000000000001 x1 : 0000000000000068 x0 : 0000000000020000
>> [    0.813153] Call trace:
>> [    0.813878]  blk_finish_plug+0x88/0x270
>> [    0.815064]  add_mtd_blktrans_dev+0x258/0x3f0
>> [    0.816316]  mtdblock_add_mtd+0x6c/0xb8
>> [    0.817428]  blktrans_notify_add+0x50/0x78
>> [    0.818666]  add_mtd_device+0x304/0x4d8
>> [    0.819790]  mtd_device_parse_register+0x1d8/0x2f0
>> [    0.821150]  physmap_flash_probe+0x4c8/0x7a8
>> [    0.822431]  platform_probe+0x70/0xe0
>> [    0.823494]  really_probe+0xf0/0x4d0
>> [    0.824539]  driver_probe_device+0x108/0x178
>> [    0.825760]  device_driver_attach+0x7c/0x88
>> [    0.827039]  __driver_attach+0xb8/0x190
>> [    0.828142]  bus_for_each_dev+0x78/0xd0
>> [    0.829254]  driver_attach+0x2c/0x38
>> [    0.830381]  bus_add_driver+0x14c/0x230
>> [    0.831502]  driver_register+0x6c/0x128
>> [    0.832604]  __platform_driver_register+0x30/0x40
>> [    0.833952]  physmap_init+0x24/0x30
>> [    0.835011]  do_one_initcall+0x50/0x2c8
>> [    0.836116]  kernel_init_freeable+0x25c/0x2e4
>> [    0.837366]  kernel_init+0x2c/0x138
>> [    0.838403]  ret_from_fork+0x10/0x18
>> [    0.839453] Code: c8037c22 35ffffa3 17fff238 f9800031 (c85f7c22)
>> [    0.841176] ---[ end trace 66ee8a40712bfd28 ]---
>> [    0.842563] Kernel panic - not syncing: Attempted to kill init!
>> exitcode=0x0000000b
>> [    0.844577] SMP: stopping secondary CPUs
>> [    0.845707] Kernel Offset: disabled
>> [    0.846731] CPU features: 0x10000071,00000846
>> [    0.847969] Memory Limit: none
>> [    0.848853] ---[ end Kernel panic - not syncing: Attempted to kill
>> init! exitcode=0x0000000b ]---

Should be fixed once linux-next resyncs with the block tree.

-- 
Jens Axboe

