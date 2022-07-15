Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 061165763C9
	for <lists+linux-next@lfdr.de>; Fri, 15 Jul 2022 16:43:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234847AbiGOOnC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 15 Jul 2022 10:43:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233247AbiGOOnB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 15 Jul 2022 10:43:01 -0400
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AF4774DCC
        for <linux-next@vger.kernel.org>; Fri, 15 Jul 2022 07:43:01 -0700 (PDT)
Received: by mail-il1-x12d.google.com with SMTP id o2so1189860ill.6
        for <linux-next@vger.kernel.org>; Fri, 15 Jul 2022 07:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=xk8a+l++rWgkTq50yVGHgr4FTNm3uMWmqHNOlMKJ2yY=;
        b=irIFRF1PGBXVjKT0EyhMeBzL5zNDmcf66s6OkDheHVZQB2sAlNPjyphmxT8EzehMGm
         emD+ckTpKwGESRVErzWPSOFgBul4XR9AcSwF+cxbJCRCZZcy05kvoWkmdQAjfEQlZTiu
         QL+YvQyGVecx9suRhd8rf9xH6wrVLuodCn5dAgXiEWgjgEMY5nWvBirv6OZWKequkcdf
         XcOXwYaLnd47/88sJ9YyT4n9o7+XVrzfxKg5lK6DYIvNMDn5xZ/Y810rzxsdwWx+KsHf
         6OXeleobam8ufdSfdGY7O6lAu/N4/xECWlaLPtY+V+KwR9TgnGXiVwVfgb1anPBe5Zhz
         hUIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=xk8a+l++rWgkTq50yVGHgr4FTNm3uMWmqHNOlMKJ2yY=;
        b=53RiZa5IKzTKgXwAlVI0+kqZACcXumVn+IkePG/Q+By97hG94UtcL9tQWYAd25SUkN
         XOQTfNncs3Tr7FV4mYXRaB+zaAmwARBsA01CuXShlDu52nEPzhNOZn3eifBquYsn5B9U
         Bnj77TuUGC8KX9VsCCNdXQAYmU1ixcMYODaxoK8JyUwXAeIns9gXxku4KfbGDPZdSX20
         gOLhpOsIvAFlGyLU4mKX2XC4jIcokyHTTb7pCeAZoQgpG7uBqGTgeO7vYbZp62Kos0Px
         ASeEYnuzP8ZR9f7fGFPR06IvmSpO2sULbMKTR8Id/uEz/PCIz6aP/RaCPaGQwUevqK8f
         sgSA==
X-Gm-Message-State: AJIora96GEsWMA27eo82+9HtNY07IPMVL5DC0SOonaJ63lf87dgY+1Z+
        cuojBdlA2tPw09sHkWjCucNpWM3iDdG+Dg==
X-Google-Smtp-Source: AGRyM1vw6arlVWDR2sztJ/KCl9xkKybS345EYMCO/XurHiZLInhyDg7mRHdbJ9zCdNKHER8AmvDSkw==
X-Received: by 2002:a05:6e02:4d1:b0:2dc:f85:2fed with SMTP id f17-20020a056e0204d100b002dc0f852fedmr7497276ils.94.1657896180444;
        Fri, 15 Jul 2022 07:43:00 -0700 (PDT)
Received: from [192.168.1.172] ([207.135.234.126])
        by smtp.gmail.com with ESMTPSA id w4-20020a92db44000000b002db4e72ead5sm1760167ilq.50.2022.07.15.07.42.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Jul 2022 07:42:59 -0700 (PDT)
Message-ID: <5614fbc0-509a-6341-bef2-8857f4fe610e@kernel.dk>
Date:   Fri, 15 Jul 2022 08:42:57 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: linux-next: build failure after merge of the block tree
Content-Language: en-US
To:     Al Viro <viro@zeniv.linux.org.uk>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Ming Lei <ming.lei@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
References: <20220715140259.205ef267@canb.auug.org.au>
 <YtDoqhuAt6Sv6qgV@ZenIV>
From:   Jens Axboe <axboe@kernel.dk>
In-Reply-To: <YtDoqhuAt6Sv6qgV@ZenIV>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 7/14/22 10:10 PM, Al Viro wrote:
> On Fri, Jul 15, 2022 at 02:02:59PM +1000, Stephen Rothwell wrote:
>> Hi all,
>>
>> After merging the block tree, today's linux-next build (x86_64
>> allmodconfig) failed like this:
>>
>> drivers/block/ublk_drv.c:951:19: error: 'no_llseek' undeclared here (not in a function); did you mean 'noop_llseek'?
>>   951 |         .llseek = no_llseek,
>>       |                   ^~~~~~~~~
>>       |                   noop_llseek
>>
>> Caused by commit
>>
>>   71f28f3136af ("ublk_drv: add io_uring based userspace block driver")
>>
>> interacting with commit
>>
>>   8804bffa93a1 ("fs: remove no_llseek")
>>
>> from the vfs tree.
> 
> I suspect that it would be a good idea to slap
> #define no_llseek NULL
> into include/linux/fs.h for the merge window, then remove it (and all
> stray no_llseek initializers) at -rc1.  Linus, would you be OK with
> that approach?

Not Linus, but I think that's a good idea as it'll reduce the pain for
any new users added in other trees.

-- 
Jens Axboe

