Return-Path: <linux-next+bounces-6268-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A57D7A906A4
	for <lists+linux-next@lfdr.de>; Wed, 16 Apr 2025 16:39:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1226C3B2A49
	for <lists+linux-next@lfdr.de>; Wed, 16 Apr 2025 14:38:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15C241B424E;
	Wed, 16 Apr 2025 14:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bWZurPw4"
X-Original-To: linux-next@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA981AE005;
	Wed, 16 Apr 2025 14:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744814339; cv=none; b=fB2BYZxqDIVzLNP8ey9S4YqzteTBPVajI/jrvrCxkB4x55BJ5K6sz5lIadaaoDySoiB/2/6ToVyHehWVedh+MdS6pG2L8Y9pfOijX492e8c2ooc+n8BD0LsMWN9Tt8IQwQs7yVybl9NWRGeQyMpsQCKd1e4vGciffUS6qm15H6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744814339; c=relaxed/simple;
	bh=renL6LwoceAbF24fMo71EZU0slhxf/A+Y4NCyzeYny0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gah6jyR1baE9wagh4h4zIzceE7v1U5vRdedNwX3MmyjktsbMMK45OpkljEWxEevKWIfz4LwXIlQt8tuRBm9Z2433p0ELAg/NYkx1MFLdhbXnGn/iA2ArB4bRScCKzsHOlYtelH8BSNRfEK3ecNVAntljU5Ug2CXP2yj88wGnOZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=bWZurPw4; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A8FA143992;
	Wed, 16 Apr 2025 14:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744814334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wp9rOD25RXguEAHoeSU9OVeZEEl5lBTpFq9oWJbz6T4=;
	b=bWZurPw4ObLFXQWshYgyR4EdyznxKElKhO4BdMzLhSebx/HZKsy1KEr5Fe7OQuHFuJv7c2
	SHQOUN7mxmaQ9Ai6V0JKsjZbfTVkeMHuzT78A0+LF/zGa5F1KtESX28NYgFST7wzzRf1My
	Rt1+0jlKrNCGPZLEEbU5M0VpKIsQeg1gkk0t9wBWIaU8RAjtrGgUIFHpcgmgyePFZN+sJK
	7ydJazwJbCsFq6LeKo3teCUB1UiTWic9zwEbkgSBKT2Gl/uUstVps0JQUE3Omt+xz6BMJp
	t2f2cyFpcxQwTSFcwBRvPK2IexYS/Q5WdQ9I5JZ1lyuKmT5zOdRLFdsdk/WhkA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin"
 <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Jason Cooper
 <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the tip tree
In-Reply-To: <20250416132151.3b0448d0@canb.auug.org.au>
References: <20250416132151.3b0448d0@canb.auug.org.au>
Date: Wed, 16 Apr 2025 16:38:52 +0200
Message-ID: <87a58ggohv.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdeiieefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhffkfggtgfgsehtqhertddttdejnecuhfhrohhmpefirhgvghhorhihucevnffgoffgpffvuceoghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgffhgedvhefgtdejvdethfdvieekgfetuefhueekteetgfdvueeutedttdekgeevnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemfegutgemvggvkedtmeejfehfsgemieelkeejmegsieehvdemieguvgeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmeefuggtmegvvgektdemjeeffhgsmeeileekjeemsgeihedvmeeiuggvkedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepshhfrhestggrnhgsrdgruhhughdrohhrghdrrghupdhrtghpthhtohepthhglhigsehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtohepmhhinhhgohesrhgvughhrghtrdgto
 hhmpdhrtghpthhtohephhhprgesiiihthhorhdrtghomhdprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehjrghsohhnsehlrghkvggurggvmhhonhdrnhgvthdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: gregory.clement@bootlin.com

Hi Stephen,

> Hi all,
>
> The following commit is also in the mvebu tree as a different commit
> (but the same patch):
>
>   73989a38268d ("ARM: orion/gpio:: Convert generic irqchip locking to gua=
rd()")
>
> This is commit
>
>   5b49e7ff76b7 ("ARM: orion/gpio:: Convert generic irqchip locking to gua=
rd()")
>
> in the mvebu tree.


Thank you for the notice. I will remove the commit from my branch now. I
didn't realize it had already been merged.

Thanks,

Gregpry

>
> --=20
> Cheers,
> Stephen Rothwell

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

