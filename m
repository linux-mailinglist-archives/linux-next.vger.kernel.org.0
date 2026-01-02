Return-Path: <linux-next+bounces-9519-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7C8CEF67E
	for <lists+linux-next@lfdr.de>; Fri, 02 Jan 2026 23:09:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 90AF23011185
	for <lists+linux-next@lfdr.de>; Fri,  2 Jan 2026 22:09:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78043242D78;
	Fri,  2 Jan 2026 22:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="xQtUv5nw"
X-Original-To: linux-next@vger.kernel.org
Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D052036E9;
	Fri,  2 Jan 2026 22:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767391778; cv=none; b=dyqPGSLFwM55kt0NPvi+bE86AlIAi/ucytyJczbi9VWci6IxoLtmHi0UXsx1hA4v46C24QHFoP9WFDKC8JrSgpjzMIyZq57wKumO/ORuPWSb2GKXP9QIx1fQOCS0smUPV9XX3W3e8wrEaU0FbjJxQMpOvW6PFkwDmD1SvIiwHu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767391778; c=relaxed/simple;
	bh=Ek4huRjr1oIyXpbGDRHNeOeRJl7UBmlIgMWei3uqhp0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=M0I90dEU0KgwxfYQulLxt8GGLCwxzycpY+AXCxPNfaS8zvPYmRFniJXPirO4bQnyf3BTPRrQMVKZnu0/iXOXeLGYDZymNnG+9INnDnxEPfieFTT/kMDqZo6wBswUnnxJMyZMGYjGIRW5mh3hUU9nT/lmY1ptORnqKjDi3RpiiRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=xQtUv5nw; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 01757EC0103;
	Fri,  2 Jan 2026 17:09:34 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Fri, 02 Jan 2026 17:09:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1767391773; x=1767478173; bh=UwSK1TsVbov5CVrZ5IJ8MCF9yu7nmzIupxr
	+57uGZCo=; b=xQtUv5nw9VOj3W1rORaAnqjgexOaOkabtppXa0ZJCmGRH3Ee//J
	oey17Nen4ZrN+v06BxgM1y+jJva/tPYEHhr+aTpyGV0beVanSXf70RTCwIDE+GDO
	BN7EPWEwMuXCD9pNNNXADBe2jKtGk5fpCa/9cewhPPBc4OiwCLWm/Wll+B6rjOJm
	HjKZTTfaSVXKIkMxxmOOF1Km211qqrrQy9FpBmjbrkjdLXHFiSJ5xnIiJgrWQPoL
	il+Ny9brkWn65qAv6W2a5v5cowZMtA8fY3Xo3awWd4FXIztRp7yK7yke5nRwrhX2
	e6QzO6d+owaISILpcE5GkRZsfL3MK5CwKmg==
X-ME-Sender: <xms:HEJYaZRr5HoBgYsKdx16jR9NQ4OCUIgRozK80dBa1qtaSHov4g6ZuQ>
    <xme:HEJYaa_WytIfGR_1xIB0qmTVGZqPHhIQFcu-OIRSQ4tzFXoMmnH8503Hwx8y6n42c
    IqnLSqSJcrfjqkMrMI3tAv5JElTl8RBM_S3CNClh2ripV94SwYi3w>
X-ME-Received: <xmr:HEJYaaZkDTKZDERR2LfoIjIOZl70ypH0oedp9UxymiNoYuV51oVi6bapRWbcKC2p2aI4WMMfVGDAgyi0ajbdVepIyFryEZ-vnQE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdekleekfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhnucfvhhgr
    ihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrthhtvg
    hrnhepleeuheelheekgfeuvedtveetjeekhfffkeeffffftdfgjeevkeegfedvueehueel
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfhhthh
    grihhnsehlihhnuhigqdhmieekkhdrohhrghdpnhgspghrtghpthhtohepuddtpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopegrrhgusgeskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepshgr
    shhhrghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrkhhpmheslhhinhhugidqfh
    houhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopegrrhhnugesrghrnhgusgdruggvpdhrtghpthhtohepshhfrhestg
    grnhgsrdgruhhughdrohhrghdrrghupdhrtghpthhtohepgiekieeskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrd
    horhhg
X-ME-Proxy: <xmx:HEJYabqEoXckEcOjNJq8O34y0FVcT2-uU8uVNeEaOwydaJz1Hy3Enw>
    <xmx:HEJYaeTiyqssTwq31yFzy8hKpGQBhqkjKO4w0bNS1lUDsDIuzyFpNw>
    <xmx:HEJYafpFUEYpzaayPU6-XB0f93mmvnhXp2VzdoK14RlIadpKaGYe-w>
    <xmx:HEJYaY2CTy2JeYUKlDzDnjUxLE2hX3cGlV-qsaYYQK19EUPbjnbULw>
    <xmx:HUJYabswIeX1MRUIwqXe8EJd3XP7aV_npATjNn78QUjxUG0a7JKKr5Xg>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 2 Jan 2026 17:09:29 -0500 (EST)
Date: Sat, 3 Jan 2026 09:09:21 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Ard Biesheuvel <ardb@kernel.org>, Peter Zijlstra <peterz@infradead.org>
cc: Sasha Levin <sashal@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
    Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
    Stephen Rothwell <sfr@canb.auug.org.au>, x86@kernel.org, 
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
    Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mm-nonmm-unstable
 tree
In-Reply-To: <CAMj1kXFjttKG3JF=aw9KgRup-ge-WeUnncfEfTZmUVSfi4F6fg@mail.gmail.com>
Message-ID: <cb27cd02-d439-9eb7-d393-79b399affcf7@linux-m68k.org>
References: <20251218153050.44da4a78@canb.auug.org.au> <fcc9ca3e-8c04-43c0-606c-e798bc0cf9ce@linux-m68k.org> <aU67sD1u83Qrpvdu@laps> <CAMj1kXFjttKG3JF=aw9KgRup-ge-WeUnncfEfTZmUVSfi4F6fg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii


On Fri, 2 Jan 2026, Ard Biesheuvel wrote:

> 
> In this case, I'd prefer it if we added a helper, rather than 
> duplicating the same check 3 times.

Yes, and the next patch in that series did add that helper. I didn't want 
to rewrite Peter's patch and drop his authorship credit, so I added the 
helper in my own patch... but being that Peter still hasn't sent a 
signed-off-by tag, I should probably fold those patches together and take 
the authorship credit/blame myself.

> But in this check, testing for __DISABLE_EXPORTS is perfectly 
> reasonable: it is already used in this manner across architectures.
> 

I think Sasha's objection was valid, in that bug table entries are said to 
be emitted, whereas symbols and interfaces are exported (and imported). 
But I agree that he may have overlooked the precendent for such use/abuse 
of that macro e.g. in arch/x86/include/asm/ibt.h.

Ard, what do you think about __DISABLE_BUG_TABLE? Shall I change it back 
to __DISABLE_EXPORTS if/when I resubmit this series? I'm ambivalent about 
it.

