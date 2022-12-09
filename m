Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71C2B6481CE
	for <lists+linux-next@lfdr.de>; Fri,  9 Dec 2022 12:35:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbiLILf2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 9 Dec 2022 06:35:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbiLILf1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 9 Dec 2022 06:35:27 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A46B396CA
        for <linux-next@vger.kernel.org>; Fri,  9 Dec 2022 03:35:26 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id g7so6589090lfv.5
        for <linux-next@vger.kernel.org>; Fri, 09 Dec 2022 03:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zltRwSXMj38uTf1FgS5zBSzh/5uz3+lDkJM6wuCHtxA=;
        b=VtbsGgm28fEqulRXJ0szF18vaIJhnw30HMpPVe1y6BnshrdWF6ViAglQ43zO6QV/lO
         mRBs4PC02zXRL5t/g/jxX+IU1RrKAvnSkQi4PCm+mSXEAAcK443cOffezhWH28orvK9T
         /IrcIYNSsgnG3hYx4IdjgCEevuHWjEXCngvrnhmNIbafuxRwSolMVSMwxE8+N/TYlfhA
         XmvhdK5iMlS6IYyjO8kCqd6eaVViiIXF5feXQqH248ptG+Zlp5EydGeg6jGtpHDawYnM
         a2DYWkMIig01dEZ6OZWmuRrIrQoTf7KYW3F5N7hdeUeO5iIIOiAul3+8OtEfkLbxlvVq
         Y5SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zltRwSXMj38uTf1FgS5zBSzh/5uz3+lDkJM6wuCHtxA=;
        b=v+HjFyspjByjEUQuoQfs3dn2hCjmf7MlHu80Ytov7dWBj4tzBmVOiasUu0DgTFwgbx
         r5BLeAt2UaZulf3/yHD21IYyDeGCThDU97pGPSSI09JtWjlVZppYyFHwoV/ugPtrPCRS
         EIndWKqIv/FQM4GbFS6+gZioObY5qv+LNCKI2TaABGIluR74JD0DMjYznN/6U0XoBRRK
         TNI58B6fVcVQpKYuRAjwY40W2pYwX95E5sBw4fqlGAyu7DC9iurM1vHlJJJGQwnHxKbX
         VHKxfD9wGR+Hg7waPGKIFKhlfLpmvi5F9JzMbsSfgDA4tOaN3HR+VUa6MzBxDqe0LX26
         KFlA==
X-Gm-Message-State: ANoB5pnnlxPSJw2i12rqVTtVm7BMt3HpLY0I4p6vatw0mAXjMOiqSuf+
        Co2Pbd24pSnFcKHcL4bSnNJSIvxhgzI0Sa6hUhg=
X-Google-Smtp-Source: AA0mqf6/bhhPty71+qZ7R+9JOqzMw/epC5eMe0NN7u18950h0rh9gzl6Y67hrjiAm4tJDYAOoCLOqQ==
X-Received: by 2002:ac2:5201:0:b0:4b5:889c:f2cf with SMTP id a1-20020ac25201000000b004b5889cf2cfmr1704031lfl.20.1670585724425;
        Fri, 09 Dec 2022 03:35:24 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id m19-20020a056512359300b00492e3c8a986sm217755lfr.264.2022.12.09.03.35.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Dec 2022 03:35:23 -0800 (PST)
Message-ID: <120a5078-6b35-9cad-e15b-5b3be77c6709@linaro.org>
Date:   Fri, 9 Dec 2022 12:35:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2] memory: omap-gpmc: fix wait pin validation
Content-Language: en-US
To:     "B. Niedermayr" <benedikt.niedermayr@siemens.com>,
        linux-next@vger.kernel.org
Cc:     tony@atomide.com, robh+dt@kernel.org
References: <20221209112828.581491-1-benedikt.niedermayr@siemens.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221209112828.581491-1-benedikt.niedermayr@siemens.com>
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

On 09/12/2022 12:28, B. Niedermayr wrote:
> From: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
> 
> This bug has been introduced after switching from -1 to UINT_MAX
> for GPMC_WAITPIN_INVALID.
> 
> The bug leads to an error when the optional gpmc,wait-pin
> dt-property is not used:

That's still not fully correct CC list. Just automate sending (combine
git send-email with get_maintainers) to avoid any errors. You can use b4
for this or:

[sendemail.linux]
        tocmd ="scripts/get_maintainer.pl --nogit --nogit-fallback --nol"
        cccmd ="scripts/get_maintainer.pl --nogit --nogit-fallback --nom"
        confirm = always

git send-email --identity=linux ...

Best regards,
Krzysztof

