Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAFD6620C7B
	for <lists+linux-next@lfdr.de>; Tue,  8 Nov 2022 10:40:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233425AbiKHJku (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Nov 2022 04:40:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233809AbiKHJkh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Nov 2022 04:40:37 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D9543134B
        for <linux-next@vger.kernel.org>; Tue,  8 Nov 2022 01:40:36 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id c25so20214185ljr.8
        for <linux-next@vger.kernel.org>; Tue, 08 Nov 2022 01:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nwGH3xncezy8aE+xydBamp1X2UzAG0+D2pQxSdjT3Go=;
        b=PguF6LnLRQ/cpoVLZlxFFNefduNiIZHPgBoSTGmze3dAN+AliIFf9pQcwZzBAdrJs+
         bT4oyiQjoIIApKKZOQWKdEqeMyMEW3JoLlrVuHXITZgB0NkyBzyEGfyBz/CPJBBSqZXi
         KNj22sWWhCl2xPc0pPLBw0D/wR1jp2xksw1JazMlcvaHQTS0eAbELD3pwm/Ob7EcxfNS
         O0k8jjEUg2eOCJvJgyGpDm7NVALcKS/4qOhxrLMlosDiZrSmoEtx0eIeVRXcSB7jtY8r
         uOCvGB64HPdapt+WCwWGecQctc1t0p+Wt8JHyRfbRFa//ys8PO6jHc5Ocsq1hrynOebU
         7VQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nwGH3xncezy8aE+xydBamp1X2UzAG0+D2pQxSdjT3Go=;
        b=FpNVD89Adffk/FSGE+ySMjqvtapNUOgpFbwYcG7fnDyU+M/kM6rMRJTbOmP3tQtxG/
         2Du+X1o/smJyN9FX+O9vgzCqLbVi4riJyD44WlYjJev87oxwYrNGDhNwTz/cDiDtFJ8q
         +Nn/7w4X5yT3T2BTz54GgZwiW/MaWJP+HLUtTM3iqJJwamqq/7Ep1b+JXFehmeALScla
         GERQ3bjQ/FlcjGSPQZwZvVEs7HNDMiPdUyEnSV1/sqQQrQUr1vFvQr/mvJP1R8P1PLiu
         gqDqjYXREMAn8NoJcv7gU0GcGj4Vtvg7fhLYpH6hupllXJ72Ud26qU9ZV44GcaC2b9el
         HbJw==
X-Gm-Message-State: ACrzQf1ItsIdqO9D4xLBmjGKgCcQ2DyIbd5om8RtS3MelpglvaOKWz1p
        pcEKAN06ZehyEa2sadPDkQoCNQ==
X-Google-Smtp-Source: AMsMyM6g0IjhpvwW0iRhgu1Nh1ZcIdl7Lok+Zjry8sEZS7v3Grs0teipqFv3tlbCkRt6UTvGImC4Vg==
X-Received: by 2002:a2e:978a:0:b0:277:107:725f with SMTP id y10-20020a2e978a000000b002770107725fmr17989655lji.417.1667900434663;
        Tue, 08 Nov 2022 01:40:34 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id u28-20020a2eb81c000000b0026dc7b59d8esm1658719ljo.22.2022.11.08.01.40.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 01:40:34 -0800 (PST)
Message-ID: <5791ab49-debf-53d6-f076-0e46c4f392ea@linaro.org>
Date:   Tue, 8 Nov 2022 10:40:33 +0100
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
 <57664014384bae015d593a7c6c6b7715fda3e89d.camel@siemens.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <57664014384bae015d593a7c6c6b7715fda3e89d.camel@siemens.com>
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

On 08/11/2022 09:15, Niedermayr, BENEDIKT wrote:

>>> Another alternative with less churn is to leave them as u32
>>> but make GPMC_WAITPIN_INVALID set to a large positive number.
>> Ok, I will fix that. 
>> Do I need to send a new fix-patch on top the current patch series? 
>> Or should I just send only the bugfix-patch for the coverity-bot? 
>>
> Sorry, another Question: 
> Is it somehow possible to check locally if the bugfix actually fixed the bug, before I submit the patch?

I think only if you have Coverity somewhere in your company set for
testing kernel...

Best regards,
Krzysztof

