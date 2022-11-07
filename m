Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AF9A61FEFB
	for <lists+linux-next@lfdr.de>; Mon,  7 Nov 2022 21:00:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231693AbiKGUAz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 7 Nov 2022 15:00:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231172AbiKGUAz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 7 Nov 2022 15:00:55 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F96A2126B
        for <linux-next@vger.kernel.org>; Mon,  7 Nov 2022 12:00:54 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id d10so11639734pfh.6
        for <linux-next@vger.kernel.org>; Mon, 07 Nov 2022 12:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=schmorgal.com; s=google;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uFzfic4/o9YADInD4BGWvhfEs6JLqTQuyFcCRUOgx4Y=;
        b=RHdQvP6hvMxUq1MeHbXCQ9u3ocWIHrr1yIjCVclcBWRLZVl4sXWjIGOrFfEZjvqkdc
         UFEJS0PepkUYnPBcdi8+fOHy8CpQkXZ8CC7a8Pn9vva28HFo8PghUqWeK8fyRcOcpaxd
         4W3221cXTefbQHEPPaWfVQkezCzkpvZiTMqbU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uFzfic4/o9YADInD4BGWvhfEs6JLqTQuyFcCRUOgx4Y=;
        b=wf1Muic/qjk+ddsXw1JFFATLZ8SXGHo3NAflydtgf+6KjlS99ZI1IJIcLwnveecqq+
         WQG/k2YHAprAIAQ7hwOS0OGUv52dL/5ZXojw85bhu8ljBej2eqIciFxPZWKmD3JhUMFi
         DtNAdKwcRCSpDljAKyHxdXrvhKzCpnU0YyBRSZYxU1PQAY48Tv9hPMamKN33R7kOgRL9
         Nmfnruqm9JUpRX84joPqRUU0FXaWfxqrnRExlzXC5tLB+rCvSMFxDxY4kDmq00TTUnMq
         1WcuGeTib+UVNQBiUeIVJ+d/YXRtB6f9MRCXstqbVefFTIzSif9k6PR3y1q54svGkFfX
         ok5A==
X-Gm-Message-State: ACrzQf2rAGlSYyY4sUjIvWNopoQm7J5UQwG4e3G8N+sFazHGv65LdVjq
        LNo8LHHj5w8oH/QAo75QoGDqrw==
X-Google-Smtp-Source: AMsMyM6FnbFzd1qhH6Vn+Nmb4NVFOWpyAAJ9nUz/060So2+4kGeFHeYUNdEFORA0eB6c/Jms8U0ruA==
X-Received: by 2002:a05:6a00:993:b0:56c:80f6:db5 with SMTP id u19-20020a056a00099300b0056c80f60db5mr51754032pfg.45.1667851253656;
        Mon, 07 Nov 2022 12:00:53 -0800 (PST)
Received: from [192.168.1.33] ([192.183.212.197])
        by smtp.googlemail.com with ESMTPSA id z11-20020a1709027e8b00b001869f2120absm5314846pla.294.2022.11.07.12.00.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 12:00:53 -0800 (PST)
Message-ID: <ccaa1df9-279e-e3a5-514e-e3baebb03357@schmorgal.com>
Date:   Mon, 7 Nov 2022 12:00:50 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Content-Language: en-US
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20221107183054.7007fd7a@canb.auug.org.au>
From:   Doug Brown <doug@schmorgal.com>
Subject: Re: linux-next: Fixes tag needs some work in the dmaengine tree
In-Reply-To: <20221107183054.7007fd7a@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen and Vinod,

On 11/6/2022 11:30 PM, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>    639d91b2d4c8 ("dmaengine: pxa_dma: use platform_get_irq_optional")
> 
> Fixes tag
> 
>    Fixes: 7723f4c5ecdb ("driver core: platform: Add an error message to platform_get_irq*()"
> 
> has these problem(s):
> 
>    - Subject has leading but no trailing quotes
> 
> Actually, it looks like it is missing the closeing ')'.
> 

Dang it, I'm sorry. I don't know how I messed that up. I'm not familiar
with the process for fixing this after it's already been accepted into
the dmaengine tree -- should I just submit a V2 patch with this fixed?

Thanks,
Doug
