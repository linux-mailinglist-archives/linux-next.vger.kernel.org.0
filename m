Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B07C4448B3
	for <lists+linux-next@lfdr.de>; Wed,  3 Nov 2021 20:03:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230206AbhKCTGO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Nov 2021 15:06:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229697AbhKCTGO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 3 Nov 2021 15:06:14 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1E13C061714
        for <linux-next@vger.kernel.org>; Wed,  3 Nov 2021 12:03:36 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id y11so5187903oih.7
        for <linux-next@vger.kernel.org>; Wed, 03 Nov 2021 12:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5oaC9OT7PCd2Vr4m+94T0a/jYCQYumzRDNC0eRuxbgg=;
        b=Tdt5km7jlZggUD/yGLnsTL4FeB/NyUiATf/d8TR3BcaWJEbNrUmWqe5k+mZVlZuWKR
         9cmy5yV46NiOk/1R0hwOoH/mWvA4fieemyERhOyku4sLWPtIXJ7YJUG2N7omWfNsNQXu
         goFIxkAuOb5Zay98aWf8WkWOPqYaECdcjUroVI7+B5HJz2PzY+ZvaaHcmRsZng9GtiOv
         LxtorsRqjqnEyDNuQvQJbcD56ANKsPLHEUo+2rZVz/Ub0WIDganblzoMpL+odv+OUTWy
         fDuHjEYJRV5zcswU23dpFVIL+w5JGFSGx4G886yhNEjc8JdcAmFAahJktKjkbXA6gcOj
         6afw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5oaC9OT7PCd2Vr4m+94T0a/jYCQYumzRDNC0eRuxbgg=;
        b=5h9J+Vdl+lhmT5IpaLK4zA/84THw8TdqVF+Wrgua2CpQD2CTb7y5pUFXEzSOz9icTb
         njAZVPgacgzomCKDJYBhgRzUsIXedUqZ3HZi+4g+W7WnZb0J8G9v4i/xcu7w9wpP2EU3
         nB6UX0s2eERgZdvAA0p0HrLP5C9GckCDpDdarxUYNeG/wXxZAccUZNx8is4e4mZ/rqNe
         p93Ydw+3gKZ+qtJ8jObMAo+Bi4tSo6f+3MoqrhmzzvMsYJzbdxwbrLEUGr8olk3cRNZ6
         zMfL/Mn4DSWYPPjnUc2wmvybF4YVe7zIz4N37hZ/1tt4aPLztbAsJBjfvqOYBYZYtjzc
         AYNA==
X-Gm-Message-State: AOAM532pg1I5a8klnHIxPOqwJM3Z2LGj4+9pJfoWjotu7nY9MCLp+8gL
        9KeJtXQYplBi2j/EP9ex6pPh/w==
X-Google-Smtp-Source: ABdhPJwuIcO4RpWVlExK2PiHYX6hoYdR1+O8lrLPZzNHQWc3RFpUznlDnPph6yXFelS6iM7aYeGjeg==
X-Received: by 2002:a05:6808:171c:: with SMTP id bc28mr12306248oib.18.1635966216083;
        Wed, 03 Nov 2021 12:03:36 -0700 (PDT)
Received: from [192.168.1.30] ([207.135.234.126])
        by smtp.gmail.com with ESMTPSA id bc32sm789359oob.12.2021.11.03.12.03.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Nov 2021 12:03:35 -0700 (PDT)
Subject: Re: [bug report] WARNING: CPU: 1 PID: 1386 at
 block/blk-mq-sched.c:432 blk_mq_sched_insert_request+0x54/0x178
To:     Yi Zhang <yi.zhang@redhat.com>
Cc:     Ming Lei <ming.lei@redhat.com>,
        Steffen Maier <maier@linux.ibm.com>,
        linux-block <linux-block@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-scsi <linux-scsi@vger.kernel.org>
References: <YYIHXGSb2O5va0vA@T590>
 <85F2E9AC-385F-4BCA-BD3C-7A093442F87F@kernel.dk>
 <CAHj4cs-pTYoksSQDjfFpK13Xtg0jB6EOvhfOZu5cDHowZa=ueg@mail.gmail.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <f95deb32-59a0-1fc1-b7b2-92583a5ef4de@kernel.dk>
Date:   Wed, 3 Nov 2021 13:03:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHj4cs-pTYoksSQDjfFpK13Xtg0jB6EOvhfOZu5cDHowZa=ueg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 11/2/21 10:00 PM, Yi Zhang wrote:
>>>
>>> Hello Jens,
>>>
>>> I guess the issue could be the following code run without grabbing
>>> ->q_usage_counter from blk_mq_alloc_request() and blk_mq_alloc_request_hctx().
>>>
>>> .rq_flags       = q->elevator ? RQF_ELV : 0,
>>>
>>> then elevator is switched to real one from none, and check on q->elevator
>>> becomes not consistent.
>>
>> Indeed, that’s where I was going with this. I have a patch, testing it locally but it’s getting late. Will send it out tomorrow. The nice benefit is that it allows dropping the weird ref get on plug flush, and batches getting the refs as well.
>>
> 
> Hi Jens
> Here is the log in case you still need it. :)

Can you retry with the updated for-next pulled into -git?

-- 
Jens Axboe

