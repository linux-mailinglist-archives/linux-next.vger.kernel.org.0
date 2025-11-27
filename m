Return-Path: <linux-next+bounces-9242-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F27C8CF69
	for <lists+linux-next@lfdr.de>; Thu, 27 Nov 2025 07:53:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CD9A84E36D8
	for <lists+linux-next@lfdr.de>; Thu, 27 Nov 2025 06:53:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97C3027FD40;
	Thu, 27 Nov 2025 06:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="Wvxy4zc3";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PpyQLGP1"
X-Original-To: linux-next@vger.kernel.org
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D11D27A130;
	Thu, 27 Nov 2025 06:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764226379; cv=none; b=F6Hj/r/se75hWPYqMbloUWM8voZwHFI4qcwU4rsQL1PgZS4ZJomUfTfpw64rsozYNNpu7QRnvjIUamwoaeAoPc132vT+tSHoCqBQXpJY/mkvXnvlkmN8TyKY2Aq5lVkj/ZsHLQXnclEamZsYonBmmvXCEMToSWTjfK6N98Bi4P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764226379; c=relaxed/simple;
	bh=pL7fbjgFOZo8MHudwY6DV3CSSbahW8sLfudIRsrotWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WqkLSHZs9xVeY2pR3SdFDtovx9WR3YqjAAEMSNBDX4WPDJHuy8YL2GGJLI4fSbLMtukelhdlpoxQzTpBLIr/7WCBWUWmZYg4/O8K/IUvkqTHzpk/3rteOCaiB5mm1ESBX4cQIh42LqrIolIKGTyQ0LYmZ/S5sIUEqhifrEN9qWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=Wvxy4zc3; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PpyQLGP1; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 0D97C1D00163;
	Thu, 27 Nov 2025 01:52:56 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Thu, 27 Nov 2025 01:52:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1764226375; x=1764312775; bh=s0yVjlp+dM
	fUp1R/BlZ4uF56MWWHMvflTyf65/dXHvw=; b=Wvxy4zc3O23ChdHu49No3EIaHw
	gOjZaTHV1rq3pP2QZnQocTzVekLNTctRFkS5adAa8nd7MQK7rx9DF40CqAQ140+q
	o1AhHc3W9SPBXgHEwiFltdKg6Fh37ufYzgu34SA/LwhN2/g2+xcyPnjC8PH+m6Gm
	2oUUjEgUZE3P8iajV+tud6UVasEaM96EL0pqnYQblmIDwW8RcFKIoTHmrPsbf8Xo
	BbNO4jQLLfPmnexq4ztq8AlciFqU296mQbLSI9MNB+04lLhRx+hNDL4yPDRfU3E2
	7pwCL12IYM85798ezplIsJSFDeRgv85PC58tR/za51Pprm9xrceIKw9ePMQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1764226375; x=1764312775; bh=s0yVjlp+dMfUp1R/BlZ4uF56MWWHMvflTyf
	65/dXHvw=; b=PpyQLGP1rRlZkUyBc8ZYmiR2/SYGWidWjRmfrQuiWNy8NsL0D3d
	BKNqzY7xNwUxBEzurSYKSZZkl7w4ULmedRj45OsGjCStMwmCrsMtWYBDzr2SJbIn
	yl1+sU/hdmm4UWxzMOD3a8Nkbegj8QOXInRR5fbUi7b9jhVSnq6LV18vCeT0Ouh6
	4guU0FkhMcxghG6Q5y9ar1x3e+RQhBU2Qd/n4BeuONaft2H8mlSuZ31BKBNe9I5h
	oSSWJ5wyQVMCfqWuOW1S1zDMdJYcv7QvVaFzi4mU35PMSMpDX1ZKmgFfn/WTn7wK
	z4iGwoK4U60xp6gDr9wMEw5hw486Apr3Xhg==
X-ME-Sender: <xms:R_UnacX406oH5mE-3jZWW5NofjPrvD0NfrsQwsn9Zw-5V9RbHuKOSg>
    <xme:R_UnaW9oyKtjBSa43VpDKJHuiiSfAAvO-PoyZ7sh2GybkfNqvRtXKhZB7AduWs-RY
    dSRQGAvO0wrawIf8CsKbkLbjDWLuRmzob9V51qlqhDhHoRAzA>
X-ME-Received: <xmr:R_UnacpSbDfRwnUdmJ8GvEdCWTFPRwEv4qR6PBW5pNS84NIVNx0iG04dg6_Gb-ph3C-ShVhVfSYyA6FED1sqQdlxVlfwssPctqvx2w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvgeeiheeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepheegvdevvd
    eljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefhgfehkeetnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrd
    gtohhmpdhnsggprhgtphhtthhopedutddpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    ohepshhfrhestggrnhgsrdgruhhughdrohhrghdrrghupdhrtghpthhtohepihhlphhord
    hjrghrvhhinhgvnheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehjihhr
    ihhslhgrsgihsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnh
    gvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhnvgig
    thesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:R_UnaZJbJs_D1DuSy0AbQYZ9nPMvl6TxofZKPMxejUtBKUtxVACzCA>
    <xmx:R_UnafMzHEn7L8rCKzOkU86DtRy4waXFXF6LWkTvfwZBDFAgNVpPSQ>
    <xmx:R_UnaWq8XCMLk1nsR0RjLCmkCwCR6V7phDAsQ6ofohzM6QDc4OJnrQ>
    <xmx:R_UnaSJYaXddlBlv7lzolm8bt-u8TZ4G_NosfZfMhC92IN8zQ29t2Q>
    <xmx:R_UnaVNBgJKDU4O9Hp21Bj4oxQZAq0010g90oSQIePgTf1OVLK-dHpAP>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Nov 2025 01:52:54 -0500 (EST)
Date: Thu, 27 Nov 2025 07:52:50 +0100
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the tty tree with the tty.current
 tree
Message-ID: <2025112740-marbling-deem-9037@gregkh>
References: <20251127120921.3c398213@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251127120921.3c398213@canb.auug.org.au>

On Thu, Nov 27, 2025 at 12:09:21PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the tty tree got a conflict in:
> 
>   drivers/tty/serial/8250/8250_rsa.c
> 
> between commit:
> 
>   2bf95a9bcb50 ("serial: 8250: Fix 8250_rsa symbol loop")
> 
> from the tty.current tree and commit:
> 
>   37d55c92e9db ("serial: drop SERIAL_8250_DEPRECATED_OPTIONS")
> 
> from the tty tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Looks good to me, thanks!

greg k-h

