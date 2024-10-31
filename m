Return-Path: <linux-next+bounces-4560-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB04D9B818F
	for <lists+linux-next@lfdr.de>; Thu, 31 Oct 2024 18:50:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 189541C20A78
	for <lists+linux-next@lfdr.de>; Thu, 31 Oct 2024 17:50:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C77261BFDEC;
	Thu, 31 Oct 2024 17:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bqbme28b"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D5012D1EA;
	Thu, 31 Oct 2024 17:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730397030; cv=none; b=rS1t8EQhBYAKS/EaC7EBBvCCbX06neKdKnIPZPwzFdkg403VaGeeOoc1yGoD90vt9eMEdLKOa8dXJS695+xNxyjXATQ+Oisv2jzjGspdFZeXoEG5Jyfc5PF+5VjEGP42BhiCqjZ4aZ4yuBwWg43Yb3fx6vQGH3cX0w3bZiyO/wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730397030; c=relaxed/simple;
	bh=uJZCR6UeY+j8Umg8Zowzf2L3YgWJ4oZESKAwkNGi0NY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mj0NDJ7LiKsC8jLxiGPWgQkcBcZdbZoJy59EHfGnWODxc8W5iibsjmrTx+xNc42d+99zZOd6V0m89b0tmI7O6y5nUf3lwl8dCnf5yOyOBOhPbZz83J1chM1wrKfF+b6+IDG9/TQgVVD0LEtPqSi7c5MYDR3bUhnlc3bFl3z0PbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bqbme28b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EF0FC4CED2;
	Thu, 31 Oct 2024 17:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730397030;
	bh=uJZCR6UeY+j8Umg8Zowzf2L3YgWJ4oZESKAwkNGi0NY=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=bqbme28bjkSAIQ2CfLqbSX9OYD3Su7rgYFQrZczDPaT9BOkB3aQ0w70jgc76rjFOQ
	 ZrUZGENmGuxSNur/pNaDmTIlD8qSTJJ671w17xpt06Wy7i6N7FO/f2+hClfo33IqoQ
	 iAL37ZIHgb4y6nBkMkB7A5KuDGUUQ+7QZinEKw78yAkItpg8pmrd2WAhZYHhdo5jHo
	 2Sy8P3K7p+xGCOYplGg3YB3ZBeWyRMjDO/zOVp/81Zc5aqQq2WgW/WJ+81fVPYptOm
	 kxRdmLtBStEIh98hMNHouqhG1MS2g1U+WeGm6rPcon3Y6oIPgGIovQ8GCdhlShcOy2
	 kvPmpeT/otW2w==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 9393ACE0924; Thu, 31 Oct 2024 10:50:29 -0700 (PDT)
Date: Thu, 31 Oct 2024 10:50:29 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Vlastimil Babka <vbabka@suse.cz>, Marco Elver <elver@google.com>,
	linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com, linux-mm@kvack.org,
	sfr@canb.auug.org.au, longman@redhat.com, boqun.feng@gmail.com,
	cl@linux.com, penberg@kernel.org, rientjes@google.com,
	iamjoonsoo.kim@lge.com, akpm@linux-foundation.org
Subject: Re: [BUG] -next lockdep invalid wait context
Message-ID: <186804c5-0ebd-4d38-b9ad-bfb74e39b353@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <41619255-cdc2-4573-a360-7794fc3614f7@paulmck-laptop>
 <e06d69c9-f067-45c6-b604-fd340c3bd612@suse.cz>
 <ZyK0YPgtWExT4deh@elver.google.com>
 <66a745bb-d381-471c-aeee-3800a504f87d@paulmck-laptop>
 <20241031072136.JxDEfP5V@linutronix.de>
 <cca52eaa-28c2-4ed5-9870-b2531ec8b2bc@suse.cz>
 <20241031075509.hCS9Amov@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241031075509.hCS9Amov@linutronix.de>

On Thu, Oct 31, 2024 at 08:55:09AM +0100, Sebastian Andrzej Siewior wrote:
> On 2024-10-31 08:35:45 [+0100], Vlastimil Babka wrote:
> > On 10/31/24 08:21, Sebastian Andrzej Siewior wrote:
> > > On 2024-10-30 16:10:58 [-0700], Paul E. McKenney wrote:
> > >> 
> > >> So I need to avoid calling kfree() within an smp_call_function() handler?
> > > 
> > > Yes. No kmalloc()/ kfree() in IRQ context.
> > 
> > However, isn't this the case that the rule is actually about hardirq context
> > on RT, and most of these operations that are in IRQ context on !RT become
> > the threaded interrupt context on RT, so they are actually fine? Or is smp
> > call callback a hardirq context on RT and thus it really can't do those
> > operations?
> 
> interrupt handlers as of request_irq() are forced-threaded on RT so you
> can do kmalloc()/ kfree() there. smp_call_function.*() on the other hand
> are not threaded and invoked directly within the IRQ context.

OK, thank you all for the explanation!  I will fix using Boqun's
suggestion of irq work, but avoiding the issue Boqun raises by invoking
the irq-work handler from the smp_call_function() handler.

It will be a few days before I get to this, so if there is a better way,
please do not keep it a secret!

							Thanx, Paul

