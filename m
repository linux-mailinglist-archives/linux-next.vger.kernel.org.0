Return-Path: <linux-next+bounces-4621-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B342A9BC87A
	for <lists+linux-next@lfdr.de>; Tue,  5 Nov 2024 09:57:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D67DA1C211ED
	for <lists+linux-next@lfdr.de>; Tue,  5 Nov 2024 08:57:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3188D1CEEB9;
	Tue,  5 Nov 2024 08:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="VEmjrGCg";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="E20Ax+ra"
X-Original-To: linux-next@vger.kernel.org
Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038EC1CEEB8;
	Tue,  5 Nov 2024 08:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730797068; cv=none; b=jWVSROrRFq/B94sGN+9VL040h5HgSqwCrxqk4Le+MpGS7AEmXQq+flNugTVZTMdn9uSn4zPkHc4YZ1z0Spu4ICN/bElqRCzrbOAy298bAXuLNXnk5HHYg5Oi+tZA3p9W22/SddZCCqGL88dEOzdl7XK0yxhG04rztQ/2Wj1/OEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730797068; c=relaxed/simple;
	bh=eVo19skSYM4/FeVkjG5DKP8xeomPVwkanJ4elVVAfUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R1NJ+WnG+nO/3mhgTU3otwmgFnj7GfJ/uuvUFWCl/ufR6qBCBPmr0ij+SkuqxxpMdEH0lbmExg7qTQ1lj8Aojwk4kEKHUbidkCGaSqZl8MC8m4ThyZUsY2S2a3ozm1jkrJVwwNNjXObWNAqOcDG/g8IqXniENxbO2npSfekkPqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=VEmjrGCg; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=E20Ax+ra; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id C3CDF2540071;
	Tue,  5 Nov 2024 03:57:43 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Tue, 05 Nov 2024 03:57:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1730797063; x=1730883463; bh=4Fi+CuwsiG
	kg8J5rFZ2VTi5CGPReWqS7KJyZGURo+Xo=; b=VEmjrGCglp6pXmAKodM3rwCVSo
	YZKll7YXW1fGclpLzZpyloDcWrADXochnuRBB2bGBwGF87cCmLZe7NQ3TrYcOSP9
	ruVfDGjUCL92d4caR4rkdf6n3C6f0nIYlAIpRr8bZCBKpUnF7WfVveb1Cm1l9Ozn
	2uxaV6grYItuatxV71hjtB/c0T3lcWmdC3TjTcpG154VlUf8xC+lwbSEl+D+l/Ou
	vM8K1bR0RDM8rmm+hFg2toIdAAP2j/GII8p+SAsa+WV2+1XcpHboTWI3optsvokE
	Us2aT79Z5cKQNaYkUGDrRM0XFDrUu3VweTC7+ERWhVx6sFxSNOd0LwQ0FrFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1730797063; x=1730883463; bh=4Fi+CuwsiGkg8J5rFZ2VTi5CGPReWqS7KJy
	ZGURo+Xo=; b=E20Ax+raw+uWgb7TK+Gv1sJ7v4BWlrRl4HpzqXp6Oestp+4xPdx
	wK6YzCHssKiCpVn9hzNT0MTLpXczbywYOhDkwKNaApeTtF6eNKb402+G1RUErtaw
	+1MfXaO1Azr1QD2kF4Zq6GZppvEeCsK+VIoo7zyYBtvpT4G86nBn4Pdz/G8kSvjO
	m//7zYyS84s1txfsLzntWMRbz9iPymYaBzORU5PMw/s7gbCGDC/zS5OwsU9fmIPA
	kcqOYu+TPCWXEegPXwqi+2pJLGFU3Alw66LCqMdzXVckHsMe8Znym2vgors81ZB0
	X43BriVtst+h1AST3WrRBrceg5rddHuoN5w==
X-ME-Sender: <xms:B94pZwLEcE985G7t6vOQoYifTuI4QSn6Qq4yJ2zSSXpT6irDQX0A9Q>
    <xme:B94pZwJd69hkoXyEOzXh61-q7NPiQrROllosPZzBvpOh5OuJyVj7MsRdt3zYIX7R4
    2bIKM30SJLxxw>
