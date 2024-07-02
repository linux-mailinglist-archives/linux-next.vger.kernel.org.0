Return-Path: <linux-next+bounces-2798-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 551CD9239E3
	for <lists+linux-next@lfdr.de>; Tue,  2 Jul 2024 11:26:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C2671C20F64
	for <lists+linux-next@lfdr.de>; Tue,  2 Jul 2024 09:26:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2D5C1448DD;
	Tue,  2 Jul 2024 09:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="bMpovPSX"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA6E4A06;
	Tue,  2 Jul 2024 09:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719912359; cv=none; b=gDk3iCjkACNKMlMTx7FW8nojQfQ+SiI9RtIny2XhzukIs47qGV8hfXyenXCBV8OjjxfxQdoyWaRQtJ4wfsuuLfHT9KlUd56Rof0UvHlgQgTbhC6MQkY1MOMLnRlBpCnlgSM+5rabQF9LKqZ9FFRNtr2eWEUVZaf9JdONrOzYPGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719912359; c=relaxed/simple;
	bh=83bEojgqDgebbSTn/AK1l+LKtArGnXDeMuaoMsN2qtA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JllT69+sC3aerq7OXZL5Ueg2fB2JQH3cYp5nEK8fa9uDyN+Dzu59qvGro8exERezwrzouEwPjmDg/TpWQJrzp+5EwKljMtQh5/stk4xrettSsetVNYeV8/NXLLDnzFGk/TKuUPhNifIprByZGk5whRioenxP/4GhtnwEJsd+XcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=bMpovPSX; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 8D1C540E0192;
	Tue,  2 Jul 2024 09:25:55 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id ZNaac-jqXZ4Y; Tue,  2 Jul 2024 09:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1719912352; bh=s8UrH3VcJ28nM0gGiUZ1ReX90tzHONE7G4tZ2ef+2Ns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bMpovPSXrQ942JBZfofo0Zl6kIqCOviSdJUpkyh2l/kQsxIxNA+L+38NHIjwIV6ZH
	 yswLC3JHJDGc9dekEswMzmi8DMDszS9CAPSRht/gLOYcGV7R5G+6WoLITq38U/7M+d
	 lKUXq8j2FtjmmZHaLm2gQbfPh4lfy/fuw/y5c0WnN17u6rs/Up53drcqSZQgNUkZL/
	 wMBHckMlI44H8IpgO+C/X8DhyfNkLwNFjdQ7+9dtd5pP69REgveVxA/Kso0/FbmrFU
	 3KGRHscUVQwDnAc5ddMYtQiGhcqbqEddE39/YYbcBRRl8to5haNhPOkMQYtutnYNPi
	 T7aw9aJ8gR/0QwBcFGdmbgmN8h4AdUWVCBe2gUcu+CiPfIHuBCp0qkPfm/x86rPWAO
	 re1F++cyBfqNvpHq0GGI/I3J5hWp5HK/u3rLy7u7rPkCcQcXOcL3U89tXi+lQYAvXe
	 /6Z4KMZM99oo156IV2dd8QxhUKqUpAG1RrrpKDng3zE0/eJJjvGO759lj400xye5cg
	 mmMKAcojB14PLH7OG53g1OSTf66NpR39ra0N6H3M9YPoARO8ieSZXir7ldSYrCneaN
	 wgWJt/nBtxhKyxbg/KhSAuI0r/leIZUuj4Njw6ppR0tSH+X4SikSICYuMW7rvs2v2W
	 xmldMEtzv34eZn7nPw0VEPF8=
Received: from zn.tnic (p5de8ee85.dip0.t-ipconnect.de [93.232.238.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 105C640E0185;
	Tue,  2 Jul 2024 09:25:39 +0000 (UTC)
Date: Tue, 2 Jul 2024 11:25:33 +0200
From: Borislav Petkov <bp@alien8.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Perry Yuan <perry.yuan@amd.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Xiaojian Du <Xiaojian.Du@amd.com>
Subject: Re: linux-next: manual merge of the tip tree with the pm tree
Message-ID: <20240702092533.GCZoPHjbvItZ9FjXNV@fat_crate.local>
References: <20240702141555.3494c5a6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240702141555.3494c5a6@canb.auug.org.au>

On Tue, Jul 02, 2024 at 02:15:55PM +1000, Stephen Rothwell wrote:
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks, LGTM.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

