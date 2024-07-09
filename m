Return-Path: <linux-next+bounces-2856-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 672DC92AFAE
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 08:01:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20A121F2239F
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 06:01:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D93ED7E572;
	Tue,  9 Jul 2024 06:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="ptebY4f6";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="kKrkkCAM"
X-Original-To: linux-next@vger.kernel.org
Received: from fout4-smtp.messagingengine.com (fout4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2399212E1F1;
	Tue,  9 Jul 2024 06:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720504882; cv=none; b=Sj4UtCtNCtKs+X9oLVPe181dDNH00ADp+oihk6BCv0qPOguZzivS5LVcr7dPrpYwaWCfPNXX6rzNB50g0dXC/bMU0p+1QLbd8iTvbZ00PckXz02Fcz52x8YwP9P46Oh0gxJnpViKjrSMM7lK9VWmqcjUQEkAQ9q7LVXZWc+stKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720504882; c=relaxed/simple;
	bh=A7J2qxXkLo7vN//o83NXCxLk1MHOuua+i7z8zJNi0k4=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=TeRfP4fRSFeXMMdAlGPXfgNrEb0WhmkMUNCaqooVg5zhJs8XimdobTsfbbo6+bfAL+uxMu/RibP6HK1FT28RksPuNzmOhynSSkRIMr1mZVHCjxT6tiD47O1SSJX+vaf4Igd1wP/mHvVIrJiLb6CEyBewVX4VhZ8Bl7ERPOCsze4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=ptebY4f6; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=kKrkkCAM; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id 427EF13811CE;
	Tue,  9 Jul 2024 02:01:19 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Tue, 09 Jul 2024 02:01:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1720504879; x=1720591279; bh=+33ACQQ76U
	XJiJTz74tjd763vFFqkkEWpJ4vg2bCth4=; b=ptebY4f6dFVb1zM2ItwInSNz+O
	Dz1Wzc0QxVwvsbQldyk2DfpidcPv53/gZnT4XVWmLMp6FzPEe7qzBInj97QqGQQp
	/TBpgic1Yy5UQygAVj6qjK+Sttv+sQIFhmaQ96/VTLDW/lWA+xXkloLvbAWBwIdD
	w3u9/Cvzcxstw1t+F8PoHE4BYZDWk7IZzM7E9x6FIx/KuY9OggzMSipBgGBZkSoJ
	SFZq2UdOwWUvksxCaqof+hlKZlty2Gl2KKAz0e+08pO6ZFlCstLOsrnlAz0oYK5P
	hDBSdbb8Ki8BAchzyLlZ1wyqruzNlluE0YKSDAmf9HmyluEwtvO/Z2ZBZJXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1720504879; x=1720591279; bh=+33ACQQ76UXJiJTz74tjd763vFFq
	kkEWpJ4vg2bCth4=; b=kKrkkCAMHH1PIEUYoggT7v9kc/umNKLG0WC77YZ/lyzs
	g0tYNKgOkM8Pw+dM63s2xRcT3Iivyy0lLkic5QwlEKja1CxervcYCS7Ty/zhFtXV
	7zv828DsriJr/PMXFJW2lPDco70unyYRGU9IQD6oh5ScBglfQaHeNrNqRBzhCuPI
	yPSMw34of05/DA3HsaErFXswKhs3PWsNQo3lZ44LtetivK3cDA5/lYo2vJ8BdsVj
	G28Jn4YrotbWlwJFhNYCs7tQcHMleoUteAMPZ26V+BKbxqfe9iue9tFfD0EJRh/b
	0Mm2Mnnbj9DgR6U0UFK3jWVuUqb6tvKR818OA/StUw==
X-ME-Sender: <xms:LdKMZuUHuqlA4-gOLopjymhf987bojm7aa193bAFEIeJbocHIGwRFQ>
    <xme:LdKMZqk2X4xmCj2qRsL3xMrlaD5-K2ryZwzB2QCndz312OTyPZ5RyM7gKLEOdYYut
    e6TXBA_QXRQyx4MkmU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdekgddutddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:LdKMZiZ00jjKHlI5ineMH64teeUgd3F_tPiNPtMAjx_J0U8aKZXKbw>
    <xmx:LdKMZlUE4ZEo2OZsoBtzv9k2KMyOOkt6A55NEI-dPVXR-8v3DxoPnQ>
    <xmx:LdKMZon6Ujeso2runysfPZWi20E7KhtdYlhz6GUChRx05WlGEVAU9Q>
    <xmx:LdKMZqdenmD2NTglKiQ2qbH8XGSAzgdoD9a0nPgQZAzzct57hMGNuQ>
    <xmx:L9KMZpCK-W7sEJJaQdGaGr3TWPOODq-60BRYj6WCQbnIDdXpA-ns_FF9>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 8E235B6008D; Tue,  9 Jul 2024 02:01:17 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <9e756bbf-fca2-4ebc-bc04-538aded93747@app.fastmail.com>
In-Reply-To: <20240709100154.0b4b1372@canb.auug.org.au>
References: <20240709100154.0b4b1372@canb.auug.org.au>
Date: Tue, 09 Jul 2024 08:00:56 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Stephen Rothwell" <sfr@canb.auug.org.au>,
 "Huacai Chen" <chenhuacai@loongson.cn>
Cc: "Huacai Chen" <chenhuacai@kernel.org>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 linux-next <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the loongarch tree with the asm-generic tree
Content-Type: text/plain

On Tue, Jul 9, 2024, at 02:01, Stephen Rothwell wrote:
> Hi all,
>
> Today's linux-next merge of the loongarch tree got a conflict in:
>
>   arch/loongarch/include/uapi/asm/unistd.h
>
> between commits:
>
>   13aa27ce8de0 ("clone3: drop __ARCH_WANT_SYS_CLONE3 macro")
>   1d7b98ec5d78 ("loongarch: convert to generic syscall table")
>
> from the asm-generic tree and commit:
>
>   a5d43e6d87c0 ("LoongArch: Define __ARCH_WANT_NEW_STAT in unistd.h")
>
> from the loongarch tree.
>
> I fixed it up (I think - see below) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

Thanks for taking care of it. There is a slightly better way
to do it though:

> diff --cc arch/loongarch/include/uapi/asm/unistd.h
> index 1f01980f9c94,b344b1f91715..000000000000
> --- a/arch/loongarch/include/uapi/asm/unistd.h
> +++ b/arch/loongarch/include/uapi/asm/unistd.h
> @@@ -1,3 -1,6 +1,4 @@@
>   /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> + #define __ARCH_WANT_NEW_STAT
>  -#define __ARCH_WANT_SYS_CLONE
>  -#define __ARCH_WANT_SYS_CLONE3
>  

The macro is no longer needed in the uapi header and
should now be included in arch/loongarch/include/asm/unistd.h
instead.

      Arnd

