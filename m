Return-Path: <linux-next+bounces-7427-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CB6AFE3DB
	for <lists+linux-next@lfdr.de>; Wed,  9 Jul 2025 11:17:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 486A21899EF2
	for <lists+linux-next@lfdr.de>; Wed,  9 Jul 2025 09:17:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E30DC23D2B0;
	Wed,  9 Jul 2025 09:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="CKwZzreb"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F17B22DA0B;
	Wed,  9 Jul 2025 09:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752052648; cv=none; b=PIMQ338tTcPLsjGi2heL083HHQHrvv9SRRIQ6GANtpqQJqTLLk3zOly5Jma7gPWu4oy67zbEvds29Xj0w913dhZ228mqBJr/oem4PPi3rhZg5iexrn/Yp8skHIjCTMOgd3KP8dLpyP5DhFYf6wFnqdzUHUqlu/rc8CcjpCKdbcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752052648; c=relaxed/simple;
	bh=SIOEIsn/iRCibzTWzmm4/iFa3isGrOWve09IOOTV9jI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qo+88jYyRzyPEPJcte6P09QNgGmy1IZqzp/D4BqjMaZvE4E+ij8bg3iSwJTnih0HkWFc1Cdl0Jps4zztsRqpwHnd/KjdnpHjNfHLJUmNMCxdpSQzmPWsNgXG40uCmEsGGsE6NjhLBU/XGByHWxcfcJYyeIZ+EAiWjQeRfUtR/Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=CKwZzreb; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id E3CEE40E021D;
	Wed,  9 Jul 2025 09:17:21 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id TnW2dmxPC4_5; Wed,  9 Jul 2025 09:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1752052638; bh=pyoSEQoZpwnpz3kLRoC/C4gNE9qlmORS6snlCTAOP4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CKwZzrebDbh5/eUDfyXS8ouLooCpgBdmvNe8Hsp0OxLuhjx/IQQb0N58KUo7CEciR
	 su16cWlEMTMfcZb99alYMJJ05bgaNTn8VCNp3tu5HdkLbnBVUToWq+miEIDkcmfCbZ
	 KRKZ1MRRf999iu+VeUXSbINApEb8nFup+1YUKBQtmxOOcWEOro4rp9bY3Dg+S7Ns1z
	 iHFK42bL4gjXFopvcpZNPY513S7bW0sIMmHQk2bmZuQFYkKdum6Xnix+JyIgywG+dd
	 a4/KjiQZ+XBc6Q7uVoQBXRRzWhuVN6+KAdMIPN+/VgAgcblIqjnQ5N5/5Ad04P2Sf6
	 h0nek8vNIZ9OvFP8jrD0ru4sFuBGOC5ykoFHFm7/NZgtXKi8boGAic7yfsAS2oFnps
	 UEvUyGWA6PPzDFrE6y+sFi/lUfvV4qL3iGb5lImU/OYL2FuvyRskN+LyPxselrNhB6
	 5/V4FVsPNMmLe7IeFkyZQc76+f3nEZuvTzniH7S9otUZnaRjLazHcQRyORGuX9/eZA
	 lK17/WfRXPoUJu0hwZ8bT7J1MRPzEw1bSjpNcqTz7FRBqCrP+N2XtNCfMoTsIkvTn5
	 FISFI/TQJ3ozxZxYZQkj6YreOPsWLRyMxAFpPwgm4REH0PtLNOgwb9gJPdr6z8sQ3m
	 671dt+834mbdvsfkNmMEnpo4=
Received: from zn.tnic (p57969c58.dip0.t-ipconnect.de [87.150.156.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id F070240E0221;
	Wed,  9 Jul 2025 09:17:09 +0000 (UTC)
Date: Wed, 9 Jul 2025 11:17:02 +0200
From: Borislav Petkov <bp@alien8.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the tip tree
Message-ID: <20250709091702.GAaG4zjs-otcGsMyY2@fat_crate.local>
References: <20250708160037.2ac0b55e@canb.auug.org.au>
 <20250707234817.d09fc28a3510b23c31c461b4@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250707234817.d09fc28a3510b23c31c461b4@linux-foundation.org>

On Mon, Jul 07, 2025 at 11:48:17PM -0700, Andrew Morton wrote:
> On Tue, 8 Jul 2025 16:00:37 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > Hi all,
> > 
> > The following commit is also in the mm-hotfixes tree as a different commit
> > (but the same patch):
> > 
> >   f339770f60d9 ("Revert "sched/numa: add statistics of numa balance task"")
> > 
> > This is commit
> > 
> >   63afea878dc4 ("Revert "sched/numa: add statistics of numa balance task"")
> > 
> > in the mm-hotfixes tree.
> 
> Thanks, I'll drop the mm.git copy.

So we actually started adding it to tip for the time being until you send it
to Linus so that our testing doesn't fail - it was reproducing reliably on my
test machines.

So can you pls send it to Linus so that we can drop it from tip?

Thx. 

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

