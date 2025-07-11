Return-Path: <linux-next+bounces-7494-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FF7B02070
	for <lists+linux-next@lfdr.de>; Fri, 11 Jul 2025 17:30:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C17D15A640F
	for <lists+linux-next@lfdr.de>; Fri, 11 Jul 2025 15:30:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DDC72E7BD4;
	Fri, 11 Jul 2025 15:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WThc5Z+g"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5646E15C158;
	Fri, 11 Jul 2025 15:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752247826; cv=none; b=dcmrc/XCGSauFlE6erso6fAIlPBLYE8cGQnr4A+i0JhWb9xLHinUO08Ivw84+jXb4gudw+WRRbpY9WdISrr7NurDB8Ad8VmbMfw7b5CGG6venly5ZNCWLR+XzlSZ/bSL2abcR87aRvHbBFybdDqvCqmht3S6r72eoLquFGRJnPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752247826; c=relaxed/simple;
	bh=da6YyAuly7iSkZkGXj/rcmMGHObWvAwYXCp+m/VHl+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SeF0C+b19tvqJDsNT7PIGIMKwGYh0J5ZinUFspTlvgWf6kteZsCuhgogtP9L+gte+U3WwzI1CP/J1htxZQhdW4rZPYs/8UCH5jb6mQf8rqwNFE7WaY+ibVlLIaer05KlkduROnba1HRt1IRPbpxKKzZFce47ZI4jIVd+jlAQpEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WThc5Z+g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D592AC4CEED;
	Fri, 11 Jul 2025 15:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752247825;
	bh=da6YyAuly7iSkZkGXj/rcmMGHObWvAwYXCp+m/VHl+I=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=WThc5Z+gmo6//rxP6/gDfKNdXdw9uv4ZJa+fIjDaXS078GXAc1oSF/Q77Lm+o0qRe
	 3fmnvESyLKDh6mcMTl81FKUI1T09/ukc0ctlBwbdXlJzHgpqC3F6RZ40KsTDnA8Qat
	 zE6Aw8ZPejCQcMhU03FZl+duQ/zURtV2kqbPh1B8snRKm5Bkq0vIvr52LgYhYZGUOh
	 aTqNqYrJncAPOSAORsdYGIAlkuOdFa3dd0tuESHcuxzZbsYRspe80uCQrN/THC/dPP
	 jfAQ++FVWvSoRp5HW11D5WWEi++ZCfs94Jl4MkDYFv66I/2Z2lT2eWRDWizGTu6vqy
	 h5LqhCicPxHVQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 84FFECE0841; Fri, 11 Jul 2025 08:30:25 -0700 (PDT)
Date: Fri, 11 Jul 2025 08:30:25 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the paulmck tree
Message-ID: <f2bcc129-02ec-4d2a-a0b6-32319c4b977f@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20250711150655.6e18b0dd@canb.auug.org.au>
 <f12f601e-2b31-4129-9768-2a33713ce348@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f12f601e-2b31-4129-9768-2a33713ce348@paulmck-laptop>

On Fri, Jul 11, 2025 at 06:58:36AM -0700, Paul E. McKenney wrote:
> On Fri, Jul 11, 2025 at 03:06:55PM +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > The following commits are also in the mm-nonmm-unstable tree as different
> > commits (but the same patches):
> > 
> >   5c23ce0cb897 ("lib: Add stress test for ratelimit")
> >   5a5c5a3de1c7 ("lib: Make the ratelimit test more reliable")
> >   d19e9fa61f60 ("lib: Add trivial kunit test for ratelimit")
> > 
> > These are commits
> > 
> >   7074799065e7 ("lib: add stress test for ratelimit")
> >   5ec9048eae16 ("lib: make the ratelimit test more reliable")
> >   cf09bc65d491 ("lib: add trivial kunit test for ratelimit")
> > 
> > in the mm-nonmm-unstable tree.
> 
> Thank you both!  I will remove mine from -next.

Never mind!  Andrew beat me to it.  If testing goes well, I will send
this to Linus in the upcoming merge window.

							Thanx, Paul

