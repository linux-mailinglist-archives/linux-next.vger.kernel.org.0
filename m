Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26BFE27AA62
	for <lists+linux-next@lfdr.de>; Mon, 28 Sep 2020 11:11:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726775AbgI1JKw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Sep 2020 05:10:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726652AbgI1JKm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Sep 2020 05:10:42 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE788C061755
        for <linux-next@vger.kernel.org>; Mon, 28 Sep 2020 02:10:42 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id d6so382129pfn.9
        for <linux-next@vger.kernel.org>; Mon, 28 Sep 2020 02:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=O1+yMppnDpNfXMAMC1ZdSEkZ8OlKvslG0pRoiuAQVN0=;
        b=i0OWzrKQVRrRW+5vXExQR3uFGBu7++GZTpfFtp5wxHPGl0QVi/qJ5OUbL+jt4X7zzi
         XVO9IAPOK/g3UxE4+rNRbdNk6MK0TsqAr9l501hzNxohI0lrw+TYEUAUHVj5nSSPqOU1
         +odUFDTyM9fc0fflVZx0LR8MKZnZLUbZ0w1BuUdCcjUJONhQ7IEqoSUZ+3vRBjRG/Rg2
         3vabPIqfBohFl4gq4MAgOQyY4Bt7VpaeR67t7JwpcFaYb5sxz1ZjYyGJt4BCwYTHtdGr
         Vx3R+P3e8jndccEUgwlRDv7eI/BuOp7ace5krUyQkMkskRGkMfbAlFjdT9GpOFgCXeUQ
         XlTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=O1+yMppnDpNfXMAMC1ZdSEkZ8OlKvslG0pRoiuAQVN0=;
        b=MTRroef8jJU9grnRQrnnA1qawb5qauWpVXDv82x9Ban17bu399Lu87jax33op8UzHx
         Tunq/T2BonfFn5lsLEtGvMcwz+3bYDE+RnTx0x+4uEX/EhDntcYx+qNGsrhuRX5GcFBH
         nMUy8qYnhuxjZG6lSnAzhsj4JOvLWsH4LRri2Pvv2PXHxsrqKLLUj46K5zVIwBarPzPD
         RW92+2KPY+KYyQoniI+40/41Ncy8OOHE1tZLq7kFFZWrZckl+VeRcH27xFbXhyx5uODa
         cLFmiUXx3Sy4a/CPhgvzx5AX+5rBeDlePpxYkWVxX0eGbyUmMw/0U0cYbVcpxmraecu7
         m11Q==
X-Gm-Message-State: AOAM532IujyEBtzKrbvW15WrmeYlXO8C21hsLdbIioV0QIMMojm6Ovq8
        PqDnyDrnm8S0IP/0mO/3KZ+D
X-Google-Smtp-Source: ABdhPJxz0IdBuu8ZZQnGUY8fl5P06ZoniHdCD4o7XYloBPzjr6aas9+xPzk+z1uzjfdwDZhKnE47gA==
X-Received: by 2002:a62:8205:0:b029:151:c014:6915 with SMTP id w5-20020a6282050000b0290151c0146915mr591925pfd.51.1601284242177;
        Mon, 28 Sep 2020 02:10:42 -0700 (PDT)
Received: from linux ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id q15sm697928pgr.27.2020.09.28.02.10.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Sep 2020 02:10:41 -0700 (PDT)
Date:   Mon, 28 Sep 2020 14:40:35 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     David Miller <davem@davemloft.net>,
        Networking <netdev@vger.kernel.org>,
        Govind Singh <govinds@codeaurora.org>,
        Kalle Valo <kvalo@codeaurora.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mhi tree
Message-ID: <20200928091035.GA11515@linux>
References: <20200928184230.2d973291@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200928184230.2d973291@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

On Mon, Sep 28, 2020 at 06:42:30PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the mhi tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> drivers/net/wireless/ath/ath11k/mhi.c:27:4: error: 'struct mhi_channel_config' has no member named 'auto_start'
>    27 |   .auto_start = false,
>       |    ^~~~~~~~~~
> drivers/net/wireless/ath/ath11k/mhi.c:42:4: error: 'struct mhi_channel_config' has no member named 'auto_start'
>    42 |   .auto_start = false,
>       |    ^~~~~~~~~~
> drivers/net/wireless/ath/ath11k/mhi.c:57:4: error: 'struct mhi_channel_config' has no member named 'auto_start'
>    57 |   .auto_start = true,
>       |    ^~~~~~~~~~
> drivers/net/wireless/ath/ath11k/mhi.c:72:4: error: 'struct mhi_channel_config' has no member named 'auto_start'
>    72 |   .auto_start = true,
>       |    ^~~~~~~~~~
> 
> Caused by commit
> 
>   ed39d7816885 ("bus: mhi: Remove auto-start option")
> 
> interacting with commit
> 
>   1399fb87ea3e ("ath11k: register MHI controller device for QCA6390")
> 
> from the net-next tree.
> 
> I applied the following merge fix patch, but maybe more is required.
> Even if so, this could be fixed now in the net-next tree.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 28 Sep 2020 18:39:41 +1000
> Subject: [PATCH] fix up for "ath11k: register MHI controller device for QCA6390"
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Sorry, I forgot to submit a patch against net-next for fixing this while merging
the MHI change.

But your change looks good and I can just modify the subject/description and
resubmit. Or if Dave prefers to fix the original commit itself in net-next,
I'm fine!

Thanks,
Mani

> ---
>  drivers/net/wireless/ath/ath11k/mhi.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
> index aded9a719d51..47a1ce1bee4f 100644
> --- a/drivers/net/wireless/ath/ath11k/mhi.c
> +++ b/drivers/net/wireless/ath/ath11k/mhi.c
> @@ -24,7 +24,6 @@ static struct mhi_channel_config ath11k_mhi_channels[] = {
>  		.offload_channel = false,
>  		.doorbell_mode_switch = false,
>  		.auto_queue = false,
> -		.auto_start = false,
>  	},
>  	{
>  		.num = 1,
> @@ -39,7 +38,6 @@ static struct mhi_channel_config ath11k_mhi_channels[] = {
>  		.offload_channel = false,
>  		.doorbell_mode_switch = false,
>  		.auto_queue = false,
> -		.auto_start = false,
>  	},
>  	{
>  		.num = 20,
> @@ -54,7 +52,6 @@ static struct mhi_channel_config ath11k_mhi_channels[] = {
>  		.offload_channel = false,
>  		.doorbell_mode_switch = false,
>  		.auto_queue = false,
> -		.auto_start = true,
>  	},
>  	{
>  		.num = 21,
> @@ -69,7 +66,6 @@ static struct mhi_channel_config ath11k_mhi_channels[] = {
>  		.offload_channel = false,
>  		.doorbell_mode_switch = false,
>  		.auto_queue = true,
> -		.auto_start = true,
>  	},
>  };
>  
> -- 
> 2.28.0
> 
> -- 
> Cheers,
> Stephen Rothwell


