Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1903263AA2F
	for <lists+linux-next@lfdr.de>; Mon, 28 Nov 2022 14:56:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231638AbiK1N4T (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Nov 2022 08:56:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231487AbiK1N4O (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Nov 2022 08:56:14 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DF9F2720
        for <linux-next@vger.kernel.org>; Mon, 28 Nov 2022 05:56:13 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id g12so16912836wrs.10
        for <linux-next@vger.kernel.org>; Mon, 28 Nov 2022 05:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F2rLacxUObBe+jKgqxP8HF2H2frn8aAUW2KYNeoqu0o=;
        b=hqvpHZF2c9j+Ix/NAoQA7E3AYXA/CPshROvYliXYTwLIj4BCxP+hdJfKRnmVFRTTNL
         kjGBp/ECsDODWCaEOdKyL9djCWno68YNfIgCE9BmeNk7l+F8xk0znTZehS0Hz0mXNRWt
         6P/kLBXL17H/IrY6ZHNhzw7S+H7NOmIXbAZnyLlR4zjrWJbioavvvPKgJsOIOUKKnrPS
         h+YTQm/uDo81cPF5NCwBx/suW3GZuAXzIKA+MarDmvkPH/ldEqyEJF3RmzR4xH88tz3W
         +NVIpt2lO0eXOuCTLrkTNrDs/uf7DtPg9nAEeXXAjah49mwtaZVcrup6xV6PSwhe9+4y
         GUOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F2rLacxUObBe+jKgqxP8HF2H2frn8aAUW2KYNeoqu0o=;
        b=7SZw2m+Wxw26zlyAxWWqmkQKtjCe/0Qy/KP0zYYG6vUzV4HI2jvaMNYJX8mCoBd7O+
         sup4JzHAT1VPczsiO6IhsDoOmYrGanadP/NqUIbXQYRGGjKyjY9PlZPULlVfcIIu0fjI
         ylz3ljEJ2LzGR7aC9k7kvpyKcxnm4K0oWb72xDkfWFAnTPq6IlbMU7APxN21oRIgmVeW
         58dZt6x9/F3/byssrVoiYVn54gjcEqiERD+AVGD4+q7GZIkkxdafl+Bp39BcardtRbhn
         QBaQe4ZO21b1GyCLs4sD4V2gGXnGIdUrtHI+IexoU4IMD3VbsIeByFP4x92f/eXxQ5Bq
         G9Qw==
X-Gm-Message-State: ANoB5pkbmVJcU6Epki1DZNpctRiCS/KdGDkl2+zLh+sYsNpyUXWn3ZDw
        FJFXEwYOOIwIrj/5fRLKnmmtXw==
X-Google-Smtp-Source: AA0mqf7jP1nll4R/qrgr1NBSFz8yRU+bGAmMwBkDuCsQRh8/v5yyw518D6w/AZXNUE++ynRJ8MHXBQ==
X-Received: by 2002:a5d:5233:0:b0:241:cc24:b65c with SMTP id i19-20020a5d5233000000b00241cc24b65cmr24417118wra.545.1669643771872;
        Mon, 28 Nov 2022 05:56:11 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id z6-20020adfe546000000b0023655e51c33sm11087810wrm.4.2022.11.28.05.56.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 05:56:11 -0800 (PST)
Message-ID: <70ee6a63-de17-100f-d4fd-8b23ab92bfee@linaro.org>
Date:   Mon, 28 Nov 2022 14:56:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: linux-next: manual merge of the thermal tree with the pm tree
Content-Language: en-US
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Zhang Rui <rui.zhang@intel.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Guenter Roeck <linux@roeck-us.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        rafael@kernel.org
References: <20221117122904.6759427e@canb.auug.org.au>
 <20221128102212.39f90b0c@canb.auug.org.au>
 <1a60d0b2-c020-4fce-d7f2-3534c9e14c84@intel.com>
 <9ac3a182-fc30-0834-8555-a4ec334531ae@linaro.org>
 <Y4S8H/hn1EJzw8fL@debian.me>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <Y4S8H/hn1EJzw8fL@debian.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 28/11/2022 14:48, Bagas Sanjaya wrote:
> On Mon, Nov 28, 2022 at 02:22:27PM +0100, Daniel Lezcano wrote:
>>
>> Hi,
>>
>> On 28/11/2022 13:51, Rafael J. Wysocki wrote:
>>> Sorry about this, but I cannot fix it myself and Daniel is on an
>>> extended leave.
>>>
>>> Can you just drop it permanently from linux-next and we'll sort this out
>>> when Daniel is back?
>>
>> Yes sorry for that, I'll go back in a couple of days and sort this out
>>
> 
> What about the upcoming merge window? At worst Linus has to figure
> out how to solve this complex conflict when pulling either tree...
> 
> Linus has already said that there's likely -rc8 of current cycle [1],
> so we have about two weeks to try sorting out the conflict and be ready
> for PR to him.

Thanks for the pointer.

I've been quickly through the changes for the thermal tree and I think I 
should be able to sort out most of the patches before the end of this 
week, hopefully. If there are any changes which sound too complex, I'll 
post pone them to the next release

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

