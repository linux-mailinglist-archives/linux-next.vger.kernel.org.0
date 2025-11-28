Return-Path: <linux-next+bounces-9259-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B0622C91794
	for <lists+linux-next@lfdr.de>; Fri, 28 Nov 2025 10:37:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BF1A94E7A2F
	for <lists+linux-next@lfdr.de>; Fri, 28 Nov 2025 09:37:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5DA23043A9;
	Fri, 28 Nov 2025 09:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="XfUIvDIJ"
X-Original-To: linux-next@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183CA303A39;
	Fri, 28 Nov 2025 09:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764322574; cv=none; b=bnir8Fxr8UFsLwn1xUd67wIrAQh7jwtmM/kr1sBpgCFtccU1LRFM6jsAQpTmO7UEq6vYYS7FcuPpCfPnI9StBuJ8RB3gmNZsP5wsd+4Us1Npil+150/mrbqM4Rmrf3qZUrdB0o0R1d/cdMAH5eMv8WNB5UJ7xoj8wV97mJj8obs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764322574; c=relaxed/simple;
	bh=xdkkJR5FzgvH0L8/QScmrJTBJuyTIe/eb9PaAg4bK+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C7uVq/adoHRdRR8OeDZ2Xccjwm56gpKToo4uMB/+6Z3SSsoMN8K5xC7wgkNWX3clq+II2g5RzQkEvPe3tn9YZV+ftYK2b9dLZyS9WGJMFtg1EXrZVHY3hpHf1k2ugWPJNczqrk+fVFgUwLQylt7LPnALbwEpevVlXSS5b5ALDi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=XfUIvDIJ; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KG0/81abyQ8PEDhyWdNyMUeaC9IBrmOXtaPyU2w0gxo=; b=XfUIvDIJ/MfScvk/ovWWE5Wm74
	O9NyQj4HhuFSOVdOCuATXRHSxoFehVzOs9n56Cb9LWEVe+h/zXZQ+6cOBg1LrcueQOEyKeMJkqCV5
	ZGfHcrP5Zu0OPUHHj9Knd3GPwcmvtgzsklFkItE4mA6EcA1gQarzwuGIAgfAhsGLifDy8j6wQno/W
	7OGFffoHmDTLC+NMPzyk+ZYYnFGXr5C3sn6zJcKGKGYoDJG6ludorr7L2m7c6IguGcFYTCTdCZ3xE
	8aXyrDZTga7jgPfxFmcuf1WlW0NWex0L01X0+SoGxrlalN6VqzX3qrTDw48ZuxVbJqRizJBp2UOmj
	NZ2lcxcg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOuta-0000000D0u4-2orZ;
	Fri, 28 Nov 2025 09:36:06 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 39471300230; Fri, 28 Nov 2025 10:36:06 +0100 (CET)
Date: Fri, 28 Nov 2025 10:36:06 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
	akpm@linux-foundation.org, Stephen Rothwell <sfr@canb.auug.org.au>,
	Nathan Chancellor <nathan@kernel.org>,
	Waiman Long <longman@redhat.com>, Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH] locking/mutex: Initialize mutex::magic even when
 LOCKDEP=n
Message-ID: <20251128093606.GF3245006@noisy.programming.kicks-ass.net>
References: <aSDoquGlA55Ge100@tardis.local>
 <20251125145425.68319-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125145425.68319-1-boqun.feng@gmail.com>

On Tue, Nov 25, 2025 at 06:54:21AM -0800, Boqun Feng wrote:
> When DEBUG_MUTEXES=y and LOCKDEP=n, mutex_lock() still checks on
> ->magic, hence debug_mutex_init() should be called in
> mutex_init_generic() as well. While we are at it, decouple LOCKDEP
> logic from debug_mutex_init(), because in this way debug_mutex_init()
> only needs one parameter, and we now have mutex_init_lockep() for
> LOCKDEP=y scenarios.
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/lkml/20251117202214.4f710f02@canb.auug.org.au/
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Closes: https://lore.kernel.org/lkml/20251121215819.GA1374726@ax162/
> Fixes: 3572e2edc7b6 ("locking/mutex: Redo __mutex_init()")
> Reviewed-by: Waiman Long <longman@redhat.com>
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> ---
> Peter,
> 
> Feel free to fold it into commit 3572e2edc7b6 ("locking/mutex: Redo
> __mutex_init()"), just resend it properly so it won't fall off your
> radar ;-)

Clearly I've been suffering too much mail again :/ Let me go frob stuff.

