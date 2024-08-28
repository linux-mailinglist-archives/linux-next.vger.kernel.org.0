Return-Path: <linux-next+bounces-3484-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D33B3963033
	for <lists+linux-next@lfdr.de>; Wed, 28 Aug 2024 20:39:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 129371C21691
	for <lists+linux-next@lfdr.de>; Wed, 28 Aug 2024 18:39:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B873E1AAE25;
	Wed, 28 Aug 2024 18:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cykaUJPo"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEAB1AAE10;
	Wed, 28 Aug 2024 18:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724870361; cv=none; b=Yrx83kZVfyHmPASB4zIXOV1yUSXsGXUsik0e0rsJDDcb0gYNCasagt6DC6Eo3rAAFFxWP4QshiCJ2mQaTiO34+1/h0yR8bJSxvltwDrgAJGuZY+TPL0RhDIXDDBtAusfiRC3KfBOQwO4Hn0fVLyKoswbSwol1Rx7RM46UcRMBJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724870361; c=relaxed/simple;
	bh=I17qLbshTPdE4pTOc+Q+tMjBx/axUlTD72kaH/aSabU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RpDdx248gAl990sq7Kkb2PWOU9ECfvjgeXJk4GljgDTeOV1hwOYhsF9k0mGnX2Ln0Qu8Pm+jwzf4oeilcJls4bHfjTQtctP8mJguHoU2glxK6mOmSlWfXfuFAfWo7PdIl0b2/SSpqCOZxbMGJTxRaWdHCHUnlOCqcXfFmGWQOCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cykaUJPo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22915C4CEC0;
	Wed, 28 Aug 2024 18:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724870361;
	bh=I17qLbshTPdE4pTOc+Q+tMjBx/axUlTD72kaH/aSabU=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=cykaUJPoF8fLxsOJch620PY9HQ3stYi++SVN7Fbi7yE5MWiQy5+obHQv2WH8zUSFo
	 e/7z+KCL5NxIion0tfKA4Vb4LqqqDI5+YV8kqI/SCaKUedfEqetK0Mx9qMh9v+dhEm
	 xqI5dX9dqjyMb97I5Ecr7g4TbqszhP8jP2X6DxgItFyTJlAvhfemlGfkZTj5D+7O13
	 G6WE1K/EXula0i+T+4lh5zDdn2LzpmDd1P5gAOYJ1Y1aJH3SDRh+MDQdXNP67mWCYn
	 Hgx7LifNpZLdildOOJfMTCNp4whgZbsPrShm5hoOKmwpWKJKIR7ka39rJop4G6HRNv
	 UrApVT3EZdUUw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id BE4A4CE0FF3; Wed, 28 Aug 2024 11:39:19 -0700 (PDT)
Date: Wed, 28 Aug 2024 11:39:19 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Valentin Schneider <vschneid@redhat.com>
Cc: Chen Yu <yu.c.chen@intel.com>, Peter Zijlstra <peterz@infradead.org>,
	linux-kernel@vger.kernel.org, sfr@canb.auug.org.au,
	linux-next@vger.kernel.org, kernel-team@meta.com
Subject: Re: [BUG almost bisected] Splat in dequeue_rt_stack() and build error
Message-ID: <8094db32-5c81-4537-8809-ddfe92a0ac6c@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <xhsmhikvmnfb3.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <c83028db-55ad-45b3-a27a-842ed665a882@paulmck-laptop>
 <103b1710-39ca-40d0-947d-fdac32d6e6a0@paulmck-laptop>
 <xhsmhcyltogin.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <a19308ed-7252-4119-b891-2a61791bb6e5@paulmck-laptop>
 <xhsmha5gwome6.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <Zs8pqJjIYOFuPDiH@chenyu5-mobl2>
 <xhsmh7cc0ogza.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <5ea3658b-5aec-4969-92c5-49a2d23171c3@paulmck-laptop>
 <xhsmh4j74o6l9.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xhsmh4j74o6l9.mognet@vschneid-thinkpadt14sgen2i.remote.csb>

On Wed, Aug 28, 2024 at 08:17:06PM +0200, Valentin Schneider wrote:
> On 28/08/24 09:35, Paul E. McKenney wrote:
> > On Wed, Aug 28, 2024 at 04:32:41PM +0200, Valentin Schneider wrote:
> >> On 28/08/24 21:44, Chen Yu wrote:
> >> >
> >> > One question, although there is no DEQUEUE_DELAYED flag, it is possible
> >> > the delayed task could be dequeued from CFS tree. Because the dequeue in
> >> > set_schedule() does not have DEQUEUE_SLEEP. And in dequeue_entity():
> >> >
> >> >       bool sleep = flags & DEQUEUE_SLEEP;
> >> >
> >> >       if (flags & DEQUEUE_DELAYED) {
> >> >
> >> >       } else {
> >> >               bool delay = sleep;
> >> >               if (sched_feat(DELAY_DEQUEUE) && delay &&  //false
> >> >                  !entity_eligible(cfs_rq, se) {
> >> >               //do not dequeue
> >> >               }
> >> >       }
> >> >
> >> >       //dequeue the task    <---- we should reach here?
> >> >
> >>
> >> You're quite right, so really here the main missing bit would be the final
> >> __block_task() that a DEQUEUE_DELAYED dequeue_entities() would get us.
> >
> > 50*TREE03 passed, yay!  Thank you both!!!
> 
> Fantastic, I'll hammer this into a "proper" patch then. Thanks again for
> all the testing!
> 
> > I started a 500*TREE03.
> >
> > Yes, the odds all 50 passing given the baseline 52% failure rate is
> > something like 10^-16, but software bugs are not necessarily constrained
> > by elementary statistics...
> 
> :-)

The 500*TREE03 run had exactly one failure that was the dreaded
enqueue_dl_entity() failure, followed by RCU CPU stall warnings.

But a huge improvement over the prior state!

Plus, this failure is likely unrelated (see earlier discussions with
Peter).  I just started a 5000*TREE03 run, just in case we can now
reproduce this thing.

							Thanx, Paul

