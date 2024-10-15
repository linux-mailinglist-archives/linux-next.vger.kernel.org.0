Return-Path: <linux-next+bounces-4279-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 508FC99F6A9
	for <lists+linux-next@lfdr.de>; Tue, 15 Oct 2024 21:00:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA09D286D10
	for <lists+linux-next@lfdr.de>; Tue, 15 Oct 2024 19:00:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BAE61F583F;
	Tue, 15 Oct 2024 18:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KjBwSsNh"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0611F582F;
	Tue, 15 Oct 2024 18:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729018645; cv=none; b=TcSgB5+1DyedGosxd06enB3sXu6ncGmkJ2AV+GiRGjkliiXWoZxSNtYHftuv/bLRcPhcNZUSlBgV/HaG6yxzIXEHQjdQaf3ycai42w6Goz6h/jvLXAlaLSpok0J3+eb7lpqWirOa0F6ThFn3HNkR1MgZwjctSo4Ld9Rhccoj5qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729018645; c=relaxed/simple;
	bh=390dvdqxwk2fe3c97f0YQRd7FIbixI55hWq7oUyetL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vBlub0P8idUGDoK01coHkkXtaGJyu0xoaV2p8Wf4oNmsmDbWvsbu2aA3ec2GoU0RBWIvt294ELxHdiMc6FBfao0zW34uism+jSxv8hWeZtvqhhLUASIvl0HARxHDDzZiz7jovpLvjG0GXd2NrGt4ph3mK7jSlw44/JYvekmv4YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KjBwSsNh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D31FFC4CEC6;
	Tue, 15 Oct 2024 18:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729018644;
	bh=390dvdqxwk2fe3c97f0YQRd7FIbixI55hWq7oUyetL4=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=KjBwSsNhtCYmnPm4/pj5328UwUZtS7j0GUM6o7BDOmW+25Q4+gvlXpy73vtx/1QYc
	 d7OMWEinJrD/I5JyHPYeRdf/PJCekPFOSjYGCzFcFkrNFnn0VUp4CQvzaijgiE1XCq
	 1PZuJF812ckC1x+uQEqaYWs/3JefdbbL/4RBgOvDJ5+5DMHrUhBvhUscou9jkGwYQq
	 smNt8cRm8UeRKNrIlswusSwjwL3ZhRoFC36YXzlyUyfvaNVoSAZMRe7m7LlB/jGOqk
	 G5A934mSVRBf879yvrSsc0tqIM77GHHx8K+eczuphPCT2F/sbNMs8gzJdzrFB4tyAn
	 U3yirhFu8m9vA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 91AF2CE098E; Tue, 15 Oct 2024 11:57:24 -0700 (PDT)
Date: Tue, 15 Oct 2024 11:57:24 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: dmitry.torokhov@gmail.com, bentiss@kernel.org, sfr@canb.auug.org.au,
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
	linux-toolchains@vger.kernel.org
Subject: Re: [BUG] -next objtool build failure (bisected)
Message-ID: <688a88d8-0b40-486b-abc7-cf7c4a5f68d6@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <fe8c909e-bf02-4466-b3eb-0a4747df32e3@paulmck-laptop>
 <20241015184507.hiepeqrjgcjssvoj@treble>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015184507.hiepeqrjgcjssvoj@treble>

On Tue, Oct 15, 2024 at 01:45:07PM -0500, Josh Poimboeuf wrote:
> On Tue, Oct 15, 2024 at 11:10:11AM -0700, Paul E. McKenney wrote:
> > Hello!
> > 
> > The next-20241011 release gets me build errors like the following:
> > 
> > 	vmlinux.o: warning: objtool: fetch_item() falls through to next function
> > 
> > Bisection leads me here:
> > 
> > 	61595012f280 ("HID: simplify code in fetch_item()")
> > 
> > This diff looks inoffensive to me, but I get this error on this commit
> > and not on its predecessor.
> > 
> > This build failure happens on quite a few different kernel configurations.
> > I bisected using this particular reproducer:
> > 
> > tools/testing/selftests/rcutorture/bin/kvm.sh --allcpus --buildonly --configs SRCU-T
> 
> The problem is likely this:
> 
> +	default:
> +		unreachable();
> 
> The unreachable() annotation by itself produces undefined behavior, as
> it will just fall off the edge of the function if the default case is
> ever executed.
> 
> Better to do
> 
> 	default:
> 		BUG();
> 
> which makes the behavior defined.

And this fixes things for me, thank you!

							Thanx, Paul

