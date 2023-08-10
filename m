Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8495E77738F
	for <lists+linux-next@lfdr.de>; Thu, 10 Aug 2023 11:00:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232030AbjHJJAG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Aug 2023 05:00:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231510AbjHJJAF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 10 Aug 2023 05:00:05 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8FC42129
        for <linux-next@vger.kernel.org>; Thu, 10 Aug 2023 02:00:04 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3fe4ad22eb0so5635395e9.3
        for <linux-next@vger.kernel.org>; Thu, 10 Aug 2023 02:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691658003; x=1692262803;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=apCyx7BnprLlNUtpxgI6ODrkhYEMJ4RAFB4yHFVMfI8=;
        b=cVdtENVBqkmVo7mhcn41Hs7v9W+1r6WC7SKAUkK0sQjOBgAlM5naVYjUnDsgRMHb3t
         pRcnknchJZPisfwVakNwZMq/8AM6/k/Dh4BZ11VqCChCGyd0qsE6QGuHdqSABiT0LWXi
         tic1V7TPvGGCaY60KFWEIV92flCtDx12JgAhDkzXhKpcqmgYg35/3tamRu2vHH0MRunb
         EV6vaPBzZHfS6Iaja7ODtkfaTKVSivYRruBPKRBPUfZdOkWPSGaRNMD1Rs+znZpXY7MT
         GynzjIzfF8pIJsWOJV6AzdIORG3VO/0W5VHnXAHRebmHY9ERkBjST2ODEtUcsM+tf+KL
         HoCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691658003; x=1692262803;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=apCyx7BnprLlNUtpxgI6ODrkhYEMJ4RAFB4yHFVMfI8=;
        b=O1WxKko0HyUTqgb+xav6H9hVtUt/rvs4yliKECZebnZmympWQgja1O6Bb9g/xq4BBJ
         vpqTu5KGhicJbSpjbLV6IEdPF6OgnMhqqSdQvhN2tQAyXq+ZH8vkfBTp01CL5/6yHt6e
         NJpIVo4B0DDUmj5cYTGMO2Fh0BvNPM0TbezjFOca//xm0eSXCk913x1L/kvEhRTu/s4e
         LHevvr1dhmEMFjEVlExz5NiFg/Y5FZNXf4UVNDmlOYJmdYJWt60jUHGY35BPKMVup9oZ
         jTlU+MP3GhRmPO/n5jufUInCmrD95maXbn8hcBXrDRofHE26JlXvdZOMtyTirbFYsyg7
         8wyA==
X-Gm-Message-State: AOJu0YyzwMtf7YWrGmipiHXRyE+q6wSyRiTzuZsuR2BfyT1wm6lDwzzO
        OzmpdUujQ59LO6EQF8EIqR2zFA==
X-Google-Smtp-Source: AGHT+IG6duMflYRBl5CQeCt/dV9xwJXDPQRP/d6NWugTgoVZOj3U5miGLp2jSFREeeNioqcKY7SORg==
X-Received: by 2002:a1c:7518:0:b0:3fe:687a:abad with SMTP id o24-20020a1c7518000000b003fe687aabadmr1323005wmc.20.1691658003225;
        Thu, 10 Aug 2023 02:00:03 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.158.65])
        by smtp.gmail.com with ESMTPSA id n24-20020a7bcbd8000000b003fbb0c01d4bsm1466098wmi.16.2023.08.10.02.00.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Aug 2023 02:00:02 -0700 (PDT)
Message-ID: <ef8cff61-d61e-120d-fd69-8612c64b4139@linaro.org>
Date:   Thu, 10 Aug 2023 11:00:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH] usb: dwc3: dwc3-octeon: Verify clock divider
Content-Language: en-US
To:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-usb@vger.kernel.org, linux-mips@vger.kernel.org,
        lkft-triage@lists.linaro.org
Cc:     Thinh.Nguyen@synopsys.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Anders Roxell <anders.roxell@linaro.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <ZNIM7tlBNdHFzXZG@lenoch>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <ZNIM7tlBNdHFzXZG@lenoch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 8/8/23 11:37, Ladislav Michl wrote:
> From: Ladislav Michl <ladis@linux-mips.org>
> 
> Although valid USB clock divider will be calculated for all valid
> Octeon core frequencies, make code formally correct limiting
> divider not to be greater that 7 so it fits into H_CLKDIV_SEL
> field.
> 
> Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Closes: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230808/testrun/18882876/suite/build/test/gcc-8-cavium_octeon_defconfig/log
> ---
>   Greg, if you want to resent whole serie, just drop me a note.
>   Otherwise, this patch is meant to be applied on to of it.
>   Thank you.
> 
>   drivers/usb/dwc3/dwc3-octeon.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

