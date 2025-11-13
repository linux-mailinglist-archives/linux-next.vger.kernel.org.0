Return-Path: <linux-next+bounces-8965-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4CDC5A507
	for <lists+linux-next@lfdr.de>; Thu, 13 Nov 2025 23:28:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1FC03AAD7E
	for <lists+linux-next@lfdr.de>; Thu, 13 Nov 2025 22:28:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C684C322C81;
	Thu, 13 Nov 2025 22:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mVH1fvfA"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D06E8405C;
	Thu, 13 Nov 2025 22:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763072883; cv=none; b=tb5ahBo6jj4knquBPVVpe/KHT8oq5mvwC9o2jCwLjVeUVE8ytPdjUx2Fjn+HVSTiuKM49u30Kjkx9ggMlkUm+iE/6dM7p5TY/AZMO6L4QqshMx2n2UNVwb8Zq214h1CDEGHDfH3UxjdtCUaU+EnhuwzILNFVNzGF84BuUd2O/s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763072883; c=relaxed/simple;
	bh=Tm5Zj0BJqQHgIIjLrYJxR6C5T4FzPjUKm18GW65Ltn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MaRsOneaQUm/iv4I+Q9kTam5O1IGg0AwKc0YNRckuEcahyyPrWWzOPUHp/FCJ+3XfGJNlg57S59wla7G52G9z1ZoDpzrsSl32/vR2M2+49X58yP1sowTyUjvfdaUeZkiUkcL9RxEv+9f2tCEHGJBwfn9Tol+r6Qe5D8wnmjQgqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mVH1fvfA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28C19C4CEFB;
	Thu, 13 Nov 2025 22:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763072883;
	bh=Tm5Zj0BJqQHgIIjLrYJxR6C5T4FzPjUKm18GW65Ltn4=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=mVH1fvfAaoIits5hXMvCUpzQeriHP+AuhRegQM8RSjInvsgQOZ01Dk8QXLTDb1FdP
	 sc3kY2XI5tdwkLRKjwe3X4jV3w/4st+Tg/eUdWehUSEa26/FJnNQqoI/LKhCxdtPk/
	 dI0kiicKsl/UiXy1G290m+79duGaHoIjfULo/9zHtZJmpoi8CTe8GVnO5tVq4+3kga
	 m+WOUdEoDYwB1pu56iKySdmMIxpVp4gRH+PNCuWVR9yWFoCFjR94QAyGicJGreo/eQ
	 PdaR7jL9i3QlBgoQREtGpw7zaACnZnHkexBLJ93CQATqDogHGR00QYeXyVOj5X6vX3
	 gbHbacVsLxzzA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id A77D0CE0DEB; Thu, 13 Nov 2025 14:28:02 -0800 (PST)
Date: Thu, 13 Nov 2025 14:28:02 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the rcu tree
Message-ID: <56daa042-9d2f-483f-9b10-8a26635b17b9@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20251114085932.18e76047@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114085932.18e76047@canb.auug.org.au>

On Fri, Nov 14, 2025 at 08:59:32AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   35587dbc58dd ("tracing: Guard __DECLARE_TRACE() use of __DO_TRACE_CALL() with SRCU-fast")
> 
> is missing a Signed-off-by from its committer.

Plus it needs to be see by git as being authored by Steven Rostedt,
apologies, my mistake.  Forgot that --author command-line argument.  :-/

							Thanx, Paul

