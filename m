Return-Path: <linux-next+bounces-9375-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A26CAC059
	for <lists+linux-next@lfdr.de>; Mon, 08 Dec 2025 05:21:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B29BA301CEA2
	for <lists+linux-next@lfdr.de>; Mon,  8 Dec 2025 04:21:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03916274B51;
	Mon,  8 Dec 2025 04:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cUVo8spC"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC38A800;
	Mon,  8 Dec 2025 04:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765167678; cv=none; b=RP2e1kouspWZg9WMBlXnxpIFfLmRXKuy29pJAzKkiST91oLIDYN7o18gm+0JtOw6jhERCJ8gXVk4TyTuT38D66WmdP2OphlR3dNwVeVHaOC8lzJuCx9hTo5+IxmCvLGkEUXO/613RY984d/7ucjnkqVKYUOXuKyDhwk8+2qvFMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765167678; c=relaxed/simple;
	bh=gJOh5Or9aFdkyfyN+nCRoFjqlyHaG60WOlFzt0iuCgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LMGv9jHRDhbTFwbI+PCN+hjOFQl6RwhbItqj6qSgGKBJOt2gEL0TFiBegOE2Q9lOqKbUj9roC/7VXH6lMBUACqUd8GM74ZZa+4u719DeRcM/OIgkIxYz2XVo3vkg0npNcxtVv5weQ2LH0AZqSnOOLrKHrXYe6KP9wfPwEM1yk80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cUVo8spC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48C4CC4CEF1;
	Mon,  8 Dec 2025 04:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765167678;
	bh=gJOh5Or9aFdkyfyN+nCRoFjqlyHaG60WOlFzt0iuCgU=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=cUVo8spC79l+3fjyGnO2Rq8KJvmFoTgn7k47dDrQIPtpuxd5OqMseEHZNr780dPu2
	 vAefmcr9s0Pa9QSyGBwl2rubt7Dy1utbYJYmGdQlPdrdparg4RH0ToYrcTOFJRxtK3
	 F0Yhg986VBPA3ZgFwe5PDqHrooNBrUeCMbloiDiBDxsX+Htu83PxyV/yG1OQ8TAnRw
	 QPeXT6E9EwVVtMA4rgvtnEKU0Bja1+JZqWoCUgSGbhGTH9nfkjHVRUrEfjSsOF2VsY
	 Ue5zmNYXGvSdJ7csonnQhRhFWTrF0Sq+1DWs2rkNN6F70dS7ghAxK5J187uIbXY6Pt
	 XgestOgL++Q/w==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 38E22CE0E29; Sun,  7 Dec 2025 20:21:16 -0800 (PST)
Date: Sun, 7 Dec 2025 20:21:16 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: linux-next: manual merge of the rcu tree with the ftrace tree
Message-ID: <8504795b-e210-4b66-a146-a22ee87c6ffd@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20251114135226.64831207@canb.auug.org.au>
 <20251114074255.3e535084@gandalf.local.home>
 <aRdBVFSmgvPWuY2k@localhost.localdomain>
 <054ceff1-87b7-4729-8589-b7dd22887bc1@paulmck-laptop>
 <aRxu_ycww5U9qxJR@localhost.localdomain>
 <f79a2e18-d9c3-40db-97ed-c334b90cf3ba@paulmck-laptop>
 <370911ae-ce3c-4ebd-a348-452c73c06597@paulmck-laptop>
 <8e93322e-9e0d-4414-b9ce-7c098477dbe8@paulmck-laptop>
 <20251207191756.3ac61680@debian>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251207191756.3ac61680@debian>

On Sun, Dec 07, 2025 at 07:17:56PM -0500, Steven Rostedt wrote:
> On Sun, 7 Dec 2025 12:43:32 -0800
> "Paul E. McKenney" <paulmck@kernel.org> wrote:
> 
> > If I continue to hear no objections in the next 20 hours or so, I will
> > push this into -next:
> > 
> > fca6fa23c5a5 ("tracing: Guard __DECLARE_TRACE() use of __DO_TRACE_CALL() with SRCU-fast")
> 
> Hi Paul,
> 
> Can you repost the patch as a normal patch (start its own thread) so
> that I can look at it separately. I'm currently in Tokyo so I'll likely
> get distracted a lot this week.

Understood.  On its way to an inbox near you:

Message-ID: <e2fe3162-4b7b-44d6-91ff-f439b3dce706@paulmck-laptop>

							Thanx, Paul

