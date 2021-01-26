Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7DED304316
	for <lists+linux-next@lfdr.de>; Tue, 26 Jan 2021 16:55:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391730AbhAZPtX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Jan 2021 10:49:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392699AbhAZPsj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 Jan 2021 10:48:39 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D859CC061D7F
        for <linux-next@vger.kernel.org>; Tue, 26 Jan 2021 07:47:57 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id m6so10665416pfk.1
        for <linux-next@vger.kernel.org>; Tue, 26 Jan 2021 07:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1x9LcmflL/RTdretuBZJnXxKrfKid3zNWQywy21TUpc=;
        b=qaKSUwQtZ2h/z3VY8p3dor+qBdjQvTF50BJYaN/IFpwDvVfRwsY/7gKmpff4psZmDo
         EIAhDAhUxcEfgckDZ9YnAG+HuWDSEtDTVW2qbbaL13bV51sjtzdGAy2JkvrRsRyDahvh
         0GfK3PvWWYyISL/+FRHmaOfqUBy1nx4KiXuUEmVoJrY9aVc+qV/d18ZTwySSbuv41lo+
         xv66T++ko3TmO8LQPyeEzLUNwpClh+6vSjA6QurcUKj1KCIZUVvXK5iquJJK9AdmkF0p
         5neCeQ4iU0plRWfdr5N1/rq+iMWOVrKMfjQn3bzBVoz7mQqbYP65jfW+PoPvhl1H+lmk
         ArGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1x9LcmflL/RTdretuBZJnXxKrfKid3zNWQywy21TUpc=;
        b=c75Mrrw+EpMBzKFB3OJKrNeBMzdV/Y7hU4b3ka1v1eOMFj4WuLF7d/5Pj1eaR0BMF2
         3AJZDPtKtqhPi6yOfGb/97heTM00624BGQlTNo9TmZUGri0MGMp4sFGW+lypTu0u4IUC
         pF3WxspsL+TahC5sPHDYog4X1mGn5c4bzdNefWvrcaN3LBBYs7edbvvsPEpbBADkeeMw
         fCBUMP1J1pHjENkURgl49LJOaQmWPB0sYmWL8NsG5DJ/Qvrbw4g4eFq60wdL8ZfXMc91
         csAc3p2l9/ExrSPr6+TUaMmcogXdWFGyC+HY5AKYdRUXVdMDm82gmeB963APpYk4nCCp
         5X1g==
X-Gm-Message-State: AOAM531RbOIlZuDt55/rV+16dUfTL3bpLgKcXE+SkmK6C/mPCDeQykMQ
        io9L43OvIflQ+PZfkHszf0yWhJnG7R1CyA==
X-Google-Smtp-Source: ABdhPJzpVv6puQt3HY7WsP4woZzvAy3kkO5fdI8te5lGrQBAdCBMyyIzLbeEnD9ZmYABOohmWggLcA==
X-Received: by 2002:a63:450d:: with SMTP id s13mr6063176pga.443.1611676077130;
        Tue, 26 Jan 2021 07:47:57 -0800 (PST)
Received: from [192.168.4.41] (cpe-72-132-29-68.dc.res.rr.com. [72.132.29.68])
        by smtp.gmail.com with ESMTPSA id fv12sm2610575pjb.22.2021.01.26.07.47.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jan 2021 07:47:56 -0800 (PST)
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
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <a2d6399c-ba61-472b-1bf2-aa261d7dbbbe@kernel.dk>
Date:   Tue, 26 Jan 2021 08:47:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210126132946.GC10966@quack2.suse.cz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 1/26/21 6:29 AM, Jan Kara wrote:
> On Mon 25-01-21 11:39:50, Jens Axboe wrote:
>> On 1/25/21 11:35 AM, Paolo Valente wrote:
>>>
>>>
>>>> Il giorno 25 gen 2021, alle ore 10:40, Stephen Rothwell <sfr@canb.auug.org.au> ha scritto:
>>>>
>>>> Hi all,
>>>>
>>>> In commit
>>>>
>>>>  d4fc3640ff36 ("block, bfq: set next_rq to waker_bfqq->next_rq in waker injection")
>>>>
>>>> Fixes tag
>>>>
>>>>  Fixes: c5089591c3ba ("block, bfq: detect wakers and unconditionally inject their I/O")
>>>>
>>>> has these problem(s):
>>>>
>>>>  - Target SHA1 does not exist
>>>>
>>>> Maybe you meant
>>>>
>>>> Fixes: 13a857a4c4e8 ("block, bfq: detect wakers and unconditionally inject their I/O")
>>>>
>>>
>>> Hi Jens,
>>> how to proceed in such a case (with patches already applied by you)?
>>> Shall I send you a v2 with only this change?
>>
>> We just have to ignore it... But in the future, always double check that
>> you are using the right shas, not some sha from an internal tree.
> 
> FWIW I have a commit hook in my git tree that just refuses a commit with
> unknown Fixes tag SHA. Exactly to catch such mishaps in the patches I
> merge...

That's not a bad idea, would help catch it upfront. Can you share the
hook?

-- 
Jens Axboe

