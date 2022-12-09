Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FE08648141
	for <lists+linux-next@lfdr.de>; Fri,  9 Dec 2022 12:04:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229640AbiLILEL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 9 Dec 2022 06:04:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbiLILEK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 9 Dec 2022 06:04:10 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69637D2C3
        for <linux-next@vger.kernel.org>; Fri,  9 Dec 2022 03:04:09 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id l8so4531964ljh.13
        for <linux-next@vger.kernel.org>; Fri, 09 Dec 2022 03:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6xobukKqkE1uvp+3FJiV0MX8gjVFf8YH3wA0+dS2aMs=;
        b=bkqA2+CMhYvWs2YpmpkiKhIVuqE8p+eTA3zOn6fglRLsOJrXP+f6ECIqD/vEljO5a1
         wR/CszWxrOzKW2nzjOvyU/IzUIQiENtxJFMqZyiKb/LkOm/5B2RCxj2LPADLamKUOPHr
         PwDyrNZjeDexY77nJSaDzXgLy4FLybGLhusVjHmOBbSGbZxQA/fI56lIXXoaLZF32sTE
         56qRxctUuIsjrr2L7V8U1mvZ0NL0rPJqru0gT3sCTAk2bj+jAZdtbExafxwORhK0RHpI
         htUq8ViLjxPQXv6e2UEeB7ZtGRLUSPbIbr1mURJRGnHXv9YMjRBs66VXi3WctLpUa+ns
         I1Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6xobukKqkE1uvp+3FJiV0MX8gjVFf8YH3wA0+dS2aMs=;
        b=s7fcZWq50dg+KW+Po6mb2A68wlcJqOune3RuTpH0TfUAR2l5QznWaPOiYGruYLWkMp
         fWrpXCUAxI7lTIepJqplmkgaMM+344e8bhxrkPoiEOWawH1v+bWJ2CZ7Io42qzIych4D
         TAt5Ezce342f1/mJ/BibqM6wBTyd8bJCaUxi6lfcHV/JE44q5MDUkaFslHq92CD6E7iX
         zDmfM/D4Ytk7KKHXTZ59cJJGdmWIITnInG9LltgIjAAJBRV80cBiFp7t5V5HQFIbQxAr
         lLBgx2g0bZ636DOm5atJ6sp5kne/tUYgT5+PbG+uKrRCr1FhAHSYA2N/KQ1axwZQh97L
         UUaQ==
X-Gm-Message-State: ANoB5pmH8FpRNgVPJe42tFuhslZBsdDRQOyo6pkADaUfwAdT7s0XKEbO
        LaUT/d/+3obS6YBySPuYvxB8Sg==
X-Google-Smtp-Source: AA0mqf4CExJzZsiDuESfoaPfri+V75ycELo7qA6B+imS/ewnDP+hRtQmHp28vGmfjznCRvzJiYS+RQ==
X-Received: by 2002:a2e:7008:0:b0:27a:170c:1938 with SMTP id l8-20020a2e7008000000b0027a170c1938mr1202975ljc.25.1670583847781;
        Fri, 09 Dec 2022 03:04:07 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id 65-20020a2e0544000000b0026e0434eb1esm176642ljf.67.2022.12.09.03.04.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Dec 2022 03:04:07 -0800 (PST)
Message-ID: <35af7393-71a0-b15e-856e-0429cf4a177d@linaro.org>
Date:   Fri, 9 Dec 2022 12:04:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] memory: omap-gpmc: fix wait pin validation
Content-Language: en-US
To:     "B. Niedermayr" <benedikt.niedermayr@siemens.com>,
        linux-next@vger.kernel.org
Cc:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Roger Quadros <rogerq@kernel.org>
References: <20221209105817.576532-1-benedikt.niedermayr@siemens.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221209105817.576532-1-benedikt.niedermayr@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 09/12/2022 11:58, B. Niedermayr wrote:
> From: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
> 
> This bug has been introduced after switching from -1 to UINT_MAX
> for GPMC_WAITPIN_INVALID.

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.

I think you got only two addresses right in your entire CC/To list...

Please resend with correct addresses.


> 
> The bug leads to an error when the optional gpmc,wait-pin
> dt-property is not used:
> 
> ...
> gpmc_cs_program_settings: invalid wait-pin (-1)
> ...
> 
> Signed-off-by: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
> Fixes: 8dd7e4af5853 ("memory: omap-gpmc: fix coverity issue "Control flow issues"")
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>

Do not store maintainer entries in git log. There is no point.
Maintainer addresses come automatically and there is never a need to
keep automatic output in the history. Keep only people who need to be CCed.



Best regards,
Krzysztof

