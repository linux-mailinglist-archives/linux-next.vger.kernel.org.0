Return-Path: <linux-next+bounces-4018-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E47A798AC82
	for <lists+linux-next@lfdr.de>; Mon, 30 Sep 2024 21:09:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88CAB1F22E22
	for <lists+linux-next@lfdr.de>; Mon, 30 Sep 2024 19:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D60331991CA;
	Mon, 30 Sep 2024 19:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B4lSoEqE"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E9E78C60;
	Mon, 30 Sep 2024 19:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727723348; cv=none; b=Yk/otCRG3Qxe2b8Zjx7YRol+ieVVoCI1esByavSda6j7oT5qKH7yQ/ENSLR5mZ2vbFi26G/0WhbosFGpSo5HGHDSFK7k3QdhIzwm2LUrtOekIyu1Ldzbh7032IU2+UR53eKK4FN5PKivSYCIm5Zi57fsmnJtCWEvOpe5zBpj4x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727723348; c=relaxed/simple;
	bh=6DazO5p0+ZxDCMk8uqSApigO0k9L87idNRTBV4yTPEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mi/Xzh99w4Bqdxp5aDkyUIAFQWiCJqfwakGGGU0Jd1O4Pt4inXMHJnvCgRJFphcjTAnvUBedBlGMBfuQThqO8RV3Rgx3fg4sAnhzZ0upDdZOrBrehNfHSwME5T9sC98zQLa+iluxchE4CEDAU3uqbPjUNg3oHGtKY0WW3uVqJac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B4lSoEqE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DAAAC4CEC7;
	Mon, 30 Sep 2024 19:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727723348;
	bh=6DazO5p0+ZxDCMk8uqSApigO0k9L87idNRTBV4yTPEY=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=B4lSoEqE9cxar9MkcRKr9mXRlb3JDUY2H997BpMU05W9uBthlya4HBXpeXTAV9h3D
	 x/K1CA9uW0akQD/luCyM/u/95lXowHyUXd6jdECzcsUVFOC+tpx3nOD2e675+wHrYm
	 J48+r+bXam9TBvFL9JaqZeNfB9RPK/ZDwCbCYpVP1jSAYJowmkO1V995rTj/kRRrYs
	 R3Q3w4AMSlCBobnfCggEe+MTsjDczOf55fCYqnhzt2LV2lWG1YW6VrEgp3jhPrETzr
	 b/TypF28W8E+3qGndNHUDRUtp/bW4g+L818v7N8gJEXV/0BwLsb6X+NelIxIC70IIk
	 kAK/8eylqRV2g==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id E85F0CE0E5B; Mon, 30 Sep 2024 12:09:07 -0700 (PDT)
Date: Mon, 30 Sep 2024 12:09:07 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Valentin Schneider <vschneid@redhat.com>
Cc: Chen Yu <yu.c.chen@intel.com>, Peter Zijlstra <peterz@infradead.org>,
	linux-kernel@vger.kernel.org, sfr@canb.auug.org.au,
	linux-next@vger.kernel.org, kernel-team@meta.com
Subject: Re: [BUG almost bisected] Splat in dequeue_rt_stack() and build error
Message-ID: <43d513c5-7620-481b-ab7e-30e76babbc80@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <5ea3658b-5aec-4969-92c5-49a2d23171c3@paulmck-laptop>
 <xhsmh4j74o6l9.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <8094db32-5c81-4537-8809-ddfe92a0ac6c@paulmck-laptop>
 <4b93e5cf-c71e-4c64-9369-4ab3f43d9693@paulmck-laptop>
 <xhsmh1q27o2us.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <cc537207-68a3-4dda-a8ec-6dda2fc1985d@paulmck-laptop>
 <250cde11-650f-4689-9c36-816406f1b9b8@paulmck-laptop>
 <182ef9c6-63a4-4608-98de-22ef4d35be07@paulmck-laptop>
 <xhsmh34m38pdl.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <ac93f995-09bc-4d2c-8159-6afbfbac0598@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ac93f995-09bc-4d2c-8159-6afbfbac0598@paulmck-laptop>

On Fri, Sep 13, 2024 at 11:00:39AM -0700, Paul E. McKenney wrote:
> On Fri, Sep 13, 2024 at 06:55:34PM +0200, Valentin Schneider wrote:
> > On 13/09/24 07:08, Paul E. McKenney wrote:
> > > On Sun, Sep 08, 2024 at 09:32:18AM -0700, Paul E. McKenney wrote:
> > >>
> > >> Just following up...
> > >>
> > >> For whatever it is worth, on last night's run of next-20240906, I got
> > >> nine failures out of 100 6-hour runs of rcutorture’s TREE03 scenario.
> > >> These failures were often, but not always, shortly followed by a hard hang.
> > >>
> > >> The warning at line 1995 is the WARN_ON_ONCE(on_dl_rq(dl_se))
> > >> in enqueue_dl_entity() and the warning at line 1971 is the
> > >> WARN_ON_ONCE(!RB_EMPTY_NODE(&dl_se->rb_node)) in __enqueue_dl_entity().
> > >>
> > >> The pair of splats is shown below, in case it helps.
> > >
> > > Again following up...
> > >
> > > I am still seeing this on next-20240912, with six failures out of 100
> > > 6-hour runs of rcutorture’s TREE03 scenario.  Statistics suggests that
> > > we not read much into the change in frequency.
> > >
> > > Please let me know if there are any diagnostic patches or options that
> > > I should apply.
> > 
> > Hey, sorry I haven't forgotten about this, I've just spread myself a bit
> > too thin and also apparently I'm supposed to prepare some slides for next
> > week, I'll get back to this soonish.
> 
> I know that feeling!  Just didn't want it to get lost.

And Peter asked that I send along a reproducer, which I am finally getting
around to doing:

	tools/testing/selftests/rcutorture/bin/kvm.sh --allcpus --duration 12h --configs "100*TREE03" --trust-make

Note that this run will consume 19,200 CPU hours, or almost two CPU
years.  Therefore, this is best done across a largish number of systems.
The kvm-remote.sh script can be helpful for this sort of thing, and
you give it a quoted list of systems before the rest of the arguments
shown above.

Doing this on a -next from last week got me 15 failures similar to the
following:

[41212.683966] WARNING: CPU: 14 PID: 126 at kernel/sched/deadline.c:1995 enqueue_dl_entity+0x511/0x5d0
[41212.712453] WARNING: CPU: 14 PID: 126 at kernel/sched/deadline.c:1971 enqueue_dl_entity+0x54f/0x5d0

							Thanx, Paul

