Return-Path: <linux-next+bounces-7775-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7D1B16205
	for <lists+linux-next@lfdr.de>; Wed, 30 Jul 2025 15:56:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93F7E188C08C
	for <lists+linux-next@lfdr.de>; Wed, 30 Jul 2025 13:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BFD329ACC5;
	Wed, 30 Jul 2025 13:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="gaqjJ9YS";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="glruIOeQ"
X-Original-To: linux-next@vger.kernel.org
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01FF2D837C;
	Wed, 30 Jul 2025 13:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753883753; cv=none; b=owPlu24pqNpnQ5tkdOhUxZHwqSYLp/aDksZzzDWkUMCFIaj+CquLhN1oIdGtureF5MZU05lGmVS/Cx5vKxmUHyqRtCPLZ5161xO5HhG23GPG59h9CIIjlpz0w83cd88Hd6wePR8KNf/zljofWa0ELmS7t4L167PivMEUK1cgtoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753883753; c=relaxed/simple;
	bh=pBQBevykAWTuA6N3TioRbzpm3IPcIYt9lsST2ldS87c=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=C98U133I17FhNI21ewdJx01ELGW4Y1ZZotwar5JlDLgExGHV5IzHDW6lflmMrm3pRmRnCZf0ZSpvxqH1VNKwI8MR+cXMSuE1cX7SHp6Wqs5yjNBbdr5vhKOdtMk7uW1ajJbRFrS76BBTwD5E/y1zyudv7H/eLR9M76MrhfKcCzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=gaqjJ9YS; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=glruIOeQ; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id B46721D014C3;
	Wed, 30 Jul 2025 09:55:48 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Wed, 30 Jul 2025 09:55:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1753883748;
	 x=1753970148; bh=k5GMeG03tjewtcK58G4TQ57zAvN4HNyzHDLLhPeneKI=; b=
	gaqjJ9YSGEVQDtJh18xB+957rxtqekgkY5cIsZe5QfKIl66kOSTta/swukoZgDfJ
	D6rQWt/fptu4LzUQHC8V7yyA3jK6VvHFaJjM1L3c/xA5F+0vYh1PqLSxkXWfOsCn
	/EO+msnPd98znrcO1S50DoImaMfm+iVQmIfcV1X1BbsYZOKpNQ7jWKddI8AtjR68
	IjWlgkgyeC3ZCNmLIw+VFsMaUnzF1oeL8rcDYygY9plFn8m4mmAEweZM2x012BvV
	7swMUhd1zdXpdswAHLc818OMPwtNpPFH1bQdWNSQgVZP6ZsqKndWq9fpR6b06eVn
	BvifuEpuc6yqAKTduO+pNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1753883748; x=
	1753970148; bh=k5GMeG03tjewtcK58G4TQ57zAvN4HNyzHDLLhPeneKI=; b=g
	lruIOeQbETX0RZEC6R3DaKV6hVAptYrCQJP452Gv4BFn4yx2r1mwEwGIEm/7ZXwj
	QHpqbLhniv7dZenu27wOuMxCAVs1B0NcuBjuHIIw8rXqrxMm+muxDjsgVluY09bl
	eDkaKqYBkO+5I2IFcOzflekJANl++9w+dGd95XvcsPwqsb+v6VwSmeFWeE1Y6rX9
	DzRPyXjoCaEQfM4wKzZGaQRwOe/vWowgtKwYuqB8x1RpnWJA0cRen1tAVzlcdZvd
	q0t1heC/UOzl9El1GnThNwfG1r9PN96jFCWr3FgWsN2E+Q+6vWdL4W9lHNGF7CPo
	XLPJQk8nxJ7WHHhKMojQA==
X-ME-Sender: <xms:YySKaBuhOCzwvpmVBFNoSo6EzpdeMcPjw9woEnLN14d41rr7PtYPsA>
    <xme:YySKaKf2tOsiTm_IOtOcNLsRcm8QqAScDNVyeB9-fjKcdizV-1cA4gdFDuaOzdpnG
    XOwO3ugsKhWIxqg8V8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelkeduudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpedvhfdvkeeuudevfffftefgvdevfedvleehvddvgeejvdefhedtgeegveehfeeljeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeeipdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopegsrhhglhessghguggvvhdrphhlpdhrtghpthhtohepshhfrhestggrnh
    gsrdgruhhughdrohhrghdrrghupdhrtghpthhtoheptghhrhhishhtohhphhgvrdhlvghr
    ohihsegtshhgrhhouhhprdgvuhdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnh
    gvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhig
    qdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuh
    igqdhnvgigthesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:YySKaOGB5iPrpPPT5udIB6aQdFEPCEb2c33bc470a0V_oTL_hWlY7w>
    <xmx:YySKaG_OG69IZY7HfuLELQnvMc10xHwIu2JJfcgJyYKCiDWWDrX2jQ>
    <xmx:YySKaFyaC6ksiJ6iKJmRCIgFX879-d_ClzXZQWkM5swXHZjkkxMXtw>
    <xmx:YySKaCMf_A5s_GZPyktKw0RSRcZds5sG-hGuPCRwpoxDmPLY-JaNEA>
    <xmx:ZCSKaFEq8hBkwwxo-4e_WxypxyEZqcsqLwtnvCH25aHR0ndZPjaHyg5R>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6D6EB700065; Wed, 30 Jul 2025 09:55:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T1270fe1a31e2c778
Date: Wed, 30 Jul 2025 15:55:27 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>
Cc: ARM <linux-arm-kernel@lists.infradead.org>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 "Stephen Rothwell" <sfr@canb.auug.org.au>,
 linux-next <linux-next@vger.kernel.org>
Message-Id: <6eac14b4-765b-4a29-b278-364dba47e0e9@app.fastmail.com>
In-Reply-To: <627cbb55-2a55-4124-8f6e-7b4ba0441558@csgroup.eu>
References: <20250723094558.5bcfca69@canb.auug.org.au>
 <627cbb55-2a55-4124-8f6e-7b4ba0441558@csgroup.eu>
Subject: Re: linux-next: duplicate patch in the fsl tree
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 30, 2025, at 15:41, Christophe Leroy wrote:
>
> Le 23/07/2025 =C3=A0 01:45, Stephen Rothwell a =C3=A9crit=C2=A0:
>
> I was going to send a pull request for this fix but I see the duplicat=
e=20
> patch is already tagged in the soc tree:
>
> $ git tag --contains 12702f0c3834
> next-20250728
> next-20250730
> soc-drivers-6.17
>
> Shall I do anything or just ignore it and drop it from my tree ?

Linus has already pulled the soc-drivers-6.17 tags, so I think
both copies of the patch ended up in mainline and there is nothing
left you can do to change that.

    Arnd

