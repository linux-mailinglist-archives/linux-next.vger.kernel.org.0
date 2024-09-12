Return-Path: <linux-next+bounces-3793-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F7B9768C5
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 14:12:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F0DB1F28A26
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 12:12:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D38FE1A0BFF;
	Thu, 12 Sep 2024 12:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="f/EsOmnX";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="HsGqCYkS"
X-Original-To: linux-next@vger.kernel.org
Received: from fout3-smtp.messagingengine.com (fout3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4460E2C6BB;
	Thu, 12 Sep 2024 12:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726143117; cv=none; b=nCDOA3f0GKZGvWcx04WeB8+11f56zkasetQXWy6TuALoXvMtvDA2YdmzIL9ZRsFFmg26loY63dgZcoqDUosHrqDuhAxzIUnjoJbjXQyXPt+SlOjLn7rwaTgifPG+0ErSugsrsnfM12y3yvIXnjgYOeQIdlnDjonE+qqfbTIpnjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726143117; c=relaxed/simple;
	bh=Q/PnUo85fy/tlStIQuLheGAYVrhrBPziiX2IK2jFKaQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=rdEh0i6x5MZoLnn3tqj6iGDyZNj9hoDBwTZk1Prc+f/M9kB2gn3jRT544Syqsb2ixcD4sufKLSBmM8Hz4B7pBkLUEwTwJShxWVTaCm1I+cC0e1c0b+9U5waHdLBb/Iu5g6gHqQ7EGmh9UXIWPK6KjMDaB0z5Gn0UPPzayW0+Nyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=f/EsOmnX; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=HsGqCYkS; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 4A6D9138061E;
	Thu, 12 Sep 2024 08:11:55 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Thu, 12 Sep 2024 08:11:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1726143115;
	 x=1726229515; bh=4p/TdVBDjwCeJV5aQJz/NeWiuEFVm0y+MnxBehrAVfQ=; b=
	f/EsOmnX0GIAYevmNNi7m8dY+pTs1JXmp7u7lhtJHTk1T5rXOjrHkbKgt9O2L5Xp
	pFRWEdGw8NFloe672gVhMjb8othAhq0Le/N9cVATHxnMpV6EcpuRQpqNOVEJTpyq
	NNQfbTOogzuGzUgYRpcqdf4+9YQzqVEx85c+vxUkGv+D1mSDL79Wm7xJ4jJcbqG0
	vj46deIua77qOsSGTLXtl2gI9OD7//m0KcVJY13lwj1B9bN66eL9DPydRfaLN5VB
	ZmnwLGPG/R4chHm8WTyFOVNqZyMSPIVbwRuW1lzIL3Mvfhgp7RjRokkN6vR0EULi
	eOdXrv44CuKAmBmJ3lQBag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1726143115; x=
	1726229515; bh=4p/TdVBDjwCeJV5aQJz/NeWiuEFVm0y+MnxBehrAVfQ=; b=H
	sGqCYkSvVIMy4cDrBurgVpPmTCO3za33vkOEtCn/0CKHns7pwjATIKkmDU1dRmNR
	u6iMXhTd/3fvlWWcFNuh5Ujqu4NU3z0tLP4mXkxrqw/wAZdUujEu9d6+ybXWfJ5O
	rd3Zb68qtvKk5FKRloRE3Que3NQZl4qWuSuMl7GGKWu06JKT0XMdr85jiPbNwyDj
	DZs7mms00gcHxCYJuChs9Sc8QGDOlLHidpH0+/1JHPMFDTmFIeQaI/yFnY3Z3Dld
	S2HpNqyQPZb136LqleB6MjNgvfA8Mya+W1Vuixc5uTOp8JaFLNm1FEFAKkKZuZ7l
	vg6qH8YL7Q4mNI3qtq7RA==
X-ME-Sender: <xms:itriZuoT8wP1oDC_L3d3Tma6p0fiP5662Vk1XOVxa4_eMfpMGjRcwQ>
    <xme:itriZsrSEaLk-rfhbIq3H9w2buOKYxNWuH2nY4Atm-ykJsyJTn-JUCQ1RfjrO7qCJ
    cypDMUkvhEuB4PT3fI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudejfedghedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepiedp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshhfrhestggrnhgsrdgruhhughdroh
    hrghdrrghupdhrtghpthhtohepfihimhesihhguhgrnhgrrdgsvgdprhgtphhtthhopehl
    ihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
    dprhgtphhtthhopeholhhofheslhhigihomhdrnhgvthdprhgtphhtthhopehlihhnuhig
    qdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuh
    igqdhnvgigthesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:itriZjOUkHpTTPpOE_M2TxdfwoJjfzbi2cFw8TjUGh7SYpcyZRyKOA>
    <xmx:itriZt5XnDI86TNmfiMCQHkHqLEkRBZmfmqtHrrWxRKaeb4G3_-HEg>
    <xmx:itriZt6hbsSvG8vQsWL3I7GjmFhlM_w_Au-L5RtxEouQUziG4tq35w>
    <xmx:itriZtj7FkbIjPxc4EapvH1pzVgCeeRmMqDLv5TBGYaaGQx_75-BlQ>
    <xmx:i9riZrSieHma7uiHOXSinjOKMQD8NTuhTd7cbXEpPzm3PsaPi8nAlqHz>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B114B222006F; Thu, 12 Sep 2024 08:11:54 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 12 Sep 2024 12:11:33 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Stephen Rothwell" <sfr@canb.auug.org.au>,
 "Wim Van Sebroeck" <wim@iguana.be>, "Olof Johansson" <olof@lixom.net>
Cc: ARM <linux-arm-kernel@lists.infradead.org>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 linux-next <linux-next@vger.kernel.org>
Message-Id: <f2b4e574-3afa-4346-a6bd-2583fb3760fb@app.fastmail.com>
In-Reply-To: <20240912152150.1db4cec7@canb.auug.org.au>
References: <20240912152150.1db4cec7@canb.auug.org.au>
Subject: Re: linux-next: duplicate patches in the watchdog tree
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Sep 12, 2024, at 05:21, Stephen Rothwell wrote:
> Hi all,
>
> The following commits are also in the arm-soc tree as different commits
> (but the same patches):
>
>   369afb28a856 ("wdt: ts72xx: add DT support for ts72xx")
>   ba60f951a098 ("dt-bindings: watchdog: Add Cirrus EP93x")
>
> These are commits
>
>   07933ff8d919 ("wdt: ts72xx: add DT support for ts72xx")
>   ad39ab18fd06 ("dt-bindings: watchdog: Add Cirrus EP93x")
>
> in the arm-soc-tree.

Dropped both from the soc tree, thanks. 

    Arnd

