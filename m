Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43B3943A5DC
	for <lists+linux-next@lfdr.de>; Mon, 25 Oct 2021 23:29:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233308AbhJYVby (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 Oct 2021 17:31:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34878 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233674AbhJYVbw (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 25 Oct 2021 17:31:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635197369;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UIAILnvmh2/9j33N6oAfYSNJRTmxRzsLhCUoA4trZck=;
        b=bawaqQcXyOmee01AU3+g0l2vVGB8ev1pBzv70N/t8dMxyxfdEC9WquK+7htWgmDl9hyumd
        4tCqBbde8ZwryIhPweFrOwj7HlZLQKR2GAVizNq+F0e+xaKQGdMaMGhIUyhFwWuNxT1yZb
        9nCWy29xqmi8ptFrBbvu6iLJQi3pyns=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-Vf5qxSqJMnOMWJOHayD-5w-1; Mon, 25 Oct 2021 17:29:27 -0400
X-MC-Unique: Vf5qxSqJMnOMWJOHayD-5w-1
Received: by mail-ed1-f72.google.com with SMTP id j17-20020aa7ca51000000b003dd395c0389so6297408edt.4
        for <linux-next@vger.kernel.org>; Mon, 25 Oct 2021 14:29:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=UIAILnvmh2/9j33N6oAfYSNJRTmxRzsLhCUoA4trZck=;
        b=lioKcBOvXlWZl2vON7mW28+vtiRQAAMqTVbsy1vwFe2gmnmoHbxYHOejTwJXfq6p5Q
         Aykp1hm4HMrjAl5PiafbP6ytaKRVWoJKHNAFvFajXJLqssUIFZstbFVWpYVZBuN/I2B4
         R+c4Xrbf3jTJAnlR/rQXGf56KtEwDJQKEW61qEhgPmNJgrb0nLA3t8kshz1vj6UacDau
         IoeuuN9dip9ULW12rmHW2277PPtDEB37uCf6UI7vs0R5dzb3GZ7Vi+JTHAJ1kTnj0mMg
         M9rzeLRA5JHZvXcPmOFXgfaJ7dXFfpgJjhzpUsWYA7ANX0uAr8j9tSO46hj7bxu+yf9N
         uk5A==
X-Gm-Message-State: AOAM532uJx/Lki7r/yGtPmc36+cpLmxiC4BPiG4Fy3TQeMUhkVQE6DdA
        EoODRfk6/MpbwJXSHkbobSZOKsSDoh6iDx8042jeRvw0fpG+UcJpEBw6FvPuSQ0uThoNmb+Nz3I
        VJtNVRbaVnHsLe/0AbCNn9A==
X-Received: by 2002:aa7:d597:: with SMTP id r23mr20892321edq.173.1635197366528;
        Mon, 25 Oct 2021 14:29:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBXicjEvqfzjQGmMrGMrVfZ0t6sWdigCRR5A3wK4GkKr68KFXxwwGJi7WxzddZAAO7jdFklQ==
X-Received: by 2002:aa7:d597:: with SMTP id r23mr20892299edq.173.1635197366371;
        Mon, 25 Oct 2021 14:29:26 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id b9sm9733063edk.62.2021.10.25.14.29.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Oct 2021 14:29:26 -0700 (PDT)
Message-ID: <92c26aee-d3eb-258c-a0dd-e09783db6a20@redhat.com>
Date:   Mon, 25 Oct 2021 23:29:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: linux-next: Tree for Oct 25 (drivers/platform/x86/amd-pmc.c)
Content-Language: en-US
To:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mario Limonciello <mario.limonciello@amd.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
References: <20211025204921.73cb3011@canb.auug.org.au>
 <af7d7b8f-45fd-53c5-a8c4-1f594a16111e@infradead.org>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <af7d7b8f-45fd-53c5-a8c4-1f594a16111e@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

On 10/25/21 22:50, Randy Dunlap wrote:
> On 10/25/21 2:49 AM, Stephen Rothwell wrote:
>> Hi all,
>>
>> There seems to be something amiss with cnosole output in today's release
>> (at least on my ppc qemu boot tests).
>>
>> Changes since 20211022:
>>
> 
> on x86_64:
> 
> ../drivers/platform/x86/amd-pmc.c: In function ‘amd_pmc_verify_czn_rtc’:
> ../drivers/platform/x86/amd-pmc.c:428:30: error: ‘CONFIG_RTC_SYSTOHC_DEVICE’ undeclared (first use in this function); did you mean ‘CONFIG_RTC_HCTOSYS_DEVICE’?
>   rtc_device = rtc_class_open(CONFIG_RTC_SYSTOHC_DEVICE);
>                               ^~~~~~~~~~~~~~~~~~~~~~~~~
>                               CONFIG_RTC_HCTOSYS_DEVICE

Hmm, yes using either CONFIG setting is a problem since it is not always
defined. Both simply default to "rtc0" though and this is also which
standard distro configs use.

Mario, can we just replace CONFIG_RTC_SYSTOHC_DEVICE with "rtc0"
here to fix this ?

Regards,

Hans

