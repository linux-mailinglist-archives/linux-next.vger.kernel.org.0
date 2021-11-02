Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A09144431A7
	for <lists+linux-next@lfdr.de>; Tue,  2 Nov 2021 16:26:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234586AbhKBP2w (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 2 Nov 2021 11:28:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28479 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234594AbhKBP2v (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 2 Nov 2021 11:28:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635866776;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=89OwjSHhRUc5TKARB/wwFNGb4/vNxlAmpJoF8OrxBjs=;
        b=iUs7dkynbei0t21toAV4SyTJXeDHA8rtZi5ufGAeD6lXkB9z2XQi+HQXStNRn3Jj4FkgL8
        xNrtUMG3Wp8+n9uIpo/xWKdKVysLpIRQovc9HWEC9iPTDCtxxn/2xdZOE2HJaA9lKs43ue
        qFO1srindj+1DtTqT3clePit/EYthMg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-35MPvFPONR-kVwrPAK1_YQ-1; Tue, 02 Nov 2021 11:26:15 -0400
X-MC-Unique: 35MPvFPONR-kVwrPAK1_YQ-1
Received: by mail-ed1-f69.google.com with SMTP id g3-20020a056402424300b003e2981e1edbso4678177edb.3
        for <linux-next@vger.kernel.org>; Tue, 02 Nov 2021 08:26:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=89OwjSHhRUc5TKARB/wwFNGb4/vNxlAmpJoF8OrxBjs=;
        b=c+9BkmeUyzbWWnda35VlQP9AzDHHA1aWZuOc1Wha2wpF9WddLhxtbTTN9O1QDQ+/Wl
         +PkOt7SZS96GSs+bZNk2EDIAQ+H76mY0cuUu/cRbjwb/bGEC4MKom75qrx7EVc1E4+2j
         XOcbWm9QxS/CgCq4IcDo3e5WzxVIg/vWBwKj7EGhRWwZgPzUsuLJteTMdXrS7jbsCSO4
         /ZlRU2JXv8BxiJh6P88Cl5s/U8J9IUd5oB9Bp9sCM+/5XXFWqx3tNJrnYdG4V4Cc1lfs
         iZLjp9R1n5OkRVYMkQBwIIHZ63wM5Mg9SXDN6HSK3ep3b0qemYB1PxhPud/8SjPB115L
         kDzQ==
X-Gm-Message-State: AOAM5318OaAhqI7SDa6l1LPDmHkwUF5L2M+8kue5hbmiYw1rel5xF8Pp
        oTknC4x4oy0DJpmg8Pp4//SqNPvH6Sk2pT7v/f8ZI1TDxuu8oj8rZ3l0SyACqRjf2F29nnWkTP5
        IteVyC4CNTnLr1UXVsuOcfg==
X-Received: by 2002:a05:6402:4401:: with SMTP id y1mr12668614eda.225.1635866774249;
        Tue, 02 Nov 2021 08:26:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAn2UDGcrFsyIYOLDeKibrEe02o7BrQtwnWNva9u6fGpKkXaOt/FpdFXQqm48SR6QpVZTb3A==
X-Received: by 2002:a05:6402:4401:: with SMTP id y1mr12668583eda.225.1635866774054;
        Tue, 02 Nov 2021 08:26:14 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id sg17sm3526921ejc.72.2021.11.02.08.26.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Nov 2021 08:26:13 -0700 (PDT)
Message-ID: <0bd6303e-1f93-1fc0-1dcc-329092ac9963@redhat.com>
Date:   Tue, 2 Nov 2021 16:26:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: linux-next: Tree for Nov 2 (drivers/platform/x86/amd-pmc.o)
Content-Language: en-US
To:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
References: <20211102191553.7467166d@canb.auug.org.au>
 <caa259b7-0560-647d-80d0-6dd25a6f09d2@infradead.org>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <caa259b7-0560-647d-80d0-6dd25a6f09d2@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

On 11/2/21 16:14, Randy Dunlap wrote:
> On 11/2/21 1:15 AM, Stephen Rothwell wrote:
>> Hi all,
>>
>> Please do not add any v5.17 related material to your linux-next included
>> trees until the merge window has closed.
>>
>> Changes since 20211101:
>>
> 
> 
> on i386:
> 
> ld: drivers/platform/x86/amd-pmc.o: in function `amd_pmc_suspend':
> amd-pmc.c:(.text+0x5db): undefined reference to `rtc_class_open'
> ld: amd-pmc.c:(.text+0x5ea): undefined reference to `rtc_read_alarm'
> ld: amd-pmc.c:(.text+0x604): undefined reference to `rtc_read_time'
> ld: amd-pmc.c:(.text+0x660): undefined reference to `rtc_alarm_irq_enable'
> 
> 
> Also "depends on RTC_CLASS" ?

Yes, thank you for reporting this. I've just send out my main PR
to Linus for 5.16, which includes the amd-pmc changes here.

I'll prepare a patch and include that in my first fixes PR to Linus
once 5.16-rc1 is out.

Regards,

Hans

