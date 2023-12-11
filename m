Return-Path: <linux-next+bounces-325-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC1B80C652
	for <lists+linux-next@lfdr.de>; Mon, 11 Dec 2023 11:23:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A1131C20970
	for <lists+linux-next@lfdr.de>; Mon, 11 Dec 2023 10:23:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 205C8249FF;
	Mon, 11 Dec 2023 10:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mJPikFMA"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D6C191
	for <linux-next@vger.kernel.org>; Mon, 11 Dec 2023 02:23:43 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-9fa45e75ed9so481743666b.1
        for <linux-next@vger.kernel.org>; Mon, 11 Dec 2023 02:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702290222; x=1702895022; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tCTT1HWaBNhjtHeFQYajDR7/foWiM7nOIut8ehHasE4=;
        b=mJPikFMALdlh/q5ViicT0mAe6OI0qJqqOjkN7sJfsCEmhsDnlBNhoq+peA2cSGSNeN
         w7Z3I7NQjsuC5Amtxp7yq/MawCftjzrbv5zesPiH5iax5EkHzJDLb8vkbLOyKz3wi1Bb
         rKy2b0oh8GkAtnY5Lb8EHUHHPGIiI7T4nLgi13lHJw75Sh0CczCRWPdUMGglKoZaMVe/
         bPP4Ysz50TLvciM8tvejRfkKWDX7OXmFQ9vtSChz7/znRY+Mx4fnRgZ0CawAGx+DOD3x
         nAAsQLDDvgaO7YZ3awFdwUCsXT+vPggX3k5gh/wMeFojSzhSM+z54aGjdHYORavYPSx6
         arYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702290222; x=1702895022;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tCTT1HWaBNhjtHeFQYajDR7/foWiM7nOIut8ehHasE4=;
        b=tRwLVa6OeYrLMhHk+twcVevmAG97pbZ7ncJZfwrJpSJ9AWLwBP9aM0ivTmNDDM7t17
         kqJImt/M6nIU/vcu+PgqXxvaxtK2HlOv7N6Y5cPiUqoAAWXm7eZMRuW2GUDG1MnX986+
         gCrNyj8oAJBiDZeDBIpyIyefid+gHZP6699yIeriqPeeJtgeP35nlSg6Rk5AUr+kSuw2
         WsZFzFRNs7R8t5/u4eAVITuujPRH6HWPUYWK9tylLQIbNObVOqVS2V9KhT75X5lpCy0x
         a2iY/NrB82cIrOz9/LV90VxmQTPDR8LHOMSaCoeDcng+ctSx2+QP86jtToeAzawHjNBX
         MTZg==
X-Gm-Message-State: AOJu0YynSWsHNzE/PNPj4PhWzocFI5h4tA85oOGgsmjMtjMvYV+AttMc
	rPItVpIO232EGZVDsTKOij/NZFYXC/bRxVK7rd8=
X-Google-Smtp-Source: AGHT+IFMu9j1B8jlwJ/43DK0orY7miD0UT4aeO4o/Rxpav0ZGKbzZIg9R4nuStg4nZBpSTX9lyyeYg==
X-Received: by 2002:a17:906:535e:b0:a1f:652e:d7c5 with SMTP id j30-20020a170906535e00b00a1f652ed7c5mr2050207ejo.111.1702290221932;
        Mon, 11 Dec 2023 02:23:41 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id li18-20020a170907199200b009fd77d78f7fsm4548178ejc.116.2023.12.11.02.23.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Dec 2023 02:23:41 -0800 (PST)
Message-ID: <730b71e2-9c3c-4b40-86a6-0794615222fd@linaro.org>
Date: Mon, 11 Dec 2023 10:23:40 +0000
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the nvmem tree
Content-Language: en-US
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20231211164916.6f0d2357@canb.auug.org.au>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20231211164916.6f0d2357@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thankyou Stephen for the patch.

On 11/12/2023 05:49, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the nvmem tree, today's linux-next build (i386 defconfig)
> failed like this:
> 
> /home/sfr/next/next/drivers/nvmem/core.c: In function 'nvmem_cell_put':
> /home/sfr/next/next/drivers/nvmem/core.c:1603:9: error: implicit declaration of function 'nvmem_layout_module_put' [-Werror=implicit-function-declaration]
>   1603 |         nvmem_layout_module_put(nvmem);
>        |         ^~~~~~~~~~~~~~~~~~~~~~~
> 
> Caused by commit
> 
>    ed7778e43271 ("nvmem: core: Rework layouts to become regular devices")
> 
> I have applied the following patch for today.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 11 Dec 2023 16:34:34 +1100
> Subject: [PATCH] fix up for "nvmem: core: Rework layouts to become regular devices"
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>   drivers/nvmem/core.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index 9fc452e8ada8..784b61eb4d8e 100644
> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c
> @@ -1491,6 +1491,11 @@ struct nvmem_cell *of_nvmem_cell_get(struct device_node *np, const char *id)
>   	return cell;
>   }
>   EXPORT_SYMBOL_GPL(of_nvmem_cell_get);
> +
> +#else /* IS_ENABLED(CONFIG_OF) */
> +
> +static inline void nvmem_layout_module_put(struct nvmem_device *nvmem) { }
> +

I see no reason why nvmem_layout_module_put() should be even under 
IS_ENABLED(CONFIG_OF).

Updated the patch with this fixed.


--srini

>   #endif
>   
>   /**

