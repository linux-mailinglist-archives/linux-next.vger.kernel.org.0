Return-Path: <linux-next+bounces-4601-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D099BAC2E
	for <lists+linux-next@lfdr.de>; Mon,  4 Nov 2024 06:47:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D27C281940
	for <lists+linux-next@lfdr.de>; Mon,  4 Nov 2024 05:47:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D83318C028;
	Mon,  4 Nov 2024 05:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="he6Shnwu";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="QETGRuYT"
X-Original-To: linux-next@vger.kernel.org
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9212418BB9F;
	Mon,  4 Nov 2024 05:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730699213; cv=none; b=VpUYv/GBRZWnnizU9m9b1I+3wkox7M2J+ls54SXj/DQx50rvPBBfRmkxBPpVwELzUNOIicL9KIyPZZTzuLGGQzFSrTGkrah6yg4JptI//C4SZevTRrbC4UtpVE1sBQVzx6H4P7nYxVjvY/1r2+6vEdL1Y54H6UzMBnlYS3Hnue0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730699213; c=relaxed/simple;
	bh=Y4e0z+s1I6wZ2rMsngHshmBrcDPlrDkhDKHjrqrKiXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BzC6mR4eRCxuxjLTCuYnlXePRHu8GKdLtijZc/Ym8naJu4eSVusydmfVhDQtFMmMt7nSMa4SgNXUQH5VBtr1NaGriiyCWUJAZFNZ2HoZm6PnlGlG/V7U6qED15RuQ9mtgcEBenvHP/LEOLXcgb+h75qduVMsPqxe9oP6QeBmLcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=he6Shnwu; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=QETGRuYT; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.stl.internal (Postfix) with ESMTP id 68B1A11400E8;
	Mon,  4 Nov 2024 00:46:49 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Mon, 04 Nov 2024 00:46:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1730699209; x=1730785609; bh=h715nG4WHE
	2EG0OwTbYrRA9dFgup8FmWlso6yjLMm3c=; b=he6Shnwuve0jKTUuBXaszvq98d
	8GSVPiBmLXJFF/4pM4kZeazohSQ5KNOdQCIqe2WhziNzgMkb7/ys/di1GTNbqlTI
	YbHsDFu3XxXoxhU1cuLTuVdXe5clZ2sU7kknaX7U/sKWXaOUCFZWspyEkAiKqoGA
	eRxI2Sm2pvH8iFQmDqeJEvniTHHNlfw5Kn4LS2F+hsr0ffKUjdIFp4drlkaa9R2z
	yxFs9vzTcBhgtu1V6/Lu34zsa9B2MiImGs18rUygFHnYikD/a+iUoDd/uqHhsYEh
	NiQE8ZdM9HhwkIXY9LXMuVA84DQRl5uBezBXNUXw/12MCso2PNv5TCR+0T8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1730699209; x=1730785609; bh=h715nG4WHE2EG0OwTbYrRA9dFgup8FmWlso
	6yjLMm3c=; b=QETGRuYT2xdGDv1HCdnz+TNQCP1s7IMWvxAZQXtesGOd9VjUVJT
	LwW3RxRSV+q43o0NpSpeevrf+KmVZ3ZB6dtGebErILeOM70OuhkDsZ/9sKBpOUwL
	Ck0eBBPFP6T+xpcLB48NRDyqYQnz9WrHHp9CMkEkaeZjO9OS5pyojIHM9PFTluhX
	WvmSXpRsr3UtzdhOVLzZA2oV4oQL328C2/vBy6Baff8VCvEBqKTZzgbzwDRo2d/p
	c5XpK9teNZMunusrkP0/fp+SKLWeT9DXmr8cWGGZFKIX8d3SjptW9kugTsPW6IHz
	ILbjtVJvvxoIxUX5M2qYWOVykDAjOio3kVw==
X-ME-Sender: <xms:yF8oZ0RpaLkXE5bzI9BA973yYMPSVI4BD0QM4YFimU1Qdl8Ig08Lrg>
    <xme:yF8oZxwGrgrPWIjlJZTSYeHMcbl_dpnnHQ5weVIEkOGgCJjiKyq6Y3WyYeV1j1hxF
    EGaw6mScMAK1Q>
X-ME-Received: <xmr:yF8oZx0axsbKpUhBjTIbMpSKQ-I7B0tU6U-KlBUdxjDxZjSokMbHYClw9RTQNY2clpEpwTPVFY_Ir4YHb3gY_vJLAecsQRQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdelhedgkeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrf
    grthhtvghrnhepheegvdevvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefh
    gfehkeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epghhrvghgsehkrhhorghhrdgtohhmpdhnsggprhgtphhtthhopeekpdhmohguvgepshhm
    thhpohhuthdprhgtphhtthhopehsfhhrsegtrghnsgdrrghuuhhgrdhorhhgrdgruhdprh
    gtphhtthhopegrmhhithhsugesghhoohhglhgvrdgtohhmpdhrtghpthhtoheplhhinhhu
    gidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinh
    hugidqnhgvgihtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:yF8oZ4CYbhuPUyntYUDlEuORNKC1c6_JHmlQqpBTDzMCBRzcdxRyog>
    <xmx:yF8oZ9iyXd1pWZyr00O2wOdOfb62yQEJLBXv9gw3u8gi04LItl6pww>
    <xmx:yF8oZ0rSmR-UcDLm_IO3y9hHnYxC9DSZhFpL4jUa8TZrr_9-eFF1UA>
    <xmx:yF8oZwiXQiJuS0eeoH3cx9zmh3OeWKdbjcr1vuYlwLRSu60T-0BmjA>
    <xmx:yV8oZ-XDU_Hxjk5cWHO6zZZiHyjZNiLr4lbN0galRxWKyAPXfRTHpAs0>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 Nov 2024 00:46:48 -0500 (EST)
Date: Mon, 4 Nov 2024 00:39:39 +0100
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Amit Sunil Dhamne <amitsd@google.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the usb tree with the usb.current
 tree
Message-ID: <2024110422-flyable-cautious-383c@gregkh>
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


Thanks, I"ll handle this when merging them together later this week.

greg k-h

