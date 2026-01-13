Return-Path: <linux-next+bounces-9637-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA3CD18A82
	for <lists+linux-next@lfdr.de>; Tue, 13 Jan 2026 13:16:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA1113022F31
	for <lists+linux-next@lfdr.de>; Tue, 13 Jan 2026 12:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DB9F38E113;
	Tue, 13 Jan 2026 12:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="dfXrdyUw"
X-Original-To: linux-next@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D063A346E5F;
	Tue, 13 Jan 2026 12:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768306443; cv=none; b=dYMWB8JwRfqirFyARAHKdOEhsKvn9v4wzl4G0B52r3gkQgPpcT90oUQTihpPUiyN7s+1eDBx+4lBq0EJfTaXGFgL4+vYECtZiKBz+IYsv6uR1imUFTrH61FwIvIYbz+lGY55ouS9TlLACVAh+eR6RuVTRd+fcQmC3kZhwfdNk00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768306443; c=relaxed/simple;
	bh=2oiHJqGV9LyAd64C430m6+sy0VfwpKH5Hzl9Bq9Tcac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ibtc5seQ6wypPkXgFzVq48N8iz3Dja2kqASYZeFORrINyhqWlllL23dswsQlERRunyzzg+zt/0P9Fzrdyng1H34BeXYNmENRqyGfsZdbFEF27HXqRcoaybAJSkGhFrObnLz8LkccnGqLXha89Z2rqfMg/iKBec+vuFB4uHu+Bio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=dfXrdyUw; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=2oiHJqGV9LyAd64C430m6+sy0VfwpKH5Hzl9Bq9Tcac=; b=dfXrdyUwcLALzs4jDH1pxnPmmR
	zCBmV1b7jJE2dL61i5NggcjeL/bamtDyCIT49CioOmrzkW+BVUO4FCmi/ZF80sjF2ofO40prsYH/7
	e4qKmtOwCf1JN+lpWTgpeGq+mKcDIw6aA22hNwQSdRNz2MoLyrLPgeWz8/Kh2gqjIEIo2+ZVVGP3R
	1cWCKWYKk26iLxPijwkQxZXC7AX0Ly/dNMkuRm5KIvGLPAyWXctL5tDBqWXss3uqKrL7py315N1zN
	Xjg56WUsIDgxAfp5NEV/1Ey1SJRZKCZXOLoZ75l9kIFlwkDga6U/1wFxAijauS/iD2Zhun/D941Mw
	ln4H4Q5Q==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfdHY-00000004gWX-3xnN;
	Tue, 13 Jan 2026 12:13:57 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 7CE55300583; Tue, 13 Jan 2026 13:13:56 +0100 (CET)
Date: Tue, 13 Jan 2026 13:13:56 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20260113121356.GD830229@noisy.programming.kicks-ass.net>
References: <20260107105222.GAaV465o3HUxGxBXGe@fat_crate.local>
 <20260109172955.GDaWE7E2xNc9WJlsNt@fat_crate.local>
 <20260109111744.07e51bf5c0bde0e419d09b34@linux-foundation.org>
 <20260109192404.GEaWFV1MUzYGNjq2eK@fat_crate.local>
 <20260109113921.5769acfa1d0c08628aeb7217@linux-foundation.org>
 <20260109195410.GGaWFc4o-TL_jhOTxF@fat_crate.local>
 <20260109140026.efda2135377239ba8964d139@linux-foundation.org>
 <20260111110231.GAaWODR6gOvIp6KzD6@fat_crate.local>
 <20260112123126.83e94ae2fe17829e32b0ea75@linux-foundation.org>
 <20260113114450.GEaWYwMh_v2K-nJMZ8@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113114450.GEaWYwMh_v2K-nJMZ8@fat_crate.local>

On Tue, Jan 13, 2026 at 12:44:50PM +0100, Borislav Petkov wrote:

> At the same time, we need reviewers of the AI review because I did see very
> persuasive explanations about something which is simply not true. I'd prefer
> if the AI said "I don't know" than hallucinating. Especially for patch review.

I think that is one of the fundamental problems in AI right now.
Supposedly this is 'hard' :-)


