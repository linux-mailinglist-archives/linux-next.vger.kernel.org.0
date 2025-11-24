Return-Path: <linux-next+bounces-9181-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDDCC811E6
	for <lists+linux-next@lfdr.de>; Mon, 24 Nov 2025 15:47:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2CCA04E354A
	for <lists+linux-next@lfdr.de>; Mon, 24 Nov 2025 14:47:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8F932701C4;
	Mon, 24 Nov 2025 14:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ddni10RE"
X-Original-To: linux-next@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD3925A2A2;
	Mon, 24 Nov 2025 14:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763995643; cv=none; b=S6lFswagiqNCQRTDxFAAaNhraGg/+yXhb8m4VC5MOoj0ZXTmcNIqrvj7yeD0REMU6Jq6V6tHgKZbzrw2dJuHiz8xv7NrW5ZaqJvYEwOtr8+NIyv/19h4ZMIVOhxbN2040wP311PJ9E7VlwLkewxZJ4Ah+BvrEKvp4Mx8OLOSCV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763995643; c=relaxed/simple;
	bh=yiFifTml1Lx3zfibWU9AALhA3/mXEh2DUuMMtTWyEUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pmG3vEiIjznH6S/o1ExUb0oCFcCBB5rCltpaMPnpFE/Pz9ek/lAhLy9MDrYxlMullmTgXG5kItUlyFpguUQZZ7UXGdy6kVGVzQo5dSuqcDOhwF1La1vSeH0VuUjO9zdWpAt1II+DFMf0Z68Ckp0zdPSdTQD2cOvmax+cpzdztvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ddni10RE; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=WU+lbaw/scOXoisuB+QcmbXcf1mK6vqPPMnwMcleZEg=; b=ddni10REQYzK7+n8GqRUnAST8k
	n+KDfkq8MNO/RjjuOANonbTg948BGgw8Zq68u9O49QLIP71noItn2WVoUs3Oiy0Wi0VggX8cuYkix
	2oTcVkad45dvgHUqG1BUD082lLKA9xcz02HQDMRAQES38YX8NCXjgc46c9qv/vH2OTDJzP+iVUEAG
	BsDVa6FI3drBUzRaOt6l0jXF7cWOkLbmflz7dg00bRQYjC1XABwu6aj+WCy4gKomQKZPf1JLkGhOF
	zT1n+QN2prVlwCadmv4WBHNy3cYYNy/9nugNYNrGHq2OY3TCB5WwIod9jr3MM4p06Q9MZLcVJezXv
	nRlpT2Qw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNWyu-00000003tu5-1RUo;
	Mon, 24 Nov 2025 13:51:52 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 67EA83002A6; Mon, 24 Nov 2025 15:47:14 +0100 (CET)
Date: Mon, 24 Nov 2025 15:47:14 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	ojeda@kernel.org, Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	nouveau@lists.freedesktop.org, Alice Ryhl <aliceryhl@google.com>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20251124144714.GT3245006@noisy.programming.kicks-ass.net>
References: <20251124231644.38d0303b@canb.auug.org.au>
 <20251124123249.GP4067720@noisy.programming.kicks-ass.net>
 <aSRlFB9PoOcZVmvt@tardis.local>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSRlFB9PoOcZVmvt@tardis.local>

On Mon, Nov 24, 2025 at 06:00:52AM -0800, Boqun Feng wrote:
> On Mon, Nov 24, 2025 at 01:32:49PM +0100, Peter Zijlstra wrote:
> > On Mon, Nov 24, 2025 at 11:16:44PM +1100, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
> > > failed like this:
> > > 
> > > ERROR: modpost: "NULL" [drivers/gpu/nova-core/nova_core.ko] undefined!
> > > 
> > 
> > Rust :/
> > 
> > So I have:
> > 
> > $ make O=tmp-build LLVM=-22 allmodconfig
> > $ make O=tmp-build LLVM=-22 rustavailable
> > Rust is available!
> > $ grep -e CONFIG_RUST= -e CONFIG_NOVA= tmp-build/.config
> > $
> > 
> > Help ?!?
> > 
> 
> [CC nova]
> 
> On my system it seems that RANDSTRUCT=y prevents the enabling of RUST,
> but I'm sure Danilo and Alexandre have better ideas about how to enable
> nova-core.

Ah, indeed, RANDSTRUCT seems to be messing things up. I tried disabling
that, but then I need to manually enable random crap to get Nova happy
and menuconfig isn't very nice.

I really don't think rustavailable is doing a good job here. Strictly
speaking yes, its available, but figuring out why things don't work is a
giant pain in the arse.

Now, lets see if frobbing Kconfig to disqualify RANDSTRUCT will let
allmodconfig work better.

