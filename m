Return-Path: <linux-next+bounces-3594-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7173696C0CD
	for <lists+linux-next@lfdr.de>; Wed,  4 Sep 2024 16:37:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1CE441F21B9D
	for <lists+linux-next@lfdr.de>; Wed,  4 Sep 2024 14:37:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49FC31DAC5D;
	Wed,  4 Sep 2024 14:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="nL/E0qFG";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="S6bTVywN"
X-Original-To: linux-next@vger.kernel.org
Received: from fhigh1-smtp.messagingengine.com (fhigh1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADFD1E871;
	Wed,  4 Sep 2024 14:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725460609; cv=none; b=FDSxKMD35Nuy0+Jk4teSq3zxX7cUwH7I9IXAqLQ9cFesZgxx4R2iRE/bbkFdzQj9Jb2KtQ/Cfj52S4XBAtvZFx/3LPDj4ZjFF8qBL+2yigUXwa71BTjYq2b9zoFU9tkZJMycAxOhEFglGwcB3cLYwM7tkbcspo4NWJiybnlwf8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725460609; c=relaxed/simple;
	bh=pJxqGv92LWCceBc+JZ0tpIa80nahQlAeKmF6m0/qfEw=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=dndyn8ce/DczTXqykwffnfySGwWh0wVANUVSS57BIqxR6P/CUVlspWpcxn9YpWE9XDnJsbyzVrUt8vrQTpz5YDPbJ8JT3KQk0rmtXVs+gCl0EhGIy4PYQp1cw/OaToZbA8S5B7AQUbj9kVIVHxmWbcxH4c2EGQW7TdHhvodhr/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=nL/E0qFG; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=S6bTVywN; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id A17DE1140200;
	Wed,  4 Sep 2024 10:36:46 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-04.internal (MEProxy); Wed, 04 Sep 2024 10:36:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1725460606;
	 x=1725547006; bh=IZQqsKxMYamNT2ngzYBOlaCRex0vsynuLu2ZlNqHf3c=; b=
	nL/E0qFG2Ji8vN7+rDxT1AswPgAVvJ1sxaRmnLQnNGX+afE1wPqryPMNac9KwZIZ
	dHfZXyFO+wHdPBB+Wvcw7sxqFng2uU0vmZ3VQDxshL/Uut32qdLtrPLF8WlNwiG0
	xexOwLTMddlR9J2c80tafUNujYCjVokcXojFL3TlyTa7lVtbvfomdb30cHqdPfjz
	ReGRMqdnX7eOuOUWxJSf8BTZ3bAaPeWHMSoEJZ1Bcg7hm7n7LiE8WZoajUKC4u+d
	6yqAr0D9GpXzDS35vQKExyLvWJLkADSXGqGjK/XtoKZvPg5raxLbxvszuKH+COEP
	Irmxn9MWgrVZlIME17d3yQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725460606; x=
	1725547006; bh=IZQqsKxMYamNT2ngzYBOlaCRex0vsynuLu2ZlNqHf3c=; b=S
	6bTVywNxF0Im68pe0yEkrtei54KmAY3KI2uoVK/6qeAUfy+hbx5aZRWWdeA/9I0p
	V/RCjbVE/Y8qLtSaeRsgAtwUfcv9MCVOsQmnqskw+xClu//oAzxFzHUgid4wLx3N
	4H/J7QzRXOjmv/gtPC/MBypUXOaZBbLJ65Jrjc0OACpoIsDVG0VQxT8hndpoJ8Qx
	x2fdxDtRuApegOMn/jC2PcHG+PRHFmER8nzEDHF13H8ZYMv+/MeBjWVA0yRW1Qu1
	TWcMF0+XJpVM8uMpg+rytxjQIrRc4UVGMc4ba7KDuRGiNDrCM/IRg81O0tpZ0OAo
	SWdFyh1qi/85NiM8YgeRQ==
X-ME-Sender: <xms:fXDYZgMhd7JgbbnhY1HiKnz7My2zyO6AmMXsJbv4oWnt82PecoEDGQ>
    <xme:fXDYZm_cG1XSXhd_UDGR13bXkytbU6aOPXqyg0pEF_q7EtNYvMZf0VBODun_iA621
    9SNbC7ao8ohy0ESEE4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudehjedgjeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepjedp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohephhgvrhhvvgdrtghoughinhgrsegsoh
    hothhlihhnrdgtohhmpdhrtghpthhtohepshhfrhestggrnhgsrdgruhhughdrohhrghdr
    rghupdhrtghpthhtoheptghhrhhishhtohhphhgvrdhlvghrohihsegtshhgrhhouhhprd
    gvuhdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhn
    fhhrrgguvggrugdrohhrghdprhgtphhtthhopeholhhofheslhhigihomhdrnhgvthdprh
    gtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehlihhnuhigqdhnvgigthesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:fnDYZnTtnLRggR4I9KGpHVYZYNQGKZWAm-H2irDjI9T3bkgRROCE1Q>
    <xmx:fnDYZou--qfwwlp1VVtOi7nwkzMQvV9J2PX_6rvE6ymJPw1tWyPMhw>
    <xmx:fnDYZofHWzuW9CsJ1IPOwI00igaen315WAhJP_2X5KYPN4aGXWX9FQ>
    <xmx:fnDYZs3asT6A4ZDvh7e94TkHavG1xxjUYXPvZIoMjH2bCsSGcWI5fQ>
    <xmx:fnDYZgTNSv8cVsGjlUHD4hsdZIzTDhoK98kFnOquBamv2vNolaytSPrS>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E2DEF2220083; Wed,  4 Sep 2024 10:36:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 04 Sep 2024 14:36:25 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Stephen Rothwell" <sfr@canb.auug.org.au>,
 "Olof Johansson" <olof@lixom.net>
Cc: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Herve Codina" <herve.codina@bootlin.com>,
 ARM <linux-arm-kernel@lists.infradead.org>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 linux-next <linux-next@vger.kernel.org>
Message-Id: <2ac0b88f-2eb0-4d57-a1df-a4e40741fd62@app.fastmail.com>
In-Reply-To: <20240904104859.020fe3a9@canb.auug.org.au>
References: <20240904104859.020fe3a9@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the arm-soc tree
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Sep 4, 2024, at 00:48, Stephen Rothwell wrote:
> Hi all,
>
> After merging the arm-soc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/soc/fsl/qe/qmc.c:25:10: fatal error: sysdev/fsl_soc.h: No such 
> file or directory
>    25 | #include <sysdev/fsl_soc.h>
>       |          ^~~~~~~~~~~~~~~~~~
>
> Probably caused by commit
>
>   eb680d563089 ("soc: fsl: cpm1: qmc: Add support for QUICC Engine (QE) 
> implementation")
>
> I have used the arm-soc tree from next-20240903 for today.

Thanks for the report, I have now applied Christophe's fix to address this.

      Arnd

