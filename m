Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D12470B63B
	for <lists+linux-next@lfdr.de>; Mon, 22 May 2023 09:16:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232507AbjEVHQh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 22 May 2023 03:16:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232554AbjEVHQG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 22 May 2023 03:16:06 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BAE7E62
        for <linux-next@vger.kernel.org>; Mon, 22 May 2023 00:15:30 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2af2451b3f1so37091621fa.2
        for <linux-next@vger.kernel.org>; Mon, 22 May 2023 00:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684739728; x=1687331728;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kr6xZy82AwuYIfKgQeuaFZw6CY7oFus6qquXi3Ox3mM=;
        b=HFk1HWU8ANDWg19ia5zKWZHWahkw6183gOl/q5eYc7Hnet2whAYEopGZzjOfdCq+Z1
         E/dEgjqAiMJTZE8b5KALB4U/WwAPoQCd+Bo8yOA1zk0CflKBarULFdfjZmvkRn7xb581
         /hTz679Y44BEZpaIsYhB9H7JySQAodqw4grh+o1uBC1rMS29ZbBYIZdI8/bz9DwDGuiE
         hLH5xhgwJYN8E9KuP+neLv8TNEyhc2+b5hboU/xUnM1WZZbPNjDN8MKNtrzmWqNhJqTi
         9f+V6jsg9OeFHAPewAeCCL3bpXs5YeRgqNmk5obTjZNA7jSQFzjoYDGvsvpQyDxsVklm
         lXXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684739728; x=1687331728;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kr6xZy82AwuYIfKgQeuaFZw6CY7oFus6qquXi3Ox3mM=;
        b=RdSYrFeJB2v6+A2JSH9FZ/USbjdA0+LD2Ba1PmhE+miG70P6sC19Omev+Yv32ygzgP
         OkWsSvbdIYSDfkRsx3kzt6/uChTRXqHzFJpUw8Ax3OA0sAUFLLoPeAiCbUfBtcVKwaKu
         GWxZ/znc08N8DMxIbi44U54U0Mgwo/SgINRxY9dZOIrBbY1RFOgOOrUKAASi61BNJzND
         0sjYu6wykC9TmzDJ3KahrUlBJ4E0a//WIV1yRBnOaB3sKAIfSlbm2oPv+SSuae8Buhq8
         5PCdWvef6eRIagPCyq2u6NQyWc+YMO6WsZboMfctW4NdDms8yhB7E45QIiWQE0TKDR7U
         UIsg==
X-Gm-Message-State: AC+VfDzBGODok/OeX7Ov1x/DDeNPTsEhdBtJXKf0XRZ9DBe8gNSthIwr
        UqY4RqqD3Pvmps+uTs0yLVLbQQ==
X-Google-Smtp-Source: ACHHUZ7GnoCsghUypMrlm2kJ0Ou9uC3JP7tRFb5fpIqvYAREuiTGq5bNU31bMlhga+AOTAoN7AiE4w==
X-Received: by 2002:a2e:9f42:0:b0:2af:20d2:bb7b with SMTP id v2-20020a2e9f42000000b002af20d2bb7bmr4152850ljk.43.1684739728372;
        Mon, 22 May 2023 00:15:28 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id t19-20020a2e9c53000000b002ab2184a9basm972092ljj.109.2023.05.22.00.15.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 May 2023 00:15:27 -0700 (PDT)
Message-ID: <f8ba7da2-2560-d47a-6f1c-12241f1896f3@linaro.org>
Date:   Mon, 22 May 2023 10:15:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: linux-next: build failure after merge of the drm-msm-lumag tree
Content-Language: en-GB
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     "Reviewed-by: Arnaud Vrac" <rawoul@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20230522170720.23ef6adc@canb.auug.org.au>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230522170720.23ef6adc@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 22/05/2023 10:07, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the drm-msm-lumag tree, today's linux-next build (x86_64
> allmodconfig clang-17) failed like this:
> 
> (in function _dpu_kms_initialize_hdmi):
> drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c:647:28: error: variable 'i' is uninitialized when used here [-Werror,-Wuninitialized]
> 
> Caused by commit
> 
>    ea767bb1752f ("drm/msm/dpu: add HDMI output support")
> 
> Reported by the kernelci.org bot

Thanks for the report, it should be fixed now.

-- 
With best wishes
Dmitry

