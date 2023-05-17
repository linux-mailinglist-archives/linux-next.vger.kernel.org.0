Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5036706DB8
	for <lists+linux-next@lfdr.de>; Wed, 17 May 2023 18:12:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231228AbjEQQMx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 May 2023 12:12:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230378AbjEQQMw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 17 May 2023 12:12:52 -0400
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEF481BD3
        for <linux-next@vger.kernel.org>; Wed, 17 May 2023 09:12:51 -0700 (PDT)
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-760dff4b701so5855139f.0
        for <linux-next@vger.kernel.org>; Wed, 17 May 2023 09:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1684339971; x=1686931971;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4rBLJ96oBunSIGi6bRehSQSg19fy1SjfpJ45RWxDsyw=;
        b=Q6dl7FRD4pah3jhftvG/oisQYHnbnzqIMASVJ4kdW1igLXbhGllqdU8NPQdN5lQ7Dg
         odwtSx3OOyjnaq9iTXpNYgwygXkmKBsFETpYKFHQ/CYZHv/0vdER7ipAYrr5TvuOIPrV
         t3g7u7sxR5CHzrVAUpCVwnDD3Z3JUwA4Hp9rU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684339971; x=1686931971;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4rBLJ96oBunSIGi6bRehSQSg19fy1SjfpJ45RWxDsyw=;
        b=OY0A703clQMSNZ3mi1LF106x7+dQy0XU3UKqsR14pUpaFtUE6jHK4OLO1dh8/MMexQ
         TuCEZ7IXxbqobOMYINRY1YFR/Ot3PSl+JPPmNsHK+9GjFy5uPgcallM3knTdytu00w6b
         jjKaOjECtCk3aVRknj0Pb6Xqo6ObbBf+OwbhU5gIFXmpTOhx60eZGO7N4gIOKgnGpg8E
         gJkFzIZ0XixoKDNFI6dvU7qtD5C9Alm/VaEpKV3IfxhJ0JkefyYgBQkBafpe1StyRLml
         MvsVaNLCEAd0++/bOo76NKzDh3gRu0KdBSLReLbgsLw9PuUhRT+swEBMcI+qSzHxVKjm
         dm5Q==
X-Gm-Message-State: AC+VfDyseNndGxtAAqvVwCDYy/eiSarCssBpA1Lz3Y3jX11oqtQTqnro
        yDH8wJXA3Y3Jf3lLSCOEuXKfQeoZmCa5J8kKLGw=
X-Google-Smtp-Source: ACHHUZ6E8ZdCJu47zHN7zQ546o+zak2SKQgvVUJg1IJajtvOabrf/tlYFwOnH/rcFE1WFcwVF8EYqw==
X-Received: by 2002:a05:6e02:1b0d:b0:332:fcce:c26d with SMTP id i13-20020a056e021b0d00b00332fccec26dmr2459442ilv.0.1684339971136;
        Wed, 17 May 2023 09:12:51 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id k19-20020a02ccd3000000b004119d31117fsm8680402jaq.147.2023.05.17.09.12.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 May 2023 09:12:50 -0700 (PDT)
Message-ID: <427a54c6-f097-f64d-29fb-b90eee504c4b@linuxfoundation.org>
Date:   Wed, 17 May 2023 10:12:49 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: linux-next: duplicate patch in the rcu tree
Content-Language: en-US
To:     paulmck@kernel.org
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Shuah Khan <shuah@kernel.org>, Mark Brown <broonie@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20230511090010.2916e9d7@canb.auug.org.au>
 <59c2fd36-6920-47d8-a79c-9ff3fcf7c7ae@paulmck-laptop>
 <96c6fdf7-e589-ca56-9314-1d437b8082ac@linuxfoundation.org>
 <62cabd2d-124f-4bc3-8eb8-36773c10b4f2@paulmck-laptop>
From:   Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <62cabd2d-124f-4bc3-8eb8-36773c10b4f2@paulmck-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 5/16/23 06:19, Paul E. McKenney wrote:
> On Mon, May 15, 2023 at 01:28:23PM -0600, Shuah Khan wrote:
>> On 5/11/23 10:52, Paul E. McKenney wrote:
>>> On Thu, May 11, 2023 at 09:00:10AM +1000, Stephen Rothwell wrote:
>>>> Hi all,
>>>>
>>>> The following commit is also in the kselftest-fixes tree as a different
>>>> commit (but the same patch):
>>>>
>>>>     6d9ed63d8bc3 ("tools/nolibc: Fix build of stdio.h due to header ordering")
>>>>
>>>> This is commit
>>>>
>>>>     d7eafa64a158 ("tools/nolibc: Fix build of stdio.h due to header ordering")
>>>>
>>>> in the kselftest-fixes tree.
>>>
>>> I can currently cleanly remove this commit from the rest of the nolibc
>>> commits in -rcu.
>>>
>>> However, I might need to re-introduce it in some way or another, for
>>> example, if there are dependencies on it by future nolibc patches.
>>> (I expect another batch in a few days.)
>>>
>>> So how would you like to proceed?
>>
>> Paul,
>>
>> I can drop this from linux-kselftest fixes if that is the easier path.
>> Just let me know.
> 
> That would work better for me, less need to keep track of different
> commits in different trees.  So could you please drop this one?
> 

Done. Dropped d7eafa64a158 from linux-kselftest fixes.

thanks,
-- Shuah

