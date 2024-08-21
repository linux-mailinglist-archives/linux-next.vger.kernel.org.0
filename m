Return-Path: <linux-next+bounces-3383-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3921995A29D
	for <lists+linux-next@lfdr.de>; Wed, 21 Aug 2024 18:19:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C70A7B23FF0
	for <lists+linux-next@lfdr.de>; Wed, 21 Aug 2024 16:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C43D14E2C1;
	Wed, 21 Aug 2024 16:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g+wkJuQS"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5262F13C914;
	Wed, 21 Aug 2024 16:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724257127; cv=none; b=uZwHev3jbyG0wCo4PEWztOYYlZjnw52NUsEvJ+ZWtan3+U//4BEFdhK52+1QbPSKKMKbXoLeSe5oIQJ++XMk9aL1PLJx+icK+SYIhVShXDL7qOT+78swPUHGF2CCDGS4eqYXXWULg+0iDJp9k06LrR6qlQ5PjGpe7UuR0FnUzkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724257127; c=relaxed/simple;
	bh=fJIbmpXh0osnZ623TZjfe8Z2k19nstODOeL2aDSXi4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ctV3+rhtZzUdOY1GEpz9tjMLcnmBX3XfrFqObqb+wnH3voTQcSeJDBnVxkZYbJy+MkvetcFLC2saF0D5K3jUITr4CeS1bYoIqPn0m1Ugiw1FM+3Rpg1m0R5/I1eAmwy6Fuz7/8Cmp9MytGAz+nR9WnYInzS2/JsMZCNcsykdIR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g+wkJuQS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4689C32781;
	Wed, 21 Aug 2024 16:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724257126;
	bh=fJIbmpXh0osnZ623TZjfe8Z2k19nstODOeL2aDSXi4Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g+wkJuQSZ2bWsJdvi4kL4Gs/+7zutKlPOFMqJ5bpqPrAsNbnSnrayKmXTTcwW1K5C
	 dtIO99Eu2Fnl3Lq1MDIM/Z0zj88w68kco7W6Smr7AetbofWuP9FkzlLAx2lMW3zWKT
	 /B/NUQ1q+wgWb5C2lAz6lTnuJrBLM+kYKo39qr3ZGTOYYiCg8UiUYlNS5W0vHVDTPA
	 3sKg6km8gPaq29BnART90yyFsM+ybUeQ+p3uKG4LKbsa6npXf53tkiQ1i8iVVsRWpB
	 o9u3PE7KiWMGtb4KeT3AOM/8V1NXJn8ddijCSiCt1Ekx+8tr8Kdb05hHO3rKj52fgr
	 wTUMHizRafcDg==
Date: Wed, 21 Aug 2024 06:18:45 -1000
From: Tejun Heo <tj@kernel.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: matthew.brost@intel.com, jiangshanlai@gmail.com, sfr@canb.auug.org.au,
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: [BUG bisected] sysfs: cannot create duplicate filename
 '/devices/virtual/workqueue/scsi_tmf_1073822488'
Message-ID: <ZsYTZTEbtMuVyp1o@slm.duckdns.org>
References: <8d443293-2020-42d9-b5b1-1348f551648f@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d443293-2020-42d9-b5b1-1348f551648f@paulmck-laptop>

On Tue, Aug 20, 2024 at 07:16:00PM -0700, Paul E. McKenney wrote:
> Running rcutorture scenario TREE01 on next-20240820 on a dual-socket x86
> system (and for that matter on my laptop) got me this warning during boot:
> 
> sysfs: cannot create duplicate filename '/devices/virtual/workqueue/scsi_tmf_1073822488'
> 
> The number at the end varies from run to run.
> 
> Bisection landed here:
> 
> b188c57af2b5 ("workqueue: Split alloc_workqueue into internal function and lockdep init")
> 
> My reproducer is to run this at the top of the Linux-kernel file tree:
> 
> tools/testing/selftests/rcutorture/bin/kvm.sh --allcpus --duration 1m --configs "2*TREE01" --trust-make
> 
> Reverting this commit on top of next-20240820 gets me clean runs.
> 
> I cannot see how the patch would make this happen, but then again,
> I don't know this code at all well.
> 
> Thoughts?

Hmmm... I have a hard time imagining that change causing that error. My bet
is unreliable reproducer. I'll try the repro.

Thanks.

-- 
tejun

