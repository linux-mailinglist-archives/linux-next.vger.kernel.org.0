Return-Path: <linux-next+bounces-4586-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD539B964E
	for <lists+linux-next@lfdr.de>; Fri,  1 Nov 2024 18:14:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 187581C20F45
	for <lists+linux-next@lfdr.de>; Fri,  1 Nov 2024 17:14:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 877AB19F430;
	Fri,  1 Nov 2024 17:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UWRgoQKa"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB921CA81;
	Fri,  1 Nov 2024 17:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730481268; cv=none; b=KbRWE5/iO7SjcETrOprIzaNkvTzOdNvlribekAKqriO3FxN/FCvNBoSoiqazj2TdHW7N5S5Vky/q7xfeUf22TrnZxkwbwdjjtRxOMNYYikmK98WilW8A6TiHJMtmSdKOpGvWf1FF7GNsMAPbRmOHVc7woTt7E4t5wapByyplw1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730481268; c=relaxed/simple;
	bh=t7jCJGcff3SakeRBVtopNaYzOmhOtoxkGSrpxV88o0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lUbwfCS0wm33vgaDqxkAoEjBx/inaWIwe7t8VzgUdzlyPWFFqNYrGtEKd+dr1tfK38gR+tPH52BW36DVubASsqFWlGiAWDe2+SpijjjtIr+1eOZxNA1nDa6bcqSqT5VqPiVwGu8VbmpnrBzjc2BbeeJ63UmmHdXNvEew9oT+fSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UWRgoQKa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE980C4CECD;
	Fri,  1 Nov 2024 17:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730481267;
	bh=t7jCJGcff3SakeRBVtopNaYzOmhOtoxkGSrpxV88o0k=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=UWRgoQKa+3GiDICunCPQClgjWjn+qDGVO0kXqpBA7LUJOPmQCIM8hH/wGZfsSEEEm
	 4KvKBKe42IrQgSonw2TXrXXOre5xvZLgDfusDeVlA3f6jCZdsEdRfUdn68TtQd+IZ9
	 escB4Sb3UEQyn7fFy2ECJkcaAddOW8rMXAkbYRLUVO6FVaD5OUsc0tXrSmYOFjWo2i
	 7Ib3kb+lqWpMkxw5GLWAtCgOyJXylmp/+IYKKbkultN9tWSTl6SAS64ZOceLCZJRzY
	 kyoTJotH2AmghfzHzoHA942vPbRfPP1IQF/h0hvJtilD7dW4yOl385BNvsgUPjGhKA
	 MeK7SwaHXpf5w==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 73DC9CE0D6F; Fri,  1 Nov 2024 10:14:27 -0700 (PDT)
Date: Fri, 1 Nov 2024 10:14:27 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Elver <elver@google.com>, linux-next@vger.kernel.org,
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
	linux-mm@kvack.org, sfr@canb.auug.org.au, longman@redhat.com,
	boqun.feng@gmail.com, cl@linux.com, penberg@kernel.org,
	rientjes@google.com, iamjoonsoo.kim@lge.com,
	akpm@linux-foundation.org
Subject: Re: [BUG] -next lockdep invalid wait context
Message-ID: <ed93c68c-fb17-4c20-958e-0fc4ce8bcd83@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <41619255-cdc2-4573-a360-7794fc3614f7@paulmck-laptop>
 <e06d69c9-f067-45c6-b604-fd340c3bd612@suse.cz>
 <ZyK0YPgtWExT4deh@elver.google.com>
 <66a745bb-d381-471c-aeee-3800a504f87d@paulmck-laptop>
 <20241031072136.JxDEfP5V@linutronix.de>
 <cca52eaa-28c2-4ed5-9870-b2531ec8b2bc@suse.cz>
 <20241031075509.hCS9Amov@linutronix.de>
 <751e281a-126b-4bcd-8965-71affac4a783@suse.cz>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <751e281a-126b-4bcd-8965-71affac4a783@suse.cz>

On Thu, Oct 31, 2024 at 09:18:52AM +0100, Vlastimil Babka wrote:
> On 10/31/24 08:55, Sebastian Andrzej Siewior wrote:
> > On 2024-10-31 08:35:45 [+0100], Vlastimil Babka wrote:
> >> On 10/31/24 08:21, Sebastian Andrzej Siewior wrote:
> >> > On 2024-10-30 16:10:58 [-0700], Paul E. McKenney wrote:
> >> >> 
> >> >> So I need to avoid calling kfree() within an smp_call_function() handler?
> >> > 
> >> > Yes. No kmalloc()/ kfree() in IRQ context.
> >> 
> >> However, isn't this the case that the rule is actually about hardirq context
> >> on RT, and most of these operations that are in IRQ context on !RT become
> >> the threaded interrupt context on RT, so they are actually fine? Or is smp
> >> call callback a hardirq context on RT and thus it really can't do those
> >> operations?
> > 
> > interrupt handlers as of request_irq() are forced-threaded on RT so you
> > can do kmalloc()/ kfree() there. smp_call_function.*() on the other hand
> > are not threaded and invoked directly within the IRQ context.
> 
> Makes sense, thanks.
> 
> So how comes rcutorture wasn't deadlocking on RT already, is it (or RCU
> itself) doing anything differently there that avoids the kfree() from
> smp_call_function() handler?

This was scftorture rather than rcutorture.  While I know of others who
regularly run rcutorture, to the best of my knowledge I am the only one
who ever runs scftorture, which tests smp_call_function(), its friends,
and its diagnostics.

							Thanx, Paul

