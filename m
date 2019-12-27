Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7416B12BB20
	for <lists+linux-next@lfdr.de>; Fri, 27 Dec 2019 21:29:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726954AbfL0U3n (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 27 Dec 2019 15:29:43 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:41699 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726911AbfL0U3n (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 27 Dec 2019 15:29:43 -0500
Received: by mail-pf1-f195.google.com with SMTP id w62so15227819pfw.8
        for <linux-next@vger.kernel.org>; Fri, 27 Dec 2019 12:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Q56YtPeQYe1RO50kXP9kDOzdyA7v8u4JAONhxWUJ7MA=;
        b=dWi5j2NDka8kAeAVUtiEZO9NXGMcava3W9c/gIoKYrjQ6LsH1b/E4d84wedKpW6Y4m
         aMMEHT1dza4GmK++mptSRNX99NwqFDPP7zS4xbePi91c1gs+xQ1tE7jV+qwLvZOqGker
         wkESreZ8l/TAs2Fa33vLkykvc+5p9Aj7ZKcp8g9fXiLS6clhSyKz+quf4asNlXmH4wpg
         NFSmO1wD5tO9Z2rS/LEAuY8bfOQPfDpuoRy4rCQNE3Qmcb3nVE0PWNcMpR7JDfc+3GJ9
         SDUzFD+RtLgDYDogyRij8lwix4VKXK8EdVrGK5qYtS6dIEXunknKS+tJBw6GuP28CIT/
         QQww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Q56YtPeQYe1RO50kXP9kDOzdyA7v8u4JAONhxWUJ7MA=;
        b=AQ6LjXYNI0cH8sfE0VZEktLfnJ8EPuN5fRtbKIq41pEuGRh3U03w4WnwV/XlTe7OuM
         OpafdrhZFyX1V3bTh1wjn+LGlG2mDRvzByZh25+bKoJQLyYgpNXqMfbR27PtZjEU+ppw
         hbXp4ocJ5ojEDrkrKWBJhWAdhrzGD32RtGEB+yFnGyI5YcsjXXWfj0DRZroFu1FPPDQI
         vmfRTwArVyjf0AKLicVtnHQYhl/Vt38Pjykwcm1oM8UjGv+Ctfd6BvxOVYnyCb55wDug
         HVAFJpPdC62VZhEuMIlEd6z2N5zXHTYfkdYDvMtB4eX0ZoZVGpxXAmgtADi4P6F1KKVw
         Z+BA==
X-Gm-Message-State: APjAAAVWKnDHmrom1Q2OJTB7K6Rtwyei5rui6wtKhw4tpRp4fxJY/D44
        1S1UHpgAiZJJJs6e0np/AtmgjQ==
X-Google-Smtp-Source: APXvYqw3ya5tBnTxy+2Dg3s/dMCPC3zWcwsdSvi8bujegHZPfRana2wYXAjnJyDGiP04csHtpvtZIg==
X-Received: by 2002:a63:604:: with SMTP id 4mr58642176pgg.406.1577478582619;
        Fri, 27 Dec 2019 12:29:42 -0800 (PST)
Received: from [192.168.1.188] ([66.219.217.145])
        by smtp.gmail.com with ESMTPSA id u23sm41596206pfm.29.2019.12.27.12.29.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Dec 2019 12:29:42 -0800 (PST)
Subject: Re: linux-next: Fixes tags need some work in the block tree
To:     Florian Fainelli <f.fainelli@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jaedon Shin <jaedon.shin@gmail.com>
References: <20191228065553.6ba5d28f@canb.auug.org.au>
 <45665759-a76f-5631-51bd-488b04f6bf03@gmail.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <d3ae7893-9b60-ecc2-4a31-65d009ecbb95@kernel.dk>
Date:   Fri, 27 Dec 2019 13:29:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <45665759-a76f-5631-51bd-488b04f6bf03@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 12/27/19 1:27 PM, Florian Fainelli wrote:
> 
> 
> On 12/27/2019 11:55 AM, Stephen Rothwell wrote:
>> Hi all,
>>
>> In commit
>>
>>   1a3d78cb6e20 ("ata: ahci_brcm: BCM7425 AHCI requires AHCI_HFLAG_DELAY_ENGINE")
>>
>> Fixes tags
>>
>>   Fixes: 9586114cf1e9 ("ata: ahci_brcmstb: add support MIPS-based platforms")
>>   Fixes: 423be77daabe ("ata: ahci_brcmstb: add quirk for broken ncq")
>>
>> have this problem:
>>
>>   - Target SHA1s do not exist
>>
>> Perhaps you meant
>>
>> Fixes: 1980eb9bd7d7 ("ata: ahci_brcmstb: add support for MIPS-based platforms")
>> Fixes: 7de3244530bf ("ata: ahci_brcmstb: disable NCQ for MIPS-based platforms")
> 
> Yes, those are the two that should have been used, the two commits were
> extracted from a downstream tree where the upstream commits ended up
> looking slightly different, my script does not (yet) rewrite those, Jens
> would you want me to resubmit or can you rewrite the commit message in
> place?

It's too late unfortunately, Linus already pulled it. So we'll have to
live with it, at least the commit titles are correct so it should be
manageable.

-- 
Jens Axboe

