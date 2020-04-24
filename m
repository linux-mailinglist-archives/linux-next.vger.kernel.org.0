Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7450D1B6E68
	for <lists+linux-next@lfdr.de>; Fri, 24 Apr 2020 08:46:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726622AbgDXGp7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 24 Apr 2020 02:45:59 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:56357 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726072AbgDXGp6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 24 Apr 2020 02:45:58 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 828565C06DC;
        Fri, 24 Apr 2020 02:45:57 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Fri, 24 Apr 2020 02:45:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=fW6EuJKIjWQLgOq/xz1RhKe9sHY
        s05skQGD45ZQNTr4=; b=pVpskSeuZ0qM21QJz7Q199X/rxMUzN97ZTsoLxYq6r7
        HA7f5SyrqJ5C/h/34NTQIrpvMpl/9DtdFSTowf+qx44FVWzjJAmzeqRz1VvQyKZV
        9TS1AMBiEoJO3xDJhsvdH0K0kwloC9T+dI4r0LQXXBuXT0zyncQfiouykTocvTJs
        k1CRB1Rjy7ziVwVS2KO7jzUNTqiBh6gBUGZQbA1wgGt3oKVQOxIBejAOGcKfuIoz
        nxMcb46wCqz5DxTRfK9wFuLb2h8aZRnprvNyP02EB5ihMRWggMb7yy9lARe0SfUn
        WGcbfV2G1yrDtkniDWp1WQgzKVVB2KoyRMf/+qrcWUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=fW6EuJ
        KIjWQLgOq/xz1RhKe9sHYs05skQGD45ZQNTr4=; b=pK/cQ/6XBY1EATf1/X0yn9
        k6ZMj+gQzK7yMj2vUJ6EYaf5fAojtqK8yDOoqvrt8DHaYiqe2bUrV+/OncqEkYqV
        KqbgLAdcZ4RM+RRGviBMI1+tBu77ubNGVTl1CO+Jse2XeXbD7AkzFdakWHaJw7Yz
        okmSRvtGT7BZ4qHbzJNAwxfvSQ5A3s8DpD3+gzLOhmsYBoTY/7wPgvTmDPlvjD5T
        DmjCiA+nQ1vtRufgHHZhZ1DbuMmAntF71hu8EV4CZeEum83hePn/EtjZAALF437K
        F3FTNyGkmisRBll1upwDGopu99zN64zoepgPF0aPPK7JE3aPEGf17hWRVhMRCVSQ
        ==
X-ME-Sender: <xms:JYuiXvg3Z_VEo-cDS2a5Ooq4qDLHVZCsysHhfdofjH7EzJtrgHsOBg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrhedtgddutddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucfkphepkeefrdekiedrkeelrddutd
    ejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhr
    vghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:JYuiXgSaAIPaN6Xr3UquT6F6IdHLQPB7VTqC8it9_K0YB-pp-cojIw>
    <xmx:JYuiXqEY_IZJqLUut0l6hDKTWyBnUOWNCM-X_I3hdROc742yOpxGiA>
    <xmx:JYuiXgks4lhlWJlBA5-8IJoZwy_OAyOPPdZ1zKEn0uEIkJgDJm7ngQ>
    <xmx:JYuiXnxduA81WSM4aVOgicAEq2kcrsJEv6XzNNjvExNBN9Rb_dKosw>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id D25963065D11;
        Fri, 24 Apr 2020 02:45:56 -0400 (EDT)
Date:   Fri, 24 Apr 2020 08:45:55 +0200
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Malcolm Priestley <tvboxspy@gmail.com>
Subject: Re: linux-next: manual merge of the staging tree with the
 staging.current tree
Message-ID: <20200424064555.GA143960@kroah.com>
References: <20200424151546.4dea83cb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200424151546.4dea83cb@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Apr 24, 2020 at 03:15:46PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the staging tree got a conflict in:
> 
>   drivers/staging/vt6656/main_usb.c
> 
> between commit:
> 
>   664ba5180234 ("staging: vt6656: Fix calling conditions of vnt_set_bss_mode")
> 
> from the staging.current tree and commit:
> 
>   463288b98190 ("staging: vt6556: vnt_rf_setpower convert to use ieee80211_channel.")
> 
> from the staging tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc drivers/staging/vt6656/main_usb.c
> index 5f78cad3b647,3c76d3cb5bbe..000000000000
> --- a/drivers/staging/vt6656/main_usb.c
> +++ b/drivers/staging/vt6656/main_usb.c
> @@@ -743,13 -740,8 +736,12 @@@ static void vnt_bss_info_changed(struc
>   		vnt_update_pre_ed_threshold(priv, false);
>   	}
>   
>  +	if (changed & (BSS_CHANGED_BASIC_RATES | BSS_CHANGED_ERP_PREAMBLE |
>  +		       BSS_CHANGED_ERP_SLOT))
>  +		vnt_set_bss_mode(priv);
>  +
> - 	if (changed & BSS_CHANGED_TXPOWER)
> - 		vnt_rf_setpower(priv, priv->current_rate,
> - 				conf->chandef.chan->hw_value);
> + 	if (changed & (BSS_CHANGED_TXPOWER | BSS_CHANGED_BANDWIDTH))
> + 		vnt_rf_setpower(priv, conf->chandef.chan);
>   
>   	if (changed & BSS_CHANGED_BEACON_ENABLED) {
>   		dev_dbg(&priv->usb->dev,


Thanks, that looks correct, I'll handle this when the staging.linus
branch goes to Linus in a few days.

greg k-h
