Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D82C22105D
	for <lists+linux-next@lfdr.de>; Wed, 15 Jul 2020 17:08:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728266AbgGOPI3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Jul 2020 11:08:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728265AbgGOPI2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 15 Jul 2020 11:08:28 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F336C061755
        for <linux-next@vger.kernel.org>; Wed, 15 Jul 2020 08:08:28 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id y2so2594483ioy.3
        for <linux-next@vger.kernel.org>; Wed, 15 Jul 2020 08:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Nv9vjEvfHuWgzOSTm31gduIcyNjGsqlPyVwRk5nczoY=;
        b=bUXUkD3lLd7CHIozSS1/iIJPQyuZ6XiRImkOzjZFuEKQYveJa8bvjkII4VrHqfCqMU
         kuH0pRPkIg7ziheSSHRqmgaCLg+h687dh1YSYtlAy/Oe40JhyvgtSpkpIJNObK4UHNk3
         w8LIPDDexzUbBOc2wL97+8+aAqyXbHRwE92d91l7W+RqFxlA+WdSZTMS/UrFz4RJpqG6
         qvYqRMcCBkudZwWItAJdGZ7pehhefaPhbvpdXWcL1BdR0CHkq8il16cFJanrVGhGPT/X
         fvL3TrLvlSDCPgwwGI4UvyjwtlSyFSYDh0IyRCGSOpc7hzToCvCY9IIn2NgeGNMzoVgl
         lhNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Nv9vjEvfHuWgzOSTm31gduIcyNjGsqlPyVwRk5nczoY=;
        b=k11mRxancY1S4BdGuDuPEATTRr72evxLeJMEZgsowTei0X3HwO7wgJhr5ywWm6BMLL
         MG/zuWpiOAVsoQsv9T+kbLqYWKy1mIqezSpA8IAI75j7vbkMZYHFNXfe31ZrhzZzvLTY
         DNWB9jcMxYE5W88Wd4um+rJ7QjCJSiqFhUZHo11EAQMAoydw2vgLPsSKdnTRQuDvHAgF
         rP4Jfx1aH14xV7XJNi5GQAJ6b3c9QeI98V2+hsXwqNMJboACQ6BVHXnbv3eyD4sLJm+7
         OkAiJz8crIvOHNK20gIFQZ2qGQwywgJFnWp/K3RMneKnw9Y8mP0QkU3nZvJSTDlDzd2d
         ikeA==
X-Gm-Message-State: AOAM5334dWiQ7qTJ41ltCK8AbftQ2YFtQJnYkXeAE7wpArBdomyKYflM
        J7uPXqUeSB+VA0Nng9g+MuniqJCKAj90AQ==
X-Google-Smtp-Source: ABdhPJzdiEqUABXsSiG1oRYxRlOkdtBGQtYGSyurLmSFVJmSliG4jn3im7aBaoRs2jNie6rFFZhMWQ==
X-Received: by 2002:a05:6638:2172:: with SMTP id p18mr12320831jak.63.1594825707956;
        Wed, 15 Jul 2020 08:08:27 -0700 (PDT)
Received: from [192.168.1.58] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id f206sm1205356ilh.75.2020.07.15.08.08.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2020 08:08:27 -0700 (PDT)
Subject: Re: linux-next: build failure after merge of the block tree
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200715121423.6c20731b@canb.auug.org.au>
 <CAMuHMdWMmP_YHEwnqmuTMw4-+LSieRaSHeqPLYLZyLq+O7zhyQ@mail.gmail.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <6bc36827-83a7-3695-530d-4b90c08b92c7@kernel.dk>
Date:   Wed, 15 Jul 2020 09:08:26 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWMmP_YHEwnqmuTMw4-+LSieRaSHeqPLYLZyLq+O7zhyQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 7/15/20 3:24 AM, Geert Uytterhoeven wrote:
> On Wed, Jul 15, 2020 at 4:26 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> After merging the block tree, today's linux-next build (arm
>> multi_v7_defconfig) failed like this:
>>
>> block/blk-timeout.c: In function 'blk_round_jiffies':
>> block/blk-timeout.c:96:14: error: 'CONFIG_HZ_ROUGH_MASK' undeclared (first use in this function)
>>    96 |  return (j + CONFIG_HZ_ROUGH_MASK) + 1;
>>       |              ^~~~~~~~~~~~~~~~~~~~
>>
>> Caused by commit
>>
>>   91ba0f529364 ("block: relax jiffies rounding for timeouts")
>>
>> CONFIG_HZ_ROUGH_MASK is not defined for this build even though
>> CONFIG_HZ_100 is set. The arm arch does not include kernel/Kconfig.hz.
>>
>> I have reverted that commit for today.
> 
> (as I don't have the original patch in my email, I'm commenting here)
> 
>     +config HZ_ROUGH_MASK
>     +       int
>     +       default 127 if HZ_100
>     +       default 255 if HZ_250 || HZ_300
>     +       default 1023 if HZ_1000
> 
> What about other HZ_* values?

Which other ones do we have?

-- 
Jens Axboe

