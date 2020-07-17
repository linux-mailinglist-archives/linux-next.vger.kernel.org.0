Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9448223502
	for <lists+linux-next@lfdr.de>; Fri, 17 Jul 2020 08:57:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727981AbgGQG4l (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 17 Jul 2020 02:56:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726166AbgGQG4k (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 17 Jul 2020 02:56:40 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AD76C08C5C0
        for <linux-next@vger.kernel.org>; Thu, 16 Jul 2020 23:56:40 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id q5so9844182wru.6
        for <linux-next@vger.kernel.org>; Thu, 16 Jul 2020 23:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=8UI9gPp1T4gScUMErB3q1shtLzCWRrwaMXZPjE+ufzc=;
        b=vo4d4Sj7NMhKOaKLsfTqK+OXYcwUwkI0j7msoO4u7kvX95IbzKpsNvj5Z0kfSh2ZHd
         EGiriAiVD8D6dgrED9LaU/gdaN9YtHrloQLo5B4jqKA+EUcc0P8fT4Vw2YKYU5IjnTBs
         F7V2wbQtmx2ihgEWg709JN7kawds3KRBsAp8O/tfCZeISb2/Ak96fFgQTvckRm1lHYK4
         VIxklSYf/VxQ2eRtlEbaB2JSUe9XHBiqnK9yMkIQpNzKFHq0J+w+kwpjjmSHe8kx5JFX
         5Zdcbcz5qsHc7L+CUQv5fIBLvFI+E3xOaxFyILM0GF9cLolt9blsAjbj+eD1pNURva5p
         5S9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=8UI9gPp1T4gScUMErB3q1shtLzCWRrwaMXZPjE+ufzc=;
        b=iHY0lRP5Mpkbqr1NK6KtjYbQCJ7yc8jKHpK4A5UBH4fADf/Ql6Yq1rA5FxcLm+cSiZ
         zTsxPD06kc5bz3spgquq3/2ZlMhrPZtDXxxRYz4LsNzU+VZ1ZbifPLVUysuuomU7cP58
         dlqNb3IyY2wZ9mC9TOsdFfcXQ1iAM5I4KCfHTw0IaxnbtPUMTe0xvo3m3cwDhMznHTgi
         1DlHAQhl+WNfauhop6lwDKbPRrFs0kBgDKsOygbN03lE2TTeSbeh/Uxdz7jFrDuGrQDt
         8GNsMMBrat/i7oJldmcQZ96ND9dJH0NL2lBZmtz8X60mBps+PWlTsh0+rY9F2Hx1fsYT
         ituQ==
X-Gm-Message-State: AOAM532mkyKfn8epe/hBQzPOrYY0R/rg+gmlm/eArW3GN6VZPdiiGA6d
        GUvkadi+yL6F3DPQOiduC/Knbg==
X-Google-Smtp-Source: ABdhPJzSM9sf9/VrfaTej0GbtLLnhVVEKD8p238Nb5Uh7WIyVRa+EUCFvs7xeRtHz4HV02+yzeBYrA==
X-Received: by 2002:a5d:44d1:: with SMTP id z17mr8674390wrr.259.1594968998781;
        Thu, 16 Jul 2020 23:56:38 -0700 (PDT)
Received: from dell ([2.27.167.94])
        by smtp.gmail.com with ESMTPSA id t14sm818824wrv.14.2020.07.16.23.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 23:56:38 -0700 (PDT)
Date:   Fri, 17 Jul 2020 07:56:36 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mfd tree
Message-ID: <20200717065636.GB3165313@dell>
References: <20200717134154.50326d78@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200717134154.50326d78@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 17 Jul 2020, Stephen Rothwell wrote:

> Hi all,
> 
> After merging the mfd tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> drivers/mfd/kempld-core.c: In function 'kempld_register_cells_generic':
> drivers/mfd/kempld-core.c:105:13: error: assignment of read-only location 'devs[i++]'
>   105 |   devs[i++] = kempld_devs[KEMPLD_I2C];
>       |             ^
> drivers/mfd/kempld-core.c:108:13: error: assignment of read-only location 'devs[i++]'
>   108 |   devs[i++] = kempld_devs[KEMPLD_WDT];
>       |             ^
> drivers/mfd/kempld-core.c:111:13: error: assignment of read-only location 'devs[i++]'
>   111 |   devs[i++] = kempld_devs[KEMPLD_GPIO];
>       |             ^
> drivers/mfd/kempld-core.c:114:13: error: assignment of read-only location 'devs[i++]'
>   114 |   devs[i++] = kempld_devs[KEMPLD_UART];
>       |             ^
> 
> Caused by commit
> 
>   70d48975c152 ("mfd: core: Make a best effort attempt to match devices with the correct of_nodes")
> 
> I have added the following fix patch for today (I assume that there is
> a better solution):
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 17 Jul 2020 13:36:22 +1000
> Subject: [PATCH] fix up for struct mfd_cell change
> 
> Fixes: 70d48975c152 ("mfd: core: Make a best effort attempt to match devices with the correct of_nodes")

Thanks for fixing this Stephen.

I need to investigate why this didn't show up during my own testing.
  
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/mfd/kempld-core.c | 28 ++++++++++------------------
>  1 file changed, 10 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/mfd/kempld-core.c b/drivers/mfd/kempld-core.c
> index f48e21d8b97c..ad68ee699cb5 100644
> --- a/drivers/mfd/kempld-core.c
> +++ b/drivers/mfd/kempld-core.c
> @@ -79,39 +79,31 @@ enum kempld_cells {
>  	KEMPLD_UART,
>  };
>  
> -static const struct mfd_cell kempld_devs[] = {
> -	[KEMPLD_I2C] = {
> -		.name = "kempld-i2c",
> -	},
> -	[KEMPLD_WDT] = {
> -		.name = "kempld-wdt",
> -	},
> -	[KEMPLD_GPIO] = {
> -		.name = "kempld-gpio",
> -	},
> -	[KEMPLD_UART] = {
> -		.name = "kempld-uart",
> -	},
> +static const char *kempld_devs[] = {

Do you mind if I change this to 'kempld_dev_names' and still keep your
SoB?

> +	[KEMPLD_I2C] = "kempld-i2c",
> +	[KEMPLD_WDT] = "kempld-wdt",
> +	[KEMPLD_GPIO] = "kempld-gpio",
> +	[KEMPLD_UART] = "kempld-uart",
>  };
>  
>  #define KEMPLD_MAX_DEVS	ARRAY_SIZE(kempld_devs)
>  
>  static int kempld_register_cells_generic(struct kempld_device_data *pld)
>  {
> -	struct mfd_cell devs[KEMPLD_MAX_DEVS];
> +	struct mfd_cell devs[KEMPLD_MAX_DEVS] = {};
>  	int i = 0;
>  
>  	if (pld->feature_mask & KEMPLD_FEATURE_BIT_I2C)
> -		devs[i++] = kempld_devs[KEMPLD_I2C];
> +		devs[i++].name = kempld_devs[KEMPLD_I2C];
>  
>  	if (pld->feature_mask & KEMPLD_FEATURE_BIT_WATCHDOG)
> -		devs[i++] = kempld_devs[KEMPLD_WDT];
> +		devs[i++].name = kempld_devs[KEMPLD_WDT];
>  
>  	if (pld->feature_mask & KEMPLD_FEATURE_BIT_GPIO)
> -		devs[i++] = kempld_devs[KEMPLD_GPIO];
> +		devs[i++].name = kempld_devs[KEMPLD_GPIO];
>  
>  	if (pld->feature_mask & KEMPLD_FEATURE_MASK_UART)
> -		devs[i++] = kempld_devs[KEMPLD_UART];
> +		devs[i++].name = kempld_devs[KEMPLD_UART];
>  
>  	return mfd_add_devices(pld->dev, -1, devs, i, NULL, 0, NULL);
>  }



-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
