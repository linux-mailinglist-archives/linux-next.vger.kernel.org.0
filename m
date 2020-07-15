Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC0A62210CE
	for <lists+linux-next@lfdr.de>; Wed, 15 Jul 2020 17:25:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726431AbgGOPZU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Jul 2020 11:25:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725797AbgGOPZT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 15 Jul 2020 11:25:19 -0400
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com [IPv6:2607:f8b0:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABCC5C061755
        for <linux-next@vger.kernel.org>; Wed, 15 Jul 2020 08:25:19 -0700 (PDT)
Received: by mail-il1-x142.google.com with SMTP id r12so2313995ilh.4
        for <linux-next@vger.kernel.org>; Wed, 15 Jul 2020 08:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BiW/jN3rL+5vGHysOrPdpgcbXQ4vTbW3++qctnxB/PU=;
        b=eZCm30jQ/Qc+jKEddMFpjDPUVEJDOJ2pl/XK/6BHPnks2yC1LwQwIKyv72gOpCc6lc
         lV81aiqejy5GKid9iK4bdpHGG/fBYBLb5XGkgsdTCfkIjXi2/GWPuKIalBW0LrzcNSrU
         XcsZZBEuWTXwmSEhKlt7lzekUjfaG5Lsamwwlenik2+LS3CnQKlul6rk9OLweAfWtFQC
         1jZPq65bO0bPOuDCA8LxZgIdSEZ9UTt3m3z4V7IKYgYsre3DSs0nLb5odTdPgmqx2AQY
         VENjRQfFl1AyCQ7C6PfzkuQd0KL0GmxDixcrjek12RxJJX0P9gBC0BYi2B2+soPTUwsp
         M1Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BiW/jN3rL+5vGHysOrPdpgcbXQ4vTbW3++qctnxB/PU=;
        b=lwEdJ4ousgDUmquWYA0v6OqWwuU1tZSGiOUgR0dV6GWbRFKBkudxC6kVGVl4iHkpC0
         QqDCtfO2a68ccmW0IiMu9ikPROvdwn5miE4Kz4ASbXbgURg2gbMSjQyqiVzzchatJc2n
         EU/0F06DlBjheE/4GsmdlvlzRxSFzuv0pOtI/tI6Q5TTt7jgeyvZqZOqHPC6vP9H2W7B
         BL2wTMSWK+ZSkq7rhJ8OWHJCAqmQvjy0TB3lzOQDKNGjC1o2da3rWafHej2Zw3qLS+Pf
         U0iMfdZE/7zrvFjHhwVqKTwjMeOeK4tM+NvNoBgO1WdJErbrXesoTzqLOcgc2Ga0tvIq
         tyIw==
X-Gm-Message-State: AOAM5335lLy0Lp+X6OGRNxxj5j+CDsa5KNKXPBokojH/+GQa6q6o0F9g
        TQzZZfUieTc2O8xiSZPETLHsYw==
X-Google-Smtp-Source: ABdhPJwCzhW5e78PQkSIJCl8zdBuhNHkvJMbJPY3jb2g/z33Q628vl8nCYLAPnihmkQZXphfIS5mwg==
X-Received: by 2002:a92:8b0e:: with SMTP id i14mr9796070ild.307.1594826718885;
        Wed, 15 Jul 2020 08:25:18 -0700 (PDT)
Received: from [192.168.1.58] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id a13sm1211031ilk.19.2020.07.15.08.25.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2020 08:25:18 -0700 (PDT)
Subject: Re: linux-next: build failure after merge of the block tree
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200715121423.6c20731b@canb.auug.org.au>
 <CAMuHMdWMmP_YHEwnqmuTMw4-+LSieRaSHeqPLYLZyLq+O7zhyQ@mail.gmail.com>
 <6bc36827-83a7-3695-530d-4b90c08b92c7@kernel.dk>
 <CAMuHMdU3uRV+8ep0YRKuqBitkfVchh1L7=+RVxCAL0rMrQHAiQ@mail.gmail.com>
 <CAMuHMdW78E0xe2ogeF0tAK3EN0vBr-B1RBOQTqi4t_9ByUiEEw@mail.gmail.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <44248db6-ff4d-aa83-a89e-dd712d540577@kernel.dk>
Date:   Wed, 15 Jul 2020 09:25:17 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdW78E0xe2ogeF0tAK3EN0vBr-B1RBOQTqi4t_9ByUiEEw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 7/15/20 9:22 AM, Geert Uytterhoeven wrote:
> Hi Jens,
> 
>> On Wed, Jul 15, 2020 at 5:08 PM Jens Axboe <axboe@kernel.dk> wrote:
>>> On 7/15/20 3:24 AM, Geert Uytterhoeven wrote:
>>>> On Wed, Jul 15, 2020 at 4:26 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>>>> After merging the block tree, today's linux-next build (arm
>>>>> multi_v7_defconfig) failed like this:
>>>>>
>>>>> block/blk-timeout.c: In function 'blk_round_jiffies':
>>>>> block/blk-timeout.c:96:14: error: 'CONFIG_HZ_ROUGH_MASK' undeclared (first use in this function)
>>>>>    96 |  return (j + CONFIG_HZ_ROUGH_MASK) + 1;
>>>>>       |              ^~~~~~~~~~~~~~~~~~~~
>>>>>
>>>>> Caused by commit
>>>>>
>>>>>   91ba0f529364 ("block: relax jiffies rounding for timeouts")
>>>>>
>>>>> CONFIG_HZ_ROUGH_MASK is not defined for this build even though
>>>>> CONFIG_HZ_100 is set. The arm arch does not include kernel/Kconfig.hz.
>>>>>
>>>>> I have reverted that commit for today.
>>>>
>>>> (as I don't have the original patch in my email, I'm commenting here)
>>>>
>>>>     +config HZ_ROUGH_MASK
>>>>     +       int
>>>>     +       default 127 if HZ_100
>>>>     +       default 255 if HZ_250 || HZ_300
>>>>     +       default 1023 if HZ_1000
>>>>
>>>> What about other HZ_* values?
>>>
>>> Which other ones do we have?
>>
>> $ git grep "\<HZ_[0-9]" -- "*Kconf*"
>> arch/alpha/Kconfig:     default HZ_128 if ALPHA_QEMU
>> arch/alpha/Kconfig:     default HZ_1200 if ALPHA_RAWHIDE
>> arch/alpha/Kconfig:     default HZ_1024
> 
> And ARC allows you to enter any integer value:
> 
>     config HZ
>             int "Timer Frequency"
>             default 100
> 
> So probably you want to derive something from the integer value itself.
> 
> Note that not all architectures include kernel/Kconfig.hz.

I've dropped the dependency on Kconfig solving it, and just made it
an initcall setup to generate the mask. That should work on all archs
and not be dependent on fixed HZ settings.

-- 
Jens Axboe

