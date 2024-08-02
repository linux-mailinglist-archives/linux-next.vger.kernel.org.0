Return-Path: <linux-next+bounces-3216-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFB2945DBD
	for <lists+linux-next@lfdr.de>; Fri,  2 Aug 2024 14:15:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F9CC1F23380
	for <lists+linux-next@lfdr.de>; Fri,  2 Aug 2024 12:15:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F39414C581;
	Fri,  2 Aug 2024 12:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="MHalGI8N";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Fj3TSWRc"
X-Original-To: linux-next@vger.kernel.org
Received: from fhigh2-smtp.messagingengine.com (fhigh2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8819414A0A0;
	Fri,  2 Aug 2024 12:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722600951; cv=none; b=kuyk1BwRDphG7hvNCGFh19Yi3ohmzUQZTQZLy0mzHWGnXd3hkZNHijpg767vm888JeLXPmJAzj2uE3H9x7zTx72gFKilIIwKTRFE0E1O+9oijP06r32/SZn2lQSbv2m5x4A9nFTalxhDtkQv/ulK0Ea4gqm5sGAdaTnu4H10xho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722600951; c=relaxed/simple;
	bh=v2FZpuYiEUC7FxdAXbRBocoJG8wrCQa6GJSlPZNgKKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MbGW6W42GvmBrEb+EZkfK3H31xmrrBgDcZAXSNgCX2ib0OMeP77JmezIpb61f7I8pH7WIyOqbXv4yryNGYaN7o6T4ERpQDov9CtUv/KxmkNuU0ezhBXTEH2IQLftt9SMWsbOxeocrfcbpUD0H18nnkvJ+IP9j0zOublslIj5s08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=MHalGI8N; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Fj3TSWRc; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 98F5C1151A8A;
	Fri,  2 Aug 2024 08:15:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Fri, 02 Aug 2024 08:15:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1722600947; x=
	1722687347; bh=W5MJKLNSFe8vyG+t77xLfVk8rQFBLZsl0YWphHlH/s0=; b=M
	HalGI8N5biCxufXzHVK8Hb6OSJ1nfGI8Y2Mw8aGycD01V73gF96iI1FpdDZAdDbv
	Q3YJQTaGjwgmoTMb2ZcmYQIA5m3aAPxklBT8pz1gDXg0/7oYXfJFrFewxRfjjuse
	9FVTxkh3dhP/L0itNGe8HoSIi5CgWLvi3l9YiJwuwjhwlxd8JKYSfiMTgP4VySju
	lJ5DCXkIXzcVhyHkROMDobE1dILQXU77pCyemiWYPfN3wjzrxIrQ7tQIGyA+PkCo
	GLjf4VFgc1RWk8VS523ZQyiPLSh08nm9GamyWIb2r+I+QmX4LPtRYvhxw3xVwSmY
	d8Wbepft+RFpxcSlFQJ2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1722600947; x=1722687347; bh=W5MJKLNSFe8vyG+t77xLfVk8rQFB
	LZsl0YWphHlH/s0=; b=Fj3TSWRcv5OscV4rFjodk/Ac3xTewrWRm+dckS5QWyO+
	WvIa5DOtVxiuGvpeuJYlScpZMZX4pe/o6MYTvfmSvwaDG4zuDYT9ll37Xu46PL1a
	dmfE/t8965mL4h+wjLBUd2I7WEvLeaXtwUPfGYXfjaWFPB1tMtv+g5x9mdacYgwR
	1oiOtXOAhQXtTrGThpJbHz9Z+fBFX59WMxrXUlf5pTuToq4uOprMADbumMtKvbE3
	cqGE9HcW5z3+O82kkXX/cQoackvjZughZIk7/K1bvHrthTAA0SHd5IZgNQyPRt1H
	/Ds3HFYClolB8P1X1hsoqO+C/Y0CUifGLhFdZMpw4A==
X-ME-Sender: <xms:8s2sZlL9-iUe9UI3qf9LrdHDIk5G0UhIUP8Aqoxe-1EN1_ThBU-WXQ>
    <xme:8s2sZhKkA5dvzHBNYh5rn-YZMpNwfOEVtqEPLESbZex2S_Xl1nWpdVAzCkcBlsUbt
    xjE-8AMlAQY-9maX8M>
X-ME-Received: <xmr:8s2sZttf7WX2TY6anospWwswSgcQNAddNq9NGcHvw_n3Zx9k7O0SbtwPekrw_nZPiKr6DccPi6-hJU3-DtavgYci9rZMGEfZpw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrkedtgdeglecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
    hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
    hpqeenucggtffrrghtthgvrhhnpeevieelhfdukeffheekffduudevvdefudelleefgeei
    leejheejuedvgefhteevvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhh
    ihesshgrkhgrmhhotggthhhirdhjphdpnhgspghrtghpthhtoheptd
X-ME-Proxy: <xmx:8s2sZmb-9zY26lGli_1wn0oKMvHPPp1bQucBzBaDySxcPSBVEK8gIA>
    <xmx:8s2sZsa5cmyolk2fbbBfY2VOrxofDUhRRpmj0iErM4YOrQGSknfCiA>
    <xmx:8s2sZqCZL7f1Al84e0ty35baWqaH29s1Bmue_shevIcrQHSWRmgbfQ>
    <xmx:8s2sZqa6Z5X12CU67lBIPugxdNSeWfQ5-DhUdpbTfAW5m914csq6dg>
    <xmx:882sZjW4Oxi6_ViFx9FscbEZGz1EOuVyYLZvGYI0Ts9gp75OOSzOa1wg>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 2 Aug 2024 08:15:45 -0400 (EDT)
Date: Fri, 2 Aug 2024 21:15:43 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the ieee1394 tree
Message-ID: <20240802121543.GA113551@workstation.local>
Mail-Followup-To: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Takashi Iwai <tiwai@suse.de>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20240802122120.480789ac@canb.auug.org.au>
 <87mslvig7e.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87mslvig7e.wl-tiwai@suse.de>

Hi,

On Fri, Aug 02, 2024 at 08:36:37AM +0200, Takashi Iwai wrote:
> On Fri, 02 Aug 2024 04:21:20 +0200,
> Stephen Rothwell wrote:
> > 
> > Hi all,
> > 
> > The following commits are also in the sound-current tree as different
> > commits (but the same patches):
> > 
> >   c2f9fd3d6ad7 ("Revert "ALSA: firewire-lib: operate for period elapse event in process context"")
> >   e29ed9a81fd4 ("Revert "ALSA: firewire-lib: obsolete workqueue for period update"")
> 
> Sakamoto-san, with your Reviewed-by tag, I thought you gave a sign to
> put via sound git tree?  I'm going send a PR to Linus in today, so if
> possible, please drop those from yours.

Oops. When applying the recent patch[1] to the for-next branch, I
wrongly pushed these patches under my evaluation to the remote. They
should be sent by sound side, indeed.

I pushed the revised series to the for-next branch. Thanks for noticing
it, guys.

[1] https://lore.kernel.org/lkml/20240801022629.31857-1-o-takashi@sakamocchi.jp/


Regards

Takashi Sakamoto

