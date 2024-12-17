Return-Path: <linux-next+bounces-4985-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 485F19F514C
	for <lists+linux-next@lfdr.de>; Tue, 17 Dec 2024 17:42:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D78991642A0
	for <lists+linux-next@lfdr.de>; Tue, 17 Dec 2024 16:42:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E8B414B965;
	Tue, 17 Dec 2024 16:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GHP9KI6L"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CAF13D891;
	Tue, 17 Dec 2024 16:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734453725; cv=none; b=A26QNh4qhBXOub+L1Nk6YhbVlLm32+y0qavalHAwg/alQLHES5iN2WWQwpjgBqkl23tErpe4wXiVy5flf3Iidq2bzisMM5gDnG/PlPHgifA18fYPwXwUOKZDzF8pVFzW6GxuJQPyi1vE2/aDvx17B/yYpTMyAamBAYlp3yR5rUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734453725; c=relaxed/simple;
	bh=ycayqxT/uww/h1706nWav8mJiQl8Tq3uVZR6pHrfhso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oQot++EL6R1cqfBQiLJJI8fCJi27Btu3NT7GqFmh2cRhDjkhChTHvELG23JHBXNKBzlx+nylyrPDIjsetuoyMdMZKqImnlS2Bbpv/d/Yt2/SxL5VfQV1aiod5ojfacnvV9jOJM4K6mi4Ubmv6+bTANQlHkfiJzyGy6MV3qLAXRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GHP9KI6L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C70B1C4CED3;
	Tue, 17 Dec 2024 16:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734453724;
	bh=ycayqxT/uww/h1706nWav8mJiQl8Tq3uVZR6pHrfhso=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=GHP9KI6LAEbNuvInnGHO9+2bBqlip6x04Smj5Xyig6z5UgV0RNUy1Nnl1GKN6weip
	 MmHCHpwNKZsLk3qLeTSy+G1KdQ1AnrESlDXUiZ6k0+r6QvYzRgmO6rqlpWR2SH5fAE
	 7ICGk9taBozLY7BHMORj+uRow2GQzVoDntZOseKgDYrhkwFUdmzLJcWo3+vL3+xd4r
	 Q+JiMhiq5BoueibsyAntDJfdX76xammu3tlQYh/NtaxAX/iQAOdVZUPsKxST1tJYO8
	 A/XV/awNvsZtbHPBb8C9bid4I6z6nULieLInCyOXvN5rBkV0BFG6kRXoa1KRL7tmOb
	 jdOLQZFE1ih0w==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 71DB4CE09DB; Tue, 17 Dec 2024 08:42:04 -0800 (PST)
Date: Tue, 17 Dec 2024 08:42:04 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Tomas Glozar <tglozar@redhat.com>
Cc: Valentin Schneider <vschneid@redhat.com>, Chen Yu <yu.c.chen@intel.com>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	sfr@canb.auug.org.au, linux-next@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [BUG almost bisected] Splat in dequeue_rt_stack() and build error
Message-ID: <b854f67c-93c5-41b8-900e-69c78e0ecab7@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <CAP4=nvTtOB+0LVPQ=nA3=XdGLhDiwLjcLAb8YmQ+YqR9L+050Q@mail.gmail.com>
 <CAP4=nvTeawTjhWR0jKNGweeQFvcTr8S=bNiLsSbaKiz=od+EOA@mail.gmail.com>
 <35e44f60-0a2f-49a7-b44b-c6537544a888@paulmck-laptop>
 <fe2262ff-2c3d-495a-8ebb-c34485cb62a2@paulmck-laptop>
 <b9064ed8-387d-47ce-ad0a-7642ad180fc3@paulmck-laptop>
 <7cdc0f04-819d-429c-9a2c-9ad25d85db55@paulmck-laptop>
 <6e3fce44-1072-4720-bf91-33bb22ebbd21@paulmck-laptop>
 <2cd70642-86de-4b26-87c2-94bde7441ce8@paulmck-laptop>
 <CAP4=nvTqnABSzYXiDfizoaeviqLtC87jG1fnGH4XFV+xQGn-2Q@mail.gmail.com>
 <a82d8961-153a-4fb8-9c71-3bdf00f2e0f3@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a82d8961-153a-4fb8-9c71-3bdf00f2e0f3@paulmck-laptop>

On Mon, Dec 16, 2024 at 11:36:25AM -0800, Paul E. McKenney wrote:
> On Mon, Dec 16, 2024 at 03:38:20PM +0100, Tomas Glozar wrote:
> > ne 15. 12. 2024 v 19:41 odesílatel Paul E. McKenney <paulmck@kernel.org> napsal:
> > >
> > > And the fix for the TREE03 too-short grace periods is finally in, at
> > > least in prototype form:
> > >
> > > https://lore.kernel.org/all/da5065c4-79ba-431f-9d7e-1ca314394443@paulmck-laptop/
> > >
> > > Or this commit on -rcu:
> > >
> > > 22bee20913a1 ("rcu: Fix get_state_synchronize_rcu_full() GP-start detection")
> > >
> > > This passes more than 30 hours of 400 concurrent instances of rcutorture's
> > > TREE03 scenario, with modifications that brought the bug reproduction
> > > rate up to 50 per hour.  I therefore have strong reason to believe that
> > > this fix is a real fix.
> > >
> > > With this fix in place, a 20-hour run of 400 concurrent instances
> > > of rcutorture's TREE03 scenario resulted in 50 instances of the
> > > enqueue_dl_entity() splat pair.  One (untrimmed) instance of this pair
> > > of splats is shown below.
> > >
> > > You guys did reproduce this some time back, so unless you tell me
> > > otherwise, I will assume that you have this in hand.  I would of course
> > > be quite happy to help, especially with adding carefully chosen debug
> > > (heisenbug and all that) or testing of alleged fixes.
> > >
> > 
> > The same splat was recently reported to LKML [1] and a patchset was
> > sent and merged into tip/sched/urgent that fixes a few bugs around
> > double-enqueue of the deadline server [2]. I'm currently re-running
> > TREE03 with those patches, hoping they will also fix this issue.
> 
> Thank you very much!
> 
> An initial four-hour test of 400 instances of an enhanced TREE03 ran
> error-free.  I would have expected about 10 errors, so this gives me
> 99.9+% confidence that the patches improved things at least a little
> bit and 99% confidence that these patches reduced the error rate by at
> least a factor of two.
> 
> I am starting an overnight run.  If that completes without error, this
> will provide 99% confidence that these patches reduced the error rate
> by at least an order of magnitude.

And we have that level of confidence!

Tested-by: Paul E. McKenney <paulmck@kernel.org>

