Return-Path: <linux-next+bounces-3457-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AFA961588
	for <lists+linux-next@lfdr.de>; Tue, 27 Aug 2024 19:33:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 226FA1F23B6D
	for <lists+linux-next@lfdr.de>; Tue, 27 Aug 2024 17:33:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49ECD1C57B3;
	Tue, 27 Aug 2024 17:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JSnd5i2I"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220E854767;
	Tue, 27 Aug 2024 17:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724779994; cv=none; b=JN4f5VP4BxLIqc57xSXRB/njPi70wunmsbCCMHeBRZtbHGR+lkg4algZZC2IVLBHnIcrY2fxQRnzGQaMMHLYhEQonEWToo601rnyDTsbfsyKqjGFDSeH+YF0k5TG4gS2xbsjyUH4FWGQICbx/Nc2GewR/EPD4sZoYu2TWvEF+Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724779994; c=relaxed/simple;
	bh=Nk0qpxw+TP/2J94jeGPaD+i1kHoOyah/wAgLA67ZSA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XUYM5qNrodgQrnXkYA30nUv/7gvFko6iqqyK0ZmqVAanvV3wd0PdEWRTmetnrYwjvxWZM+bTRsvVzGBNCBvwC4T0v2bcNJjvEQu8+Kyw77N6/clKsZ3oSjZdXxW0MCYpthcLPXj1JrLj/5Eib57CIoOQoIDbryl/wjUzfvwUb9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JSnd5i2I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 923F8C4AF49;
	Tue, 27 Aug 2024 17:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724779993;
	bh=Nk0qpxw+TP/2J94jeGPaD+i1kHoOyah/wAgLA67ZSA0=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=JSnd5i2IXH/UMZ0as98UU6/xl+FQXF1oeaxpZdnGJpgBSuuWcpaeHZ6WaB1lSb2Ol
	 wGlRhBqXeSlwBMtqaTNxWrI3OrwCkaZN97Kiy7SOrESWcm3aVMPzvtWS8Z53XwAjql
	 H2PTbLVNxSP2+iZ3AXg06yw5tIIKEHHYk0NiizAYnralRpcLEIqs1viOLCgtS3SAME
	 mKHAFF26E5NToTw+2K10qlGcplW5DP0efj383tiE5kSyVl4YLcifGZMb3jCkT+QDoW
	 /QEb3Gu4o96TRx735K01leXGiFmrk1dhvaFqMABnQacKw+4GUcQAvOUlMkelT6h9eq
	 Trszz8m/OdLwg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 2DAD8CE10CB; Tue, 27 Aug 2024 10:33:13 -0700 (PDT)
Date: Tue, 27 Aug 2024 10:33:13 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Valentin Schneider <vschneid@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	sfr@canb.auug.org.au, linux-next@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [BUG almost bisected] Splat in dequeue_rt_stack() and build error
Message-ID: <c83028db-55ad-45b3-a27a-842ed665a882@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <c28dbc65-7499-41a5-84d0-991843153b1a@paulmck-laptop>
 <20240823074705.GB12053@noisy.programming.kicks-ass.net>
 <xhsmho75fo6e4.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <b1824f4a-f5cc-4011-876f-8a73cf752067@paulmck-laptop>
 <xhsmhle0inuze.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <xhsmhikvmnfb3.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xhsmhikvmnfb3.mognet@vschneid-thinkpadt14sgen2i.remote.csb>

On Tue, Aug 27, 2024 at 05:41:52PM +0200, Valentin Schneider wrote:
> On 27/08/24 12:03, Valentin Schneider wrote:
> > On 26/08/24 09:31, Paul E. McKenney wrote:
> >> On Mon, Aug 26, 2024 at 01:44:35PM +0200, Valentin Schneider wrote:
> >>>
> >>> Woops...
> >>
> >> On the other hand, removing that dequeue_task() makes next-20240823
> >> pass light testing.
> >>
> >> I have to ask...
> >>
> >> Does it make sense for Valentin to rearrange those commits to fix
> >> the two build bugs and remove that dequeue_task(), all in the name of
> >> bisectability.  Or is there something subtle here so that only Peter
> >> can do this work, shoulder and all?
> >>
> >
> > I suppose at the very least another pair of eyes on this can't hurt, let me
> > get untangled from some other things first and I'll take a jab at it.
> 
> I've taken tip/sched/core and shuffled hunks around; I didn't re-order any
> commit. I've also taken out the dequeue from switched_from_fair() and put
> it at the very top of the branch which should hopefully help bisection.
> 
> The final delta between that branch and tip/sched/core is empty, so it
> really is just shuffling inbetween commits.
> 
> Please find the branch at:
> 
> https://gitlab.com/vschneid/linux.git -b mainline/sched/eevdf-complete-builderr
> 
> I'll go stare at the BUG itself now.

Thank you!

I have fired up tests on the "BROKEN?" commit.  If that fails, I will
try its predecessor, and if that fails, I wlll bisect from e28b5f8bda01
("sched/fair: Assert {set_next,put_prev}_entity() are properly balanced"),
which has stood up to heavy hammering in earlier testing.

							Thanx, Paul

