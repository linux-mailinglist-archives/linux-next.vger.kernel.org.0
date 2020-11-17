Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10A6B2B58C7
	for <lists+linux-next@lfdr.de>; Tue, 17 Nov 2020 05:24:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726146AbgKQEYH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Nov 2020 23:24:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725804AbgKQEYH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 16 Nov 2020 23:24:07 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4DF4C0613CF
        for <linux-next@vger.kernel.org>; Mon, 16 Nov 2020 20:24:06 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id w4so15167250pgg.13
        for <linux-next@vger.kernel.org>; Mon, 16 Nov 2020 20:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kym+WIvXEwEsWSxB5yZoBkT204D8P+KoJQqNQejcuVw=;
        b=mkFlrCFoPs0LlKesu/WwzsFx5VtSaiENlfxp+37eTSD+dhkURoSDqP97G3N7kc70Un
         4pm143z99NLSjXrff27+FKCqgXTjnbMtzGpKTjko1aWZKlwZ7HYLX+oZYUpMjuQC6xf3
         InASiv+B9idCVVckduOORbbikhDWJKfXbwihETqLn4dOzcMXqUIjXecCVic4n78pW98c
         CPhLK+wkScc+zxI9BuxIa4KWPQdTi//I/zvdj0QlUb9u8mLLxBKX3Z75eZszU1mZF2TG
         NHHwFplRYj7foBqFGiks+yhYT3iLDSljmGuB6wAgIGKWOmeHwP1ohfRtUzy/ejd2/Ph8
         NiUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kym+WIvXEwEsWSxB5yZoBkT204D8P+KoJQqNQejcuVw=;
        b=uDn4KRTfNJT+6Fxhs/RfZrQ9Z0D1eDe2Iy56W2iIba3ApN9sQMPrPiKdy38gNc6zuy
         mS4SmGi6ooyClYK+Oa/FMLyusCTYI0Um+KX0EUbjPDMZOlnVb/PvD1b4dFjRwycY9gYS
         W8v7ebduSLzoVHUX6AeHuUJBTtNIxXbGbvefZ1F8/pHPwtw6Xoq8M4Iunswnb5qTLtgL
         2fZ+IPApEwM+kec2Zt/xBnItSxvKGj7n6MI0S+BFiHPFDgCrgkdsqdP2TQEHTznxhoOj
         MFCgJyr/zX0TcXOZKfdai+XQxLjpnX86EFzvlaETUDQ4EgMH4tVHeDjzYuONhg3NF0Gg
         GxIA==
X-Gm-Message-State: AOAM531b/T5i+r8QXEuycDijE47PMTWVl8vO/JlOT2u6tqZIydeUInWA
        YX7miN0IUg65xrIpKl85vGSy
X-Google-Smtp-Source: ABdhPJzTMEa2+7tU5c/2ocVkXIntNnCrqCgdfDc9zBt++t6tk3ibWKn2y/2NSpyZy3oeJmp2hZPQuw==
X-Received: by 2002:a17:90a:ab91:: with SMTP id n17mr2632797pjq.23.1605587046251;
        Mon, 16 Nov 2020 20:24:06 -0800 (PST)
Received: from work ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id 17sm15180667pfi.180.2020.11.16.20.24.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Nov 2020 20:24:04 -0800 (PST)
Date:   Tue, 17 Nov 2020 09:53:59 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mhi tree
Message-ID: <20201117042359.GB7787@work>
References: <20201117151225.6a50abf8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201117151225.6a50abf8@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

+ath11k list, kalle

On Tue, Nov 17, 2020 at 03:12:25PM +1100, Stephen Rothwell wrote:
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
>   0cc1f3a385b2 ("bus: mhi: Remove auto-start option")
> 

The fixing patch [1] should've landed in ath-next. Kalle can you please
apply the patch on top of immutable branch?

Stephen, feel free to pick it up in the meantime.

Thanks,
Mani

[1] https://lore.kernel.org/netdev/1601369799-22328-1-git-send-email-kvalo@codeaurora.org/


> I have used the mhi tree from next-20201116 for today.
> 
> -- 
> Cheers,
> Stephen Rothwell


