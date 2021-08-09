Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26B2F3E4725
	for <lists+linux-next@lfdr.de>; Mon,  9 Aug 2021 16:05:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233445AbhHIOFm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 9 Aug 2021 10:05:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233366AbhHIOFl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 9 Aug 2021 10:05:41 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98961C061796
        for <linux-next@vger.kernel.org>; Mon,  9 Aug 2021 07:05:21 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id ca5so28136509pjb.5
        for <linux-next@vger.kernel.org>; Mon, 09 Aug 2021 07:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IGxi92yHd6EYivICtZF6F80ifWW8YGcYHwCnM5eJIwE=;
        b=PXOxm2aYFYheeQSTGHlO9lncIQYdCJo/K2qhR7K+U3s2Lbn4Mh9y5VLFSCpT654Uv7
         bcznhF3bI0wtmWbShG3zu25IQ1itvhtyxSYGmB1EpFokQW7Qa68fO4v1iMAa2zhzml5S
         2rXBFGXcEYL4VUmwxqalK4WLyEPxtYXV9PJ1Perui2GBITgzgLM7tzcxMYK2iczPB27a
         kCQFJTKW3ssDXmO3vixFu2xBEcpTu4k13z0Hg8uqbnwx7uBJ79z74N5h0lnRi27KsIud
         rlqrOneWGVViCYIo6+/WAZuJYCu4MWwExelNEADlCka5E3aByN0Zwmh4hM+nzC+5+rXn
         bRWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IGxi92yHd6EYivICtZF6F80ifWW8YGcYHwCnM5eJIwE=;
        b=K/RS/96k8GCeoecho/VRQbcIJk94+ej1v07EGi9bWBo4FEwaHWTUCpbmYqc/UneizY
         Pie2ivEBk3+KXwuK+xcY7ueAouhabh8mwjWSY8b63ksatF/wi5pGH1T4oCN+/pnOQRup
         VT38Fk1nqcMlLqY6xojxh6LbLV3Px25G7IrjwbT3JAQyvgYPaxRk7SfHbFldyoErq/Yh
         R5FUQgR9JAPrEeRhxV2v+Q6MIQ4U8cuOxy6+bOCVBfTOwc2OpBn6DvbfaE0Pk5ZZagN/
         DL0X83FS0KjrYadmw0/irzvHs1vuk9ZxW0V141/4bLlMRz8mkwZorwnjiQyK76oAg4mn
         FX6A==
X-Gm-Message-State: AOAM530ECpmmtuEpkK5lWaVSQnV19wVolWO06TcWLqgMP+VpEBJYhmWm
        unwrDKpIJaWboKO4qtELpADmCHH1MzeUME55
X-Google-Smtp-Source: ABdhPJzoGjsjX+2i5pu7wV/PquDe3EppQ30OCmAXPpOvutCn++xCdrI7OP9hCcd+aQ8H1Ux3MBgZaw==
X-Received: by 2002:a17:902:c405:b029:12c:cbce:26b9 with SMTP id k5-20020a170902c405b029012ccbce26b9mr20378611plk.69.1628517920864;
        Mon, 09 Aug 2021 07:05:20 -0700 (PDT)
Received: from [192.168.1.116] ([198.8.77.61])
        by smtp.gmail.com with ESMTPSA id d31sm23798686pgd.33.2021.08.09.07.05.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Aug 2021 07:05:20 -0700 (PDT)
Subject: Re: linux-next: manual merge of the block tree with Linus' tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Hao Xu <haoxu@linux.alibaba.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210809142909.1d5fab20@canb.auug.org.au>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <037df910-899c-688c-a4f1-a280cb3b5987@kernel.dk>
Date:   Mon, 9 Aug 2021 08:05:19 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210809142909.1d5fab20@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 8/8/21 10:29 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the block tree got a conflict in:
> 
>   fs/io-wq.c
> 
> between commit:
> 
>   21698274da5b ("io-wq: fix lack of acct->nr_workers < acct->max_workers judgement")
> 
> from Linus' tree and commit:
> 
>   e16aa0c614c6 ("io-wq: remove GFP_ATOMIC allocation off schedule out path")
> 
> from the block tree.
> 
> I fixed it up (I just used the latter version, but more may be needed?) and
> can carry the fix as necessary. This is now fixed as far as linux-next
> is concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.

I'm going to re-shuffle the 5.15 branch, I knew we'd be hitting this
conflict after the merge for 5.14 on Saturday. Hence it'll be a short
lived conflict.

-- 
Jens Axboe

