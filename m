Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FC422AAEA4
	for <lists+linux-next@lfdr.de>; Mon,  9 Nov 2020 02:01:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728016AbgKIBBl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 8 Nov 2020 20:01:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727949AbgKIBBl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 8 Nov 2020 20:01:41 -0500
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95760C0613CF;
        Sun,  8 Nov 2020 17:01:40 -0800 (PST)
Received: by mail-lj1-x242.google.com with SMTP id o24so1565201ljj.6;
        Sun, 08 Nov 2020 17:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=RrJxs8GIOH42wOGaqFFrFIhogWDtupERELltcwunJ7E=;
        b=MejoSAN1yBh475RxAcy4cejMOb/Br4KFbjpTEO3hiJj/tpTyO68ZdiDnpAB1XI+/WI
         P7npOKhDyhVrHGeElexOBjV0/yfApBdX524D5NuFa+WVmTz/NtjD+htFBw+blDQbfTqu
         xMzRwqDWa6NNdg5Il/3SsTkq8saoKOA31tPPXtR5BnKHH+yMHTqKgF5njKxw0qKymi5F
         gYgMNwuTeUKAffmwUGaZR4rlaBZev4wJmIxYs5cWM0y25UWRnOSwTG3BjLjuQKZAtLgn
         qSGzQAS7M8n/3p705+E1GUe1GleHEYH1HYkricTAmnYtfmBRkqbeHUBJjDlvkiIB4y59
         1UCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RrJxs8GIOH42wOGaqFFrFIhogWDtupERELltcwunJ7E=;
        b=JwzkpxC8zB8MZovSWeqQxpNw0eRbhpKjS+0BVZ5edLXfOCaT2qzAF+VGOV5Pt2PiCy
         pwW8L/puwxzwAHsldDQeRXa11TfN9X0kV2P14LZ1tb0HAnrgyOPvkm40NoI8TnjVhCWJ
         1ah/mULo5nm9hTwMc6vOiZO7TPuKn+kO8pRv+GHvA/OfIw3pU9gGkOi5e+E8HdKMPao+
         1ZCCDCifGLzLZv1qArRVhfGx06MGcrzrwZ+fz55h4sNkj5mb9pSQRdgdifKLZip0KUdn
         8eq+CzBFXaM0OMNcCfYzAyT9XbcscOJQEd2X4MyzCFbei0BHHUYOp0NCNRMRQOO8+loa
         16PA==
X-Gm-Message-State: AOAM531AJbnQgGepQXuMn1aNVOxHvbbCajPgm2rGIWF9HAbiYuY4Fsvl
        yH7g3Qa7vTjq3X6U/QnaeH7rTzBpkKY=
X-Google-Smtp-Source: ABdhPJxWOa5treW1o0RPSt+rsgHUz9CQfPvDPmZch/OPVsdC1R7xdpV6RhXz8fI+jAuQ6oxEYeR8KQ==
X-Received: by 2002:a2e:9243:: with SMTP id v3mr5175167ljg.47.1604883698651;
        Sun, 08 Nov 2020 17:01:38 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-159.dynamic.spd-mgts.ru. [109.252.193.159])
        by smtp.googlemail.com with ESMTPSA id x11sm1175652lfe.96.2020.11.08.17.01.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2020 17:01:38 -0800 (PST)
Subject: Re: linux-next: build failure after merge of the drivers-memory tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20201109102300.539961bb@canb.auug.org.au>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <82fd8221-f903-2646-4b00-a20ae936ff25@gmail.com>
Date:   Mon, 9 Nov 2020 04:01:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201109102300.539961bb@canb.auug.org.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

09.11.2020 02:23, Stephen Rothwell пишет:
> Hi all,
> 
> After merging the drivers-memory tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> In file included from drivers/devfreq/tegra20-devfreq.c:18:
> include/soc/tegra/mc.h: In function 'devm_tegra_memory_controller_get':
> include/soc/tegra/mc.h:211:1: error: no return statement in function returning non-void [-Werror=return-type]
>   211 | }
>       | ^
> 
> Caused by commit
> 
>   1f1997eb44b1 ("memory: tegra: Add and use devm_tegra_memory_controller_get()")
> 
> I have added the following fix patch for today:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 9 Nov 2020 10:19:44 +1100
> Subject: [PATCH] fix "memory: tegra: Add and use
>  devm_tegra_memory_controller_get()"
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  include/soc/tegra/mc.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/soc/tegra/mc.h b/include/soc/tegra/mc.h
> index 43876216de34..d731407e23bb 100644
> --- a/include/soc/tegra/mc.h
> +++ b/include/soc/tegra/mc.h
> @@ -207,7 +207,7 @@ struct tegra_mc *devm_tegra_memory_controller_get(struct device *dev);
>  static inline struct tegra_mc *
>  devm_tegra_memory_controller_get(struct device *dev)
>  {
> -	ERR_PTR(-ENODEV);
> +	return ERR_PTR(-ENODEV);
>  }
>  #endif

Krzysztof, will you be able correct this typo locally, or should I add a
new patch?
