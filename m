Return-Path: <linux-next+bounces-9261-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 4184EC918A2
	for <lists+linux-next@lfdr.de>; Fri, 28 Nov 2025 10:56:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5EAAD34BE1C
	for <lists+linux-next@lfdr.de>; Fri, 28 Nov 2025 09:56:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BADB03074A9;
	Fri, 28 Nov 2025 09:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="llvzfZ+h"
X-Original-To: linux-next@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D4E307AC7;
	Fri, 28 Nov 2025 09:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764323763; cv=none; b=eqY2fBuBJ5ndJuFk8a7f2TOH4e+r2JhCDQeuMzGUPC+b2n8H/UXSVI1JuoIlln3ZRxHvfT1i0UNAXZQ6RwcoXV5MF1t9VQLTy1NFLw8t2lrgB9I4IVzqoAJLl4CP9vKKaBgf8M6K+59XMlOh5jOx9V8ObQtWUsXcy7oyPiRgkx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764323763; c=relaxed/simple;
	bh=1dPrb+6v+s8FkDZO7j4maZX1pkLHHGmQtvFnEk69KRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DgVwsBS9m2pEE0Q6zRUHKDHjK8klS+Cr0yue8PS0ZdngrCzi4kMvhAgmGAFLDc5Li/Pb/7XCxaUGWkkl3sbm9/f0Ddctl4z6S8N1vZJHlDMd5efTSc0y7LnVY/LKIFQ8718/y6/XUVNA8BlCCqKSU3TfE5Fd5/OzzVqLaA+Rg+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=llvzfZ+h; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=w0rRf6HtG7XGnbeDEPVE10+3eXiAEMS2mz2j63SdEPU=; b=llvzfZ+hjCFYUAH94cVzkpu9xd
	8AiBajDzyLNqAj6DXV17NtMD6rmsTcv1R+5G1sIBIKrmu70u5mu/2MTqfSE34zysDYWgMPPfOzMbn
	8YqmnDNYoZ2pE1XbTnWnbKf087Q6Q87AlxVhBPyNsAhy8m6Dd5X4HDxAEUugc7o8r0kqUaH8tYS97
	yH/pVQwhnI2c6rJ5kqyds8UFdTfaA35k5Q7NaydUHAZSb0HhwqHGMBwqHMfjFqUCy2yrCFohgKgqv
	gGvDXuiV2NFUY9OnEcTz2XessUSdpAJzCS8zJhoN3F33k0eoxJGIb3UxUhfkrhqncvgIQcP7Kkm6Q
	cbiuJnPQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOuL9-0000000Bg3R-1ipg;
	Fri, 28 Nov 2025 09:00:31 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C5A1A3001D4; Fri, 28 Nov 2025 10:55:52 +0100 (CET)
Date: Fri, 28 Nov 2025 10:55:52 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org, akpm@linux-foundation.org,
	Nathan Chancellor <nathan@kernel.org>,
	Waiman Long <longman@redhat.com>, Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH] locking/mutex: Initialize mutex::magic even when
 LOCKDEP=n
Message-ID: <20251128095552.GG3245006@noisy.programming.kicks-ass.net>
References: <aSDoquGlA55Ge100@tardis.local>
 <20251125145425.68319-1-boqun.feng@gmail.com>
 <20251128160815.64709af7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251128160815.64709af7@canb.auug.org.au>

On Fri, Nov 28, 2025 at 04:08:15PM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> On Tue, 25 Nov 2025 06:54:21 -0800 Boqun Feng <boqun.feng@gmail.com> wrot=
e:
> >
> > When DEBUG_MUTEXES=3Dy and LOCKDEP=3Dn, mutex_lock() still checks on
> > ->magic, hence debug_mutex_init() should be called in =20
> > mutex_init_generic() as well. While we are at it, decouple LOCKDEP
> > logic from debug_mutex_init(), because in this way debug_mutex_init()
> > only needs one parameter, and we now have mutex_init_lockep() for
> > LOCKDEP=3Dy scenarios.
> >=20
> > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > Closes: https://lore.kernel.org/lkml/20251117202214.4f710f02@canb.auug.=
org.au/
> > Reported-by: Nathan Chancellor <nathan@kernel.org>
> > Closes: https://lore.kernel.org/lkml/20251121215819.GA1374726@ax162/
> > Fixes: 3572e2edc7b6 ("locking/mutex: Redo __mutex_init()")
> > Reviewed-by: Waiman Long <longman@redhat.com>
> > Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> > ---
> > Peter,
> >=20
> > Feel free to fold it into commit 3572e2edc7b6 ("locking/mutex: Redo
> > __mutex_init()"), just resend it properly so it won't fall off your
> > radar ;-)
> >=20
> >  kernel/locking/mutex-debug.c | 10 +---------
> >  kernel/locking/mutex.c       |  8 +++++++-
> >  kernel/locking/mutex.h       |  5 ++---
> >  3 files changed, 10 insertions(+), 13 deletions(-)
>=20
> Any chance if this being applied?  I am still seeing the boot warning.

Should be sorted now, sorry for the delay!

