Return-Path: <linux-next+bounces-2883-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACDF92B61B
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 13:05:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34E231F21E4C
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 11:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9B261586C0;
	Tue,  9 Jul 2024 11:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="tWoCAcEX";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="IFKbdE9U"
X-Original-To: linux-next@vger.kernel.org
Received: from fout7-smtp.messagingengine.com (fout7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681B3155389;
	Tue,  9 Jul 2024 11:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720523082; cv=none; b=ukGDiFqsNbTBR2tS0pAlvYREGNrNHHHpymHEZFxvjxzhhpVipeev7OjWaSQig+VxfvsX+gF/sx1KB5yxSN8+TLb9vp/w7lEch7sAB+UmrRqnqmeCrFqOpYP2VGeU1c4Yhv44lsVPJuu0+mboq2jCSN/Rr2ZQ9wbU6AM8bfOsiSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720523082; c=relaxed/simple;
	bh=B5t8FOU10IgnywCSaV+yV+n3OSAVnFv17h+gxNR0IWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WDFvn6T+RqI4tN49fivmQoYsLh3Ggg3IeHMPTU/A6DNtl7oVWOUvygAY6wJTd3Koucmdk4SxVb2+8Ie73Z5UCiqAdiVic3E8zElmyR3XkqVxE2wj91MJBgWPT/wo//vRzpbexwKSBsfV7MJ3gj1o2ylobHTIT2EA9R/dMSAZ7j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=tWoCAcEX; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=IFKbdE9U; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id 659BD1381C57;
	Tue,  9 Jul 2024 07:04:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 09 Jul 2024 07:04:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1720523079; x=1720609479; bh=H3tNaDdGY8
	FKMr1+a9tMtjAdOC1ZrM5KtAJSOzs+ZOw=; b=tWoCAcEXUhgmVRM7YYbaJRQFb4
	8xe1vf8DtSpoLrehhxx1oX7O+/LiJmAqG3f/953tKPCN3ZjrrjEC2K6Tlzb/gpqr
	2+CaaXbBG8ExPtlLA+i01Yd1PbVklScLKa9wiQyP0FnSUAuJk8oOG0UyPFOoIry4
	TlPX7gylKJkTer7Z2dhQ0iO78rm28NPsQGaQxXQf7cd/446Nlwor4HuzuEIaAtm7
	MsYcxwRDM66nUzkI3D0Tzq0vWQxhRjiaqVhjfjjB4OZ23kcu3WYt1lDin3HTzSaF
	GyvMORTrvXdN/Sj+KNncu97/Zg+jEiYdnacOdHVNI2Lw5zLU1lhzeJkv+jvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1720523079; x=1720609479; bh=H3tNaDdGY8FKMr1+a9tMtjAdOC1Z
	rM5KtAJSOzs+ZOw=; b=IFKbdE9UTprV5c9WDTgZ0NWmpbWjyk1dXzyhierjp0bH
	xAicb2g+1XrzVsbdyP+W38XtjQxreWsDrLPXTLknM3RFBkOxdeMzONKdUUHmP6lX
	RxlYr/9+NfDfDpp/p9nHre2b8uWX8CS5GGSa9BFHiYNTDCYalHkeOiWsQI1eKcNA
	+L8GYCe+EwfqQ74/lP/EwLF8wIpfrwhqoR+OARQr7mCjoSMWX7hfrbGIluQbHFGs
	vC4hH2PdunfxV8SLDXvxdCrvx6FwaGWWlYhLEeCJBkZeRxIndwJtDBl6uHcXCd/x
	yx4DQbuHrCxiwHv4KFm/cR8GfcF2kQW6jcbF4TDy9A==
X-ME-Sender: <xms:RRmNZjhVGZx3wrvJ41CUYe6B1n3-VMAfvbMYlHKV8OXy8QCJwdlNrA>
    <xme:RRmNZgC176DTvYnkYF5OTXUDcJJRp2K4bgaoPS19BxME7zBlBttmgL2gyZQD66Tuy
    xkkuad4y8MXjQ>
X-ME-Received: <xmr:RRmNZjFpDraIqhjFx8LRY1A7eyuixl-epg8PLNflNY-JsaeIj-aVqo7IYdPmCp7vyhxj6I0eY1yiDFhaJUlPJKoqyztTAbP6jdFeGg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdelgdefiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeehgedvve
    dvleejuefgtdduudfhkeeltdeihfevjeekjeeuhfdtueefhffgheekteenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhh
    drtghomh
X-ME-Proxy: <xmx:RRmNZgQ8tDI68xKKzgJnWybVqMRKfc8tzUaLTbCxbLiCE25_0adN4w>
    <xmx:RRmNZgzqnIx_olKyTaFBKDRz0ooh9mJ_q5e5--OouyJPb_WhoybQQw>
    <xmx:RRmNZm4LDYUHOBrZ_aWELXe7O9Ha6dzJoCByJg4PZ_ijFckQVEvXvA>
    <xmx:RRmNZlxD2L7BdUDtm3MHHupEAX3DKB9uQkVRg3zro6bRdrHXxIGdAA>
    <xmx:RxmNZloXggv5w9oYddGP7Y4Z8NDYa395DC79F4i9BAxHPdsSz016d2Oo>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 9 Jul 2024 07:04:37 -0400 (EDT)
Date: Tue, 9 Jul 2024 13:04:35 +0200
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: linux-next: manual merge of the tty tree with the tty.current
 tree
Message-ID: <2024070925-area-cobbler-271f@gregkh>
References: <20240709153747.07d7272c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240709153747.07d7272c@canb.auug.org.au>

On Tue, Jul 09, 2024 at 03:37:47PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the tty tree got a conflict in:
> 
>   drivers/tty/serial/imx.c
> 
> between commit:
> 
>   9706fc87b4cf ("serial: imx: only set receiver level if it is zero")
> 
> from the tty.current tree and commit:
> 
>   3093f180bc6e ("serial: imx: stop casting struct uart_port to struct imx_port")
> 
> from the tty tree.
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
> diff --cc drivers/tty/serial/imx.c
> index ff32cd2d2863,d96f0524f7fb..000000000000
> --- a/drivers/tty/serial/imx.c
> +++ b/drivers/tty/serial/imx.c
> @@@ -1549,10 -1553,9 +1554,10 @@@ static int imx_uart_startup(struct uart
>   
>   static void imx_uart_shutdown(struct uart_port *port)
>   {
> - 	struct imx_port *sport = (struct imx_port *)port;
> + 	struct imx_port *sport = to_imx_port(port);
>   	unsigned long flags;
>   	u32 ucr1, ucr2, ucr4, uts;
>  +	int loops;
>   
>   	if (sport->dma_is_enabled) {
>   		dmaengine_terminate_sync(sport->dma_chan_tx);
> @@@ -1984,8 -1937,8 +1989,8 @@@ static void imx_uart_poll_put_char(stru
>   static int imx_uart_rs485_config(struct uart_port *port, struct ktermios *termios,
>   				 struct serial_rs485 *rs485conf)
>   {
> - 	struct imx_port *sport = (struct imx_port *)port;
> + 	struct imx_port *sport = to_imx_port(port);
>  -	u32 ucr2;
>  +	u32 ucr2, ufcr;
>   
>   	if (rs485conf->flags & SER_RS485_ENABLED) {
>   		/* Enable receiver if low-active RTS signal is requested */



Looks good, thanks!

greg k-h

