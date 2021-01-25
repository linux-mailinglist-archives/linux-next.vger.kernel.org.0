Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 830633047A6
	for <lists+linux-next@lfdr.de>; Tue, 26 Jan 2021 20:12:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730312AbhAZF6N (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Jan 2021 00:58:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727154AbhAYSki (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 25 Jan 2021 13:40:38 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A8B4C061756
        for <linux-next@vger.kernel.org>; Mon, 25 Jan 2021 10:39:55 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id d4so8213861plh.5
        for <linux-next@vger.kernel.org>; Mon, 25 Jan 2021 10:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=b6u/WUCmSU0QAscUYeApKxm+wOPUgy+KJoomzmcMtkA=;
        b=x8n5OMDuJTuBtD8qL2jC9B3zbNtOqc6UvqcsRIY/thgsr/zx5cks19UjYDDHvlh4jq
         zj0LzTf98OxxLCUeFaMJ4ZuOv2GzCBx9qXdsQGMtNzAnhyPMybYSYg/EogMP9E6+wLlq
         h4zRasUObh55p+m0x415+DsOYp1IpoWW+VraziUNzosFjXq2KFIuRa678sw5sqH8vrYJ
         c9gUI318hZCtg34qO0eQvUUiQg4fH6zBib2c0WfoUFZgBT6r9fhYmjLJxQpYSC1GUFf1
         MFngmZAA6N/JbSAHLCw7U8tu2g+xv2eb0+HVlIWEpMd1H+GqxbZLqELOV6/37zIRB9jt
         4dWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=b6u/WUCmSU0QAscUYeApKxm+wOPUgy+KJoomzmcMtkA=;
        b=Ab1uPN+Yu6KCtZYSFfYpiiVmENOGMPBh3ZH246FDv8C2AcW24FSxwjsA1YXqtjY3dc
         QUL278ShaiTGZIZHyMspJFuivQoHmdi+PNcKGdy0eLVDhmVtoEdz6MDWIXIf8oFMyBDc
         CabeKxjcf1fyTTJSjDSyBPWUzJBNqvQFyuIt+gfEqwe3O/7sfXBbtVO603Z+aKKleWBV
         iiiTVldymSSJ9gmvmg2XsOwa8RoupT6T6kPaMchCW7BZIVT5GmfrvO8moJ71XldwY4S7
         Jg+DeIOsd4wXkXvninC72BWMUINhKZwNnaGHqOp1Y6xn99qJNA+Dm4vjqJ/G1vJrsljT
         vyqw==
X-Gm-Message-State: AOAM532uyYptWYLZEvXv04ePA5Mrb0mSl8c1JKKzw5ziUgP2XxxZpxbJ
        Jvh6VXJfwcJuhFmMHCtZKxLSgC3LtEtQog==
X-Google-Smtp-Source: ABdhPJxOmd0snia3sFjZWkCv9trJwxeRXB4Uc9Rz4QAcT+/+MAHdqB4bsn6P39CPw4rADbhEtKkKLA==
X-Received: by 2002:a17:902:e74b:b029:df:e5d6:c35f with SMTP id p11-20020a170902e74bb02900dfe5d6c35fmr2001982plf.57.1611599992853;
        Mon, 25 Jan 2021 10:39:52 -0800 (PST)
Received: from [192.168.4.41] (cpe-72-132-29-68.dc.res.rr.com. [72.132.29.68])
        by smtp.gmail.com with ESMTPSA id a4sm17446049pfg.41.2021.01.25.10.39.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jan 2021 10:39:52 -0800 (PST)
Subject: Re: linux-next: Fixes tag needs some work in the block tree
To:     Paolo Valente <paolo.valente@linaro.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Jia Cheng Hu <jia.jiachenghu@gmail.com>, Jan Kara <jack@suse.cz>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210125204032.6b6a604b@canb.auug.org.au>
 <3F91181A-EDF2-4F01-9839-17B40D6EA07F@linaro.org>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <fb60bac7-f572-d131-d761-f6ce10a05f69@kernel.dk>
Date:   Mon, 25 Jan 2021 11:39:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3F91181A-EDF2-4F01-9839-17B40D6EA07F@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 1/25/21 11:35 AM, Paolo Valente wrote:
> 
> 
>> Il giorno 25 gen 2021, alle ore 10:40, Stephen Rothwell <sfr@canb.auug.org.au> ha scritto:
>>
>> Hi all,
>>
>> In commit
>>
>>  d4fc3640ff36 ("block, bfq: set next_rq to waker_bfqq->next_rq in waker injection")
>>
>> Fixes tag
>>
>>  Fixes: c5089591c3ba ("block, bfq: detect wakers and unconditionally inject their I/O")
>>
>> has these problem(s):
>>
>>  - Target SHA1 does not exist
>>
>> Maybe you meant
>>
>> Fixes: 13a857a4c4e8 ("block, bfq: detect wakers and unconditionally inject their I/O")
>>
> 
> Hi Jens,
> how to proceed in such a case (with patches already applied by you)?
> Shall I send you a v2 with only this change?

We just have to ignore it... But in the future, always double check that
you are using the right shas, not some sha from an internal tree.

-- 
Jens Axboe

