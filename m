Return-Path: <linux-next+bounces-9187-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA41C812D0
	for <lists+linux-next@lfdr.de>; Mon, 24 Nov 2025 15:55:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB3C53A21A3
	for <lists+linux-next@lfdr.de>; Mon, 24 Nov 2025 14:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4879828A701;
	Mon, 24 Nov 2025 14:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="hvTwx4nD"
X-Original-To: linux-next@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4765B28D83F;
	Mon, 24 Nov 2025 14:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763996152; cv=none; b=aMC8vqKpVI7WEBndiuGE8DWkNpvNpQJJgISks7+vLeM/6XhMnqv6F/Y1NzefO4bt+5frCo9gW0vVzxzBC5PqDe0ZYVbn2Gt7idgKBpYAB8HrwxH/Xi1s/JapVgfy1UEj/5+iz3o1x/ZrKl9ZF7gko9Ia/TJ52Ls2P1gdQuRvHF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763996152; c=relaxed/simple;
	bh=m/EMQcaEGUR84bDn+PjKjts6tBgCLFLgBQ4an6zPvaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K9IASNPDhIlPQxhlAqoCRE0XaoNV8i2kcfD/WtkWnOdLDtim+78mjUXmEGj1O/kVtrurqGkjztRra0UNqudXPInpqfPu5rR1gWBiX3+6ma1TcgQLDiR9driYPIVKg5DjHtfhi29IfLUqmvluO8/1PgFK307hEEHHUiFTv3MscHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=hvTwx4nD; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Ecx5UUb338upKmBZxHmlmJZBMGzHH+jrv0oSxjw0ZtU=; b=hvTwx4nD6yYb+g61F27bX3YTgu
	NFD5WP828tU2N5T3xFVRtK4tpUKtd2PENwcNHxGwdHKWoOtfTuPinLcVjx7C+M5mX+PJuQtJdTDn8
	A4JRYWAxiV30aFBbMLVnRy5zdKrxWHO4UpOBlFAe9/X5/JN4DKDJjsieu/CO9s9FTn4AeNWCa8McF
	R95B72D8qDMe1Po6OumdtvDBvOhUByXURENaIw5hMD+nfjfcHqb+EhFjYIIzQ2WeVIdyIdt8Wel09
	z1palUcWjkcPVVDIfPd92MicRnFtlnAwmqRXoL5SehoRYwxLi3bB5hafA0sNYpO4VRe74ZI9bLaKH
	CsksPiMg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNXyj-000000078Mi-01oN;
	Mon, 24 Nov 2025 14:55:45 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 80C1D3002A6; Mon, 24 Nov 2025 15:55:44 +0100 (CET)
Date: Mon, 24 Nov 2025 15:55:44 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	ojeda@kernel.org, Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	nouveau@lists.freedesktop.org, Alice Ryhl <aliceryhl@google.com>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20251124145544.GU3245006@noisy.programming.kicks-ass.net>
References: <20251124231644.38d0303b@canb.auug.org.au>
 <20251124123249.GP4067720@noisy.programming.kicks-ass.net>
 <aSRlFB9PoOcZVmvt@tardis.local>
 <20251124144714.GT3245006@noisy.programming.kicks-ass.net>
 <CANiq72kN_QjYSCdzs9UCx2sHdR9Q2g_7_h-ZZ2y0qLZjhUxX6g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72kN_QjYSCdzs9UCx2sHdR9Q2g_7_h-ZZ2y0qLZjhUxX6g@mail.gmail.com>

On Mon, Nov 24, 2025 at 03:51:46PM +0100, Miguel Ojeda wrote:
> On Mon, Nov 24, 2025 at 3:47 PM Peter Zijlstra <peterz@infradead.org> wrote:

> By the way, I have had this patch around for RANDSTRUCT a long time:
> 
>     https://lore.kernel.org/rust-for-linux/20241119185747.862544-1-ojeda@kernel.org/
> 
> More than glad if someone confirms it works for them...

/me mumbles something about using clang to inject C IR into the Rust
thing and kicking bindgen to the curb :-)

