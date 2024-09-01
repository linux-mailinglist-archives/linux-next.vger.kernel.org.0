Return-Path: <linux-next+bounces-3517-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AB7967BBC
	for <lists+linux-next@lfdr.de>; Sun,  1 Sep 2024 20:28:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 922DC1F212BA
	for <lists+linux-next@lfdr.de>; Sun,  1 Sep 2024 18:28:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A871D183CD1;
	Sun,  1 Sep 2024 18:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wybkT605";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="68eVhT6f"
X-Original-To: linux-next@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8878126AE8;
	Sun,  1 Sep 2024 18:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725215330; cv=none; b=WY+mZECbdraPU1my1eQ7ZTnYDKsMiJyhgl5KSRqVQkJei2akTH4wCNOQZZOVzuzaed817R8IliEHQWMMms4lUlm9LD2ijURwVq2vfcWMP/uX+TQx7Yg0pib45llayNLYRaQh+qe40Zdr1SXxPivix/JV8siGu7RIf0HTYxOfLdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725215330; c=relaxed/simple;
	bh=0RYzoBOKEpaxfeWVQC5LQzV98V0L0r6EBX7krY/RrFY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YXW4UFq/XnZ8IbcJmREX5EsETaCpreYM/xPqIrLyV771NaI6fIi3g54tKJPvTadqd5zblnNFwkXbDLyKN4stD2B9IJNoVN6iq1KV68nECsdf3CjCx3ma6wp5ZjHGMG2Kwa/4Bcsj+in4jiNiVb8MIA2uNAjpPSUFcVAYxGp/DJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=wybkT605; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=68eVhT6f; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1725215326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RmY8bnVkd8XYMtbhSt4gVywEjTfDYFgtk9dXtbhAvZk=;
	b=wybkT605r846ulUgMAzCnC/xTrGTKYc/M0WWddUV+oIE6g+FHm/ErUNbiC1kRpwbPbeh3L
	y7tj9vw8V0J4i6rHaX7hHxPbLzN9Wf3RS4ZAZLcYt7/2rtSEK/hfypmb2eXaKI5Qh4+638
	NQtpIaTiTWYd+5agFMB2Jdn7hdK3pwcU6AZCV+EoNBgzk3gt/UKa/Ps3NmrDhVvYjvd+Au
	dFlzxmRwvgXlCetlptMk30IbUeJALXdDYHgru9Jhk5gng+N8g+d1wYDk25eaW5+ckkIpJx
	r043qJhPJt0v+o1VyvbQYu1mLM8NuAWKPjWwRcnytSyle4fSD5/Ri1MrczTVkw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1725215326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RmY8bnVkd8XYMtbhSt4gVywEjTfDYFgtk9dXtbhAvZk=;
	b=68eVhT6fQzvkt5SV/8OYt8KO7oGOnCwpCodHoIMV0E4ZtYGIfScJ/Ub9B0l3wQG/nODaNg
	dQENZ32qWXkK/pDA==
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Peter
 Zijlstra <peterz@infradead.org>, Chen Yufan <chenyufan@vivo.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
In-Reply-To: <20240830160210.365b47d7@canb.auug.org.au>
References: <20240826130137.631e5e31@canb.auug.org.au> <8734mremla.ffs@tglx>
 <20240827080925.32a7aec4@canb.auug.org.au>
 <20240830160210.365b47d7@canb.auug.org.au>
Date: Sun, 01 Sep 2024 20:28:45 +0200
Message-ID: <87a5gr8bz6.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Aug 30 2024 at 16:02, Stephen Rothwell wrote:
> On Tue, 27 Aug 2024 08:09:25 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> On Mon, 26 Aug 2024 10:04:49 +0200 Thomas Gleixner <tglx@linutronix.de> wrote:
>> >
>> > On Mon, Aug 26 2024 at 13:01, Stephen Rothwell wrote:  
>> > > kernel/time/timekeeping.c: In function 'timekeeping_check_update':
>> > > include/linux/typecheck.h:12:25: error: comparison of distinct pointer types lacks a cast [-Werror]
>> > >    12 |         (void)(&__dummy == &__dummy2); \    
>> > 
>> > Offending commit has been removed.  
>> 
>> That commit is still in the tip tree this morning.
>
> I am still reverting that commit.

Hrmpf. This was pulled in via some other branch again. I've reverted it
in that branch and merged that into master

Thanks,

        tglx



