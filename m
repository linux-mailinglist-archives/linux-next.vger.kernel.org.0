Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 565FB2CAF2E
	for <lists+linux-next@lfdr.de>; Tue,  1 Dec 2020 22:54:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729843AbgLAVxP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Dec 2020 16:53:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729842AbgLAVxO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 1 Dec 2020 16:53:14 -0500
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43444C0613D4
        for <linux-next@vger.kernel.org>; Tue,  1 Dec 2020 13:52:28 -0800 (PST)
Received: by mail-pj1-x1041.google.com with SMTP id v1so2154282pjr.2
        for <linux-next@vger.kernel.org>; Tue, 01 Dec 2020 13:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GdTxJDpXOOmL5JC+JpbpkKg3d8WT038POzb3ofRzgqI=;
        b=ZfOduIAXN5ZFOQ0xt2x4X3QfUTBvgIsddRdRxYGbW4yMBqi1r+8oB/zhLW2Z1mAWqy
         NYtmYThqQgWYZrOxTM7zMnyHeVKZkr99Ew45vsrRnYPaH9IFv9huw95TQbvKLQnVGRiy
         bOHoxMBp27k/nkmubL/OuFbYZYcn2du7FjAC7oOmAvyOGoQkh69Ar/cngvDf8BM+lRw7
         9+B1GgBI7E6mBC6JwygI5cdxQ78HXvBMJME0JcK0CLmTVTShy83/5dT166xCE3XNf+xu
         AhTsJJnfjaaDM88F/aXenietPf4SD++/VOuBUsL8kQOhHA7JbYj+eQ9bygDvjN5AXEbJ
         P8jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GdTxJDpXOOmL5JC+JpbpkKg3d8WT038POzb3ofRzgqI=;
        b=cGbGDKCboEMkSDkWCT129KuSXgjHn1OCAsSBt1ycdzKrVhLPHfeyQKSKtoMSDWwKMZ
         GwDWhxyRHKM0qqvlKfxeBJjwWHVcgJFveKK691EjJzmOu0CN8HxEfK1TOFinNR7BYEhq
         Ws5h4LwRXEC/S1ysXZM94V9jxjQmEKTt8n//UHP9wVQLgVuI6GFMDNp3sR1jC7U68nVw
         O1ifbPastPNR+NhOWxra4FTG5bqPrCdOHbwaspxQFdsjLK2ANGfuIzzondoOxcm3IYSa
         44fgYX4vLr1p//QpqtTsYoBbRJIB2X5o58ZDQVWCFNHI8BO7ROR+16J0aMvfqwRFYkUb
         Ws4Q==
X-Gm-Message-State: AOAM531v9XstWDsPa5w2S0IufrhNiG17TrxususaBWQyAoDDVUATdUSj
        pwR7CLGJwDUlMWZ+sE4jOxesLvaREOcS0Q==
X-Google-Smtp-Source: ABdhPJzBZtPTZTDgrrA5iRrjULEa9CrPPmWjN6H9VJzxz6wiTdKTUPbxSjEYSEpfW8Q1P3Q0IEGQmA==
X-Received: by 2002:a17:90a:a501:: with SMTP id a1mr4973492pjq.4.1606859547489;
        Tue, 01 Dec 2020 13:52:27 -0800 (PST)
Received: from [192.168.1.134] ([66.219.217.173])
        by smtp.gmail.com with ESMTPSA id t10sm692464pfq.110.2020.12.01.13.52.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Dec 2020 13:52:26 -0800 (PST)
Subject: Re: linux-next: Fixes tag needs some work in the block tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20201202080254.4e8dbb43@canb.auug.org.au>
 <9ef33d53-a98e-7608-da86-f3cf7b4b6da1@kernel.dk>
 <20201202084452.790e9f16@canb.auug.org.au>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <2ed44adf-9fcf-a1a7-73e8-b6b5aabd8638@kernel.dk>
Date:   Tue, 1 Dec 2020 14:52:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201202084452.790e9f16@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 12/1/20 2:44 PM, Stephen Rothwell wrote:
> Hi Jens,
> 
> On Tue, 1 Dec 2020 14:09:24 -0700 Jens Axboe <axboe@kernel.dk> wrote:
>>
>> On 12/1/20 2:02 PM, Stephen Rothwell wrote:
>>>
>>> In commit
>>>
>>>   573cc9d095bc ("blk-cgroup: fix a hd_struct leak in blkcg_fill_root_iostats")
>>>
>>> Fixes tag
>>>
>>>   Fixes: ef45fe470e1 ("blk-cgroup: show global disk stats in root cgroup io.stat")
>>>
>>> has these problem(s):
>>>
>>>   - SHA1 should be at least 12 digits long
>>>
>>> For the future, this can be fixed by setting core.abbrev to 12 (or more)
>>> or (for git v2.11 or later) just making sure it is not set (or set to
>>> "auto").  
>>
>> It's in Linus's tree, not in -next. The ship has sailed...
> 
> Ummm, 573cc9d095bc is only in your tree as far as I can see ...
> however, I don't really expect these short SHA1 issues to be fixed up
> (as that would require rebasing your tree), just that people will try
> not to do the same in the future.

Hmm yes, but that's because I botched something up. I'll take a look!

-- 
Jens Axboe

