Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8415C5A99BF
	for <lists+linux-next@lfdr.de>; Thu,  1 Sep 2022 16:10:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234454AbiIAOKp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 1 Sep 2022 10:10:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232404AbiIAOKo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 1 Sep 2022 10:10:44 -0400
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 800FC5A2F0
        for <linux-next@vger.kernel.org>; Thu,  1 Sep 2022 07:10:41 -0700 (PDT)
Received: by mail-io1-xd30.google.com with SMTP id q81so14641876iod.9
        for <linux-next@vger.kernel.org>; Thu, 01 Sep 2022 07:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=CyNbcV14q7+Ey6YxeCBNqSaJlRng0kSUQ5nxtXoFaWw=;
        b=itCLQCZh1QpRBU5xvMrj8jVtI7BFXtZrqghFjObvPTJEwX/myKCtUa06ux69XiK40k
         zHD/t9DCgq3GaiBEpkDFyIscNooeqQUW7LJVQjh8StipOeLYe0v1b2LDITxzyLPwToPd
         RJ9Mr8NJtfLFbKhiEKyHopiL87afugpNN1N4oMql+/WunNTadE0NeQBld1254ENxtx1f
         61aAIbaPu9wv3t8fJOf1mZznGAn5XGqamu9PpPNhLcrpz/sRjZJ+6sFzDVvsXUW8oafT
         /B26hLoWR3jkHb3fyDyoOHPoxTWEnAkqGU8Wvl0ZUiOnXdnGwCpj8Y5xrFD62CkQV7Hn
         Gj7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=CyNbcV14q7+Ey6YxeCBNqSaJlRng0kSUQ5nxtXoFaWw=;
        b=Q76RVU4NSHRj+ytD6Bx7hPbaWaNRFAs6qwB5hREeRbz/GCh8yGT9elEoUYvEfdn1qp
         BL+csK8f0cELLPbEh0wn0bIynvaILX0+ZfAo6Gn6n+RVI1qSGql4LgljxRPMvE/Irc4S
         BLBepj1brcNXk52Rhdf3c4mG/i31ny2Ots8YwiIMhkJkRCMi8YrtqilCIx5MWFuzaIdG
         ulqPifqE2svYERORfFRC7J/j1eL/yT4VGrK/sQ2pcnfX0aazI1Jao/UIH9pU0F6HFjCS
         K/ttKLIEfFUR6Yk/SeE3AtSTommG7WPjagwxgYjRo+/jOTM5DymEB2s+hv8Ggh6WSRnS
         iK5w==
X-Gm-Message-State: ACgBeo1xf4sYWEV/BN4p5CRLb3j3JXYjXSfM22v285dG+2NdpgPp0j1t
        8fOO3vgMvDA42st07x13fJq+XQ==
X-Google-Smtp-Source: AA6agR694CqwSaixSBdSD1iR4/wSRdBsicWKndEbSHznwNc8FNkXNt0eNbj1fmhOMkrdMjEys9Oxww==
X-Received: by 2002:a6b:6704:0:b0:688:d06b:2233 with SMTP id b4-20020a6b6704000000b00688d06b2233mr15215106ioc.174.1662041440723;
        Thu, 01 Sep 2022 07:10:40 -0700 (PDT)
Received: from [192.168.1.94] ([207.135.234.126])
        by smtp.gmail.com with ESMTPSA id p9-20020a02b389000000b0034c10bd52f5sm1867543jan.125.2022.09.01.07.10.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 07:10:35 -0700 (PDT)
Message-ID: <f80623f2-7c19-c121-6eff-f5bb4f1cfc48@kernel.dk>
Date:   Thu, 1 Sep 2022 08:10:32 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: linux-next: manual merge of the mm tree with the block tree
To:     John Hubbard <jhubbard@nvidia.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20220901161722.739d2013@canb.auug.org.au>
 <1a6632f1-5e23-5fb3-1af2-6d653e4338d4@nvidia.com>
Content-Language: en-US
From:   Jens Axboe <axboe@kernel.dk>
In-Reply-To: <1a6632f1-5e23-5fb3-1af2-6d653e4338d4@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 9/1/22 1:47 AM, John Hubbard wrote:
> On 8/31/22 23:17, Stephen Rothwell wrote:
>> Hi all,
>>
>> Today's linux-next merge of the mm tree got a conflict in:
>>
>>   block/blk-map.c
>>
>> between commit:
>>
>>   e88811bc43b9 ("block: use on-stack page vec for <= UIO_FASTIOV")
>>
>> from the block tree and commit:
>>
>>   2e9a2aa23dad ("block, bio, fs: convert most filesystems to pin_user_pages_fast()")
>>
>> from the mm tree.
>>
>> I fixed it up (I think - see below) and can carry the fix as
> 
> The fix up looks correct to me.
> 
>> necessary. This is now fixed as far as linux-next is concerned, but any
>> non trivial conflicts should be mentioned to your upstream maintainer
>> when your tree is submitted for merging.  You may also want to consider
>> cooperating with the maintainer of the conflicting tree to minimise any
>> particularly complex conflicts.
>>
> 
> Of the 7 patches in my series [1], the first two are in mm, and provide
> some prerequisites. The remaining patches apply to block, bio, fs, and
> iov_iter, and that's where this merge conflict happened.
> 
> Also, there's still some upcoming churn (more patchset revisions are
> coming), as reviews are still active and this one isn't perfected yet.
> 
> So I see two obvious solutions. Either:
> 
> a) Only do the first two patches for now, and leave them in Andrew's
> tree. After the next release, do the remaining 5 patches via the block
> tree, or
> 
> b) Move the whole series to the block tree now, or
> 
> c) something else?
> 
> Andrew, Jens, any preference here? 

Would've been cleaner to take through the block tree given what
it touches, imho. Or at least base on that, so we'd avoid frivolous
conflicts like this.

-- 
Jens Axboe


