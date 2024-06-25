Return-Path: <linux-next+bounces-2659-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B2A915D96
	for <lists+linux-next@lfdr.de>; Tue, 25 Jun 2024 06:26:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 31B731C212FD
	for <lists+linux-next@lfdr.de>; Tue, 25 Jun 2024 04:26:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A103913A416;
	Tue, 25 Jun 2024 04:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="jkNm0egL"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909331BC4E;
	Tue, 25 Jun 2024 04:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719289582; cv=none; b=jL4eUGoUE33V2O8wjcRLgU/q0GnTY7AWcCtohp6K+zoJN5iZAOhg6D8A0lQJOi3VnuCQY7h0SmRsdX2Uo8y+sAZT/4g8sQZzo7CF7bmorELr4FQyEfWixgVa51cXkLgezMNQ+D+Um5CCaMFyJ34eF1TjQ/cEfpfwGzXYtcOHJGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719289582; c=relaxed/simple;
	bh=f3ZaHg7zXNDxbC7aVhqoP9pzSv7uE7vI9wOUUmMHTao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cdlr+rlXueYFHl0/Mkh0slqA0AfZ/SE8IIdBQNQxKLpuNqG6Gj246uLG6wgLPEXbVK/C/7LGDfFCtjsG5Q6QkG8QmgUs9NBIaaLq0ogFY40GYhFcAbYWExAoqgqgcbJox5zosVzluaTgdjK+3sztFtZS8jrYgRkwc7pTu0ZMKyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=jkNm0egL; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 6870740E0219;
	Tue, 25 Jun 2024 04:26:18 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id jbs_CxtgtW-5; Tue, 25 Jun 2024 04:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1719289575; bh=LvuY8FEx0M92MNEaOQ8kDCcP0/FtFiwpDnwTWlODvWc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jkNm0egLetUP6nveckA1ujZjuHvh+1uKLTueRz4mdO7oS4WPEjm/6u7XgA6Qlb26K
	 EZTQemvuvx2g3ocAGQx9CUjMxynVH0pGE/YaRg9/KRITlqCYPVy+jvBARXlA/wZfum
	 CC890aeXrLZaaSHJo47sRWsZN2g3CcaX5z4a9BBtkXHdmZ3blgvKVjK7DM+GhL4xzH
	 C0OwlyP66wK++SPDllmgVJDWV/t9kUYPHhF+JEOb+fGbFLGSuibtxk1DevAsKbsTdy
	 EOWb9k9sXGFg4IhS9in24xYTTZIPiTX0b8dQhT1itGRuU8YT+RHjgZeXInVmiBBbqv
	 H9io1yMgH1ZvHSO7SbwxmsJyOCc9RsK8J+dl4/0kAN+4b0Xo49ps9L6PVBLukntoyk
	 Q6Z8gkNaUzJq2IlJw4nvhARbPRx4Og3ytnwb9SUcuk05Tqbg/mihg4PnHFendmpJVC
	 xDCE6CAIdacKR02TtlV1hiClIPDNLhtbZ0oiYXdzpWHRA71MoV1wXrMfloQtfXky/5
	 tqAFHKN1DtbzHtWBBDNmHLt9ji/I9ipS7r9bIwDvhWnaOlTsUapTYtfDcJ3wUPmG+e
	 kIdKSA8yAOHbVFWn7NlBM9eSa3zwY2M3Snm2cI6VlBv9+gydDf6bDtZB13AGrhUTg5
	 ROqFoep6/tgb7sHU46JswBWk=
Received: from zn.tnic (p5de8ee85.dip0.t-ipconnect.de [93.232.238.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id BD16A40E0177;
	Tue, 25 Jun 2024 04:26:03 +0000 (UTC)
Date: Tue, 25 Jun 2024 06:25:57 +0200
From: Borislav Petkov <bp@alien8.de>
To: Xiaojian Du <xiaojidu@amd.com>
Cc: Mark Brown <broonie@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Perry Yuan <perry.yuan@amd.com>, Xiaojian Du <Xiaojian.Du@amd.com>
Subject: Re: linux-next: manual merge of the tip tree with the pm tree
Message-ID: <20240625042557.GBZnpG1S2p6X_7F-IY@fat_crate.local>
References: <ZnmnqjCZ_dx0xXjw@sirena.org.uk>
 <db2165ae-2086-d60a-df31-dbf7711060ac@amd.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <db2165ae-2086-d60a-df31-dbf7711060ac@amd.com>

On Tue, Jun 25, 2024 at 11:00:26AM +0800, Xiaojian Du wrote:
> But it is better to hide this new flag "Fast CPPC", prefer to use " /* ""
> AMD Fast CPPC */ ".
> Not expected that "CPPC" and "Fast CPPC" are listed to user at the same
> time, it will cause confusion.

https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?h=x86/cpu&id=78ce84b9e0a54a0c91a7449f321c1f852c0cd3fc

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

