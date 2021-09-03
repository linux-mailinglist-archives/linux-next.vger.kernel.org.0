Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36E034000B0
	for <lists+linux-next@lfdr.de>; Fri,  3 Sep 2021 15:41:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347669AbhICNmh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 3 Sep 2021 09:42:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242849AbhICNmh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 3 Sep 2021 09:42:37 -0400
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90EBEC061757
        for <linux-next@vger.kernel.org>; Fri,  3 Sep 2021 06:41:36 -0700 (PDT)
Received: by mail-io1-xd29.google.com with SMTP id z1so6789739ioh.7
        for <linux-next@vger.kernel.org>; Fri, 03 Sep 2021 06:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gnzVb8mHv15u+/S85Bjs1puYCsU45RASECntRmgjk90=;
        b=o3pQxYURqv6iDmgwAZYr3/Xkv9DwClSW/psfysStrgUSZfBnsX5gWVp4SsqkEe01+E
         oeWLep0eiSOFn1b4NlQAvzfrztmWabowWSN+0LRS4KOtwfRDQ9g5I4V2Uof8WYnfE0z4
         banfNSpRyVkMLxUXZhukRFCbpT3MSeq51IZIBN3g/i4MH3hrGpHqD8XuenS18b3ygUwg
         JDNJNimWGmyhZJ563j6Td2LK4LLIC6K7KxaHFtku3DpuC1/Qag39dnfV7OXnvVczs1PQ
         a9DTMie5Au37ggDi9ExdK5Eq7oYUranfjoTeeESNSFYPYew67uWfz0Vni7YD6vptTeYz
         eZow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gnzVb8mHv15u+/S85Bjs1puYCsU45RASECntRmgjk90=;
        b=jo4j6KSA9U7ByNmVicEa8deZmnK1bq0JMwLNYQk1XCbyCx6UZ0WfGSkgs/0L0mbFb5
         qpkXIEieM92VHAVJdQqxEMkuJivga/iR2/m2H0cMrUz0cj+BZBw/nZBW1r3qIZvpaNu3
         jXK//UZwhVr+am3NwcuNll6YO0bokeIsTwFKyPV+pIJeYy3MPGlpq/2hiwYVMEDmi89O
         +xCGwlHtnFuYc2MG3F0yL5k2tRNbV/lWIaSeFy3m+zPIRTSlNR1Pfer71gcrpYytf89X
         c0+GKNWy81nDqOjHF+h78zXpM9nm+xrV4guVSIB53jN76ScKDVgBDFmyWEh/aRQvofDw
         v1xg==
X-Gm-Message-State: AOAM530o2DHHW+GNoFfnF73jECo7Ve0/6vNCpOoUZLRg1gOjtMMHU5kY
        3eyZ9oGJNvM59fb//8X0PIU1AXKb+jzISQ==
X-Google-Smtp-Source: ABdhPJygjc2RmH9XBWk66cjslitWJ8pRgE3mvLmVGDxF8sKQgfT/p5EinG9T7L4x/BTVi10tp81Ltw==
X-Received: by 2002:a6b:8d8a:: with SMTP id p132mr3084472iod.81.1630676495884;
        Fri, 03 Sep 2021 06:41:35 -0700 (PDT)
Received: from [192.168.1.30] ([207.135.234.126])
        by smtp.gmail.com with ESMTPSA id s7sm2666579ioe.11.2021.09.03.06.41.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Sep 2021 06:41:35 -0700 (PDT)
Subject: Re: linux-next: build warning after merge of the block tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210813194116.3a0297d6@canb.auug.org.au>
 <b2492209-732c-9871-6085-6a17659f6429@kernel.dk>
 <20210903164939.02f6e8c5@canb.auug.org.au>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <fdf2e372-a5fb-7476-6b17-c6cccf5b8d40@kernel.dk>
Date:   Fri, 3 Sep 2021 07:41:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210903164939.02f6e8c5@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 9/3/21 12:49 AM, Stephen Rothwell wrote:
> Hi Jens,
> 
> On Fri, 13 Aug 2021 07:54:51 -0600 Jens Axboe <axboe@kernel.dk> wrote:
>>
>> On 8/13/21 3:41 AM, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> After merging the block tree, today's linux-next build (htmldocs)
>>> produced this warning:
>>>
>>> block/bio.c:1689: warning: Function parameter or member 'nr_vecs' not described in 'bio_alloc_kiocb'
>>>
>>> Introduced by commit
>>>
>>>   1cbbd31c4ada ("bio: add allocation cache abstraction")  
>>
>> Thanks, fixed up.
> 
> Not really :-(  I am now also getting this (the above has moved to line
> 1704 as well):
> 
> block/bio.c:1704: warning: Excess function parameter 'nr_iovecs' description in 'bio_alloc_kiocb'

This should fix that one up:

diff --git a/block/bio.c b/block/bio.c
index e16849f46b0e..5df3dd282e40 100644
--- a/block/bio.c
+++ b/block/bio.c
@@ -1688,7 +1688,7 @@ EXPORT_SYMBOL(bioset_init_from_src);
 /**
  * bio_alloc_kiocb - Allocate a bio from bio_set based on kiocb
  * @kiocb:	kiocb describing the IO
- * @nr_iovecs:	number of iovecs to pre-allocate
+ * @nr_vecs:	number of iovecs to pre-allocate
  * @bs:		bio_set to allocate from
  *
  * Description:

-- 
Jens Axboe

