Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F6727447D4
	for <lists+linux-next@lfdr.de>; Sat,  1 Jul 2023 09:58:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229490AbjGAH5w (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 1 Jul 2023 03:57:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbjGAH5w (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 1 Jul 2023 03:57:52 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F7591B0
        for <linux-next@vger.kernel.org>; Sat,  1 Jul 2023 00:57:48 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-98e109525d6so476496166b.0
        for <linux-next@vger.kernel.org>; Sat, 01 Jul 2023 00:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688198266; x=1690790266;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LSATOF2fTrmY3TIuw1xjHyriagcvCRWohOX207a4PI4=;
        b=f5Rv4atvrar8yzuX6A8VW5RZulYnynQd7+ZxQir7NyoB5OEYKuSM57tAPfOU00wd0p
         nyhS5l0WmfbtEoVvhTSy1eXn/SrQl3OqiuAHLLhXJX5pw6UmZsKD+QjV1TsvV7MqyOhC
         nzDGSWugig8YdJ4wlB2GkccWFi2Y1njJsDDsIPTZOtR3327vNslyYrrqSf3sNcQbZDbV
         phiJYGrOIFsoq7YMChkYN0NJQFJVzORR3b8VhZXsYI7Em1DWCbFL6m+gfkj3Ak/Tg6fw
         NC+XrsjwesKJVSnPzNfGLtRWiscQZHXeCKsjzNU9PuumoPdwUZp1/uGN0VfFmhjV0jz/
         PecA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688198266; x=1690790266;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LSATOF2fTrmY3TIuw1xjHyriagcvCRWohOX207a4PI4=;
        b=hW1JijK6uMBchYdnPlgMuD+N/8Yj2kX3F284rsHwPHoWdH+5klbnuiETJBkCovGSEN
         wykLJfML9MKRQ9J+azP2nkjTgkMn9TiEIwG5KHx1SyzlBnvspcxpc2POH1WtUs9p2oWR
         dMhUj1McIiyXRhMOyrOrKf2n9fj7zuuLTA7AtDFAeovFQC/SZiufhMn+wc/kELJmgQD9
         s5yRNtD3fNrQ2rlwjnvekkf8qDuGcsCQTUXAogyDZfye0AzQo/A/G22eCUtRvgTTkEi3
         fklA2pa8i7z5UKbwtZiwzpT8kn6A70HekOX8Hv/Oxh5XGraYOlP5Ej788lsRz/Pd92W9
         hcDg==
X-Gm-Message-State: AC+VfDwamS/wc4xXha1Zh2WY+zaf5XtC/sky/YFpbm80dpoJWTbNMUd6
        Bmva4bUKmurvOw3omDXDxzkHZ8Od5OtW7Y0Jj98PVz/z
X-Google-Smtp-Source: ACHHUZ4GtDj39uaeZgdFa7jGf1AdFfLXejtN2gl9WRjG2SEF3Xgxlq7VC/eG/qHA/Jxt/5eCLBvwZA==
X-Received: by 2002:a17:907:6d86:b0:98d:4b97:acc8 with SMTP id sb6-20020a1709076d8600b0098d4b97acc8mr9773005ejc.25.1688198266343;
        Sat, 01 Jul 2023 00:57:46 -0700 (PDT)
Received: from [192.168.10.214] ([217.169.179.6])
        by smtp.gmail.com with ESMTPSA id rp25-20020a170906d97900b0098e17ea781csm8178529ejb.94.2023.07.01.00.57.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Jul 2023 00:57:45 -0700 (PDT)
Message-ID: <c40964a7-1895-0174-d114-beede91cffbb@linaro.org>
Date:   Sat, 1 Jul 2023 09:57:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: linux-next: duplicate patch in the samsung-krzk tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20230630084649.5d4e6f1c@canb.auug.org.au>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230630084649.5d4e6f1c@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 30/06/2023 00:46, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in Linus Torvalds' tree as a different commit
> (but the same patch):
> 
>   858fd147234d ("arm64: dts: exynos: Remove clock from Exynos850 pmu_system_controller")

Thanks, it is kind of expected and won't make it twice to Linus' tree. I
should have dropped it when it was merged by my upstream maintainer.

Dropped now.

Best regards,
Krzysztof

