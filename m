Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB2A463B7DA
	for <lists+linux-next@lfdr.de>; Tue, 29 Nov 2022 03:30:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235011AbiK2Cak (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Nov 2022 21:30:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233537AbiK2Cak (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Nov 2022 21:30:40 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E804431EC8
        for <linux-next@vger.kernel.org>; Mon, 28 Nov 2022 18:30:38 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id k7so12040395pll.6
        for <linux-next@vger.kernel.org>; Mon, 28 Nov 2022 18:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IXHv7FKwamfpP3OAbBVNH5dDzTy9Zz0epUrCCXyNIZM=;
        b=FhCVKJsMGs4GK7GxBOcCZHD/MGhkhAXstFxIr75Jp21bNWRmd8wVfPhuWglC/9KWG+
         aVuTq/MdLMdFn0B54JBw0FD/bQXKGgKIOh5iZPCIf39eLKVPa3K43+19ugokBQwBdQtY
         kwv+lJ30ivxZnBnqMkngbN48fkSCpjGsFVI3zHl9gmeSqfNXH6nv/CJ72q6ngHDbhv8M
         r7gv7MWtnbNvDguA5qfn426z/IYlMUOaifVT/0xBpzTuHMSaQoX7wgHn4HihSBTZU5ea
         SVQrlAPx6IlaJywHtz23ai85SE2rdQLxg82A3wJy+c62a+Dxy/abPQEBZRS3mkDDI5ha
         a+bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IXHv7FKwamfpP3OAbBVNH5dDzTy9Zz0epUrCCXyNIZM=;
        b=FfONENuJhF+kqu0ExIieGZs+li/05nMPH3vLUFzeLynGzbtKaXckqL+PgBaAVXGW08
         mYgZiDndspR/IWTpLw1ES8KFvbV7dlJqF0GGJZxkhzYTp4JAFQPDsO3ViI8EKczDhINg
         EE50wd2tPM5+mMANbEOq4OwwtUhwuZmSDTPwlhC403+a8nMXnTdL1tXDq6A5B0t714ah
         5woguOelGxrjyP1G5tSaXOlk3788zvCXUpz5W14RZOuUAvk3XvtQtMN+NfulfgYBGDiO
         g+RBTtPTtZEvS7yUVrYUOcr1iHhW9BF8K82+GcB/LPaRFjtbuc/YWUkkIQIz7sJpx5bm
         +HCg==
X-Gm-Message-State: ANoB5pk2vSZ5LRWIFEm/W6HYWdre0RtHrvZXLR2QKEJmq/xVEPYXA3uQ
        Lj+GeOFVZbkI92jNOfBWfuAz/Yjgc5SNiyQn
X-Google-Smtp-Source: AA0mqf7l6232RkeFf6beFnopSzjgLRbwjObYX/qsgHzFJqp7fZURrXWhZ8qW+3EobFSqzvndzexfgQ==
X-Received: by 2002:a17:90a:788b:b0:218:24fc:c6b6 with SMTP id x11-20020a17090a788b00b0021824fcc6b6mr58350735pjk.127.1669689038373;
        Mon, 28 Nov 2022 18:30:38 -0800 (PST)
Received: from [192.168.1.136] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id y23-20020a17090264d700b00189667acf15sm7836307pli.162.2022.11.28.18.30.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 18:30:37 -0800 (PST)
Message-ID: <c03be0eb-1c4c-b8c9-8325-c7769b966ddf@kernel.dk>
Date:   Mon, 28 Nov 2022 19:30:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: linux-next: Fixes tag needs some work in the block tree
Content-Language: en-US
To:     Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20221129082715.78e44566@canb.auug.org.au>
 <ab5368d2-5f65-68cb-9703-23d6e451b775@opensource.wdc.com>
From:   Jens Axboe <axboe@kernel.dk>
In-Reply-To: <ab5368d2-5f65-68cb-9703-23d6e451b775@opensource.wdc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 11/28/22 4:39?PM, Damien Le Moal wrote:
> On 11/29/22 06:27, Stephen Rothwell wrote:
>> Hi all,
>>
>> In commit
>>
>>   4b49197f9fbd ("block: mq-deadline: Rename deadline_is_seq_writes()")
>>
>> Fixes tag
>>
>>   Fixes: 015d02f4853 ("block: mq-deadline: Do not break sequential write streams to zoned HDDs")
>>
>> has these problem(s):
>>
>>   - SHA1 should be at least 12 digits long
>>     This can be fixed for the future by setting core.abbrev to 12 (or
>>     more) or (for git v2.11 or later) just making sure it is not set
>>     (or set to "auto").
> 
> Oops. Sorry about that. It seems I cannot count up to 12 anymore :)
> It should be:
> 
> Fixes: 015d02f48537 ("block: mq-deadline: Do not break sequential write
> streams to zoned HDDs")
> 
> Jens, can you fix this ?

Sure, it's not that important though as it's just missing one digit. For
the record, this is what I have in my .gitconfig :

[alias]
fixes = log -1 --format=fixes

[pretty]
fixes = Fixes: %h (\"%s\")

[core]
abbrev = 12

and then you just do 'git fixes <sha>' and it spits out the line for the
commit without needing to count anything and eliminates this error.


-- 
Jens Axboe
