Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF2E33C25EF
	for <lists+linux-next@lfdr.de>; Fri,  9 Jul 2021 16:27:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231918AbhGIO37 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 9 Jul 2021 10:29:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231908AbhGIO35 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 9 Jul 2021 10:29:57 -0400
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D77EC0613DD
        for <linux-next@vger.kernel.org>; Fri,  9 Jul 2021 07:27:14 -0700 (PDT)
Received: by mail-il1-x131.google.com with SMTP id r16so3548038ilt.11
        for <linux-next@vger.kernel.org>; Fri, 09 Jul 2021 07:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=95dkVPm8mKfD+WhqlIEKmIqJnoyW6EzD5pKbI1YQ1aw=;
        b=kVg4PY8RXgvhd3Sd3kOhaIkN2d1ko23xe8BkDehunth690JjMfHF3Uw5kigoViaQAd
         XU5SoeLzp9siKxy8A0aR/ti6mesUX77cvCXt/w6QMFcJyhZdvx3swCPjnJzAFdLa9NT0
         RyUDvr+1uJxYWr6riQTSZnI3OAGzhpFFfiLsVGGJSU11Nldg/D88ys7W0vle902NNVLw
         hdcXc5j6MepYXGNsMtJgSnWhQvB7oBETnOEsctJ1Dc6/m5JgeuLdxyt+3mO3dpSoWpql
         FgH55bOFLAn4LJoZFe8KLGLbKFSA5roSCxYfSjJIU8CRPlsYgB85AXp2b0ymdI7+1dh2
         2nfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=95dkVPm8mKfD+WhqlIEKmIqJnoyW6EzD5pKbI1YQ1aw=;
        b=RY3CGMfY6isNYpMus21s9jfeeJv0ohOCzhyl0zfA2tdW5rhBhe9w+a3n+ByQ5NcmBW
         BWhsKaPCGyA6uvERViA7YH8YzJzzZgH4uB/XEVXVdrV4LqgtetwbzSjGbkr2ajfkSKlB
         d6HS6SoPJKWt8Jav+r6Tq64KtJk1mntqXKRZwUEyTf38NympnuU41NF24pLq4vnq/LRA
         eZpUiw6JuzQIwVsNiwup67OvGks/GgJtIijYLzhu/UmHENUfGnzUzNTSVP8+jlqlpO+k
         4uUlFVdIIyIutWiuBx+uhuTFTZqBU/B0X1/FDLWGlFlZDQq6anwNHQCfUxiFTXCmDnRz
         ruSA==
X-Gm-Message-State: AOAM531oHWbKRHaSAG19EIREWVqLzHrExAuxOM5eZMI7NZSfIs9Nj9yF
        qo5c2pFncymJx7ZLR5k2H2Jdjw==
X-Google-Smtp-Source: ABdhPJzC5DNGi6NgV9XHXpVkOO3/L8OD1SjkyK5Lwv4L+LABCTnOtlvRi1kZ873eia9i7G8qo59ftA==
X-Received: by 2002:a92:c7c4:: with SMTP id g4mr5026281ilk.252.1625840833951;
        Fri, 09 Jul 2021 07:27:13 -0700 (PDT)
Received: from [192.168.1.134] ([198.8.77.61])
        by smtp.gmail.com with ESMTPSA id j4sm2866189iom.28.2021.07.09.07.27.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jul 2021 07:27:13 -0700 (PDT)
Subject: Re: linux-next: manual merge of the block tree with the mmc-fixes
 tree
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>
References: <20210709103244.64b2f1de@canb.auug.org.au>
 <CAPDyKFrO-KcrPWBLGvS9hO+rLJjr=yx1766Np2M8HHApgkwNKg@mail.gmail.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <12c52b0f-275c-4663-d1bd-3f06fece4299@kernel.dk>
Date:   Fri, 9 Jul 2021 08:27:11 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAPDyKFrO-KcrPWBLGvS9hO+rLJjr=yx1766Np2M8HHApgkwNKg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 7/9/21 2:34 AM, Ulf Hansson wrote:
> On Fri, 9 Jul 2021 at 02:32, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> Hi all,
>>
>> Today's linux-next merge of the block tree got a conflict in:
>>
>>   drivers/mmc/core/block.c
>>
>> between commit:
>>
>>   5c0777665b3e ("mmc: core: Use kref in place of struct mmc_blk_data::usage")
>>
>> from the mmc-fixes tree and commits:
>>
>>   249cda3325e0 ("mmc: remove an extra blk_{get,put}_queue pair")
>>   607d968a5769 ("mmc: switch to blk_mq_alloc_disk")
>>
>> from the block tree.
>>
>> I fixed it up (see below) and can carry the fix as necessary. This
>> is now fixed as far as linux-next is concerned, but any non trivial
>> conflicts should be mentioned to your upstream maintainer when your tree
>> is submitted for merging.  You may also want to consider cooperating
>> with the maintainer of the conflicting tree to minimise any particularly
>> complex conflicts.
>>
>> --
>> Cheers,
>> Stephen Rothwell
> 
> Stephen, thanks for the heads up!
> 
> Jens, I noticed that you sent the PR with the mmc commits as of
> yesterday. Assuming Linus will pull it before rc1, I will rebase and
> fix up the conflict from my fixes branch on top. No action needed from
> your side.

I don't have any 5.15 code in for-next until after the merge window, so
it's all fixes that are going into this release until then. These commits
have been queued up for a few weeks, they are just part of a later push
to Linus (that was sent out yesterday).

-- 
Jens Axboe

