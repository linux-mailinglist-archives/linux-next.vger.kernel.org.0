Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42C6E31A2B5
	for <lists+linux-next@lfdr.de>; Fri, 12 Feb 2021 17:31:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229782AbhBLQ3Y (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 12 Feb 2021 11:29:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230353AbhBLQ1Q (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 12 Feb 2021 11:27:16 -0500
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34D4BC061786
        for <linux-next@vger.kernel.org>; Fri, 12 Feb 2021 08:26:30 -0800 (PST)
Received: by mail-il1-x12f.google.com with SMTP id m20so8630309ilj.13
        for <linux-next@vger.kernel.org>; Fri, 12 Feb 2021 08:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wWYQggmidDOXt8SlEpUZeJHp/q9QIYaBxVftGHC9fl4=;
        b=wqK20CJrDipWCz9QUtF7I6iO/4sqOeVO4U9r0p+G2dg+YwXUcEaQOw/vfYef9zebwY
         tseAfC4F9wICBg3NN8s+WDl1D9LUAkCp3cqLS+JmkIhnhXy6tAInE8eUu0wZjDfdvRsf
         Izj928y0tSJPXIBy+FAZmJPHOn2SrTTafRHRXl0fnpaUW8rAxSOIubeD7jPnr3glJWsi
         +xgH6NENxsyA/mR0TxfoG2/CT7KG8dgUQblOwXJ/byahzdJdvtXcGSNym3TVoUzth5IY
         hqelihDyrtMw9gqPiCDK24udHz7NuN2AMH5Yd1CYZMItGOB9bNecmcCXFbOsxxIByitx
         b5Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wWYQggmidDOXt8SlEpUZeJHp/q9QIYaBxVftGHC9fl4=;
        b=He2qSiVyLH3D8vx5Uyiqtb/DiXdJzqkWxsre4veHjAw4pSJiBW98YyAzD+S0yYA3Dv
         EAznpAYrEMgFgArHEv9x+wpck+sr88xudNqiermQ99zmk1sh524o8DGswYQeHRbfvlT9
         DNm3fKT1MXh139lhW1JEn1UqbziHW5FNvSoSMsRAq5PIbBekIWWOh69DgmN4lG9vncPq
         jGOyrS+1OZ/WE3/j3r4tiDmuO85tJBRSUqnEnG7KQP9vhaNrCM3IDFdhnY1UuIPPVdlW
         v0yeOqy3NHKczfjsx596kjUnT3o/HnbN3gsV2dry2Uw6EcDtV6Ha5vEDOIMSRyYKibcS
         o4/w==
X-Gm-Message-State: AOAM531PIeQoBG4r6RFE8pTnQX526kAvexNBfI3tFPTka0/hIfWi/M3N
        z8/SaVOwuF39D2bah6+34sEeRjmh9akdSSP3
X-Google-Smtp-Source: ABdhPJzqKK70rITdwxOkp1Fp0AxwB0gmZns9uk9e8ElQcdo6PA7zYv9EhYMyqsn7CTpZc1rPJ20/4g==
X-Received: by 2002:a92:ad09:: with SMTP id w9mr2869509ilh.23.1613147189266;
        Fri, 12 Feb 2021 08:26:29 -0800 (PST)
Received: from [192.168.1.30] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id j5sm2013784ilo.42.2021.02.12.08.26.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Feb 2021 08:26:28 -0800 (PST)
Subject: Re: linux-next: manual merge of the rcu tree with the block tree
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     paulmck@kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
        Frederic Weisbecker <frederic@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210211164852.7489b87d@canb.auug.org.au>
 <20210211173802.GM2743@paulmck-ThinkPad-P72>
 <d4232318-0e44-445d-a7a3-1e2a018c824e@kernel.dk>
 <YCaqSuQBhqgAkWLm@hirez.programming.kicks-ass.net>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <793e83ff-3bd1-39a0-9037-cb3cbfb455e8@kernel.dk>
Date:   Fri, 12 Feb 2021 09:26:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YCaqSuQBhqgAkWLm@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2/12/21 9:18 AM, Peter Zijlstra wrote:
> On Fri, Feb 12, 2021 at 08:26:56AM -0700, Jens Axboe wrote:
>> But I think I made a mistake in that it should've been sched/smp instead,
>> which would likely get rid of this issue too? I'll rebase it, it's just
>> a single topic branch with just those two patches on top.
> 
> Right, I made tip/sched/smp with just that one patch. That _should_ work
> for you, if not, please let me know.

It does, I just originally fat fingered the pull. All fixed up now!

-- 
Jens Axboe

