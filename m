Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB4572DA95E
	for <lists+linux-next@lfdr.de>; Tue, 15 Dec 2020 09:43:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727280AbgLOImI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Dec 2020 03:42:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726945AbgLOImC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 15 Dec 2020 03:42:02 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFF4AC0617A6
        for <linux-next@vger.kernel.org>; Tue, 15 Dec 2020 00:41:21 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id a12so18956138wrv.8
        for <linux-next@vger.kernel.org>; Tue, 15 Dec 2020 00:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GbEzlI33OGU2m93piMSf4kBL+lR5zxOJKf2VeMLoEIE=;
        b=yCuexCqgQRrHyuPvGukIq9TNU/xW0HW9gQQ3S8iCnSnrXJYAl925lc9udtiq/mYlf9
         AQzIl6bb1OCTt/r39DssvnP/xtSQLc9HhcU3kVE6fiqHFemMiM5/jvIdK+vAXZOZttUh
         9AEdnJ2P0COYe/9b6MYcwZEWVDKwJF1EL76vqi/5IBaSkNK9QwbFDqzn9ToR1OX3J3+O
         efJ6mcmgAi2+Cjk12dwpgZz03VHQiN+QXfIyQxT4Tz+FBrx8kVfsLkIVEG+flcSYH92e
         R5ZGI95tV1tCw/hz9kSRxAnBrJ5tquJn1EUdGE9ANCC+dcdz6NTn9xt1CkdPqb3OB1WD
         JOmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GbEzlI33OGU2m93piMSf4kBL+lR5zxOJKf2VeMLoEIE=;
        b=ewtoJa60Fwg8ACVroNtD/UrzQS5W/GS52P1EujFwUun6WgRqmMUmS6+CX4W45cy7fT
         138VLLyH/nt/zfj9PnI5aK8qk6idhnuLCCSZQNMregjSIeEE7Z5vH9eQTubHDim+IEfH
         0Fnq5QTQYgpmmHt4pjTEamXnDn5z2QmXWgbeeY7/FptMM53hAI9baqcaQM6YW9fqzBrh
         htN2frcDXuHtIgNHyI86GzC8XYnuluHU18Js1jXlYMFV34/g4VyfAy1fdmZZZwLXR4av
         EkNXlrm1fiFjuAaicYGSCQduhnLK2DxVv3pPV8UTvPlYiSXtJm45L1BDhju7CqtpZ/O+
         elXg==
X-Gm-Message-State: AOAM5305RhMLx6M4+VZsUbqiGWVyS/SwXkiKBHTdgo8sJz0vcH0o8cJM
        p+yXzakmPzvoKGPafo/0x3OaCg==
X-Google-Smtp-Source: ABdhPJzBNEtjk59mcpfwSNW8Qzw6ooxHFo5FWxuFpo6rL/Za+fg5OV/zUyaEaZ0WNX4Z4qYdYvXKGw==
X-Received: by 2002:a5d:4bc2:: with SMTP id l2mr17095662wrt.204.1608021680445;
        Tue, 15 Dec 2020 00:41:20 -0800 (PST)
Received: from ?IPv6:2a01:e34:ed2f:f020:e842:4086:6f24:55a6? ([2a01:e34:ed2f:f020:e842:4086:6f24:55a6])
        by smtp.googlemail.com with ESMTPSA id l16sm37134641wrx.5.2020.12.15.00.41.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Dec 2020 00:41:19 -0800 (PST)
Subject: Re: [PATCH] thermal/drivers/devfreq: Fix missing dependency with the
 energy model
To:     rui.zhang@intel.com, lukasz.luba@arm.com
Cc:     sfr@canb.auug.org.au, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org,
        Arnd Bergmann <arnd.bergmann@linaro.org>
References: <20201215125806.31495950@canb.auug.org.au>
 <20201215083520.601988-1-daniel.lezcano@linaro.org>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <657f28a7-fc75-06ae-a96c-d2ef0485e4bc@linaro.org>
Date:   Tue, 15 Dec 2020 09:41:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201215083520.601988-1-daniel.lezcano@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


A separate patch should add the select ENERGY_MODEL in the
multi_v7_defconfig so the devfreq cooling device continues to build by
default as before.

Arnd?

On 15/12/2020 09:35, Daniel Lezcano wrote:
> The devfreq cooling device has been converted to use the energy model.
> 
> Add the dependency on the ENERGY_MODEL option to reflect this change
> and prevent build failure if the option is not set.
> 
> Fixes: 615510fe13bd2 ("thermal: devfreq_cooling: remove old power model and use EM")
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
>  drivers/thermal/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig
> index 7edc8dc6bbab..ee62d51ef351 100644
> --- a/drivers/thermal/Kconfig
> +++ b/drivers/thermal/Kconfig
> @@ -193,6 +193,7 @@ config DEVFREQ_THERMAL
>  	bool "Generic device cooling support"
>  	depends on PM_DEVFREQ
>  	depends on PM_OPP
> +	depends on ENERGY_MODEL
>  	help
>  	  This implements the generic devfreq cooling mechanism through
>  	  frequency reduction for devices using devfreq.
> 


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
