Return-Path: <linux-next+bounces-7782-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB03B1667C
	for <lists+linux-next@lfdr.de>; Wed, 30 Jul 2025 20:45:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD77516386F
	for <lists+linux-next@lfdr.de>; Wed, 30 Jul 2025 18:45:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 026891F37C5;
	Wed, 30 Jul 2025 18:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="ArWMqwR7";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hiKK4tUW"
X-Original-To: linux-next@vger.kernel.org
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9CABE6C;
	Wed, 30 Jul 2025 18:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753901145; cv=none; b=Ty3CYneJNEwx73umpBKottwtT4MXnLSXtPYB2CpPAlEF0wC+vq4sJf/kVOztNbm+FGsqDdf9q6mwwa3ePwSqGxoAC6CPx1jEbx/zBvfMz8beXj5+upZPEz31PgoJsBbuW4XgHF4f2MSx9xE7AwuqPkp6EOlWmj4V2mviPRUIh+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753901145; c=relaxed/simple;
	bh=DML+pxg5472XMdWo/I3gaHRPJpUv/4fnoxH1XWFvbfE=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=FWKsApg47l7NJ+zKxEsaLUCUZZks6OaVOHl8wacwCgpIdrV/oJ5544KDZ/FYVkhvVz/HNQq4tU8I6KF14nwTTlIzudbS7nhY1qeZnPU0nYWSO+DlcgivIyyYwh051iNW35oRC89SXvVdEHvNKCWO1OYM+zoyjy5LHN+7NAAYVVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=ArWMqwR7; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=hiKK4tUW; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 11F761D0043E;
	Wed, 30 Jul 2025 14:45:42 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Wed, 30 Jul 2025 14:45:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1753901141;
	 x=1753987541; bh=/r6ceY6wuLmPZxO2obp4/gZdNM/4IXxHbonw4d2nQfE=; b=
	ArWMqwR7hD/w3J7bUCFuYrLZ0HhCHqnrWbhyP9BMFTm4mVMZqAgQXEShxcJG4Ixc
	BxC8QnsMVChteLA+HQSqbqiQZlOKbYI/G5Z8ANgYh1jGZ9Pal9jF58lUwuBE/Ajm
	Li4IpppdpFamfWhnTSheYPmAadCP1HC4115+ngguegX1Zq2eDOhm7UJNUBMee1Sx
	DjnoI7tmrTbvI5TByJP9V2i8HnQmeWYZMkd0dgGFDn+joPpG3HORYQoHwAS9w45/
	ft2d5BpjffF1plJJF7iip8c+OriCOloRnNxgAKU3YfqrF5RQ0LgaHVvYKZbP0UDp
	eBjOIzKZHaqPLbRSycDatg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1753901141; x=
	1753987541; bh=/r6ceY6wuLmPZxO2obp4/gZdNM/4IXxHbonw4d2nQfE=; b=h
	iKK4tUWkuF4NE53qXW3FYuI9zWT/7elSOZ19zYsdxd3/4I/WAcvIR0riPUDInqRF
	XrOYokynhJuwKQTWuSYDoIrKR2bA01L2fhldxJ1E+U9YdqhYLjxUjtDRiY0svDLc
	00MiUtPOLetvD9UHgdeNeQsMu2WdvxU0Tire7QVFCKVieZM7+a+ZU/cfj1OSs9Bx
	ags8ezt1CijxjQhFr/8CceQ1D3ZlIPC0ICRJM2Dj9a7FgiFXZE7p/BLTqIHiFCaS
	HojzZ1Uuyj3zj8jgeQjDHtdc1o/N3aNb3edFi1nhABVmJiG3eEI/mh7Ewol6PLNR
	vEaiyiRD9N1wnK2s/sTFQ==
X-ME-Sender: <xms:VGiKaM3-og9oeXNg7TDOo9wljsRBftFKFsjTpO4s458ZOsk9vLCx-g>
    <xme:VGiKaHHHRAxbLFba3De9JzwDTwyXJQUa1APUMi6iGipUn7JBRdQVbVP05MkzuZxql
    K3rdwZ0_d0qMDjDNu8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelkeeilecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:VGiKaBOxyL1D1VkqoeaUWlVyV-Mx2RU2WOGCxHDnpRmQmZybpTxYoQ>
    <xmx:VGiKaLnS6EjiD1xQV4aynnKIZJL06uNeP9BKAbdLNe7cqlLRJZ-tCg>
    <xmx:VGiKaN7paHc0r3hlbiQjYgD9lFzfDm9FaiDpspvdSII-aemPzHSRTw>
    <xmx:VGiKaH3F_cn6W738_4EnDnFxoqQH3TpAiRIcE4b0OuRm1xPyCJMIBg>
    <xmx:VWiKaKV10Wj1loCmHSPdnPbPGBciNAEO1-pLjKWAh7nTjP-52Stwb6Ch>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id BABB6700065; Wed, 30 Jul 2025 14:45:40 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T1270fe1a31e2c778
Date: Wed, 30 Jul 2025 20:45:19 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>
Cc: ARM <linux-arm-kernel@lists.infradead.org>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 "Stephen Rothwell" <sfr@canb.auug.org.au>,
 linux-next <linux-next@vger.kernel.org>
Message-Id: <1457d4cc-512b-4dfe-bf2f-375af1fdbe94@app.fastmail.com>
In-Reply-To: <0b738b01-8574-49b1-b89c-3c96e9a56b28@csgroup.eu>
References: <20250723094558.5bcfca69@canb.auug.org.au>
 <627cbb55-2a55-4124-8f6e-7b4ba0441558@csgroup.eu>
 <6eac14b4-765b-4a29-b278-364dba47e0e9@app.fastmail.com>
 <0b738b01-8574-49b1-b89c-3c96e9a56b28@csgroup.eu>
Subject: Re: linux-next: duplicate patch in the fsl tree
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 30, 2025, at 16:23, Christophe Leroy wrote:
> Le 30/07/2025 =C3=A0 15:55, Arnd Bergmann a =C3=A9crit=C2=A0:
>> On Wed, Jul 30, 2025, at 15:41, Christophe Leroy wrote:
>>>
>>> Le 23/07/2025 =C3=A0 01:45, Stephen Rothwell a =C3=A9crit=C2=A0:
>>>
>>> I was going to send a pull request for this fix but I see the duplic=
ate
>>> patch is already tagged in the soc tree:
>>>
>>> $ git tag --contains 12702f0c3834
>>> next-20250728
>>> next-20250730
>>> soc-drivers-6.17
>>>
>>> Shall I do anything or just ignore it and drop it from my tree ?
>>=20
>> Linus has already pulled the soc-drivers-6.17 tags, so I think
>> both copies of the patch ended up in mainline and there is nothing
>> left you can do to change that.
>
> The one in my tree is in Linux next, nowhere else for the time being a=
s=20
> far as I know, as it was not included in the pull request I sent three=20
> weeks ago.

Ah right. I thought I saw it included in the branch I pulled
from you when I looked earlier today, but I see I made a mistake
now, as I had checked out a branch based on top of linux-next that
included yours.

      Arnd

