Return-Path: <linux-next+bounces-8397-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 168D0B8C522
	for <lists+linux-next@lfdr.de>; Sat, 20 Sep 2025 12:02:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2918621E42
	for <lists+linux-next@lfdr.de>; Sat, 20 Sep 2025 10:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67EE0276059;
	Sat, 20 Sep 2025 10:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="bbEK8xJp"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2402561B6;
	Sat, 20 Sep 2025 10:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758362541; cv=none; b=VFIFFVmia5aLushfoXQ5xwtCojju1qWQuDa04+JcVS2NdfcQN6ZzFlc1JmlZv87cAIeG9OPUwSxalNt2K+t/5S8q4eAS4iahGbczPzDsVL7pQT+tVKaNoubcWFlaQsfpdErxTEkq+QrO1zH6OC1iQqOmus0xpdL99Dnk4g6IHWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758362541; c=relaxed/simple;
	bh=pjWQn1/LW9OFDqO1KE6stnw1H6OgwFiK0+4cubwXWGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BsMsFXOPfLv4PDB7GfpFc32kVHbk2gaaZTiMcP2LXp0bwNEwRBU/98Qg/3zCLh+LTtjYRHbwOzwVhbzKUjpVWae6q5Ktb284IW153J8FqQohydxNY461tTJw/ilhPDjnuH5j1nTlnN+d6muESekUfwaXlnC9K+3YXx5OZ8ey6F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=bbEK8xJp; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 01F0A40E016A;
	Sat, 20 Sep 2025 10:02:14 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id lRoSpv873p_n; Sat, 20 Sep 2025 10:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1758362530; bh=YR/0SfpcFco9aMO/lrccoZg2WaByBkepDkeRZMp93As=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bbEK8xJpAE1U8qSplRYwY+Kd69QfBKkLFiVkL3sVvbKfNHJ/w5KKmRRh93+K4jv2G
	 zdNb4OWH7uaDmaqMtE8V8H3HxZCfx73UJw+v8cXWsYOTh6Sp7gOXUCKu98ji0dtjAa
	 VcijrnkxkuWY77j91FzMM7AaxfzKWfUPbQqU0nKXCbgKWTonT4XMxoLLVEnAUuWtTf
	 qXqO44oozXqy3Sw8vM+Hyw640p0IvFaJKZhmzA/n4bVtAXqGwfiwBTndCb2NvJK6RI
	 FMg7ZkWUAUU+KiTBSmdGugRlYRqYFti9mvIBqTS5wUzfHYp3Xxqftgfmlrgz4oMJnR
	 QwYPPypJumA/1JyW7LxauEccezyH1+gFU47K54vc+mI3dRIbBPZHeTd/PsHTJcMh0R
	 VXiQI0vY4S3BbdAcy5Ulaj2IQZNstlgF6a2SRFmzgdE7TeStQDblx/jmrzXIATg8tN
	 /3GVRAiVUBSQAZTiIwO5VuD0l8p5gwmXPbpHfaiHBlXMzo4h4dq68PfIoIRp5mvCnF
	 4EdkJZY3NMamICgu0SKcRvMqtXEyO/IOXVhpv7FzoC2Yu1u0PcEeHGAsmKtVleoXST
	 iZcBVzgcbUoPQvjGenRsVeMaBWJXENBjzd+DrdjdIUnp+4YWoAH6bUfPaqo7tp6pME
	 ahHiAdt2XXs+yUbkSLrQ4aVE=
Received: from zn.tnic (p5de8ed27.dip0.t-ipconnect.de [93.232.237.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id C73FA40E015D;
	Sat, 20 Sep 2025 10:02:00 +0000 (UTC)
Date: Sat, 20 Sep 2025 12:01:53 +0200
From: Borislav Petkov <bp@alien8.de>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Mark Brown <broonie@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ashish Kalra <ashish.kalra@amd.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the tip tree with the crypto tree
Message-ID: <20250920100153.GAaM57kWMAzmo__hDl@fat_crate.local>
References: <aM1bJqhtojdLhp3c@sirena.org.uk>
 <20250919204355.GHaM3AiwTM25LiOKAb@fat_crate.local>
 <aM4AoOSxD4SFo_Op@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aM4AoOSxD4SFo_Op@gondor.apana.org.au>

On Sat, Sep 20, 2025 at 09:17:20AM +0800, Herbert Xu wrote:
> As the conflicts seem to be straightforward, how about we just
> keep things as it is and mention it to Linus when the merge window
> opens?

Ok, sure, sounds good.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

