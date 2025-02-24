Return-Path: <linux-next+bounces-5545-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E6312A41535
	for <lists+linux-next@lfdr.de>; Mon, 24 Feb 2025 07:14:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D2C08169E9F
	for <lists+linux-next@lfdr.de>; Mon, 24 Feb 2025 06:14:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03CBA1C84AC;
	Mon, 24 Feb 2025 06:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="aEcCq7IC";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="5CzYQdfW"
X-Original-To: linux-next@vger.kernel.org
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997BF1C7012;
	Mon, 24 Feb 2025 06:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740377660; cv=none; b=gzKQ1Ca3Y4jeCZDw75Ha/QohU02Z6XMM57Xcu/stysG/mAoz8vchXBw16QSWNYnPkRw5Vs02Q3UGHcz0Ski1rqmADzWJubyQbAZ6lztIYfsAf9Y0id/mvyAsYTGUkNHbpXgckuYTdXQVwy5zAHulclLUfG04sbPRic74su3WKVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740377660; c=relaxed/simple;
	bh=uthh1GdJlNwYGP2qd5ulMfwYkkHd6RmXQHNrvTZVuI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t9hN/yOT+4Xv/LWxmYFMT2AkmdIAzyKZFu1SY7CTTShDVVwUl4sIZgc0dXM/b6rABKRzmuyIQuRvyGVS3C38QC09+F4tP0dUcq1BljHMXBsfqUI+OqIqZ3owl4ULMII6YsiFBLpfvdIYAItyNutsQyAkxfsBxCQQC6y0SYoO/t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=aEcCq7IC; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=5CzYQdfW; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 58A39114015B;
	Mon, 24 Feb 2025 01:14:16 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Mon, 24 Feb 2025 01:14:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1740377656; x=1740464056; bh=WVZQ/SrBG9
	HHdueJZQONEaVAhB/knCgZad44KJVP+KM=; b=aEcCq7ICRoMiKQcJZXXe+DY5jY
	Tzg+lEM+ZrzrNjdeQYDfoZSWaxdaBx/72VFwhwLd/Q6l6mxd7NE2v/+kaoOsHzB0
	IOIN+YIcLTOTTduplzWUA/3A4JaI/0ue4JTQfkclakbGldYu5YZ2Sg2eJyc1WhvA
	tKfmJRSooBhReEjWrhOVGvXOFLtZ5/tHUsNJ2ee0srVUc/9So0Es6drGkpB5GXy+
	Y2w+jExOnHegPBTcgMWlfvkOOwSiShqflyJFxvXP0zXOrG/k74a6IuAhokKwfYFE
	k/xUwngq+ymWyyQqZYxBerVggUpt2ugCA0dMcFeZxJCLKvIzn+HZ3x/eHpUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1740377656; x=1740464056; bh=WVZQ/SrBG9HHdueJZQONEaVAhB/knCgZad4
	4KJVP+KM=; b=5CzYQdfWTQlMfeSwETdcFR52LIL7YDK85Nl5nqfiItrlKhC4JAB
	KN6TQXrXlXLH94NlUyalSyr1zOnAcCOyqc3leK53wMFhwo+MI1TR8DeO4282KPLw
	MnDIKwndRz7L4xhS6eLktPOXkTN+0LKMxbbLjZCRuuNwdnwB5WlXqaGa3wi3F+Uz
	nH3RaGKX7Xwv1Tty9rTyL6HNNso8goWDePceZmTbP3MlPGPOwO9WW7IDiBJqdPEL
	1Gg54qQrYpAnPK/BjQeRlVOfVhroX+CBK/a4g0WzBgmwYXWY4UI5YzC3ltXaNEHQ
	QFjKzzoylk7UfoOwWHpDzWhInoPznWK5psQ==
