Return-Path: <linux-next+bounces-6477-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D4190AA5443
	for <lists+linux-next@lfdr.de>; Wed, 30 Apr 2025 20:56:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4AD933B5876
	for <lists+linux-next@lfdr.de>; Wed, 30 Apr 2025 18:56:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9B5D1E25E8;
	Wed, 30 Apr 2025 18:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="j3/41Jgd";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="HLbqVmQY"
X-Original-To: linux-next@vger.kernel.org
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF55B1DFDA5;
	Wed, 30 Apr 2025 18:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746039390; cv=none; b=XA3FkMkfahoGBff6QEDBYa/6oBrx9br/c4e3YVasdn2mfdLY/PtQq4huIJGjiUBusByC+J6I7549ben5XfzpUm4cL7eJHF7//b8N6ziCoIXjn4OoM6JPZGATComMJZU8fyj/VfAElvffTEkYwWjKcJX1fS8hMC0k9wnvuY/F5Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746039390; c=relaxed/simple;
	bh=alLES3wn1aAFAUtBAPq6rQdaW3D80Q7vAQRQbyQh1lE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=URaoie/l9Hl93WDz0pBSMpJimZ5DCXGKXaeKO+eXpJDBKlwKvwgzbSdujLDqUuRIl8irfzCPMVsKasJBRkjYHFxPiMxEnISpDk1EjBD0mQ37M4//PTLazxbLcDo8ZkKlXdqPi2+LDurEnTh22CS3/Q9Rpa2pjNM3kavq5NXCq5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=j3/41Jgd; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=HLbqVmQY; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id A61882540200;
	Wed, 30 Apr 2025 14:56:26 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Wed, 30 Apr 2025 14:56:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1746039386; x=1746125786; bh=lP0Hmi/QdP
	d1+RgtWoU2Pue5AtzFe45mtYWAsbiLhZA=; b=j3/41Jgdhj0XvMSAZYTilXFJZY
	VhD0ocBjVH0/KaoMniQNCi9BWCzdSGFx7HE1NdlYwyhdp8ZLH7L/C6W2LIOTDwfS
	y4UQb6mNggkdUpWg+m6GTUrr+QMUzdbffid3A8Me8TA5nFHO0xImgJiTTTVPxYKn
	HW+cPDbeOBByiS6PVNyr+/q7ELh0YR/rP5nza20bfezjMzChJKtmtKzzHvP3vqKx
	b6VBWvH2212YcltxM96jqYexQw+Oeujeewyw+QFUBNqGa46nXsmJSrQV/R75vo9K
	NIAl8AR49x4rgeeRynpO1+Hwm+7Eavup8ywCZu46Nd9g33L9T8PhW4WWBMcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1746039386; x=1746125786; bh=lP0Hmi/QdPd1+RgtWoU2Pue5AtzFe45mtYW
	AsbiLhZA=; b=HLbqVmQYUHJFZ2I5ojx7/8wcO6dzbsr67mo+/1DHcglWjY/isEO
	HCPU6SUkj35Mu4jtcGoPQNNt5870cglS71MTvbpJlOcdoN2w7ezEBjsYQoyU0cY6
	oRfaML7+GA3i0fTDIzq1ynhc0kDqzyzMepAf0AeRLCilcLde0QfyPUBIbsRw1+Yx
	4QGLl+hbT/Q2tF2cNeUXMB7Mbqg811UhTlu6fzXpeX4Ib8YSDLONvQo77gow+EaL
	PCs/lmZ6ctMexxwSvWhBpJkM8miRKsn7vjB+6vGEl1hOlJmWoiG1uOLJa5frSfKo
	JzehXaw4sRkxK7X4aVntv5CIpNIOgEMxqFA==
X-ME-Sender: <xms:WnISaL4-dPhAyJzRzvhrOzK0tqVb68JQV5reNrswTBY8Vc32gFiCZg>
    <xme:WnISaA6H-xxspObe7u9oMdVJe-1kNj1BMGrPgvc6o2JA_R49tOU_iJbH5wkWMIzew
    yBUPa6LFx-a2w>
X-ME-Received: <xmr:WnISaCdtt-6tCxIfH1pvX0P5droqrqKw2yC8ofPPYM2tZrREabjDJxZqM-IBDscDKIli1uoGQo8yUcTG-g8aY5TRbqoAUGE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieejgeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    vdenucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecugg
    ftrfgrthhtvghrnhepheegvdevvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeu
    fefhgfehkeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepghhrvghgsehkrhhorghhrdgtohhmpdhnsggprhgtphhtthhopeekpdhmohguvgep
    shhmthhpohhuthdprhgtphhtthhopehrjhifsehrjhifhihsohgtkhhirdhnvghtpdhrtg
    hpthhtohepshhfrhestggrnhgsrdgruhhughdrohhrghdrrghupdhrtghpthhtoheplhhi
    nhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplh
    hinhhugidqnhgvgihtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:WnISaMLvASdQRn_9ks5mY_Erf34tbdK4hxPPCNMNGqvuX2D7lpQ4jA>
    <xmx:WnISaPIlV9inqTZVOp0u-yUDg5L3fZyvMooqHP_Y2xvj4hCZ2Ku84A>
    <xmx:WnISaFwwMcFmlxiYtCpFqGaqhWFiwk-FHcB2DpBz0Ex4FlNmNjRwYg>
    <xmx:WnISaLLQ0UJl_qx8vMU1clYnalEaDydjPJazBr52zzKTwer1hLtBkA>
    <xmx:WnISaOiL4O0B1i6Z-vRzPhr3fYwB2KwqYOVMXYh2mTUejSg3uJxMLADn>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 30 Apr 2025 14:56:25 -0400 (EDT)
Date: Wed, 30 Apr 2025 20:56:23 +0200
From: Greg KH <greg@kroah.com>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the driver-core tree
Message-ID: <2025043005-default-hurray-7567@gregkh>
References: <20250430174726.0322f461@canb.auug.org.au>
 <4984921.GXAFRqVoOG@rjwysocki.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4984921.GXAFRqVoOG@rjwysocki.net>

On Wed, Apr 30, 2025 at 08:34:39PM +0200, Rafael J. Wysocki wrote:
> On Wednesday, April 30, 2025 9:47:26 AM CEST Stephen Rothwell wrote:
> > Hi all,
> > 
> > The following commit is also in the pm tree as a different commit (but
> > the same patch):
> > 
> >   142ba31d8b4a ("PM: wakeup: Do not expose 4 device wakeup source APIs")
> > 
> > This is commit
> > 
> >   150b374b9ff9 ("PM: wakeup: Define four low-level functions as static")
> > 
> > in the pm tree.
> 
> I'll drop this from the PM tree, but this technically is PM material.
> 

Sorry about that, my fault.  I can revert it if that makes more sense.
Which ever you want is fine.

thanks,

greg k-h

