Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E90521D3220
	for <lists+linux-next@lfdr.de>; Thu, 14 May 2020 16:07:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727050AbgENOHA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 May 2020 10:07:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726197AbgENOG7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 14 May 2020 10:06:59 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C0ABC061A0E
        for <linux-next@vger.kernel.org>; Thu, 14 May 2020 07:06:59 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id n18so1365271pfa.2
        for <linux-next@vger.kernel.org>; Thu, 14 May 2020 07:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Q6a5nhhtlwC3I5RzWhkpkIibe9GsSPKfDndfMfvdcTU=;
        b=kN0PmvDMVtljFEv8ZZiWnVY21ZcFZaTdWSR1rQHlizhryKZoT6g9M4GrlsOwKVeqJq
         ntH4vWDYpi91xUTxHfxrLJIJzhXSE+RLmZiXwTZ9Owk/SsspqFBnyMD8YCSLlgaSkK46
         eF0z/hFDoYIVfwK9h6M5JYCKKus1Bv7kWrO2ZNsAMHINFO3qgY1FwSzhCeiVmBwXTGNg
         cHPze5zERq3uZ3+sW6yXhCusceImIEWPrA6W5Dzj8mfjw3giik3sNdVcQCk0KFgbY77k
         eeStU+Y2el2jtJs633pADino/pFOdlt+CZ8sNVncMD6jYCxLRfcV+UUaD0iyePkQydpt
         hnbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Q6a5nhhtlwC3I5RzWhkpkIibe9GsSPKfDndfMfvdcTU=;
        b=aA+AO4AkoJDEYDsZlP/+utuSN9HExRUdZHPtfoYqZLCsq8HDLo4qm/qjvU19FgZ6Eu
         J4odUMZcn0YhwJGs/vENZg1iiud85Zc4FkfitzTG3DWKGUss9c538z5rg5IFvDnhyhqP
         19tk9m0NEVHDQV8vKcpjTe2w4op0b8T+vo+HMIxTgU6MoVcq7/0kLqCPHCfLKqN72VD1
         ue6mlX8Kg5tLrgs5K0Jz4FBYx7ggIXOJzE3/kvOPsP/qN+vfsqibGM1XQBX/HzuiK+Cs
         tvmjC7Gb+S5FqSo/bnxRwETDFCujlCkN+Aoxv4fUzzhg0KLsTrbycjK/GpDRGw9SRAM4
         4+tw==
X-Gm-Message-State: AOAM533mlI20OlC+6WN2PGckVzVipnmgkHKBs+6TryHAk++Hvg0egKZ5
        WzD5aWcWud3BFQB2I/Wi8mjZ3LxE4hw=
X-Google-Smtp-Source: ABdhPJznyMcs2R1vd0kHKH4cBcFVIp8kNX0MWajfDDv2D4gE7p+9fLnw22AzwjVOeCG7+qIXLh5N4w==
X-Received: by 2002:a63:5225:: with SMTP id g37mr4043696pgb.230.1589465219177;
        Thu, 14 May 2020 07:06:59 -0700 (PDT)
Received: from ?IPv6:2605:e000:100e:8c61:a45a:373e:9b20:39ea? ([2605:e000:100e:8c61:a45a:373e:9b20:39ea])
        by smtp.gmail.com with ESMTPSA id g16sm2450843pfh.217.2020.05.14.07.06.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2020 07:06:57 -0700 (PDT)
Subject: Re: linux-next: build failure after merge of the block tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ming Lei <ming.lei@redhat.com>,
        Bart Van Assche <bvanassche@acm.org>
References: <20200514185737.701b40dd@canb.auug.org.au>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <b2fafdce-2616-cad4-79c8-c8186e4e0272@kernel.dk>
Date:   Thu, 14 May 2020 08:06:55 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200514185737.701b40dd@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 5/14/20 2:57 AM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the block tree, today's linux-next build (x86_64
> allnoconfig) failed like this:
> 
> In file included from include/linux/blk-cgroup.h:23,
>                  from include/linux/writeback.h:14,
>                  from include/linux/memcontrol.h:22,
>                  from include/linux/swap.h:9,
>                  from include/linux/suspend.h:5,
>                  from arch/x86/kernel/asm-offsets.c:13:
> include/linux/blkdev.h: In function 'blk_io_schedule':
> include/linux/blkdev.h:1857:26: error: 'sysctl_hung_task_timeout_secs' undeclared (first use in this function)
>  1857 |  unsigned long timeout = sysctl_hung_task_timeout_secs * HZ / 2;
>       |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Caused by commit
> 
>   e6249cdd46e4 ("block: add blk_io_schedule() for avoiding task hung in sync dio")
> 
> linux/sched/sysctl.h was not included since CONFIG_BLOCK is not defined.
> I have applied the following patch for today.

Sorry about that, it's fixed in the current tree.

-- 
Jens Axboe

