Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D7C1467C6B
	for <lists+linux-next@lfdr.de>; Fri,  3 Dec 2021 18:22:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236004AbhLCRZf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 3 Dec 2021 12:25:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235894AbhLCRZe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 3 Dec 2021 12:25:34 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C589C061354
        for <linux-next@vger.kernel.org>; Fri,  3 Dec 2021 09:22:10 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id 77-20020a1c0450000000b0033123de3425so5458312wme.0
        for <linux-next@vger.kernel.org>; Fri, 03 Dec 2021 09:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MhRYkwGP9y8J66uLTyGKdYV6Wy72Se8HK2WrMyhEeTQ=;
        b=MXO1uUZFxb9pLVjd1EL0J360MIY6N0ro6yQT+NEhU5FcvQCSK/YaacRZKOgtoFIitv
         2H8pokCbuK+Ja71M9IO74t8xT+w1St8ffldZQ2Pp5HxZnuR3cU/kd+GIyMuFhz/BjEfe
         v59DUz5qzTJpJRvsH5weKauhWKHLJSAs+fPNB9xfyZ0Y9YhShVlNFu4KLDWbB3BXBPiB
         AaSiXKR9VjUp9kFx6Rcznxgyf2nUR8gLWSdDSXFwVMNjITINLI2lGzPV2fqnB7yWQbua
         1kAJGnVKpDgV2QZVntfvypake0L6+gBZKt22PlIFwj5+5kmlEdmR1tIN+9UUEHeqsgrl
         fjPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MhRYkwGP9y8J66uLTyGKdYV6Wy72Se8HK2WrMyhEeTQ=;
        b=U9m0mMfBrpY6RaFVF4S+DJOEwk6Mh8eRB4qAGMTYgOSQ9JrRsrUUHm0idBGRm5gySR
         Vzqp73StH7XrnIC6pRguffNntukZCj0cK/l334s+BariuAC1NzeLUlGJhc9M7Qj4RyE4
         T/sxc+B2EupnbGN+hmFXQrLKfrhXD5cq4KU/oi/KGaUuj2VblWc/AEYpuLLMzRGgwtBH
         uqzR6RyLzo7ri7vKtC1DubDdeF2hz/Zt3gz2w3lt5uaVJolGfUtqqmWkDyExs/py0noE
         lLnzDt1Pq49zcr51sYCbhclQ3SXlxjEUvU6Tagwga+DF2RhRnE6KUscDSDO3VSDLdqv2
         Aqig==
X-Gm-Message-State: AOAM531YLPtLqmvYIFGh7ozHkJigfDXp9/d1jSM3ryoPxuyDQd3lEpFJ
        LVp43XRkalXdKQIqT/fsvTZ/Ez+bt8MoJQ==
X-Google-Smtp-Source: ABdhPJxz0PGaPizeU5ApKPdlDsYUw3paucZczO+7RaaARzQmI0OQHybqH4s5Ru/NOmvJoNWYuEc7iw==
X-Received: by 2002:a1c:98ca:: with SMTP id a193mr16892696wme.162.1638552128748;
        Fri, 03 Dec 2021 09:22:08 -0800 (PST)
Received: from ?IPv6:2a01:e34:ed2f:f020:98bf:72f4:f216:41dc? ([2a01:e34:ed2f:f020:98bf:72f4:f216:41dc])
        by smtp.googlemail.com with ESMTPSA id d6sm3202136wrx.60.2021.12.03.09.22.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Dec 2021 09:22:08 -0800 (PST)
Subject: Re: linux-next: build failure after merge of the pm tree
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20211202102814.793d2f67@canb.auug.org.au>
 <f6e96a47-01a3-96f3-1ed7-e9a42c2b26bf@linaro.org>
 <1902790.PYKUYFuaPT@kreacher>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <33d6d418-535d-8df4-b674-6b4f498a8dbd@linaro.org>
Date:   Fri, 3 Dec 2021 18:22:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1902790.PYKUYFuaPT@kreacher>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 03/12/2021 17:50, Rafael J. Wysocki wrote:
> On Thursday, December 2, 2021 11:04:45 AM CET Daniel Lezcano wrote:
>>
>> On 02/12/2021 00:28, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> After merging the pm tree, today's linux-next build (x86_64 allmodconfig)
>>> failed like this:
>>>
>>> drivers/powercap/dtpm.c: In function 'init_dtpm':
>>> drivers/powercap/dtpm.c:466:21: error: unused variable 'dtpm_descr' [-Werror=unused-variable]
>>>   466 |  struct dtpm_descr *dtpm_descr;
>>>       |                     ^~~~~~~~~~
>>> cc1: all warnings being treated as errors
>>>
>>> Caused by commit
>>>
>>>   f751db8adaea ("powercap/drivers/dtpm: Disable DTPM at boot time")
>>
>> Rafael, will you drop the patch from your tree and I send a new one with
>> the local variable also, or shall I send a change on top of?
> 
> I'll fix this.

Ok, thanks. Sorry for the inconvenience


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
