Return-Path: <linux-next+bounces-6773-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4885AB6920
	for <lists+linux-next@lfdr.de>; Wed, 14 May 2025 12:48:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6D4D3BCF2C
	for <lists+linux-next@lfdr.de>; Wed, 14 May 2025 10:48:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76EB126FD97;
	Wed, 14 May 2025 10:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hAX3YBY6"
X-Original-To: linux-next@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7F825E453;
	Wed, 14 May 2025 10:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747219711; cv=none; b=GJDpzJqvS2oHXKKIViNhL6acdCKljDnTnlmvJDYy46MYkuofoI5b2OG4TFmElEaF1QmzjPEMnMQ5rCZ9h0n0VSCtT/DRoFt9mODrijlmLsmhQRzsVJEeJ58apKYCLzUvYbbJDYxljdXD/SCAoMH46OZ2QRGeNc0PtC3Ih6Fl+og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747219711; c=relaxed/simple;
	bh=Am6+5hIthbRTBwqRDdcag9w+o5FwihD0Ybc3qA2P3zg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WT/TZ1KveHiQ9ZtpEHRFSMGsGyeM7ZVLsAbswwQ6pRGLJX4O4xjYaIAvp/zSfrss1UChPWo3sMZg4HwraX3aimvYX6Eyhvw+LWy8fFTkl0NS7nZIrKAe6Nlp1wKEmTSN1gbZu+GTimyDCp442VAiFYwBxRk8XhNgRx3GSYmHoew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hAX3YBY6; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3D75E41CFB;
	Wed, 14 May 2025 10:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747219700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6Q095rtrbjfxFUIdQvOiPilxc/gRxMFUqo5sTcxVnw0=;
	b=hAX3YBY6sFjQ2wGB0hxyNvgt0bxbkTIHJxMU6iRf+bkYe72eEzDTRk+bQM5nDCj68jT2l6
	rB/beGnglyZcuPybMuacijufeikfQ5msMfoTKdrkTw32ej83ClUpZzsHwmXZLvlFZikWQX
	KCdDoTYqG/lcl1K0mqh6sr7t2tsGN5JDUxYlS67sJ/TkH8pAI6fF94D+OeaPTrKqwkHcyh
	ydDgennDsoEX3fseqejmUxQmJMN8B0XQDP1WJnGOJXEdODzNmwSPCnwpr1ClxDMqKSPzBN
	JA66v5w+pquFKF4tiNQQ0RIyF7F4TEOxbSUL0uU93I7gBICpGoBQLG9SWnCVOw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Jason Cooper
 <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Arnd Bergmann
 <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the mvebu tree
In-Reply-To: <20250512130613.02c970f4@canb.auug.org.au>
References: <20250512130613.02c970f4@canb.auug.org.au>
Date: Wed, 14 May 2025 12:48:15 +0200
Message-ID: <8734d7qxhs.fsf@BLaptop.bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdeijeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhffkfggtgfgsehtqhertddttdejnecuhfhrohhmpefirhgvghhorhihucevnffgoffgpffvuceoghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgffhgedvhefgtdejvdethfdvieekgfetuefhueekteetgfdvueeutedttdekgeevnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtugemvgegkeejmeduhehfmegrvdduugemudgvfeehmeegvdgtrgemudgtlegtmeeivdeltgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtugemvgegkeejmeduhehfmegrvdduugemudgvfeehmeegvdgtrgemudgtlegtmeeivdeltgdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepjedprhgtphhtthhopehsfhhrsegtrghnsgdrrghuuhhgrdhorhhgrdgruhdprhgtphhtthhopehjrghsohhnsehlrghkvggurggvmhhonhdrnhgvthdprhgtphhtthhopegrnhgurhgvfieslhhunhhnr
 dgthhdprhgtphhtthhopegrrhhnugesrghrnhgusgdruggvpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqnhgvgihtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: gregory.clement@bootlin.com

Hello Arnd,

> Hi all,
>
> The following commit is also in the arm-soc tree as a different commit
> (but the same patch):
>
>   a3a0b8b23108 ("ARM: dts: marvell: use correct ohci/ehci node names")

I can drop this commit from my tree. Is it OK for you ?

Gregory

>
> This is commit
>
>   49683c02d8e1 ("ARM: dts: marvell: use correct ohci/ehci node names")
>
> in the arm-soc tree.
>
> --=20
> Cheers,
> Stephen Rothwell

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