X-ME-Sender: <xms:Nw68Z5C_8nGADCwzU8fz-BBgvG0UgvhzauI2wqJJm_j82hnO9sEEMQ>
    <xme:Nw68Z3gMLV3tYWJCDl8qjMyOX1u_cZMEgVIu7ssw9xbI5UhdThUKAdG8Btz5_LlV9
    cUYVW9X7GHuYg>
X-ME-Received: <xmr:Nw68Z0l3Yqv642QOAeQdFUCjnCCyMIo5iAh3naVUPnzyDTMqvgG2s1p1sIYHtXFIySUsn1qdd3j2QhStqOuSLjseXN8-0gBTvAzOxQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdejkedtudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtf
    frrghtthgvrhhnpeehgedvvedvleejuefgtdduudfhkeeltdeihfevjeekjeeuhfdtueef
    hffgheekteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehgrhgvgheskhhrohgrhhdrtghomhdpnhgspghrtghpthhtohepudegpdhmohguvgep
    shhmthhpohhuthdprhgtphhtthhopehsfhhrsegtrghnsgdrrghuuhhgrdhorhhgrdgruh
    dprhgtphhtthhopehtghhlgieslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopehm
    ihhnghhosehrvgguhhgrthdrtghomhdprhgtphhtthhopehhphgrseiihihtohhrrdgtoh
    hmpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhgpdhrtghpthht
    oheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpth
    htoheplhhinhhugidqnhgvgihtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:Nw68ZzzMR_p6oAvaHPJh0L-JPp623D4LcdqpBzv3xQ-Sr7bP9dOfDQ>
    <xmx:Nw68Z-Sho52GRPrZ1cLPzYhli8Sa453G8Buw78IfbgEZTsKnuXAcXg>
    <xmx:Nw68Z2ZiNZk_PWQYjEQW5QOtw0HR9BRgKr4si9xqdB6BDG25zqBbRg>
    <xmx:Nw68Z_QayM5u-56w3IJLZ8y-9oX5z23gutBSyIZ_zDCZgOZg2KjDIw>
    <xmx:OA68Z6r5NXSipetnGfP8SA59Msv9hgMmDJwxxN5IhW2FsIIlBr8E02Vt>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Feb 2025 01:14:15 -0500 (EST)
Date: Mon, 24 Feb 2025 07:14:13 +0100
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the tty tree
Message-ID: <2025022451-planner-motion-5d5b@gregkh>
References: <20250224155015.7790ed0f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224155015.7790ed0f@canb.auug.org.au>

On Mon, Feb 24, 2025 at 03:50:15PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> The following commits are also in the tip tree as different commits
> (but the same patches):
> 
>   a2d1afe65a15 ("serial: xilinx_uartps: Use helper function hrtimer_update_function()")
>   d2fa8e52cf91 ("serial: xilinx_uartps: Switch to use hrtimer_setup()")
>   7ba2facc3f91 ("serial: sh-sci: Switch to use hrtimer_setup()")
>   afa51660033c ("serial: imx: Switch to use hrtimer_setup()")
>   8cb44188b986 ("serial: amba-pl011: Switch to use hrtimer_setup()")
>   d45545c32904 ("serial: 8250: Switch to use hrtimer_setup()")
> 
> These are commits
> 
>   eee00df8e1f1 ("serial: xilinx_uartps: Use helper function hrtimer_update_function()")
>   0852ca41ce1c ("serial: xilinx_uartps: Switch to use hrtimer_setup()")
>   4e1214969603 ("serial: sh-sci: Switch to use hrtimer_setup()")
>   721c5bf65a1d ("serial: imx: Switch to use hrtimer_setup()")
>   c5f0fa1622f6 ("serial: amba-pl011: Switch to use hrtimer_setup()")
>   6bf9bb76b3af ("serial: 8250: Switch to use hrtimer_setup()")
> 
> in the tip tree.

Yeah, sorry, my fault, I forgot to drop them.  We'll just live with them
for now.

greg k-h

