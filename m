Return-Path: <linux-next+bounces-3482-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CA5962DC2
	for <lists+linux-next@lfdr.de>; Wed, 28 Aug 2024 18:35:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BDF631F22F98
	for <lists+linux-next@lfdr.de>; Wed, 28 Aug 2024 16:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E5E51A257C;
	Wed, 28 Aug 2024 16:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XAAuuF46"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6648B19FA9D;
	Wed, 28 Aug 2024 16:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724862905; cv=none; b=SVxi6P5K+FSM5fOYbtgpOkKYCJcEBVA7X5qU9a+lAggC9PUvaicSSZVCnWUbwHoSJGeuZAMb184grthWHSqlpiNrhLW0eHrFqrk1/6qUYDvatPxnl8Sefha8vONLmDxAeamUYTNQoBMBhqrXWW89GsqZtHvfblkLlA+jU7SIlbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724862905; c=relaxed/simple;
	bh=1/Ux0/aOBdzOcFk57HnAKqOVb8yqrFtLIQS04HCJdQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bxgkpwv9Zz8Jxs1qh+SqS0jbZbqcXAUkXvESUAdWnNTryKwXZqnniRObpIrswz1pBTsQcpj0IavUMAujdhHLaI+S72TZjGcL8yusd9jVWcEikkERiAKpJFx+IQGx3bhzbZgl/1iztbEW9HoPvPpY1jNUf+8OFwhZKKHgwDXqkZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XAAuuF46; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDAB3C51EF2;
	Wed, 28 Aug 2024 16:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724862904;
	bh=1/Ux0/aOBdzOcFk57HnAKqOVb8yqrFtLIQS04HCJdQ8=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=XAAuuF46gAdVplfhcMdjNdCu6Hx7MfcvtHATDTpojMMEGst0LhBdy/jXrAF0BGRPH
	 rZaVdqFXFzg2vXAtw1/9BF5UrQGI6MTyd+HzAX0PQIyEy+3hDc2+Xzflx8x1l5V043
	 RKfUCFwdsgGqwMsatGmI4qP/iKOs2Ke4XpV/lLEdtpcG+jluZ32VtYO80RZZzjgYBv
	 yjcWyXS5XINaPBXZMOMMXBq7Yb25nNcpvGfRbS7TQ3418cluhfkFw6afhJP68shntk
	 XNoIQ59At16TvDq5v21VvrJI4tQwvhWL0aj/L1MLBdH0IChnAJBiYNwUNldSQS0ICn
	 B0tCaIRpilggQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 83B9DCE1697; Wed, 28 Aug 2024 09:35:04 -0700 (PDT)
Date: Wed, 28 Aug 2024 09:35:04 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Valentin Schneider <vschneid@redhat.com>
Cc: Chen Yu <yu.c.chen@intel.com>, Peter Zijlstra <peterz@infradead.org>,
	linux-kernel@vger.kernel.org, sfr@canb.auug.org.au,
	linux-next@vger.kernel.org, kernel-team@meta.com
Subject: Re: [BUG almost bisected] Splat in dequeue_rt_stack() and build error
Message-ID: <5ea3658b-5aec-4969-92c5-49a2d23171c3@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <b1824f4a-f5cc-4011-876f-8a73cf752067@paulmck-laptop>
 <xhsmhle0inuze.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <xhsmhikvmnfb3.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <c83028db-55ad-45b3-a27a-842ed665a882@paulmck-laptop>
 <103b1710-39ca-40d0-947d-fdac32d6e6a0@paulmck-laptop>
 <xhsmhcyltogin.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <a19308ed-7252-4119-b891-2a61791bb6e5@paulmck-laptop>
 <xhsmha5gwome6.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <Zs8pqJjIYOFuPDiH@chenyu5-mobl2>
 <xhsmh7cc0ogza.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xhsmh7cc0ogza.mognet@vschneid-thinkpadt14sgen2i.remote.csb>

On Wed, Aug 28, 2024 at 04:32:41PM +0200, Valentin Schneider wrote:
> On 28/08/24 21:44, Chen Yu wrote:
> > Hi,
> >
> > On 2024-08-28 at 14:35:45 +0200, Valentin Schneider wrote:
> >> On 27/08/24 13:36, Paul E. McKenney wrote:
> >> > On Tue, Aug 27, 2024 at 10:30:24PM +0200, Valentin Schneider wrote:
> >> >>
> >> >> Thanks for the testing!
> >> >>
> >> >> The WARN_ON_ONCE(!rt_se->on_list); hit in __dequeue_rt_entity() feels like
> >> >> a put_prev/set_next kind of issue...
> >> >>
> >> >> So far I'd assumed a ->sched_delayed task can't be current during
> >> >> switched_from_fair(), I got confused because it's Mond^CCC Tuesday, but I
> >> >> think that still holds: we can't get a balance_dl() or balance_rt() to drop
> >> >> the RQ lock because prev would be fair, and we can't get a
> >> >> newidle_balance() with a ->sched_delayed task because we'd have
> >> >> sched_fair_runnable() := true.
> >> >>
> >> >> I'll pick this back up tomorrow, this is a task that requires either
> >> >> caffeine or booze and it's too late for either.
> >> >
> >> > Thank you for chasing this, and get some sleep!  This one is of course
> >> > annoying, but it is not (yet) an emergency.  I look forward to seeing
> >> > what you come up with.
> >> >
> >> > Also, I would of course be happy to apply debug patches.
> >> >
> >> >                                                       Thanx, Paul
> >>
> >> Chen Yu made me realize [1] that dequeue_task() really isn't enough; the
> >> dequeue_task() in e.g. __sched_setscheduler() won't have DEQUEUE_DELAYED,
> >> so stuff will just be left on the CFS tree.
> >>
> >
> > One question, although there is no DEQUEUE_DELAYED flag, it is possible
> > the delayed task could be dequeued from CFS tree. Because the dequeue in
> > set_schedule() does not have DEQUEUE_SLEEP. And in dequeue_entity():
> >
> >       bool sleep = flags & DEQUEUE_SLEEP;
> >
> >       if (flags & DEQUEUE_DELAYED) {
> >
> >       } else {
> >               bool delay = sleep;
> >               if (sched_feat(DELAY_DEQUEUE) && delay &&  //false
> >                  !entity_eligible(cfs_rq, se) {
> >               //do not dequeue
> >               }
> >       }
> >
> >       //dequeue the task    <---- we should reach here?
> >
> 
> You're quite right, so really here the main missing bit would be the final
> __block_task() that a DEQUEUE_DELAYED dequeue_entities() would get us.

50*TREE03 passed, yay!  Thank you both!!!

I started a 500*TREE03.

Yes, the odds all 50 passing given the baseline 52% failure rate is
something like 10^-16, but software bugs are not necessarily constrained
by elementary statistics...

							Thanx, Paul

