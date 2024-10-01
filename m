Return-Path: <linux-next+bounces-4039-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2774298B8FE
	for <lists+linux-next@lfdr.de>; Tue,  1 Oct 2024 12:10:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D54DB1F21766
	for <lists+linux-next@lfdr.de>; Tue,  1 Oct 2024 10:10:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EC2F1A072C;
	Tue,  1 Oct 2024 10:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kifh4mvf"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259E51A0706;
	Tue,  1 Oct 2024 10:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727777449; cv=none; b=JL8fMKLrhNy5FCV8Do2u9LvZ4fZbc4WjQTVCijvRPTgZlKthdnM2g+vHY5k8BrE5IjuAyklVhXAEzOGbGdyliIemvis/y1+4Zpi7R6EH2kvDQaifK/QVD2hbFmMBUglye5KegjOLyUNZR+p6ZG0ZfMyfqg1UClwFNuJd7kvgmx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727777449; c=relaxed/simple;
	bh=syenZMyWtz7zybSF9iTkLnsiOl/jFXgmekBMJdI0vO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BqVghtpqxqD8WgAt4Hy98ISxzgXJa0xt9fFgSZpSs8FLTd6P8WyT0Fo++FMtW7NPdcWN7xEN3f/JYkzknV++cBwENgrA2/CfnIH0AlsJEv1p7hNklumJmr3+nOKC1uuLEq30ba06Oag1N7v7N4R4QWxz9iRqD+jqct19D5nUeCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kifh4mvf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A390BC4CEC6;
	Tue,  1 Oct 2024 10:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727777448;
	bh=syenZMyWtz7zybSF9iTkLnsiOl/jFXgmekBMJdI0vO8=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=kifh4mvfbqC2EcJL3WMPEsvDnxLWc/cGZlFYfi4Xf6mvzq4jnzq5deYTIouUAFdWg
	 Td7wH+117yUPb/+LDR+NT69nlxAz4qtC4xy8WbLU0JpXk8FdguuoLut7SBtSQ26Rmo
	 w+XQskEikBH95KNsfnvppbAHMHg1j/aS+k1UFe1RGBRphFE1Aq4bsseGU7YJm6GqMO
	 h9m3dIouoZwfxn4gr/Lpsdnum/QMZiWVEVw7skgqB8FE6+txIt24zp8QTDsNf8xvm8
	 ltTzrzU+QfFKgEFpqy8EuLMWJs2NAwSNKSHNj5x/3EYU4QKmPjGwTFhOKAFiRgQ6PF
	 i5Xo3SoWrazYQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 4D187CE0F7B; Tue,  1 Oct 2024 03:10:48 -0700 (PDT)
Date: Tue, 1 Oct 2024 03:10:48 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Valentin Schneider <vschneid@redhat.com>
Cc: Chen Yu <yu.c.chen@intel.com>, Peter Zijlstra <peterz@infradead.org>,
	linux-kernel@vger.kernel.org, sfr@canb.auug.org.au,
	linux-next@vger.kernel.org, kernel-team@meta.com,
	Tomas Glozar <tglozar@redhat.com>
Subject: Re: [BUG almost bisected] Splat in dequeue_rt_stack() and build error
Message-ID: <d6033378-d716-4848-b7a5-dcf1a6b14669@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <8094db32-5c81-4537-8809-ddfe92a0ac6c@paulmck-laptop>
 <4b93e5cf-c71e-4c64-9369-4ab3f43d9693@paulmck-laptop>
 <xhsmh1q27o2us.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <cc537207-68a3-4dda-a8ec-6dda2fc1985d@paulmck-laptop>
 <250cde11-650f-4689-9c36-816406f1b9b8@paulmck-laptop>
 <182ef9c6-63a4-4608-98de-22ef4d35be07@paulmck-laptop>
 <xhsmh34m38pdl.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <ac93f995-09bc-4d2c-8159-6afbfbac0598@paulmck-laptop>
 <43d513c5-7620-481b-ab7e-30e76babbc80@paulmck-laptop>
 <xhsmhed50vplj.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <xhsmhed50vplj.mognet@vschneid-thinkpadt14sgen2i.remote.csb>

On Mon, Sep 30, 2024 at 10:44:24PM +0200, Valentin Schneider wrote:
> On 30/09/24 12:09, Paul E. McKenney wrote:
> > On Fri, Sep 13, 2024 at 11:00:39AM -0700, Paul E. McKenney wrote:
> >> On Fri, Sep 13, 2024 at 06:55:34PM +0200, Valentin Schneider wrote:
> >> > On 13/09/24 07:08, Paul E. McKenney wrote:
> >> > > On Sun, Sep 08, 2024 at 09:32:18AM -0700, Paul E. McKenney wrote:
> >> > >>
> >> > >> Just following up...
> >> > >>
> >> > >> For whatever it is worth, on last night's run of next-20240906, I got
> >> > >> nine failures out of 100 6-hour runs of rcutorture’s TREE03 scenario.
> >> > >> These failures were often, but not always, shortly followed by a hard hang.
> >> > >>
> >> > >> The warning at line 1995 is the WARN_ON_ONCE(on_dl_rq(dl_se))
> >> > >> in enqueue_dl_entity() and the warning at line 1971 is the
> >> > >> WARN_ON_ONCE(!RB_EMPTY_NODE(&dl_se->rb_node)) in __enqueue_dl_entity().
> >> > >>
> >> > >> The pair of splats is shown below, in case it helps.
> >> > >
> >> > > Again following up...
> >> > >
> >> > > I am still seeing this on next-20240912, with six failures out of 100
> >> > > 6-hour runs of rcutorture’s TREE03 scenario.  Statistics suggests that
> >> > > we not read much into the change in frequency.
> >> > >
> >> > > Please let me know if there are any diagnostic patches or options that
> >> > > I should apply.
> >> >
> >> > Hey, sorry I haven't forgotten about this, I've just spread myself a bit
> >> > too thin and also apparently I'm supposed to prepare some slides for next
> >> > week, I'll get back to this soonish.
> >>
> >> I know that feeling!  Just didn't want it to get lost.
> >
> > And Peter asked that I send along a reproducer, which I am finally getting
> > around to doing:
> >
> >       tools/testing/selftests/rcutorture/bin/kvm.sh --allcpus --duration 12h --configs "100*TREE03" --trust-make
> >
> 
> FYI Tomas (on Cc) has been working on getting pretty much this to run on
> our infra, no hit so far.
> 
> How much of a pain would it be to record an ftrace trace while this runs?
> I'm thinking sched_switch, sched_wakeup and function-tracing
> dl_server_start() and dl_server_stop() would be a start.
> 
> AIUI this is running under QEMU so we'd need to record the trace within
> that, I'm guessing we can (ab)use --bootargs to feed it tracing arguments,
> but how do we get the trace out?

Me, I would change those warnings to dump the trace buffer to the
console when triggered.  Let me see if I can come up with something
better over breakfast.  And yes, there is the concern that adding tracing
will suppress this issue.

So is there some state that I could manually dump upon triggering either
of these two warnings?  That approach would minimize the probability of
suppressing the problem.

							Thanx, Paul

