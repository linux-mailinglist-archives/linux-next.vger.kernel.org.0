Return-Path: <linux-next+bounces-4089-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 618D298F380
	for <lists+linux-next@lfdr.de>; Thu,  3 Oct 2024 18:04:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 92AE51C21698
	for <lists+linux-next@lfdr.de>; Thu,  3 Oct 2024 16:04:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34F731A4F15;
	Thu,  3 Oct 2024 16:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J4xFhOa8"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D20219C56A;
	Thu,  3 Oct 2024 16:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727971473; cv=none; b=ownFS3iv/4R0Lix0rzpiIV/mCajm6vkjPc4In1ra3kIKZG+9+g4o+T2F1mTUVrT+Al0ljkN9z/RTtk6lIjG3td9spcmEQf0HvNop7emwHYpJqLJCLcHDX953Q0vURhmE4JHWoKwfIJNEgbVEzwCJv/j6y9z3Ng/5jCAV14dH02g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727971473; c=relaxed/simple;
	bh=UWG67wCzxS0H6+5o0wt+bV75FyIlgU/TWHBgGqkLvU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tX5UUdFWEcV43EubcJxIKnmgZFuorpQEeXxT9jBAAxqQYkwIXkSlKvVYARRv6ttZy+ecMqRTuETnXR9dN7mAaM8kscuJHsD4Hq95pIAWNv11vMw5HBK+0MNECLTKsBCG60fJMO7VbKx7t34vynB4tPtlfOsagkwIYXuvg1IucO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J4xFhOa8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87B58C4CEC5;
	Thu,  3 Oct 2024 16:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727971470;
	bh=UWG67wCzxS0H6+5o0wt+bV75FyIlgU/TWHBgGqkLvU0=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=J4xFhOa8AtKUcsfK+echE/Uk2+2xFc4ky4DrVFMcwzsTGmYlZuLfCTPFHCU22DHrd
	 enRATfa+SMaZMCtyCpDdV8rNNTWVmpxQ2Vup6//5tATwHTaLK+r+i4aSXtYT8SrYDg
	 AcZBec1qvM0KoHfWr6Kq4+VdRHhkmqcCck5OM8VrBmu8TyoyiiRwvv3Z+pq0uGorqT
	 ToVL8MxTBTpMSyXkai7TP4pXKRsx+IPF7nec7XvFLKUY6DsE7KZEJXIxuldYNb1ar7
	 rrP7eZeSn4IYIUNCRXPJs5i8ufnUbzJj54f7lHp6RXmloos3cwF0eWTlh0W4afb4Ai
	 jNioq+ujteQ7Q==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 253AFCE0D68; Thu,  3 Oct 2024 09:04:30 -0700 (PDT)
Date: Thu, 3 Oct 2024 09:04:30 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: vschneid@redhat.com, linux-kernel@vger.kernel.org, sfr@canb.auug.org.au,
	linux-next@vger.kernel.org, kernel-team@meta.com
Subject: Re: [BUG almost bisected] Splat in dequeue_rt_stack() and build error
Message-ID: <7b14822a-ee98-4e46-9828-1e41b1ce76f3@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <c28dbc65-7499-41a5-84d0-991843153b1a@paulmck-laptop>
 <20241003084039.GS5594@noisy.programming.kicks-ass.net>
 <20241003084743.GC33184@noisy.programming.kicks-ass.net>
 <20241003092707.GD33184@noisy.programming.kicks-ass.net>
 <20241003122824.GE33184@noisy.programming.kicks-ass.net>
 <83d29a0c-dab2-4570-8be0-539b43237724@paulmck-laptop>
 <20241003142240.GU5594@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241003142240.GU5594@noisy.programming.kicks-ass.net>

On Thu, Oct 03, 2024 at 04:22:40PM +0200, Peter Zijlstra wrote:
> On Thu, Oct 03, 2024 at 05:45:47AM -0700, Paul E. McKenney wrote:
> 
> > I ran 100*TREE03 for 18 hours each, and got 23 instances of *something*
> > happening (and I need to suppress stalls on the repeat).  One of the
> > earlier bugs happened early, but sadly not this one.
> 
> Damn, I don't have the amount of CPU hours available you mention in your
> later email. I'll just go up the rounds to 20 minutes and see if
> something wants to go bang before I have to shut down the noise
> pollution for the day...

Indeed, this was one reason I was soliciting debug patches.  ;-)

							Thanx, Paul

