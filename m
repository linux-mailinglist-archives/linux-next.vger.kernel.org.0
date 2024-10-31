Return-Path: <linux-next+bounces-4553-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D24AD9B75CC
	for <lists+linux-next@lfdr.de>; Thu, 31 Oct 2024 08:55:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 982F6285A0F
	for <lists+linux-next@lfdr.de>; Thu, 31 Oct 2024 07:55:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D3D214D29D;
	Thu, 31 Oct 2024 07:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="r57rkDgx";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MBi+cQkB"
X-Original-To: linux-next@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7B9146019;
	Thu, 31 Oct 2024 07:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730361317; cv=none; b=eRSBQYKnYwzlh7xj/BeHDveQJRG2BNCw2Pct5mUuTRfRZO1Z8mukKqcncn2BlPemrjpdX4HiK0G1AGwTaG3iirv/mguxJshQG0DjmWyZCmc7tigT2DPBU2iWIpCKHQrvjzirSRNjRJ+eZ/5Nu5ltMuH7WqVuDpaOf+iV+7qvOHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730361317; c=relaxed/simple;
	bh=igDCE/xG8z7PFzU8jpeANhIbhJWsYql4+5a6fEQ+Mn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hDEZ4QPFK7CunbUVpPf/u0GSHLvtlauYlq4S/bFBiMsE9bWfFDmtGayrd8rcvrYBgYaSTC3Org/C+mpuJNY386AyXUUUuv7pX4ayEZMhbRN9JWTuvw59sAt4r+5uH2sMM9HTt070xRL+ERjEtcuvrdgFpQTU1YlsW65/+142SQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=r57rkDgx; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MBi+cQkB; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Thu, 31 Oct 2024 08:55:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1730361313;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=smZJ3gWMsDVgdSzoTnaukuVPFfiZhLlX964GA+Dzwz8=;
	b=r57rkDgx2HVFzvFRmHdzOPKiNYr2WC/mCEprOskCaVU16cITkS4wBwAhrS0hXUnbgpiTlF
	rKfGhLeOQTShY9mnZ4Y8qL1mHuSu5xqzDZVtUEAU//NKbB6vF78MKOLBphHJMZp2TAQy5I
	fN2hPNtIrJ6j2Ay+AhquClKVpqYNGJdgzlDxGBwTT62/FGOIrPFBywu9r3dE+ocogDweur
	q+i7YBzVSpAuCop239hjgaalhoA9DqwrJbTzkCbfHxP2tbdzcpBVF+ZBOytIFNcEnHoBAe
	8Trf2EbRSSH83GGch+pQIPGJlrwBvDnHqrl3PTCvv/k2++pdv/ZMEtKv6Pe/ag==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1730361313;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=smZJ3gWMsDVgdSzoTnaukuVPFfiZhLlX964GA+Dzwz8=;
	b=MBi+cQkBAQDm1M1gu/pI18xCKC3V4DeEjZf4fFzBoP2Q6yoJkeeGw6GiblkENg8XrvD+YP
	C23QF+2m4Kfqe1AQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Marco Elver <elver@google.com>,
	linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com, linux-mm@kvack.org,
	sfr@canb.auug.org.au, longman@redhat.com, boqun.feng@gmail.com,
	cl@linux.com, penberg@kernel.org, rientjes@google.com,
	iamjoonsoo.kim@lge.com, akpm@linux-foundation.org
Subject: Re: [BUG] -next lockdep invalid wait context
Message-ID: <20241031075509.hCS9Amov@linutronix.de>
References: <41619255-cdc2-4573-a360-7794fc3614f7@paulmck-laptop>
 <e06d69c9-f067-45c6-b604-fd340c3bd612@suse.cz>
 <ZyK0YPgtWExT4deh@elver.google.com>
 <66a745bb-d381-471c-aeee-3800a504f87d@paulmck-laptop>
 <20241031072136.JxDEfP5V@linutronix.de>
 <cca52eaa-28c2-4ed5-9870-b2531ec8b2bc@suse.cz>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cca52eaa-28c2-4ed5-9870-b2531ec8b2bc@suse.cz>

On 2024-10-31 08:35:45 [+0100], Vlastimil Babka wrote:
> On 10/31/24 08:21, Sebastian Andrzej Siewior wrote:
> > On 2024-10-30 16:10:58 [-0700], Paul E. McKenney wrote:
> >> 
> >> So I need to avoid calling kfree() within an smp_call_function() handler?
> > 
> > Yes. No kmalloc()/ kfree() in IRQ context.
> 
> However, isn't this the case that the rule is actually about hardirq context
> on RT, and most of these operations that are in IRQ context on !RT become
> the threaded interrupt context on RT, so they are actually fine? Or is smp
> call callback a hardirq context on RT and thus it really can't do those
> operations?

interrupt handlers as of request_irq() are forced-threaded on RT so you
can do kmalloc()/ kfree() there. smp_call_function.*() on the other hand
are not threaded and invoked directly within the IRQ context.

> Vlastimil
> 
Sebastian