X-ME-Received: <xmr:B94pZwu-_kKEYnIhTJNhR8pKikEvxE1lglAp4rVeXUW7snyIHG551GLnEvAzzh3XjCLxiy6257GQe3No65UB_ZHEHYo4TQPl7Wq4Ig>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdeljedguddvjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtf
    frrghtthgvrhhnpeehgedvvedvleejuefgtdduudfhkeeltdeihfevjeekjeeuhfdtueef
    hffgheekteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehgrhgvgheskhhrohgrhhdrtghomhdpnhgspghrtghpthhtohepkedpmhhouggvpehs
    mhhtphhouhhtpdhrtghpthhtohepshhfrhestggrnhgsrdgruhhughdrohhrghdrrghupd
    hrtghpthhtoheprghmihhtshgusehgohhoghhlvgdrtghomhdprhgtphhtthhopehlihhn
    uhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlih
    hnuhigqdhnvgigthesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:B94pZ9Y4PGbhG4KWS_6PDBGrCPUO1UkP-3QJo6sxBNjyVECDZO3j-w>
    <xmx:B94pZ3Y7QNgN8sHGlz3NNsEVL47nVuXwgVPTHdn9t57C8LAMBB9KKg>
    <xmx:B94pZ5Dxc24_FmMVz1Gu4yH17gWkqDrMuI11iMT7SkWTd0AWsVjUQQ>
    <xmx:B94pZ9bLwjXNdW6-JC9qRBOp4-0SfEOfYbolZKaVflPeXfic1-nCCg>
    <xmx:B94pZ1M_1XQftOHydNNgflMDvtNqhY44hkG5LWZpNrvSGm4rF2ysMOkp>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 5 Nov 2024 03:57:42 -0500 (EST)
Date: Tue, 5 Nov 2024 09:57:26 +0100
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Amit Sunil Dhamne <amitsd@google.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the usb tree with the usb.current
 tree
Message-ID: <2024110513-molecule-diabolic-3bc7@gregkh>
References: <20241101150730.090dc30f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241101150730.090dc30f@canb.auug.org.au>

On Fri, Nov 01, 2024 at 03:07:30PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the usb tree got a conflict in:
> 
>   drivers/usb/typec/tcpm/tcpm.c
> 
> between commit:
> 
>   afb92ad8733e ("usb: typec: tcpm: restrict SNK_WAIT_CAPABILITIES_TIMEOUT transitions to non self-powered devices")
> 
> from the usb.current tree and commit:
> 
>   33a0302455d6 ("usb: typec: tcpm: Add support for parsing time dt properties")
> 
> from the usb tree.
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
> diff --cc drivers/usb/typec/tcpm/tcpm.c
> index 7ae341a40342,a8fcca029e78..000000000000
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@@ -5042,13 -5055,10 +5056,14 @@@ static void run_state_machine(struct tc
>   		if (port->vbus_never_low) {
>   			port->vbus_never_low = false;
>   			tcpm_set_state(port, SNK_SOFT_RESET,
> - 				       PD_T_SINK_WAIT_CAP);
> + 				       port->timings.sink_wait_cap_time);
>   		} else {
>  -			tcpm_set_state(port, SNK_WAIT_CAPABILITIES_TIMEOUT,
>  +			if (!port->self_powered)
>  +				upcoming_state = SNK_WAIT_CAPABILITIES_TIMEOUT;
>  +			else
>  +				upcoming_state = hard_reset_state(port);
> - 			tcpm_set_state(port, upcoming_state, PD_T_SINK_WAIT_CAP);
> ++			tcpm_set_state(port, upcoming_state,
> + 				       port->timings.sink_wait_cap_time);
>   		}
>   		break;
>   	case SNK_WAIT_CAPABILITIES_TIMEOUT:

Looks good, I've now resolved this in my branches.

greg k-h

