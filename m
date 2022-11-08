Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6466F620C6D
	for <lists+linux-next@lfdr.de>; Tue,  8 Nov 2022 10:39:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233259AbiKHJjz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Nov 2022 04:39:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233803AbiKHJjx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Nov 2022 04:39:53 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CB9A26AE5
        for <linux-next@vger.kernel.org>; Tue,  8 Nov 2022 01:39:51 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id b3so20444147lfv.2
        for <linux-next@vger.kernel.org>; Tue, 08 Nov 2022 01:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kSwog5ERxG3EokF124vpEbubj3vdn0vtr+WUZpZ5SIc=;
        b=gdeDy+kVAls2tF3+8sTJ9fVAWpvclXEl/RcjTan6GjLB1bEPXlpzRWWD0uXdzu1vWt
         A9zjjA8AiNshAQJha7dQq6pslJ8AKFoE61X7ry6GdgkBi2l4ef4jJJzdChn12qckcqBV
         S4w7wKz4e0ZYehkm8WUcCsJW+M94nMoOJ17Ae872c1lt7U9O+H1W25wcR6hYUffJYNVg
         YSnT8wyAo6SF7rmfLLi/6kMhx6zIBVZW7Wo1At5CiBc/vF+C1ceE0ejDpJo1rhNoNMGO
         n/nQCb8A1WmlLy8/+dN7yL8k85KRYFzmKVWRtZbfj3/PLlqvIGQ9NAgMMEh4oxjBa0qs
         31Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kSwog5ERxG3EokF124vpEbubj3vdn0vtr+WUZpZ5SIc=;
        b=Zae4s/a92Ri/93fFuTKFOJuhuETQ6IFc0mShm3Y6oeETzk4z5TemPOEW/tyHFm6hVI
         7b6kvRZn8+FdeHQVf6b9YrnGw5xGGutSRsj97Q1Jfpfs2AwZh7YyzQTizPNJFujJMMQO
         SWe+QX5//BjTc+z6YCMBWrjzE6VWCaIratdRnrKvraThI4RXtCQM9TcsJZmhvbpOPIRz
         9+BTJ2eSPuIvtAy9DWoTwUYbetzXLh2/750bLQL1RZaCL0j1qvfgFgK5pplnqDoy7bLV
         3zUeozWLoosX1fr3xNOVp4UxhiCRWa2L8HujMnWaBzfrb2ifbF2REgEJn6rcEwVPIVX3
         zGXw==
X-Gm-Message-State: ACrzQf2V71uZvsxOkpzyb+ZPwDHkVbZgsR+MbPolKHwWTzugf5DpUtfT
        IbbU1/Qsvxj0oD389SwFdXXxVA==
X-Google-Smtp-Source: AMsMyM6aCyd7GLTchlaoL+Cpdzc6zcZSwGdB4+XrqFm7lPITXo+4Eqv8OHH2Ff2W8eeXs7CVhE7+RA==
X-Received: by 2002:a19:dc48:0:b0:4a8:d24b:d78 with SMTP id f8-20020a19dc48000000b004a8d24b0d78mr20399524lfj.351.1667900389861;
        Tue, 08 Nov 2022 01:39:49 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id t3-20020a19ad03000000b004a459799bc3sm1700025lfc.283.2022.11.08.01.39.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 01:39:49 -0800 (PST)
Message-ID: <32f42513-0c55-042e-2530-c58d980a9ce0@linaro.org>
Date:   Tue, 8 Nov 2022 10:39:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Coverity: gpmc_is_valid_waitpin(): Control flow issues
Content-Language: en-US
To:     "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>,
        "rogerq@kernel.org" <rogerq@kernel.org>,
        "keescook@chromium.org" <keescook@chromium.org>
Cc:     "gustavo@embeddedor.com" <gustavo@embeddedor.com>,
        "tony@atomide.com" <tony@atomide.com>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>
References: <202211041233.4D45359E7@keescook>
 <7cdf3d14-3f1b-7cd4-e8b9-e94b5359bf82@kernel.org>
 <e4e4c4f0-782b-9f89-d7a2-859c7759ca66@kernel.org>
 <b18cddde778ada5030f6a80308854cf9c0dc4d23.camel@siemens.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <b18cddde778ada5030f6a80308854cf9c0dc4d23.camel@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 08/11/2022 09:02, Niedermayr, BENEDIKT wrote:
> On Mon, 2022-11-07 at 10:56 +0200, Roger Quadros wrote:
>>
>> On 07/11/2022 10:53, Roger Quadros wrote:
>>> Hi Benedikt,
>>>
>>> On 04/11/2022 21:33, coverity-bot wrote:
>>>> Hello!
>>>>
>>>> This is an experimental semi-automated report about issues detected by
>>>> Coverity from a scan of next-20221104 as part of the linux-next scan project:
>>>> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fscan.coverity.com%2Fprojects%2Flinux-next-weekly-scan&amp;data=05%7C01%7Cbenedikt.niedermayr%40siemens.com%7C1a25cc8704524f24224108dac09dfab7%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C638034081994087461%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=W1KlBKg9nwEDfFAbqW6Jw7v1d46HQLj8RX8wlZ9RHyc%3D&amp;reserved=0
>>>>
>>>> You're getting this email because you were associated with the identified
>>>> lines of code (noted below) that were touched by commits:
>>>>
>>>>   Wed Nov 2 10:02:39 2022 -0400
>>>>     89aed3cd5cb9 ("memory: omap-gpmc: wait pin additions")
>>>>
>>>> Coverity reported the following:
>>>>
>>>> *** CID 1527139:  Control flow issues  (NO_EFFECT)
>>>> drivers/memory/omap-gpmc.c:1048 in gpmc_is_valid_waitpin()
>>>> 1042     	spin_unlock(&gpmc_mem_lock);
>>>> 1043     }
>>>> 1044     EXPORT_SYMBOL(gpmc_cs_free);
>>>> 1045
>>>> 1046     static bool gpmc_is_valid_waitpin(u32 waitpin)
>>>
>>> We will need to change this waitpin argument to int.
>>> In addition we will also need to change
>>> struct gpmc_waitpin->pin and struct gpmc_setting->wait_pin
>>> to int as in the code we are relying on GPMC_WAITPIN_INVALID logic which is -1.
>>
>> Another alternative with less churn is to leave them as u32
>> but make GPMC_WAITPIN_INVALID set to a large positive number.
> Ok, I will fix that. 
> Do I need to send a new fix-patch on top the current patch series? 
> Or should I just send only the bugfix-patch for the coverity-bot? 
>

A bugfix patch on current next is ok.

Best regards,
Krzysztof

