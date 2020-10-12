Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00D0E28AE9E
	for <lists+linux-next@lfdr.de>; Mon, 12 Oct 2020 08:59:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726527AbgJLG7W (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 12 Oct 2020 02:59:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725941AbgJLG7V (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 12 Oct 2020 02:59:21 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 739C4C0613CE
        for <linux-next@vger.kernel.org>; Sun, 11 Oct 2020 23:59:21 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id z22so13116444wmi.0
        for <linux-next@vger.kernel.org>; Sun, 11 Oct 2020 23:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=8R6AjN+P7E5Fn1syKS345C5WBWhnLVLCOEs1RW9kuyk=;
        b=uSo/yxS+dgP3+QypemHlHRE7o7ZjY5QyVMOYF/pCNuO7eqxl97UJWKfP215p9XZ0WD
         DNdbmUYHX/3f6muzjEd6IUGJBjrXKyeKMRoMajqNeM/aqcYiJP+rqEelQ7lctBR74RXh
         k3Zre8YpzstJC0cACfYPA4u/U/xttGKWLsYte4ZbMBaSGgEghCBbvayZ0BotA1Pkkhz3
         hkyJT1PSUC3SIHuGar99bbB5f/FwmBgkHESumOim8P2aJ6QC21U/4Wmq1PR6U8exrn5y
         q6Nh4uhA1WakAQyvExxEHrpmOGXV+rf6Q8tk0ZU/ZGpiiLnxlgBP7is5wW21SG6NhREd
         tF1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=8R6AjN+P7E5Fn1syKS345C5WBWhnLVLCOEs1RW9kuyk=;
        b=tupnMhOvEp4TqypDeb+SfZGGjiPAEjJJekMKlVYcQOl/NM1GPCkmleMhOAuFZ6ulfE
         /pr0J40iZkbY6Va6VAyGMK70NlgbhHht+Z0xw5a1A6zk2cCqsgcfg+jKJ0WxEJeVAr9f
         18jw+X0stBl6Sk/HqX7Lp/KNtmZkRLlnexAsU2yK+hycNvhvNjS6EstfF4iTsFhpCgMI
         tbtngpj9r4l798d26LbSxMXS8UnBftMMTntEveH0f1hwlrXiNoBAgvo0LID4YGUmB9KB
         yiGbASIm4vcAilvRBHCxxKgi3ZTeCp9k6EaK0//JdS5AK9T+Dasc3dvu4xGSBRVbvrsJ
         BOAQ==
X-Gm-Message-State: AOAM53023cy3NtVThBMZn0xruaDsNs0E1E18cEOa+ek1xelkiCAC+AYW
        a6m2mhhFfn7RAxIFwK3aLTl/KA==
X-Google-Smtp-Source: ABdhPJzKTbCpmYcZHzy4LRAsTLP1gG/GCfSlQ4UmgewK6QDxvzaHYbijwD5OaHLmKXnxWF8wuveDpA==
X-Received: by 2002:a1c:bad7:: with SMTP id k206mr9163787wmf.159.1602485960052;
        Sun, 11 Oct 2020 23:59:20 -0700 (PDT)
Received: from dell ([91.110.221.138])
        by smtp.gmail.com with ESMTPSA id v17sm24236235wrc.23.2020.10.11.23.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2020 23:59:19 -0700 (PDT)
Date:   Mon, 12 Oct 2020 07:59:17 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Marc Zyngier <maz@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
        Michael Walle <michael@walle.cc>
Subject: Re: linux-next: manual merge of the irqchip tree with the mfd tree
Message-ID: <20201012065917.GK1763265@dell>
References: <20201012161757.4cdf20c2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201012161757.4cdf20c2@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 12 Oct 2020, Stephen Rothwell wrote:

> Hi all,
> 
> Today's linux-next merge of the irqchip tree got a conflict in:
> 
>   drivers/irqchip/Makefile
> 
> between commit:
> 
>   03ac990e0ac0 ("irqchip: Add sl28cpld interrupt controller support")
> 
> from the mfd tree and commit:
> 
>   ad4c938c92af ("irqchip/irq-mst: Add MStar interrupt controller support")
> 
> from the irqchip tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

It looks as though the 'ib-mfd-gpio-hwmon-irqchip-pwm-watchdog-5.10'
pull-request I sent on Thursday 17th September [0] should be applied
to the IRQChip tree. 

[0] https://patchwork.kernel.org/patch/11783523/

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
