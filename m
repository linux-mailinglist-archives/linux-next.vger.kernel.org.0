Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C135B46A117
	for <lists+linux-next@lfdr.de>; Mon,  6 Dec 2021 17:17:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352609AbhLFQVQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Dec 2021 11:21:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356621AbhLFQVF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 6 Dec 2021 11:21:05 -0500
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDBC2C0611F7
        for <linux-next@vger.kernel.org>; Mon,  6 Dec 2021 08:17:35 -0800 (PST)
Received: by mail-qk1-x732.google.com with SMTP id 132so11625706qkj.11
        for <linux-next@vger.kernel.org>; Mon, 06 Dec 2021 08:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=R4jGu2qbmARxbGb3tgU7TY4VubezWvXJws2tBM5yACI=;
        b=JrREj+GYATn/OgLASlKoyqwkpFQIbBcn3h8+rHrduh4wsclXJZXTUaIOiYwOWV38Bd
         VJgDIV8DxO4nYZ544e8+vF3kvTIssorXg0OsQgFN2TvCzLvY9MbjarJrLOToMcG2+MW5
         5NAUNdFuVYD3tTbEvNqBbL/V1HO4qljhIylprRvGeFoooLAn7uDiIbYSFK/twWQ/SELU
         ZhA/x7vnd3tChmOF8PvB1zk0Aj2eKs4UzAjXGLjE5UddxW+Ca4HWej3cfmGoYlNq0vbc
         MbU9wLo2u+1WxT7fxR1ckb3ryYE10Xf63Q5Y+26HwxleHMIpiLiK5GuvCPsk16XGldXA
         MwBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=R4jGu2qbmARxbGb3tgU7TY4VubezWvXJws2tBM5yACI=;
        b=oNbJ8BuXFxCVLd02SzndKmpbF/h9rkTNQCoX7YGOPsDyBugttehgj1F2WdWoGBqx1N
         LaIWMt9ynVC5ddX5ytwpjdR5nQ2ZiAb+fvaR8VhE3Ff58FZNJaY0OnNKnqpXqt1v4Wdy
         6pQLjkTgTBSK10ahr+2/C2T3KMjTMclaNtv90l9gfqcKQCWFEfmcBbaMkLI0XcqGglUu
         mBqNo9a0EFTOPvY88BYsX//dQ97RxSwtNe2YP6xcR3X6TZ2thsIKSmDsaZkawRnFPBCB
         WxBHvTwqYL8YZjawcV72BCmsdaCmtwk2+pMEij3L4xpt3tU7z2jr0D24EEt7xVUBrB1W
         43iQ==
X-Gm-Message-State: AOAM532pZp1cxvo5Eco4uGT0mQZqmcf3+Qtlp4F+T+lX4Q+y2uC8u5In
        QMHsbA3oCS/H4HMkxFPf9v6SNg==
X-Google-Smtp-Source: ABdhPJyC7uIvfU+T7FDc6RP31Z2irw5DUroyBb38U+GlqnWKWtBwkIbAJO+Rn97S2b3rckXKDuQhJQ==
X-Received: by 2002:ae9:efd8:: with SMTP id d207mr33848579qkg.97.1638807455064;
        Mon, 06 Dec 2021 08:17:35 -0800 (PST)
Received: from localhost (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id f12sm7291521qtj.93.2021.12.06.08.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 08:17:34 -0800 (PST)
Date:   Mon, 6 Dec 2021 11:17:34 -0500
From:   Ralph Siemsen <ralph.siemsen@linaro.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the char-misc tree with the
 char-misc.current tree
Message-ID: <20211206161734.GA4141317@maple.netwinder.org>
References: <20211206144901.63529ac9@canb.auug.org.au>
 <Ya4Tb9NUj33UdxmI@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <Ya4Tb9NUj33UdxmI@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Dec 06, 2021 at 03:43:11PM +0200, Andy Shevchenko wrote:
>On Mon, Dec 06, 2021 at 02:49:01PM +1100, Stephen Rothwell wrote:
>> Hi all,
>>
>> Today's linux-next merge of the char-misc tree got a conflict in:
>>
>>   drivers/misc/eeprom/at25.c
>>
>> between commit:
>>
>>   9a626577398c ("nvmem: eeprom: at25: fix FRAM byte_len")

This was my original patch from Nov 8th.

>>   5b557298d7d0 ("misc: at25: Make driver OF independent again")
>>   a692fc39bf90 ("misc: at25: Don't copy garbage to the at25->chip in FRAM case")
>>   58589a75bba9 ("misc: at25: Check proper value of chip length in FRAM case")
>>   51902c1212fe ("misc: at25: Use at25->chip instead of local chip everywhere in ->probe()")
>> (and probably more)

These are newer versions and some cleanups from Andy. I was not aware of 
this work going on. I'm surprised at25 is getting so much attention ;-)

>> I fixed it up (I just used the latter version) and can carry the fix as
>> necessary. This is now fixed as far as linux-next is concerned, but any
>> non trivial conflicts should be mentioned to your upstream maintainer
>> when your tree is submitted for merging.  You may also want to consider
>> cooperating with the maintainer of the conflicting tree to minimise any
>> particularly complex conflicts.
>
>The result from char-misc.current should be used as is and I guess it's
>what you have done, thanks!

Agreed - Andy's version is cleaner, and includes my fixes. I've run some 
quick tests locally and all seems to be working as expected.

Regards,
Ralph
