Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 107DC304367
	for <lists+linux-next@lfdr.de>; Tue, 26 Jan 2021 17:09:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391626AbhAZQHp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Jan 2021 11:07:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404892AbhAZQGs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 Jan 2021 11:06:48 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B247C061D73
        for <linux-next@vger.kernel.org>; Tue, 26 Jan 2021 08:05:52 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id b17so3480053plz.6
        for <linux-next@vger.kernel.org>; Tue, 26 Jan 2021 08:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jUGKf1rME507Ip/sgLYerQXLQBf8ZuaBGXgiassQ+UE=;
        b=2T8xfwp98OrVyuqKvYUSZXjezEL2e8WLqSu2M7yTsbLm6GaXEzJAjCncjifab6iVDe
         se+oGr1es8a+zFJsbDyt75qNhcJQ0toUrUZG14GHhH7YcN9BJCirnZPjgrdHUGr3rfWX
         tuPGOhXBwjXWBCd388F1Eh+P2eD7bV9J3lVAWUxXtGGYn0xDHLkew7LEYt/N4QlbgTuO
         oc0RUxG5WnEysRpg2ptUbkB3Tckuc+4FnA/KrqW+P71xJ5kFcsx8ZqlqwHIOHr39t8BP
         MhR11zhJTTXISs2IY+/q59r4fheGXNAj4AlbSPgIRixkUnDFblS94TGVJGvtt4320hKs
         DDMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jUGKf1rME507Ip/sgLYerQXLQBf8ZuaBGXgiassQ+UE=;
        b=rTIrIrMEipcbz3pcQwCRYmkcmcJ9fmQUWs32yyEN8yCC2M+SK94mh/xN2vdKgB1Bxt
         oLaKZP7syz6K4DHwaDq0HKVB091xKGJucdZyUq/1eaLOjZjPStk2l3L26+uKaohIsu+O
         VpbzRD2GZxqut9KqsKfqOBA7DytBLT/A9r/GNwjWJUgfEq6VtFpOfEnaoa3EHBKcOyT6
         nGKTZtkZYNc7N2cW1BqgrLtUIeKaQ0iVN897kLROFlGy4ypL/lAe2wftglUYl5kgkvbC
         6s3WqbDg78BPS3R010FLqQpO9S57cOMfxiLCMYjMduucLTjyBbRzHrGWyveEHTdLqTAD
         Q7sA==
X-Gm-Message-State: AOAM531MxYEZ66Kcre5OV2eiGJadw0OhvDNQHwQkZtS4jU5iaHpYTVBB
        zzXI1GRlvxyclb/78WH5zQBKXNy1TKxpDw==
X-Google-Smtp-Source: ABdhPJxtmLxNwcwY8eY1ahoibAF48xUWBK7ur8a596imFdgXmP3USbF9OhxMV2/en52qUYZeoBJnyQ==
X-Received: by 2002:a17:90a:6407:: with SMTP id g7mr529756pjj.56.1611677151908;
        Tue, 26 Jan 2021 08:05:51 -0800 (PST)
Received: from [192.168.4.41] (cpe-72-132-29-68.dc.res.rr.com. [72.132.29.68])
        by smtp.gmail.com with ESMTPSA id q2sm18015463pfj.32.2021.01.26.08.05.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jan 2021 08:05:51 -0800 (PST)
Subject: Re: linux-next: Fixes tag needs some work in the block tree
To:     Jan Kara <jack@suse.cz>
Cc:     Paolo Valente <paolo.valente@linaro.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Jia Cheng Hu <jia.jiachenghu@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210125204032.6b6a604b@canb.auug.org.au>
 <3F91181A-EDF2-4F01-9839-17B40D6EA07F@linaro.org>
 <fb60bac7-f572-d131-d761-f6ce10a05f69@kernel.dk>
 <20210126132946.GC10966@quack2.suse.cz>
 <a2d6399c-ba61-472b-1bf2-aa261d7dbbbe@kernel.dk>
 <20210126160156.GF10966@quack2.suse.cz>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <fe6e9e4f-af91-725a-ba2d-a932591b1923@kernel.dk>
Date:   Tue, 26 Jan 2021 09:05:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210126160156.GF10966@quack2.suse.cz>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 1/26/21 9:01 AM, Jan Kara wrote:
> On Tue 26-01-21 08:47:55, Jens Axboe wrote:
>> On 1/26/21 6:29 AM, Jan Kara wrote:
>>> On Mon 25-01-21 11:39:50, Jens Axboe wrote:
>>>> On 1/25/21 11:35 AM, Paolo Valente wrote:
>>>>>
>>>>>
>>>>>> Il giorno 25 gen 2021, alle ore 10:40, Stephen Rothwell <sfr@canb.auug.org.au> ha scritto:
>>>>>>
>>>>>> Hi all,
>>>>>>
>>>>>> In commit
>>>>>>
>>>>>>  d4fc3640ff36 ("block, bfq: set next_rq to waker_bfqq->next_rq in waker injection")
>>>>>>
>>>>>> Fixes tag
>>>>>>
>>>>>>  Fixes: c5089591c3ba ("block, bfq: detect wakers and unconditionally inject their I/O")
>>>>>>
>>>>>> has these problem(s):
>>>>>>
>>>>>>  - Target SHA1 does not exist
>>>>>>
>>>>>> Maybe you meant
>>>>>>
>>>>>> Fixes: 13a857a4c4e8 ("block, bfq: detect wakers and unconditionally inject their I/O")
>>>>>>
>>>>>
>>>>> Hi Jens,
>>>>> how to proceed in such a case (with patches already applied by you)?
>>>>> Shall I send you a v2 with only this change?
>>>>
>>>> We just have to ignore it... But in the future, always double check that
>>>> you are using the right shas, not some sha from an internal tree.
>>>
>>> FWIW I have a commit hook in my git tree that just refuses a commit with
>>> unknown Fixes tag SHA. Exactly to catch such mishaps in the patches I
>>> merge...
>>
>> That's not a bad idea, would help catch it upfront. Can you share the
>> hook?
> 
> Sure, attached. Note that the hook just gets commit ID from the Fixes tag
> and formats it with 12 commit ID digits and appropriate commit subject.

Thanks, that looks great, and also fixes up short shas.


-- 
Jens Axboe

