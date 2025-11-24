Return-Path: <linux-next+bounces-9185-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 91ABBC812C4
	for <lists+linux-next@lfdr.de>; Mon, 24 Nov 2025 15:55:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8D0094E4F0C
	for <lists+linux-next@lfdr.de>; Mon, 24 Nov 2025 14:53:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62606288C39;
	Mon, 24 Nov 2025 14:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jgi2gtLZ"
X-Original-To: linux-next@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A10F2868BD;
	Mon, 24 Nov 2025 14:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763996009; cv=none; b=PC0Nge1Fk3OVEOnk7BiNkDqov37VtqiMa22t4BGU/fF/oOOZ5G9gaErcnbF1l2l3U7geFlMlxNlF5CN03Erg9cGeg9CDi1jHAcFGrA53m7tGcpTJtYF9GV75J/fVRi8WeDCz1E8dnVJmSeEYBu23W35las7zOuhgXSBDhiLu+TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763996009; c=relaxed/simple;
	bh=osvj3cPm+0QvD4jwt6GkOKUTvbpzo3c3gFniqGsHS60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RuOeePPABx7wgx9Victa/1de5ln3yMwrlq4RJ4TOSYV03Ty0+zqqramFxuKbvgWOBCKwIUwDTPrGv8QfsYvnqi953ZQ2CTC1E2+QIi/pgVoW1ExaefKBN7z2HQUUtrwzFNHOrZqvnTHL+KtC3Zpb/x93uN5e/dCPtlgdwRKAaw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=jgi2gtLZ; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wuizb7xv0hnznpkcAgmG4+l4XF6tBAeiQauqYCOlBLA=; b=jgi2gtLZJP4/K+SrIeFSa/lQPY
	/BcNQfHjR9Q0GEcyRrKiR+tuwqswJ9xVx23z2meOVCa6HeDdqRDCuEXi6G2rEQXVWuNqIZ7jUlASn
	kSAbc0ot7RJ6mo5/0MWLR2G7FATqyIeN/4qV1IeBMlNMfVVX8BHVPCm1Kabe/H6lrYi/x46XSUPyw
	LTrQp1gkAbdhDdq8nsX8WWbSo6FPC9c2chQo+z8y/4twOd2IQmABbJpwzEnPDOKknMpLCaI589SSj
	mOKX+MoMclFedPDS1o5Qy7b922Iqu7DPyHokHjPYkAzeVvcEW5RTcbbYRanDr2qzQi6qWoHuAuKmM
	+5Q07gjw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNXwR-0000000789b-2Rgn;
	Mon, 24 Nov 2025 14:53:23 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 15BAE3002E3; Mon, 24 Nov 2025 15:53:23 +0100 (CET)
Date: Mon, 24 Nov 2025 15:53:23 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	ojeda@kernel.org, boqun.feng@gmail.com
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20251124145323.GR4067720@noisy.programming.kicks-ass.net>
References: <20251124231644.38d0303b@canb.auug.org.au>
 <20251124123249.GP4067720@noisy.programming.kicks-ass.net>
 <20251125010351.05b0b2d7@canb.auug.org.au>
 <20251124143537.GS3245006@noisy.programming.kicks-ass.net>
 <CANiq72kdCJS9ZDX+6B3pecAbfMqpt2XCqOfQfoKWgLaT9DtMpg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72kdCJS9ZDX+6B3pecAbfMqpt2XCqOfQfoKWgLaT9DtMpg@mail.gmail.com>

On Mon, Nov 24, 2025 at 03:48:12PM +0100, Miguel Ojeda wrote:
> On Mon, Nov 24, 2025 at 3:35 PM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > At some point in the past... I just did again, and updated the relevant
> > packages and rustavailable is still green, but allmodconfig is still not
> > giving me rust.
> >
> > I'm on Debian Testing.
> 
> There are several `depends on` for `CONFIG_RUST` as Boqun mentions, so
> it is likely one of those is blocking you.
> 
> The easiest way to know which one it is is to check what `menuconfig`
> computes about the requirements (searching with the `/` command).

Yeah, that output is so long it scrolls out of the right side of the
screen and it really isn't nice to read with all the negations.

