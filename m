Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16F4F394710
	for <lists+linux-next@lfdr.de>; Fri, 28 May 2021 20:32:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229481AbhE1Sdi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 28 May 2021 14:33:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbhE1Sdi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 28 May 2021 14:33:38 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A350C061574
        for <linux-next@vger.kernel.org>; Fri, 28 May 2021 11:32:03 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id kr9so3041662pjb.5
        for <linux-next@vger.kernel.org>; Fri, 28 May 2021 11:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=YV/BiPJXhGwSK1PzuBgArnxi+SlDKErcHallVmzy8OI=;
        b=oeIfKPwTYbdFzQnGWsbcMsrzvBZhq6DWLQce99NaYxtj/w88ZrQ/B8vnRXhivk3bHE
         gywmstMJZWJo+BKKpHRs+K9ccDl+xmbNbvXuFfjMNFHXoiOXlwUukS3Yd+uGJFRPhg1k
         tvyhtoiU0/TDw9x17Yf2IAHpZ9z8mCG+ivp8MTBNrmaZEZ+3PWl7a7eHcKsdBryf2VzP
         NHUTEJIvbNCW55olNDFolDrJUVhKAmDtsdKKLB/W5WNEEN5jyUM2WaRI0xONWVxFaQT8
         i4ZUfeRod4jnIyFmrd0j3vHYrwWF8goZaVmX2YELomWg5n1R9aw4rvH9QNeUs0inHNdU
         UiTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=YV/BiPJXhGwSK1PzuBgArnxi+SlDKErcHallVmzy8OI=;
        b=XANP8lawCWRGLReq3yKjtLr8H3vOiuCoiL5Cnoqb/mFJ4lKSsI2/LE59G+DDQ+CjZ7
         oZgafTPVFbkDUOjYLbBqV5tEPryarxFlSvz/bS82UCg7hl8mUPP2Y0UR95wldoKZytvE
         qP31/iLQeXsRKFnOasku/gGEuoXiCgdRgp9Ex5uHcuVUNJ9frouW0DJKIWYHoZcpalWm
         uKv9PBh5vfekPxAvLKX+Ptw7UdyuDmT9EaEQG1mrVTa32WxL6n2yx+YmX9HhPtoEa6E3
         1HG/X8febwRdipfCgpRqdAwfE04yDs85du4X+AZ1PQqgpgB84dffAXuPpEds+FoUsnFt
         8c+Q==
X-Gm-Message-State: AOAM533aGewOdcMdekgw14waRSGVQn69/b5Y487gKppxErupYSA3Vs1X
        ReKvktt0YvzwjXWahZeD2y0hFg==
X-Google-Smtp-Source: ABdhPJzShLm9qG/+ny4dx5TtLmdS2dbI51CA9eYDIpWdiO+juPnKFo3HhnqPYAdwL9ldDj/cKotdbw==
X-Received: by 2002:a17:90a:1c02:: with SMTP id s2mr5784634pjs.172.1622226722903;
        Fri, 28 May 2021 11:32:02 -0700 (PDT)
Received: from localhost ([2601:602:9200:1465:b7b1:ebba:cf8d:434e])
        by smtp.gmail.com with ESMTPSA id r5sm4896984pjd.2.2021.05.28.11.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 11:32:02 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Carlo Caione <carlo@caione.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        linux-amlogic@lists.infradead.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: updated Amlogic repo used for linux-next
In-Reply-To: <20210528083821.72dda431@canb.auug.org.au>
References: <7hmtsgrpkt.fsf@baylibre.com>
 <20210528083821.72dda431@canb.auug.org.au>
Date:   Fri, 28 May 2021 11:32:01 -0700
Message-ID: <7h8s3yso9q.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi Kevin,
>
> On Thu, 27 May 2021 11:36:50 -0700 Kevin Hilman <khilman@baylibre.com> wrote:
>>
>> Please update the tree used for Amlogic SoC kernel development
>> (suggested patch below[1].)
>> 
>> We've switched to a maintainer group for this tree which is now
>> co-maintained by myself and Neil (cc'd)
>> 
>> [1]
>> diff --git a/Next/Trees b/Next/Trees
>> index 2d22ca1d2911..1794b9144f3a 100644
>> --- a/Next/Trees
>> +++ b/Next/Trees
>> @@ -103,7 +103,7 @@ arm64		git	git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux#for-next/co
>>  arm-perf		git	git://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git#for-next/perf
>>  arm-soc		git	git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git#for-next
>>  actions		git	git://git.kernel.org/pub/scm/linux/kernel/git/mani/linux-actions.git#for-next
>> -amlogic		git	git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git#for-next
>> +amlogic		git	git://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git#for-next
>>  aspeed		git	git://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git#for-next
>>  at91		git	git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git#at91-next
>>  drivers-memory	git	https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git#for-next
>
> I have updated the tree URL and added Neil as a contact.

Thank you.

> I still have Carlo (cc'd) listed as a contact, is that correct?

You can drop Carlo.  He stepped down as co-maintainer awhile back.

Thanks,

Kevin
