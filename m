Return-Path: <linux-next+bounces-9605-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F578D0C1E8
	for <lists+linux-next@lfdr.de>; Fri, 09 Jan 2026 20:54:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BCBEB3004BA7
	for <lists+linux-next@lfdr.de>; Fri,  9 Jan 2026 19:54:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D938F3612E4;
	Fri,  9 Jan 2026 19:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="K2QFXviJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3392E229F;
	Fri,  9 Jan 2026 19:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767988466; cv=none; b=MhGyCZdvw6NMMNHo6jo47U7meMYMt/JPbpLpJhA/SMdG1Z3bN61oXSAYKRJkWnahX8vg3dUrVAS4+ok+b4kRqJA4LTqJ5S6x47S4747R4ABoUk9uw9DtAEz13MQOaFTSzsFkrcbm7m9ao6aAfZj+KBG9ayeM9l0Vn13QdeDbcVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767988466; c=relaxed/simple;
	bh=jQXFrZBnSc0Jzed/n/Bt/ATUnYL/+3SpQwPVcrDPiUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ikq0ZFwKV7iE8za0ImatigKZXNNTuOpqEDKbAzoGq91JjkGbFQ1Ejpb5ZLGBTS5jxd/Dqe8Dsta8V9eqXOaO2yyJ4euW0ImCEgYs4TJDnUP6EEtxdMYRkPbSxotbcXf3ytXr4ckY59DYLa/tLTRTcvMY0rJOyz4kvcbYsJUDvoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=K2QFXviJ; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 23E1E40E0281;
	Fri,  9 Jan 2026 19:54:23 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id OkAl4i2-VUAO; Fri,  9 Jan 2026 19:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1767988459; bh=lO514R7tuhY05aY2hsbvcZq0T0HY9++S4nLJQUlMpIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K2QFXviJfBvYyun1KMVgAKhaD+3xAOvPxIqlIiMS7UZzLpoBgGWaPVlOA4Ds+9k4q
	 6tceSDI52do12FW7SiuUB0cWRz/pTbv9a4/3LpVpWKZulZMqolABiPBuDyYF9rArsZ
	 T4uQDBaDlvM0jbrPOEEDSsi6d2o2gIeY4ofvbVXjuAvZHnoZVLicBLEqPDrCiHrRU9
	 G8nZAFR+JngP8RC3+3T75Zc16Ma/eml/zRXcULitgTPiR9WThqGv99EGDQ+Ke7u7fq
	 p3DLAUOoHhfy0+vD0TbpbPvJGJbh46OqqKZnW+2+Jb1+/AZA/nq8BCf/wxyS94L7+H
	 QYavTOzTjqioLuOeIteMp4ZLtxAXjSCfKBbLSXVhiy1ruD0Jdet3gbCGE1c69nMhVv
	 2nHvLowCYbXVKBLDMDlI16GY930JNNMNriRZ2DT+Dd1Pe1iPKsGuJZ5UxHiMjShLT6
	 uvzsxX5LFO1yvM/61egMoohqNGDLYtU+LFJk8M1PaWCmawuMKSP1ERPHefcfKcxg/C
	 a/kEMEMBrj0Cu64bzpKY7XxVpZd+KCA/AbGe6vwba68kMQl/VHKewPjpU2OHN8cjG2
	 j3475ebPloE7jXcHA2AAZpnCU4/oZM6yY1F/HsU/n+ERB5yNLQThDbfHWwEihLZPFA
	 B/nzv6CFpztuEBdgtz91bDuY=
Received: from zn.tnic (pd953023b.dip0.t-ipconnect.de [217.83.2.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 9771C40E01B0;
	Fri,  9 Jan 2026 19:54:11 +0000 (UTC)
Date: Fri, 9 Jan 2026 20:54:10 +0100
From: Borislav Petkov <bp@alien8.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20260109195410.GGaWFc4o-TL_jhOTxF@fat_crate.local>
References: <20260107134710.15363555@canb.auug.org.au>
 <20260107144753.7071f5f2@canb.auug.org.au>
 <20260107105222.GAaV465o3HUxGxBXGe@fat_crate.local>
 <20260109172955.GDaWE7E2xNc9WJlsNt@fat_crate.local>
 <20260109111744.07e51bf5c0bde0e419d09b34@linux-foundation.org>
 <20260109192404.GEaWFV1MUzYGNjq2eK@fat_crate.local>
 <20260109113921.5769acfa1d0c08628aeb7217@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260109113921.5769acfa1d0c08628aeb7217@linux-foundation.org>

On Fri, Jan 09, 2026 at 11:39:21AM -0800, Andrew Morton wrote:
> I'm not particularly concerned about these integration and build issues. 
> Shit happens, that's what -next is for and we fix things quickly.

Except that I don't like mails from sfr saying, "oh well, a patch in tip is
breaking something but it must be coming from a different tree because tip
alone builds fine."

So I go and do some crazy bisection dances on a big fat machine.

linux-next is there, AFAIU, to avoid exactly that - cross-tree conflicts,
amongst other things.

> My main concern is to avoid placing too many developers on the critical
> path for MM development.
> 
> I mean, it's a really common thing.  Because we all love statistics,
> mm.git MM development branches presently hold 262 patches, 16 of which
> alter arch/86!

Yah, I know. I do look at all your emails when you pick up stuff into your
trees and I mark them accordingly.

However, I don't like it when you pick up stuff too quickly, without any
review by us.

And it's not like there are no solutions for cross-tree patchsets - immutable
branches, acked-bys etc so that the whole set goes through one tree, and so
on.

Don't get me wrong - I see your point but what is missing, IMO, is better sync
between the trees. I can work with almost any setup and tree configuration
- but I'd like to be in the know and be aware of the situation and what goes
where.

And when Linus says that something doesn't build during the merge window, I'd
like to be prepared instead of both trees scrambling last-minute to figure out
why.

I hope that makes sense.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

