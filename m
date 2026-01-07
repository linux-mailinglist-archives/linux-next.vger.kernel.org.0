Return-Path: <linux-next+bounces-9586-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2C1D00424
	for <lists+linux-next@lfdr.de>; Wed, 07 Jan 2026 22:58:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE72A302CF5E
	for <lists+linux-next@lfdr.de>; Wed,  7 Jan 2026 21:54:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74B6D3054EB;
	Wed,  7 Jan 2026 21:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="hKABIYpi"
X-Original-To: linux-next@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F582F49F7;
	Wed,  7 Jan 2026 21:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767822856; cv=none; b=auYJlciJRQCc4QhOw2H27YWQI++v3lFqn5UvDOF+Wpwgb+15ULfx0PzU3ibD/tvgaefO3myntAEGGH2Vh/jinscEeyw7qZOM5S6b3rsT06yfh8vlPt5RdPX2g250Lfc9K245q0ljX8OAPfOM2895ycn6vnCfTyvDMKwouJ94UUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767822856; c=relaxed/simple;
	bh=QgF+rIkjgOBln2XEsnNrRATW1rqTLObHS+R+1eJbw5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OgrsGI+vrXr0WHIvwpj2uNUd3YS7CSDO98WGELwlriIYfj4FcCkspFhJmGLM/azpgpXj7nLRNJqAxLZYimlyVF+bjSmn9voLsBZ665nRikhCx2LEn5OD5VaNM13Xv98777ppWuVAL8zY6Cu4rfNbarXvaJ5abLhkwCVBx20tESg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=hKABIYpi; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=rI3AUxwB4kMQYNiWEjhY6Ljibr6cJCVTAck5BaV9Jvg=; b=hKABIYpijySsesRv6fW8JIpDpg
	/077SmsphZAaRVJGWvVpa2kiwX4/rwGLsZ2PT6urnBUWaey5uJSiM5rQiNun2FI5lY0Hbnc/1pgW2
	aJGlMyZIUPxF/9Ke7ahn8rpeOPo5ZwFKyynR4RBPMQpakBWAgHKJIbB2KpHUSkZUtLcVeaUmvHnGT
	MJ5qK5dzZYznEoDkru2/EDDE5EduhmeiQ/2KECdm2bz/asSD4GkRSgpZ0w3sASdlL4Nm4QXh6ZDyB
	JfjM+zqxSTlJaro2JIGeDJyS2dn1hljI9S2k4bGcDYL8542/9UoBeGBMGboM7o6qV9T9T1UBqMXC8
	/vvzgRAg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdbTl-0000000CBfC-40nT;
	Wed, 07 Jan 2026 21:54:10 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 5E1BF30057E; Wed, 07 Jan 2026 22:54:09 +0100 (CET)
Date: Wed, 7 Jan 2026 22:54:09 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>, Marco Elver <elver@google.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the tip tree
Message-ID: <20260107215409.GB694817@noisy.programming.kicks-ass.net>
References: <20260107161548.45530e1c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260107161548.45530e1c@canb.auug.org.au>

On Wed, Jan 07, 2026 at 04:15:48PM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the tip tree, today's linux-next build (htmldocs) produced
> this warning:
>=20
> Documentation/core-api/kref:328: include/linux/kref.h:72: WARNING: Invali=
d C declaration: Expected end of definition. [error at 96]
>   int kref_put_mutex (struct kref *kref, void (*release)(struct kref *kre=
f), str
> uct mutex *mutex) __cond_acquires(true# mutex)
>   -----------------------------------------------------------------------=
-------------------------^
> Documentation/core-api/kref:328: include/linux/kref.h:94: WARNING: Invali=
d C declaration: Expected end of definition. [error at 92]
>   int kref_put_lock (struct kref *kref, void (*release)(struct kref *kref=
), spinlock_t *lock) __cond_acquires(true# lock)
>   -----------------------------------------------------------------------=
---------------------^
>=20
> Introduced by commit
>=20
>   5e256db9325e ("kref: Add context-analysis annotations")

I really have no clue what that thing is on about. The code is fine and
works as intended.

My go-to fix for anything kdoc is to change '/**' into '/*' until it
goes away.

