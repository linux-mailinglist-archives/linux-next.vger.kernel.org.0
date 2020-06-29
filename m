Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB1C920E8E8
	for <lists+linux-next@lfdr.de>; Tue, 30 Jun 2020 01:14:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726129AbgF2Wpk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 29 Jun 2020 18:45:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728308AbgF2Wpi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 29 Jun 2020 18:45:38 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 743BBC061755
        for <linux-next@vger.kernel.org>; Mon, 29 Jun 2020 15:45:36 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id u9so4056318pls.13
        for <linux-next@vger.kernel.org>; Mon, 29 Jun 2020 15:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xKWgfmUWOlb+dTGThUrunVvLc4+EdQONAVPrPzv8zys=;
        b=FE7MpQEceOHv0Lw22wW4W0nYDHzvxwYQQrNcu51bBcOUqpi+As6IGR27bnwXHlpfZL
         su0eQoQaQ/lcmbl2G53HGnPhcRWpMnfPFlDO6OAB1PlCyQLhApiwgUNqtXvbehc5LH1v
         gf6yash1nAU10L6WW+QNXtmU4P47gICSO+m5WNJX3DWC/J/ZerE91QdrQpHl3BEuFvr0
         2lfOrmN0+R3TZSAT2IiDTxQWAT7QOxZV57saRVC22tjNe4F2nWQ/Ble9a/Gz2eaS+Zgy
         tLy0B7o48jCehYcr8Ktnb0i321ytzzERIE1P1Oe4hvap03cJx+Gc9Bvnxk1GRem530Co
         MiyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xKWgfmUWOlb+dTGThUrunVvLc4+EdQONAVPrPzv8zys=;
        b=opZDdOdk7MN/XmEF7ty6P+0haqadJKm8ZuiynheH/xBWtLATKfTEfORRgGhxDss78B
         vlpX5VKpshLaP2qM+Z0dTbMGlZ5UeMbgmdHCZAJVhIAt36LL4AKx28UoKcxRWy1T1PIK
         9Vb4XpLnqDugvj73LHSmaLAbTHuplnUFflQHAT9iEdVjth2Gaq1BR9YRpFN5+qNarYLF
         X0Dtx1doufxIsz2BIgkTF2IIPG5y4UczFb4HEpvx3d6Y7vMR57zOmMFO5uCmUpsrKKBD
         pZCFC86yOEaXXxkhn4/8UINlYMVPIkOo4roki7MJJZTPaJrNTvwfUe9+4chEcP5RSPib
         ZK3w==
X-Gm-Message-State: AOAM531aiV0q+IhaSPlp8dyWyIxpMB8Ln9ZY2eEiGksavur8W1AnU/dq
        3TnU6I9G5ZH5p/ekispc1cIBag==
X-Google-Smtp-Source: ABdhPJyZEXUWwmz7SIKd8+fTWij6NgTR4fM2ol9AwKPFe3WKi6k/QuW+Cre/T20Ko/jIDTcq0HhXLg==
X-Received: by 2002:a17:90a:65c9:: with SMTP id i9mr19870342pjs.201.1593470735932;
        Mon, 29 Jun 2020 15:45:35 -0700 (PDT)
Received: from [192.168.86.197] (cpe-75-85-219-51.dc.res.rr.com. [75.85.219.51])
        by smtp.gmail.com with ESMTPSA id z11sm600366pfg.169.2020.06.29.15.45.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2020 15:45:35 -0700 (PDT)
Subject: Re: linux-next: Fixes tag needs some work in the block tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Pavel Begunkov <asml.silence@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200629080533.5f44d445@canb.auug.org.au>
 <3949fc27-da62-6e26-cf07-59d3c78e2b64@gmail.com>
 <fa5b0279-32a6-f9c6-f325-cedc2786b74a@kernel.dk>
 <20200630083617.46d6a08b@canb.auug.org.au>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <e781f9f5-c4dd-a91b-dccb-f951756c84ee@kernel.dk>
Date:   Mon, 29 Jun 2020 16:45:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200630083617.46d6a08b@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 6/29/20 4:36 PM, Stephen Rothwell wrote:
> Hi all,
> 
> On Mon, 29 Jun 2020 10:25:01 -0600 Jens Axboe <axboe@kernel.dk> wrote:
>>
>> On 6/29/20 10:21 AM, Pavel Begunkov wrote:
>>> On 29/06/2020 01:05, Stephen Rothwell wrote:  
>>>> Hi all,
>>>>
>>>> In commit
>>>>
>>>>   8c9cb6cd9a46 ("io_uring: fix refs underflow in io_iopoll_queue()")
>>>>
>>>> Fixes tag
>>>>
>>>>   Fixes: a1d7c393c47 ("io_uring: enable READ/WRITE to use deferred completions")  
>>>
>>> Jens, could you please fix this up after me?
>>> full hash: a1d7c393c4711a9ce6c239c3ab053a50dc96505a  
>>
>> I don't think that's a grave enough concern to rebase, it's just "missing" a
>> single digit of the sha.
> 
> Yeah, its more of a "please fix your git config". :-)

Agree! But I'm guessing that Pavel did this manually, which I end up
doing a lot too... And then mistakes happen.

-- 
Jens Axboe

