Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 737053955E2
	for <lists+linux-next@lfdr.de>; Mon, 31 May 2021 09:18:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230226AbhEaHT7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 31 May 2021 03:19:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230150AbhEaHT5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 31 May 2021 03:19:57 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C863C061574
        for <linux-next@vger.kernel.org>; Mon, 31 May 2021 00:18:18 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id o2-20020a05600c4fc2b029019a0a8f959dso2648543wmq.1
        for <linux-next@vger.kernel.org>; Mon, 31 May 2021 00:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yzOPm44mU6wdSe0rFBtn0wpByYVkRe5hZQ+xGNYSjCk=;
        b=yVc9QFFp4SSuyoFdUxPxOZU59Lr6Z/Dnl7dX+Hl6zqhNW1rOZ82rc86PQjIRbR10zg
         sZqgpf4bOYkCrFKdZyqYsyoP0ZyNSUpZzKpINli4A0Qs+hliobtdbAtvz5zGTivceGN7
         2tRhmlkAuC66EjY3+wohoyMnsAHe6xKtCkf80cKoJ5Z3RrEs1KDo38F+fiQHucBTu9q3
         ZLH8xvZ0wAy0RBoszOxBHkEDHzbM8RC/VJOjGFbL4TVU9IOe/a/ZUKgvmxHh6YaIKk8e
         7G9joCor3U9pKL7y6+uUnT7QifFMz3jZJF0SBSXOiXOsN5RpuNZXG8rllY8DPSTlL0WI
         x1Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=yzOPm44mU6wdSe0rFBtn0wpByYVkRe5hZQ+xGNYSjCk=;
        b=CmCaWF8SSAxi0iLKbxsGR3vZpE+6eek+XNtWGrRbYjP/cjezolQ8jBaPOBIo+b1raL
         j+ZQePPcNAN/PzFTHvP1jfvx96UIEhugX+td+sOJrALVaYjnjO/p5ay9Pq7gUb7scU6F
         /O7Vh+hTimjCGKwF2JBD+Xeo3WwPIfTmE3+DDD/WSrsE6g+CD2AgygGd61wg2nld44UA
         pz9QJm6b5YGuc7W3mhVEsUsERBFBeDnEwuaxMnj7YHYaDT0mB8W2Yk/IkR54vNCsGPF0
         LejKdOD+mPkfMr/K28vjdKGZsCSQNbX1cyeclH6RykWuHezW8mugFxpXbNpWbhpJ2yqF
         16qQ==
X-Gm-Message-State: AOAM5333RSDtkQ6yoOUcwu3AZhQqbaKwkyxGgLbuMDO4LbVm1ba1YQF0
        E3e8YIUc7NWdlb8XHg4CSw9kVA==
X-Google-Smtp-Source: ABdhPJwVmIyNrhSc2AwqfskqYQcQpraO8DqOj3l17pvV3m4Y7YQmhYRV1JFTSfzaxaEUdpDs0MMSPA==
X-Received: by 2002:a05:600c:2301:: with SMTP id 1mr24997444wmo.180.1622445496932;
        Mon, 31 May 2021 00:18:16 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:6567:aa5c:6dc2:fff8? ([2a01:e0a:90c:e290:6567:aa5c:6dc2:fff8])
        by smtp.gmail.com with ESMTPSA id t14sm15809230wra.60.2021.05.31.00.18.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 May 2021 00:18:16 -0700 (PDT)
Subject: Re: updated Amlogic repo used for linux-next
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Kevin Hilman <khilman@baylibre.com>
Cc:     Carlo Caione <carlo@caione.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        linux-amlogic@lists.infradead.org
References: <7hmtsgrpkt.fsf@baylibre.com>
 <20210528083821.72dda431@canb.auug.org.au>
From:   Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <610bbec0-d8c6-4ce2-ffc3-80dd124653d0@baylibre.com>
Date:   Mon, 31 May 2021 09:18:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210528083821.72dda431@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 28/05/2021 00:38, Stephen Rothwell wrote:
> Hi Kevin,
> 
> On Thu, 27 May 2021 11:36:50 -0700 Kevin Hilman <khilman@baylibre.com> wrote:
>>
>> Please update the tree used for Amlogic SoC kernel development
>> (suggested patch below[1].)
>>
>> We've switched to a maintainer group for this tree which is now
>> co-maintained by myself and Neil (cc'd)
>>
>> [1]
>> diff --git a/Next/Trees b/Next/Trees
>> index 2d22ca1d2911..1794b9144f3a 100644
>> --- a/Next/Trees
>> +++ b/Next/Trees
>> @@ -103,7 +103,7 @@ arm64		git	git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux#for-next/co
>>  arm-perf		git	git://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git#for-next/perf
>>  arm-soc		git	git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git#for-next
>>  actions		git	git://git.kernel.org/pub/scm/linux/kernel/git/mani/linux-actions.git#for-next
>> -amlogic		git	git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git#for-next
>> +amlogic		git	git://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git#for-next
>>  aspeed		git	git://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git#for-next
>>  at91		git	git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git#at91-next
>>  drivers-memory	git	https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git#for-next
> 
> I have updated the tree URL and added Neil as a contact.  I still have
> Carlo (cc'd) listed as a contact, is that correct?
> 
> [The following for Neil's benefit]
> 
> Thanks for adding your subsystem tree as a participant of linux-next.  As
> you may know, this is not a judgement of your code.  The purpose of
> linux-next is for integration testing and to lower the impact of
> conflicts between subsystems in the next merge window. 
> 
> You will need to ensure that the patches/commits in your tree/series have
> been:
>      * submitted under GPL v2 (or later) and include the Contributor's
>         Signed-off-by,
>      * posted to the relevant mailing list,
>      * reviewed by you (or another maintainer of your subsystem tree),
>      * successfully unit tested, and 
>      * destined for the current or next Linux merge window.
> 
> Basically, this should be just what you would send to Linus (or ask him
> to fetch).  It is allowed to be rebased if you deem it necessary.
> 

Noted !

Thanks,
Neil
