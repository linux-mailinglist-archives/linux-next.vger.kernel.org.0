Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C58B7341DC0
	for <lists+linux-next@lfdr.de>; Fri, 19 Mar 2021 14:09:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229785AbhCSNJI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 19 Mar 2021 09:09:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230042AbhCSNIp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 19 Mar 2021 09:08:45 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69779C06175F
        for <linux-next@vger.kernel.org>; Fri, 19 Mar 2021 06:08:44 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id mz6-20020a17090b3786b02900c16cb41d63so4850074pjb.2
        for <linux-next@vger.kernel.org>; Fri, 19 Mar 2021 06:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=buVMjeowUZo4dJC/b5sO1Z53VSSYUsgdAPOTplKlLjU=;
        b=WeooCjwbubv21qemCWFYxN/uHYGqCmxgpVU3ayZi7No0pgF27UOW5/wOlr7cszp+ZD
         LJ09rpbwE05voXI3g6IT2D//P1gPnIF+DINFYmjt/BwuL92IgColu/7govdxNcdtgwVM
         EO9gn0sham0Mn+lrnDtckzYiVRov9qbAD9Nt/EMcH44QsKEOrP1KP0SWicHWEpz9nydA
         CoejOEa8john0Gu4rKgzlh5WuymBtS+LqfQ7wM/BuwjkPr0kVeyrVVCUQ7BPceHeiiKe
         Mun2GKq82T62ogkmaywJql4PDMeS2LelI6Osm4Ems8Zn6yw7GayZ2LxK66k4cox/OvTD
         TfoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=buVMjeowUZo4dJC/b5sO1Z53VSSYUsgdAPOTplKlLjU=;
        b=SrrgfDpkv9jzIbhL+gPjoHDLam8/IkB8gV2eNny6npuxCeDZsyxhMngrSgZRAm4TXf
         kHlBUVneWB0axFCdzHlpeYgU4XR7OxFpgEs5V1pJhdXu8KQZCpnLq5wpsgeeZ6curgNd
         Pue8B8GGSnc4UCsbtFZDcBYPR2lEYPZPJKNc1NY9f04jsPbloe0hWrFw6dlrCt096Zh3
         MlS8LQkVzsKOGKtGlVhXfU25QxPlDWXfjFHBQCwow3o1xZLKjockn2j770eVPyqa8+of
         +re0WqgSKOrCQMrfuBzLF5kIq7h1Kdz7M40Z//GjFw3n5zN2IBZtOKBntLDd3MlQV6+L
         kGBw==
X-Gm-Message-State: AOAM5312eosG/ETquB0pifGwF3jEgCV79zWSrnyP6yvHc/xKEhvD7QZc
        uY9cQA+x27Bx+q4vRR17EBUsItN5rDt0ZQ==
X-Google-Smtp-Source: ABdhPJwzcNPtvJ+SamvAt64muZGkRUY2CRdkt4CJhOdUfG/jM3W7rQs6pbnYStQmXfSCnb/n3ySO0w==
X-Received: by 2002:a17:90a:c096:: with SMTP id o22mr9734144pjs.119.1616159323694;
        Fri, 19 Mar 2021 06:08:43 -0700 (PDT)
Received: from [192.168.1.134] ([66.219.217.173])
        by smtp.gmail.com with ESMTPSA id u17sm4978547pgl.80.2021.03.19.06.08.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Mar 2021 06:08:43 -0700 (PDT)
Subject: Re: linux-next: Signed-off-by missing for commit in the block tree
To:     Stefan Metzmacher <metze@samba.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210319101654.638e8e95@canb.auug.org.au>
 <7ced6739-4458-2b5b-af5a-d3aa9d37656d@kernel.dk>
 <14e60889-156e-7682-71c1-7b86c9b019a5@samba.org>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <6fc61af0-e113-15d3-dd71-a0415b0f546f@kernel.dk>
Date:   Fri, 19 Mar 2021 07:08:41 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <14e60889-156e-7682-71c1-7b86c9b019a5@samba.org>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 3/19/21 2:02 AM, Stefan Metzmacher wrote:
> 
> Am 19.03.21 um 00:25 schrieb Jens Axboe:
>> On 3/18/21 5:16 PM, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Commit
>>>
>>>   c2c6c067c050 ("io_uring: remove structures from include/linux/io_uring.h")
>>>
>>> is missing a Signed-off-by from its author.
>>
>> Stefan, let me know if you're OK with me adding that, not sure how I missed
>> that.
> 
> Yes, sure :-)
> I guess you removed it while adding 'Link:'

That was b4, I don't add those manually. But maybe it stripped those too,
annoying...

> You may want to remove cc: stable from 3aab52c9a708f7183460d368700181ef0c2a09e6
> ("io_uring: imply MSG_NOSIGNAL for send[msg]()/recv[msg]() calls")
> for now.
> 
> I'll want to do some more test with it on 5.12,
> I guess we'd then have to backport it to stable as part of the
> io_thread worker backport. I'll post some more details later
> to the io-uring list.

Sure, let's do that. I also dropped the short link sever as well for now.
I do like it on principle, but it does have a risk of breaking valid
use cases.

-- 
Jens Axboe

