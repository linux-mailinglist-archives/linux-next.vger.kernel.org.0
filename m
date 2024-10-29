Return-Path: <linux-next+bounces-4516-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FB49B438C
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2024 08:53:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 53656B215B9
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2024 07:53:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D74F8202F64;
	Tue, 29 Oct 2024 07:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Mua9Pibe";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fhfjNxfI"
X-Original-To: linux-next@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1572010F4;
	Tue, 29 Oct 2024 07:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730188377; cv=none; b=od9NBaNvBwIacTS4kMDpPXm7ra/j6OPZxUEL1KIvCti6Q1h35T5jYFJODmM9C4NIDukL4WMiAf/Lo2CGiFcut3XE3U7nriCRg8dYGgnpRTiez42MY0+3A1ZBiOkpuAvtZD2waQysC9Ud4A52juO0rqWpyHOdeT7zVXJFnwZkVvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730188377; c=relaxed/simple;
	bh=5yYH7qIfGmrE0LNQZXlaCsK1rMXfHyv4X0roVe5QXZ0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ViqWKLFvnuQgV8laUfWUYkqB3FeBQuBKkauIv9oWtty3HBuJZXm//oft9ZI+4BeeCfzeuMg30pLWddzgOgNSBp2uNbJMtC1aKbr9avadCXsaMjPWm+AW3v0TtESHS0Mofr4UoRGS0HjDhKDSma+rCQ0aed4XauuDgnAKz4P/C+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Mua9Pibe; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fhfjNxfI; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1730188373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u3a3YBlZ7wl5Xbj5OvTfmZmfrm3sVYf28cB+dMZoIGM=;
	b=Mua9PibeCluDmxKsvFB+ax+TnCQ24HP4wLVLJsx2e4mhVdNL9V39wrwqbQ1uO+BMmpKDMv
	rW98f9w9Bts37wwUCS8Dtgh4s4wbsquM2jU5YL4yHOSyqNaUNo7wCvVBTBaygpzat8SQUo
	Nnm9bSIYRtTt+FzMt4Ra2mirbLTjR7ws13tkqcJMInakdDIVtDAYu4V4IOs1L10cN8pHWt
	ucP6yEfs0PNHCDjLsugHK4ihCLss2rXbRBEeT/h1TqtkPteecMLm+8ndOu97pLulTyQVJr
	kOlmkFw+u8ZuK5FRx3D+B1AWaZPQD83yHPvTkSrBWxoCOCJwj4k+Rzib/Pi8TA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1730188373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u3a3YBlZ7wl5Xbj5OvTfmZmfrm3sVYf28cB+dMZoIGM=;
	b=fhfjNxfI5m/FcuZV4YBROU7nMz9mfld+IAmET8tHlipFgsYELKK/CDgnauE81m7CoXGgXc
	sPjag4h0fQjwUiDg==
To: Stephen Rothwell <sfr@rothwell.id.au>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the tip tree
In-Reply-To: <20241029170533.5592ab42@oak>
References: <20241029133407.3580be1a@canb.auug.org.au>
 <20241028213040.e5d72b2f56971ceb5c80395b@linux-foundation.org>
 <20241029170533.5592ab42@oak>
Date: Tue, 29 Oct 2024 08:52:53 +0100
Message-ID: <87h68v2vmy.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Oct 29 2024 at 17:05, Stephen Rothwell wrote:
> On Mon, 28 Oct 2024 21:30:40 -0700 Andrew Morton <akpm@linux-foundation.org> wrote:
>> > This is commit
>> > 
>> >   82c4d6b6dace ("sched/numa: fix the potential null pointer dereference in task_numa_work()")
>> > 
>> > in the mm-hotfixes-unstable branch of the mm-hotfixes tree.  
>> 
>> Thanks, but...  What tip branch is it in?  Matters because: is that
>> branch destined for 6.12.x?
>
> Its in the sched/urgent branch, so probably destined for Linus fairly
> soon.  But the tip guys would know better than I.

Yes, .../urgent are fixes for the current -rc cycle. That should go end
of the week to Linus.

Thanks,

        tglx

