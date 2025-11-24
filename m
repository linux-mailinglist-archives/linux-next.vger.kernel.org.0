Return-Path: <linux-next+bounces-9189-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 98889C81981
	for <lists+linux-next@lfdr.de>; Mon, 24 Nov 2025 17:35:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 31357348A62
	for <lists+linux-next@lfdr.de>; Mon, 24 Nov 2025 16:33:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEC7727F72C;
	Mon, 24 Nov 2025 16:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="mEZk2m9X"
X-Original-To: linux-next@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD00298987;
	Mon, 24 Nov 2025 16:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764002005; cv=none; b=YGJXgvU9mLg/cBbngqXPxddE9zEgigANAUMnAnvef/4nvGLSORZGLuFeSxw3Oz/N+xPpX8uUVxHVwkAEdt/s1cwhSy3nwZnEyKVlEYhAxM+x0h0dbC5+J0gIvMp31L3UfYBiiSQVph9F3vf/fibw6eH5DhcTD3gfl7mw/rCcuUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764002005; c=relaxed/simple;
	bh=Sp/8dRv3VqURk7PzQ1HmDpoA4qyuMLLu2tGBpREpYmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LQPaKRWJtSx/DnCLfiv+YoB91gKPHHW1k9OOT2cm+y5K5akGpdvH//jXUxO3/2BxDJJzpyxNKJNjg3DzeSthz/Hv+gBsYTdk/wALlWUEqw2A/siso/LNzn/bvDG7lP7PQr4di2RchtuR+PA8N/psK6pwebvB8s8PT9AVTZsqCJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=mEZk2m9X; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=tL+39OnwTLvrAWvrGLglm04jsHHrgdlmkveq7RkWEdU=; b=mEZk2m9X1XDOzI4SKbvJ/c5atn
	QXMRhnKkDWLYeIuQ13Z6fXRwrBM+V5Dnf0JuEfVGpf0SdRcob61LNH15NWSNEd4Zsb5gruwpGQRIa
	7vOWKUBElof77Gm7UsUv98B1W4SIRGtBJOhdX0iOTf5aVnasmKH5HcWtnF5l0dYcw0zMek0PwIvc+
	647knoV4nzZ9Ha52DL4zCYHCQxIjKRLuZFUdl0BioQmunBMv32pcnJHi8AU3joDadkZNwZtZftTov
	oxZdH3phQ06JvuNAuvb3Sq+twFImsNLh42OWeL3alFfKhp/CFMWSIIjATImcy/+IkWBwDHVK1yB+t
	NHbOaBKg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNZV6-00000007EXl-3fUN;
	Mon, 24 Nov 2025 16:33:16 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id A75393002A6; Mon, 24 Nov 2025 17:33:15 +0100 (CET)
Date: Mon, 24 Nov 2025 17:33:15 +0100
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
Message-ID: <20251124163315.GL4068168@noisy.programming.kicks-ass.net>
References: <20251124231644.38d0303b@canb.auug.org.au>
 <20251124123249.GP4067720@noisy.programming.kicks-ass.net>
 <aSRlFB9PoOcZVmvt@tardis.local>
 <20251124144714.GT3245006@noisy.programming.kicks-ass.net>
 <CANiq72kN_QjYSCdzs9UCx2sHdR9Q2g_7_h-ZZ2y0qLZjhUxX6g@mail.gmail.com>
 <20251124145544.GU3245006@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251124145544.GU3245006@noisy.programming.kicks-ass.net>

On Mon, Nov 24, 2025 at 03:55:44PM +0100, Peter Zijlstra wrote:
> On Mon, Nov 24, 2025 at 03:51:46PM +0100, Miguel Ojeda wrote:
> > On Mon, Nov 24, 2025 at 3:47 PM Peter Zijlstra <peterz@infradead.org> wrote:
> 
> > By the way, I have had this patch around for RANDSTRUCT a long time:
> > 
> >     https://lore.kernel.org/rust-for-linux/20241119185747.862544-1-ojeda@kernel.org/
> > 
> > More than glad if someone confirms it works for them...
> 
> /me mumbles something about using clang to inject C IR into the Rust
> thing and kicking bindgen to the curb :-)

FWIW it might be relatively simple to abuse precompiled headers for
this. Generate the pch files using clang and the normal linux build
flags, then let rust do something like:

  unsafe extern "C" include "header.h.pch"

or whatever fits the syntax best -- some day I'll get around to learning
this thing.

That way you can fairly trivially inject AST/IR from another language --
including all the inline functions and inline asm bits.

