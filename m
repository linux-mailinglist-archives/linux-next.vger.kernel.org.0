Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65C96621771
	for <lists+linux-next@lfdr.de>; Tue,  8 Nov 2022 15:54:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234344AbiKHOyA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Nov 2022 09:54:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234285AbiKHOxw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Nov 2022 09:53:52 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F72018E0C;
        Tue,  8 Nov 2022 06:53:51 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id j12so14390293plj.5;
        Tue, 08 Nov 2022 06:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iPWTM5bctppQrEhT8PhLH/n0wnwXqhBeZrZRWfQFk6Y=;
        b=IFSc9rcTe5NRbcWLMfSJ4CqwAQk9sDNFD/xyAot5VYfdbTZ2hxB6yakJcevKzWEHu0
         xRno1uKyAhpxqkPvfsBXilff1tCNQ+QmyDif5bt01gE1aiT8fZfADLRWzZdcL4pAjFfB
         Irj29iU6KywmdtoUDu3iJxR4oZNscSeCyi4Biaq2yKFJJcsG2mgCdJvHDiGfldp3/O1l
         lWhzqP3x2mWhl/zTzedyULoseUB/vAgw8Jl2tFWiESsYZ70CljZwdet9gcNuJXulG9h6
         c3OEal4GGhdvE24tP913AWfuznGbLEO/hluY1PvetFaUN9icFyV58RC+rmjkG18CcZws
         Uvrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iPWTM5bctppQrEhT8PhLH/n0wnwXqhBeZrZRWfQFk6Y=;
        b=HSmbTTd35gWv+oaLPzWTmpRDnCn/8hdPE4fUXcC6MJUEPJOcLnWRwq7S8gKrVyc4gL
         3MBm8jGygAmXnGyD4lD5ZSHvsm0C7PDiNeaQwq2/JeQ73uCF1q3KqdqBirUymYxXGtC1
         Zn7axkgu90eBkI+v0EcMtqtRe+LEzVmmFrMa1NIBjswGPcW0p17YdSW9jKTi4Zkesef9
         f+7xhebQtd3QXHdRRTciwO+hekOWh3HYmMnH0iI4Ce5BhiwU4Ze4tqTpArFGe8a1HP8i
         RZIkqCWrcuG4PzL6vi6O1mAEaneReDbwh4MTbSU/WFCml1ESH6RrEj0PDsBb1R+VEAlP
         OwiQ==
X-Gm-Message-State: ANoB5pk8hbd18x9zUKtG5ZjNSYRVoh7d4mIlN+gkx/loW0usWpMfORVD
        vm2TNgxWhiwU0pT2g195JxKbU2sIh04=
X-Google-Smtp-Source: AA0mqf5rkTlutTfPxsW2hru2NT6RkXbIajNdPSnXJv2RClDTXMhDdnd9C9N5Rnimq+6rkNpPFQlUgA==
X-Received: by 2002:a17:902:6b4a:b0:188:867a:e079 with SMTP id g10-20020a1709026b4a00b00188867ae079mr7466801plt.158.1667919230982;
        Tue, 08 Nov 2022 06:53:50 -0800 (PST)
Received: from [192.168.11.9] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id x190-20020a6231c7000000b0056abfa74eddsm6701169pfx.147.2022.11.08.06.53.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 06:53:50 -0800 (PST)
Message-ID: <fd1903d4-a721-931e-c928-1818cd650490@gmail.com>
Date:   Tue, 8 Nov 2022 23:53:46 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
From:   Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH] Documentation: RCU: use code blocks with autogenerated
 line (was: Re: linux-next: build warning after merge of the rcu tree)
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     corbet@lwn.net, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org, paulmck@kernel.org, rcu@vger.kernel.org
References: <Y2jWAR1QESe3OrhH@debian.me>
 <af3ec8bf-310e-69ea-9d32-f7aec740b306@gmail.com>
 <206a95eb-5430-f9bf-15ad-4e644393255e@gmail.com>
Content-Language: en-US
In-Reply-To: <206a95eb-5430-f9bf-15ad-4e644393255e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

[Dropping most CCs]

On Tue, 8 Nov 2022 09:29:01 +0700, Bagas Sanjaya wrote:
> On 11/7/22 18:48, Akira Yokosawa wrote:
>> That might be true if all you care about were the generated documents,
>> but we need to pay attention to readers of .rst files as plain-text.
>>
>> There are a bunch of references to line numbers in RCU documents.
>> If explicit line numbers are removed from snippets, such readers need
>> to count the lines by themselves, which doesn't sound reasonable to me.
>>
> 
> I think only rcubarrier.rst have explicit references to line numbers.

Oh, I find such references in (not limited to):

  - Documentation/RCU/Design/Requirements/Requirements.rst
  - Documentation/RCU/Design/Data-Structures/Data-Structures.rst

> 
> Also, besides manual line counting, readers seeing rst sources can deduce
> where actually the lines are from explanation of the snippet.

Maybe, maybe not... Deducing may take time.

>                                                               Of course
> they can make htmldocs and seeing the output if they want.

There can be situations where you can't afford such luxuries.

Remember there is a note in Documentation/doc-guide/sphinx.rst
which reads:

  Please don't go overboard with reStructuredText markup. Keep it simple.
  For the most part the documentation should be plain text with just enough
  consistency in formatting that it can be converted to other formats.

My interpretation of above:

  .rst sources should be kept as close to plain-text which can be
  easily understood in dumb terminals, as far as possible.

> 
>> If you can put labels to referenced lines within code snippets, auto
>> generation of line numbers might work, but as far as I know, Sphinx
>> doesn't provide such a nice feature.
>>
> 
> There's also :emphasize-lines: option to highlight selected line numbers.

But that option doesn't do any highlighting while viewing .rst files
as plain-text. What am I missing?

        Thanks, Akira

> 
> Thanks.
> 
