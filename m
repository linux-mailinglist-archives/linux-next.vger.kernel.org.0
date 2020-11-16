Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 983F82B4534
	for <lists+linux-next@lfdr.de>; Mon, 16 Nov 2020 14:56:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728461AbgKPNyW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Nov 2020 08:54:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728717AbgKPNyV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 16 Nov 2020 08:54:21 -0500
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF48AC0613D1
        for <linux-next@vger.kernel.org>; Mon, 16 Nov 2020 05:54:20 -0800 (PST)
Received: by mail-ej1-x643.google.com with SMTP id 7so24515339ejm.0
        for <linux-next@vger.kernel.org>; Mon, 16 Nov 2020 05:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tessares-net.20150623.gappssmtp.com; s=20150623;
        h=to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=aD3qfM2yjHhnaLsG2eSOWaWvLo9/5a8N5bYSZ4uCB7Y=;
        b=LUiuPEMbmS7vgnAVfR+ERX3dRmQvGSdG9XuuqY6sg2/rqrsVHfpklHOazYJrCB0hEA
         cQLuuLB7ySeXZK247dnTqKW/vW3GjS+2ESt9RHSu+N9Qhx+ZDPNs5IKBUfqTCj0gPdPZ
         BoG8aof99kghxDkXIz3KLNZ/0+3+pbIephydtlVNr1zEzUDTjMKPYHp1KFm77p0qkbNy
         OvPkpqdbbvHHwS4TvAa7cBuDmgTDACiqF5vcf96/96SPfxzRwaWNWEQqxfb/ARYFJ/QB
         +LUHkYDiuAL2B1/AM8GVlROUJ+ZJDPDMcHX8bLG7b4Ni/V7uZwWxof5XTxiylKDIENRm
         71NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aD3qfM2yjHhnaLsG2eSOWaWvLo9/5a8N5bYSZ4uCB7Y=;
        b=Ly7qpvJvBH7JkmMRKZK98QNBZUstWn8S/3Tf/VGHE41Hg3+XhZJ/MTTMvEKI5gCA1I
         tktjI+3mdAsavZq1dzRigJzFMJ3mlDHcoZ4YIVuREMuMXUwoV7XiFUDoRLGSwBnkpV6J
         32QBl1AFvflA1AV+B0Llfz8GwOLAKIhMp91qn4SzdnjuNrDsG1rKZmD+B5c7TGmV8q9e
         NrXHtqtNzm1uJ5gXE6Iz/fUnSfBdi3iAIYOLQA+UIgckU31ziqZVD53z2y09DugLbIPs
         IiuixIZgE4R4dZJIUPuq+TiHA2CfTxM1CEVkzfKtcCcPyBiadGgJaiD1wenv8Wtr2A6L
         tSxQ==
X-Gm-Message-State: AOAM532NyFEkASJOFUouoDCR/X/qWBNnQIo3A15AAKWeb54Y934cu3mo
        8p0pIZCB02DKwBtgYYkREvIUOg==
X-Google-Smtp-Source: ABdhPJz7P8v17bMp5D5XxlovDjHdxIZm7+U5Y8L6o/R+Ow2OUmKHk+O9OrzxUeIxe43EoK3JOXQJqA==
X-Received: by 2002:a17:906:60c4:: with SMTP id f4mr14724959ejk.336.1605534859480;
        Mon, 16 Nov 2020 05:54:19 -0800 (PST)
Received: from tsr-lap-08.nix.tessares.net ([2a02:578:85b0:e00:76c5:ace8:67f7:ee5b])
        by smtp.gmail.com with ESMTPSA id rp28sm10467307ejb.77.2020.11.16.05.54.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2020 05:54:18 -0800 (PST)
To:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc:     kernel test robot <lkp@intel.com>,
        Aleksandr Nogikh <nogikh@google.com>,
        Willem de Bruijn <willemb@google.com>,
        Jakub Kicinski <kuba@kernel.org>, linux-next@vger.kernel.org,
        netdev@vger.kernel.org, Florian Westphal <fw@strlen.de>
References: <20201116031715.7891-1-rdunlap@infradead.org>
From:   Matthieu Baerts <matthieu.baerts@tessares.net>
Subject: Re: [PATCH net-next v4] net: linux/skbuff.h: combine SKB_EXTENSIONS +
 KCOV handling
Message-ID: <ffe01857-8609-bad7-ae89-acdaff830278@tessares.net>
Date:   Mon, 16 Nov 2020 14:54:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201116031715.7891-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Randy,

On 16/11/2020 04:17, Randy Dunlap wrote:
> The previous Kconfig patch led to some other build errors as
> reported by the 0day bot and my own overnight build testing.
> 
> These are all in <linux/skbuff.h> when KCOV is enabled but
> SKB_EXTENSIONS is not enabled, so fix those by combining those conditions
> in the header file.
> 
> Also, add stubs for skb_ext_add() and skb_ext_find() to reduce the
> amount of ifdef-ery. (Jakub)

It makes sense, good idea!

Thank you for the new version!

> --- linux-next-20201113.orig/include/linux/skbuff.h
> +++ linux-next-20201113/include/linux/skbuff.h
> @@ -4137,7 +4137,6 @@ static inline void skb_set_nfct(struct s
>   #endif
>   }
>   
> -#ifdef CONFIG_SKB_EXTENSIONS
>   enum skb_ext_id {
>   #if IS_ENABLED(CONFIG_BRIDGE_NETFILTER)
>   	SKB_EXT_BRIDGE_NF,
> @@ -4151,12 +4150,11 @@ enum skb_ext_id {
>   #if IS_ENABLED(CONFIG_MPTCP)
>   	SKB_EXT_MPTCP,
>   #endif
> -#if IS_ENABLED(CONFIG_KCOV)
>   	SKB_EXT_KCOV_HANDLE,
> -#endif

I don't think we should remove this #ifdef: the number of extensions are 
currently limited to 8, we might not want to always have KCOV there even 
if we don't want it. I think adding items in this enum only when needed 
was the intension of Florian (+cc) when creating these SKB extensions.
Also, this will increase a tiny bit some structures, see "struct skb_ext()".

But apart from that, I think we are fine, even if we add new extensions 
in the future after this kcov one.

So if we think it is better to remove these #ifdef here, we should be 
OK. But if we prefer not to do that, we should then not add stubs for 
skb_ext_{add,find}() and keep the ones for skb_[gs]et_kcov_handle().

Cheers,
Matt
-- 
Tessares | Belgium | Hybrid Access Solutions
www.tessares.net
