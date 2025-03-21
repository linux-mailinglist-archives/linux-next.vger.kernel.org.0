Return-Path: <linux-next+bounces-5926-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BC3A6B66C
	for <lists+linux-next@lfdr.de>; Fri, 21 Mar 2025 09:56:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE66C3BDE6A
	for <lists+linux-next@lfdr.de>; Fri, 21 Mar 2025 08:55:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E8B01EFF96;
	Fri, 21 Mar 2025 08:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="C/jeYx/a";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="reWrdfSz"
X-Original-To: linux-next@vger.kernel.org
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E836A8BEE;
	Fri, 21 Mar 2025 08:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742547340; cv=none; b=PYsAFgmg+VXIaNkwMwBF/dLPvo5TPwzjdxurtqd4YKbytDTKdoR5mmaRadzuzLA44NMYroF1LlPVcRWT/yEoAcBeD94nNtL356CmIbKxAU3flJGJ125wohAvQ9cXT/kSgk/wM6RcjNXbsjagfeK7miP7DT4NfnG6tu0rul8IIiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742547340; c=relaxed/simple;
	bh=gwz97SF+Ob89YKHD3lqRsYHSxYmlKfH/i7SV1WoHMwU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=eqzaZeVs2MflfFRTyOpNUyfXq64lR+fdXIDS41ec+2Y5Y5EZjkZWyDamUsuapsTdApBVzY+BvHosKwrbtJqr2ML4cCHtVTu21rYHjB++trJie2ArHjAVB52gfhxpBFTNaiwHZDc+pxcFRhLpaJWBLGeaY5FuDmSi+BPEYENlvGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=C/jeYx/a; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=reWrdfSz; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfhigh.phl.internal (Postfix) with ESMTP id F38D11140143;
	Fri, 21 Mar 2025 04:55:37 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-07.internal (MEProxy); Fri, 21 Mar 2025 04:55:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1742547337;
	 x=1742633737; bh=WsFBUXiH8o16pSj0PWVq1s5XJ9ooiQqZ0HXBk5az69Y=; b=
	C/jeYx/aa3rbvcxPAVVFtu72F8p7M4V81P3r6HKNZ3E5ZmMkV9uGYclPfAGKhW9d
	BIhQMJ3DrwKlrIE6tpN3AwRGL0HaXnQRT37oK8jHxupkVvCdC/78xiXx43OxvBrU
	aT0GiDpAVJ8gvsoYAhG1nQq0wQuZqgbdslfKq51GCoHbN7uhcByCDQ2lp3Q3DB90
	gr5kqSxwZDJ2eUKq8fgIbV53qH43hLrySWiGDBEcXLlNxbskuHrUFr/BE+RwdE2Y
	Gbrb8xVrasPrh8M75H0euKxPh0gQEaqSZirhxcYPGrQXOGx93HWoIcfCu8gFmCA2
	zKKrBn6C06hLwk3MgGowvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742547337; x=
	1742633737; bh=WsFBUXiH8o16pSj0PWVq1s5XJ9ooiQqZ0HXBk5az69Y=; b=r
	eWrdfSzSZkxz3/2t+G9UlXu/9DpQqJDgutuHy2FwE1hcHyLFYcJkLyFxxZttWYeP
	50vcXEsfXCcBe6ulmf/ZL0ml+DkLIcmTUEkWhbeUJJ2VBUMi6k3vZ5PminvfxnSQ
	rMe0ZYlaXHzafxfut9lKISbVKdtKEdE4OB2M4/2d8GEvYNb6XlYgphzdGlRvuUp/
	3PXeuq0GK5M1851onYg1KKl0dM/G0qG5GaqOg8m3usRlEcSlO/dfFi9eWFcD5PyG
	SFhgDVdxMTM2OC2aYmJ2Kk2zWY2LPXJlIlXY919/PANKdCaFGKDc8wKGmgf+gnhl
	9x19t1AA80r8NbULxlDHw==
X-ME-Sender: <xms:iSndZ-AJ1dwMzdn1_uYJzPPqx6MhDid4fCxep7rT-Qjr_Bjt2nN-tg>
    <xme:iSndZ4iQChBiKtU4o4KyZ2ldxaZveBxCxxFK4J1ZdNazobnlrCwAcxAUSMSfCPTw8
    s29byk61_3YSV5_Vxk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduhedtieeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    hedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshhfrhestggrnhgsrdgruhhugh
    drohhrghdrrghupdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphht
    thhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrug
    drohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehlihhnuhigqdhnvgigthesvhhgvghrrdhkvghrnhgvlh
    drohhrgh
X-ME-Proxy: <xmx:iSndZxkSGnfU1YuwFS-XzLWPJ9CLO78zW959QBtWJ5zMn8iQIc0Dfg>
    <xmx:iSndZ8yWS8TnciT3flYa4l-_uURahtMecdk7IgX4iNaWhePgjuJ1DQ>
    <xmx:iSndZzRB_qWnPwGHhcifyxRrwijC5mJ0VwjneZ3sQynVB4E0YFxPYQ>
    <xmx:iSndZ3YXrdAHM8AFGDC7nTmkCSFJpZcLApE4QL0UyJohia38-OfM_A>
    <xmx:iSndZxM2LEDJbbuGzhDU3rRKl_Rhq78T45nhu_ftTrJCqFNo9iqReJZ0>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 5BFDD2220073; Fri, 21 Mar 2025 04:55:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T03b4c03f0ce6f6fd
Date: Fri, 21 Mar 2025 09:55:17 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Stephen Rothwell" <sfr@canb.auug.org.au>, "Rob Herring" <robh@kernel.org>
Cc: ARM <linux-arm-kernel@lists.infradead.org>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 linux-next <linux-next@vger.kernel.org>
Message-Id: <1eda0df7-a797-43b9-b3d0-3d1855b58e38@app.fastmail.com>
In-Reply-To: <20250321153800.639f03c5@canb.auug.org.au>
References: <20250321153800.639f03c5@canb.auug.org.au>
Subject: Re: linux-next: duplicate patches in the devicetree tree
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Mar 21, 2025, at 05:38, Stephen Rothwell wrote:
> Hi all,
>
> The following commits are also in the arm-soc tree as different commits
> (but the same patches):
>
>   a78f7a337bc7 ("docs: process: maintainer-soc-clean-dts: linux-next is 
> decisive")
>   b31cc6af1bb1 ("docs: dt: submitting-patches: Document sending DTS 
> patches")
>
> These are commits
>
>   a42d2d53a6d7 ("docs: process: maintainer-soc-clean-dts: linux-next is 
> decisive")
>   d98d35d99e0f ("docs: dt: submitting-patches: Document sending DTS 
> patches")
>
> in the arm-soc tree.

My mistake, I saw them in the patchwork backlog and applied them.

I dropped them again now as they were still on the top of my branch.

    Arnd

