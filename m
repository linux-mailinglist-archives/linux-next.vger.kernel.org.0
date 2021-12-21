Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEE4047BB61
	for <lists+linux-next@lfdr.de>; Tue, 21 Dec 2021 08:58:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235385AbhLUH6m (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 21 Dec 2021 02:58:42 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:53448
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235380AbhLUH6l (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 21 Dec 2021 02:58:41 -0500
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A2DA03F1BA
        for <linux-next@vger.kernel.org>; Tue, 21 Dec 2021 07:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1640073520;
        bh=pdk0rqVNGg8GOBmVYXYE0PO6Xsy3hz9CYzKWBDMLtvc=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=hYqpsHdVYeCzj6eUlKLWX+4tJD3Eo9NT9HcvA2FbtqbF635Fbv4+qPXPFYzjVdCd4
         9RzcwpHqFGoPCLQC35znZ27Kzl0YUf41bZ9iLJSPauqK79V5dbIkf/y+pjKcYDCADV
         tJ6R7y4rwEXLR/iUmqf3g0XR2zLRdjEg30M69UzJ4iSum+QryRuCfkMNBfmrd7O5Yj
         hONCZk1BQYiuLmgQ030ZTdhYmOhzYWL5Rvh5X+FbnYg73VHsQCHaISBV77CJJisHY5
         nygI9D3aBXLFhrYM2Xp3DSXyiLf/Y/EvLCBN5SjpX/EJe3ckjc/q4gkfVj60ISBmSS
         u7yu5fLmxXO2w==
Received: by mail-lj1-f199.google.com with SMTP id m20-20020a2eb6d4000000b002219b019ae8so1972999ljo.16
        for <linux-next@vger.kernel.org>; Mon, 20 Dec 2021 23:58:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=pdk0rqVNGg8GOBmVYXYE0PO6Xsy3hz9CYzKWBDMLtvc=;
        b=yMZ+POg1vqOovkdn7wEKwnZhfFcsgDn0D5UXVF39XDMxsXR39JOSobMbvTBPVTPeLM
         xzpsq/wJZ3y2jTcpPQ92cCk0Lp+94r/H+Sta6sM7wqGH3ScHMyUdnbnru1z5bM0a8RaH
         aD4VXG5Nz9vX6sEV2W5p8bEc/NLskzqcEPteb2xK4YiaCVE9Lvh6khlHbVezHz+YWZTB
         5gWjddCVF8HREe//LBMqAlL6KvkdG4B6crtfjSrfxdRLcQlXYAwA7x5LCzbhbBsGfsNN
         1KZ3nJljzQ25mtGL9c5a+M3G3tYvk/5oA/UcRnBwIlENba7qnZGG44pIqnWbUOPZd1T3
         rjNA==
X-Gm-Message-State: AOAM531i8r1N31SNeI4oIzQV4UEAL1gm6UaU75aX794jhlwEBGEoQEgh
        K5me1Tvm2wZzinu1DW/TlhsYYvWTot9wqREP8I3ZJPRYz/n5PmMhg+VGR012HZUtkp1rWWAwn2O
        6BvQbi2/8aaH/qmabVKfCz6VP+1Hgl3P5UyBpitc=
X-Received: by 2002:a2e:904b:: with SMTP id n11mr1696468ljg.120.1640073520061;
        Mon, 20 Dec 2021 23:58:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy6tFxWCCcCSBs+LY47MGdabh2z1CnORDM/crApTxNp+QlY+3k+UQKdBFLw/eqol+PpKxcAeA==
X-Received: by 2002:a2e:904b:: with SMTP id n11mr1696447ljg.120.1640073519803;
        Mon, 20 Dec 2021 23:58:39 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id v19sm2683822ljg.8.2021.12.20.23.58.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Dec 2021 23:58:39 -0800 (PST)
Message-ID: <bc65c2d7-7bfa-4ad5-aaff-8875370010b7@canonical.com>
Date:   Tue, 21 Dec 2021 08:58:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: linux-next: manual merge of the samsung-krzk tree with the arm
 tree
Content-Language: en-US
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Russell King <linux@armlinux.org.uk>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        ARM <linux-arm-kernel@lists.infradead.org>
References: <20211220094012.5a340d45@canb.auug.org.au>
 <20211221095314.432527ff@canb.auug.org.au>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211221095314.432527ff@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 20/12/2021 23:53, Stephen Rothwell wrote:
> Hi all,
> 
> On Mon, 20 Dec 2021 09:40:12 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> Today's linux-next merge of the samsung-krzk tree got a conflict in:
>>
>>   arch/arm/Kconfig
>>
>> between commit:
>>
>>   54f481a2308e ("ARM: remove old-style irq entry")
>>
>> from the arm tree and commit:
>>
>>   3ac5f9db26bb ("ARM: samsung: Remove HAVE_S3C2410_I2C and use direct dependencies")
>>
>> from the samsung-krzk tree.
>>
>> I fixed it up (see below) and can carry the fix as necessary. This
>> is now fixed as far as linux-next is concerned, but any non trivial
>> conflicts should be mentioned to your upstream maintainer when your tree
>> is submitted for merging.  You may also want to consider cooperating
>> with the maintainer of the conflicting tree to minimise any particularly
>> complex conflicts.
>>
>>
>> diff --cc arch/arm/Kconfig
>> index 15bc7fba0761,391f07c17096..000000000000
>> --- a/arch/arm/Kconfig
>> +++ b/arch/arm/Kconfig
>> @@@ -471,7 -478,7 +471,6 @@@ config ARCH_S3C24X
>>   	select CLKSRC_SAMSUNG_PWM
>>   	select GPIO_SAMSUNG
>>   	select GPIOLIB
>> - 	select HAVE_S3C2410_I2C if I2C
>>  -	select GENERIC_IRQ_MULTI_HANDLER
>>   	select NEED_MACH_IO_H
>>   	select S3C2410_WATCHDOG
>>   	select SAMSUNG_ATAGS
> 
> This is now a conflict between the arm and arm-soc trees.
> 

Thanks for letting us know.

Best regards,
Krzysztof
