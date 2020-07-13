Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F1B721DB3B
	for <lists+linux-next@lfdr.de>; Mon, 13 Jul 2020 18:08:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729659AbgGMQIr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 13 Jul 2020 12:08:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729649AbgGMQIr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 13 Jul 2020 12:08:47 -0400
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9537DC061755
        for <linux-next@vger.kernel.org>; Mon, 13 Jul 2020 09:08:47 -0700 (PDT)
Received: by mail-il1-x143.google.com with SMTP id o3so11608060ilo.12
        for <linux-next@vger.kernel.org>; Mon, 13 Jul 2020 09:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kd0lZ6Q0Y27gtL8Diz7CfYwjPZyjsUaCrsbeyNeO+hI=;
        b=UyJfcshVLh/rnFBLweokbFSFTDg4sUFC4gltX6Cc36uqZ6LE7n+p7O2DvdMdSh3rtH
         VNtLe9LJtVl/9HztICABh7cxjyO9C2194+qjtAxG5RHU6wnQqOAFSuSdE515I2sL4gZg
         GVWQRv3w9xjXlT689r5VbViCIDznik2asFDLvDPHutZqhEPa3S5BTrkXo6uNsaORArVO
         vnViD9WVRYeLIzuQDKRkm7k3sn9Mt4BLOLoVenTp+SVRsT+G71Y3k8XQWuTmABgdDY1Z
         eoOOMbqlqJ513qCCFo6KP0t7UiZk9VUBiFFq6plP7LhsbI1noulvM9tDHVSRM3rA52MS
         YPuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kd0lZ6Q0Y27gtL8Diz7CfYwjPZyjsUaCrsbeyNeO+hI=;
        b=WCh1M3IY8PQP9cdjjIKJnV1BIPOK72tQkUBHWgi+nDnEfgyQDyvrjOvOjMzvx0xOsU
         4Fa/Y7fopxLm5DTlFwdB00rnss5S0CcvG6JIzmLuBwiWBamnz4hojizLw9UO5d6w1cNB
         n4s3Xglk8H0Bf6P9+f7X/aamFW3gtwnPrOgSUU7tgu4P8WP8pLNwRe80fB7yQffEbJpJ
         quBGw0I9/ZDsWv2OwAe2427Uw1F985x0gI1p5A5WTUPgkOYCTdgDUjJq2mlxrUXIf2Qe
         R6eizXqHJDuFZ5dlyH6bCzEgearPtbmO/OwEbxNzPBuqH5gwvysy6h9SZQ4jR0LHviP8
         JlTA==
X-Gm-Message-State: AOAM533fQKd9eqbpDj+04w9N0kaY5C/7CHV8Z2o+Ls+MZHPcxNLZYEJ2
        aigMYM5i/qPE9u0jTJ7/B1dV6tu+qpvyUQ==
X-Google-Smtp-Source: ABdhPJwVVTVaefgi436OAH7B4PJsDTFxe/0ZnQh0PdCTDT4XvbopyQ/Uy7q2toPvIAtgeRNXAUK/7g==
X-Received: by 2002:a05:6e02:1086:: with SMTP id r6mr405658ilj.158.1594656526605;
        Mon, 13 Jul 2020 09:08:46 -0700 (PDT)
Received: from [172.22.22.26] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id f18sm7807870ion.47.2020.07.13.09.08.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2020 09:08:46 -0700 (PDT)
Subject: Re: Build failures in -next in qcom_common.c
To:     Mark Brown <broonie@kernel.org>,
        Siddharth Gupta <sidgup@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org
References: <20200713154822.GC4420@sirena.org.uk>
From:   Alex Elder <elder@linaro.org>
Message-ID: <cd2d5949-9ffb-953a-021d-3c375f185b06@linaro.org>
Date:   Mon, 13 Jul 2020 11:08:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200713154822.GC4420@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 7/13/20 10:48 AM, Mark Brown wrote:
> Since Friday -next has been failing to build various arm and arm64
> configurations with:
> 
> drivers/remoteproc/qcom_common.c:210:9: error: implicit declaration of function 'kzalloc' [-Werror,-Wimplicit-function-declaration]
>         info = kzalloc(sizeof(*info), GFP_KERNEL);
>                ^

That has a trivial fix.  I have contacted Bjorn to find out
whether he's going to do it or whether he wants someone else
to.  Thanks for pointing it out.

					-Alex

> drivers/remoteproc/qcom_common.c:210:7: warning: incompatible integer to pointer conversion assigning to 'struct qcom_ssr_subsystem *' from 'int' [-Wint-conversion]
>         info = kzalloc(sizeof(*info), GFP_KERNEL);
>              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 1 warning and 1 error generated.
> 
> caused by 5abfe5cf0b8358b8ad0 (remoteproc: qcom: Add per subsystem SSR
> notification) which adds a use of kzalloc() without ensuring that it is
> prototyped.
> 

