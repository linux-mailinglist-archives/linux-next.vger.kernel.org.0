Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A646648173
	for <lists+linux-next@lfdr.de>; Fri,  9 Dec 2022 12:16:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229845AbiLILQM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 9 Dec 2022 06:16:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229865AbiLILPr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 9 Dec 2022 06:15:47 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6004370BB2
        for <linux-next@vger.kernel.org>; Fri,  9 Dec 2022 03:15:44 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id cf42so6544121lfb.1
        for <linux-next@vger.kernel.org>; Fri, 09 Dec 2022 03:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oB/gitXgrRL+kFSrSkcL2lNqx5NfzdSw6iG0lwdmhqs=;
        b=OXo4D/HSWCBdPxZh80WlOlKJ0/5KtpMdsSR4IMm1MfqIRllanjYGw2FgsJcaOGzMkP
         P6vyxPwmHi5naESUqMNSOUTUdmcpP67Qv4XU7k2Y1vUN0H3IA7S6KUgy3x13g3EXcGgh
         mxqQeSwTiQlK+OBkSRsIs9UMC1X/pbB+9jaBxWvmpiYBf1278kgTFAb5abg1codpxomr
         Nb5dcGeaGQYt8Q0SA17xrn5JW19I+5lBPJV7y9NcRIx0UvlfqiV2BmWrIjgSCCnP4bqA
         gt9bPQbrOOvaOmZcToAPahe/Sux5iiaP3OaZIf/4BgesF8maDySOhq2JIsWEGAuKfHdG
         tpzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oB/gitXgrRL+kFSrSkcL2lNqx5NfzdSw6iG0lwdmhqs=;
        b=WQp8m/cQ163PVEuaj34n1WcsG8p3aSKDfUlGRzjSUdkiOJ4g518cBZo8G1y5vRtVw4
         KnIlXasjoOrXqKcMDFT6xc3DSfv3vQzffYk9j7Kss6SJ3wX0Ia4BQ5JwO4wokhuVOscO
         /Je7VgbibL5NwXyb2JByny8dMJ6RrM+G5Tzv0SP7IJMVp2pF1B0JfANQb/LVc1BCcxHZ
         edC0EbdvVh5zLf4XQeNGsWstDH5Bycgbxv0d1Wk7xLWiGpnJ/ntSOxw+Fo9SqO5viq12
         2csAxasvLZ9BV8+frRLDm+uU0jETeoeOypADq1PPMwvZSNPWUv0odMLbkB1yukzON7HY
         KW6w==
X-Gm-Message-State: ANoB5pnUUHAV6n1ZUSYZPNJZy3anIeCNWBiat0lqPxcv/ypCyk/M/csg
        O7QwzqNLpNK2rhc9yrKymVwNEg==
X-Google-Smtp-Source: AA0mqf7YpnbuTxasATRu8NLlQ+l30mh+pBMZ5vZgyXqFpDhk3qg5DGnQuUpXahZc9/izj/iECVcbJA==
X-Received: by 2002:ac2:5deb:0:b0:4b5:28e5:29f8 with SMTP id z11-20020ac25deb000000b004b528e529f8mr1443246lfq.42.1670584542726;
        Fri, 09 Dec 2022 03:15:42 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id e26-20020a19675a000000b00497a61453a9sm217350lfj.243.2022.12.09.03.15.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Dec 2022 03:15:42 -0800 (PST)
Message-ID: <0898f2b3-7a75-0979-bb14-81bd802842ca@linaro.org>
Date:   Fri, 9 Dec 2022 12:15:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] memory: omap-gpmc: fix wait pin validation
Content-Language: en-US
To:     "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
Cc:     "rogerq@kernel.org" <rogerq@kernel.org>,
        "tony@atomide.com" <tony@atomide.com>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
References: <20221209105817.576532-1-benedikt.niedermayr@siemens.com>
 <35af7393-71a0-b15e-856e-0429cf4a177d@linaro.org>
 <8d7b2fb49791cddc34355cdd9d7907fb8484ae7f.camel@siemens.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <8d7b2fb49791cddc34355cdd9d7907fb8484ae7f.camel@siemens.com>
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

On 09/12/2022 12:10, Niedermayr, BENEDIKT wrote:
> On Fri, 2022-12-09 at 12:04 +0100, Krzysztof Kozlowski wrote:
>> On 09/12/2022 11:58, B. Niedermayr wrote:
>>> From: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
>>>
>>> This bug has been introduced after switching from -1 to UINT_MAX
>>> for GPMC_WAITPIN_INVALID.
>>
>> Please use scripts/get_maintainers.pl to get a list of necessary people
>> and lists to CC.  It might happen, that command when run on an older
>> kernel, gives you outdated entries.  Therefore please be sure you base
>> your patches on recent Linux kernel.
>>
>> I think you got only two addresses right in your entire CC/To list...
>>
>> Please resend with correct addresses.
> OK.
> 
>>
>>
>>> The bug leads to an error when the optional gpmc,wait-pin
>>> dt-property is not used:
>>>
>>> ...
>>> gpmc_cs_program_settings: invalid wait-pin (-1)
>>> ...
>>>
>>> Signed-off-by: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
>>> Fixes: 8dd7e4af5853 ("memory: omap-gpmc: fix coverity issue "Control
>>> flow issues"")
>>> Cc: Tony Lindgren <tony@atomide.com>
>>> Cc: Rob Herring <robh+dt@kernel.org>
>>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
>>
>> Do not store maintainer entries in git log. There is no point.
>> Maintainer addresses come automatically and there is never a need to
>> keep automatic output in the history. Keep only people who need to be
>> CCed.
>>
> I wrongly thought I should Cc all people who have been Cc'ed on the
> discussion.
> Sorry, for that.

You can Cc them, that's okay, but Roger, Tony and me are maintainers, so
there is no need to store these addresses in the git log.

Best regards,
Krzysztof

