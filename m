Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FC004318C5
	for <lists+linux-next@lfdr.de>; Mon, 18 Oct 2021 14:17:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229833AbhJRMTo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 Oct 2021 08:19:44 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:33537 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229519AbhJRMTo (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 18 Oct 2021 08:19:44 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id C5B203200FA2;
        Mon, 18 Oct 2021 08:17:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 18 Oct 2021 08:17:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
         h=date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=x0KJzCbJFSe9C/yj3j/2aCCzcsO
        x35f4682NnWdDluM=; b=sv+KtCGoqPyFXurcu/jhFUUGEPCC8ADKapb/x3ENyqW
        2nwWr5Aqhpj6lelCO3nJiEA2iqQrutJIMgAY5b/gbWwCJ7979rYAytlc9i8MJxm7
        ptLG+Q6uKlSMug+OBT53gfqlRx5WhLIV1lspdJULCTR8UzJCuT7QlV446o69dIxn
        c+7hkSMEYQhhRNrdQJHYvc6BRzJ06fpECnoKQnT+6WzEEJt51KiXdG3/uB3W582g
        LVuux3noxAXGNqycqJ68jfFIcKyO6MjCIjtD1202QTs+C9P7G2kXxL7ONEsJqZ6s
        UoI86VD/+ZSCuA03m4A1sPTt4mAsDaaYLE9P+GEzFtQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=x0KJzC
        bJFSe9C/yj3j/2aCCzcsOx35f4682NnWdDluM=; b=SZUPvv8fYnOJVLiYv1jfnJ
        HzgHCWzjAlewIb5eFz4lcg4/jW/IfTauwFQnMs9j1FP7YXsgd9QHbZHQn/Geq/hy
        gqXwLIGBeXdgyS9O4k+14ms6yNXmztB0rwWDwlN8YHKooRyoXQOW2JWH8SJ5bvip
        ktKNHLIzLgjNf1RvswLGiGrGou24w65mLa/ea8R5HJcm4ryT+LwffKLTjXPYhj5w
        AorHgk/tuF1QCfxZqm5FvRQ/QpmD5Ej4KyY4BCmY6pyP5El/f6mnpTvRuNpa1bA9
        vlxCrsTCoE0eQiENC+8NM9Beh1w0DtCmYQRbsdHbOO+D0UjruaLf/qk9BEbvF8bA
        ==
X-ME-Sender: <xms:2WVtYfCsvcW4h2HK9hw5dWULdtJGVKJwYjaAU2CbCJ8ftLOwHrtvow>
    <xme:2WVtYVheWHDRaCMA_SbWnxzClLucAtVOaj__QUq02xF1tAvvIClMuUjhuHvX1VxCB
    Rq0c92Lxkd9eKNebd4>
X-ME-Received: <xmr:2WVtYamT43prbW0ssdCgWzFIYl0CfUNRo4W-JhlP6qPZWlu9Uel4s0zkZXvP-tk1blULWdnKLjIZMKoiWSrXPHNmvTftRT_zfw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvtddggeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
    hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
    hpqeenucggtffrrghtthgvrhhnpeejgeeifeeuveeufeeigeegjeelvdfgjeegffejgfdv
    keelhefgtdefteejleekjeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhh
    ihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:2WVtYRwhP7zdoYsZyqlXfJd99YA86nvHBKI7-vw29yahZ59EJ9Fzzw>
    <xmx:2WVtYUQFtOgaMv8SPT0Dx2j2UDJvbcz1LEthaeMIYVvlACvIfYjJHg>
    <xmx:2WVtYUby9ySOXAJJEKtck0i9bIlivMKUZVmvOJ3ZgzoGjSE-jYsSlg>
    <xmx:2mVtYacaNifuXk4OTJo6E5wa4Gutpkp3crxOfidH4wUnbf53asWx7A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 18 Oct 2021 08:17:28 -0400 (EDT)
Date:   Mon, 18 Oct 2021 21:17:25 +0900
From:   Takashi Sakamoto <o-takashi@sakamocchi.jp>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     alsa-devel@alsa-project.org,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: firewire: Fix C++ style comments in uapi header
Message-ID: <YW1l1U4/isAd2xzc@workstation>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
        Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211018063700.30834-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211018063700.30834-1-tiwai@suse.de>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

On Mon, Oct 18, 2021 at 08:37:00AM +0200, Takashi Iwai wrote:
> UAPI headers are built with -std=c90 and C++ style comments are
> explicitly prohibited.  The recent commit overlooked the rule and
> caused the error at header installation.  This patch corrects those.
> 
> Fixes: bea36afa102e ("ALSA: firewire-motu: add message parser to gather meter information in register DSP model")
> Fixes: 90b28f3bb85c ("ALSA: firewire-motu: add message parser for meter information in command DSP model")
> Fixes: 634ec0b2906e ("ALSA: firewire-motu: notify event for parameter change in register DSP model")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Link: https://lore.kernel.org/r/20211018113812.0a16efb0@canb.auug.org.au
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  include/uapi/sound/firewire.h | 70 ++++++++++++++++++-----------------
>  1 file changed, 37 insertions(+), 33 deletions(-)

I completely overlooked it. Thanks for your reporting.

Acked-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>


Regards

Takashi Sakamoto
