Return-Path: <linux-next+bounces-4321-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F929A2449
	for <lists+linux-next@lfdr.de>; Thu, 17 Oct 2024 15:52:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 08411B264A8
	for <lists+linux-next@lfdr.de>; Thu, 17 Oct 2024 13:52:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC6AA1DD556;
	Thu, 17 Oct 2024 13:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eYY+eFBu"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5743C147;
	Thu, 17 Oct 2024 13:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729173157; cv=none; b=Od0slvHclXV/q4joHy5w1CAPrBPJqBYtZYjgsE5Q3sHVcBn0MANqdmbqMfnkjzGG+uk1QSUwysq8FwIQq5ZYsag23Vb6Zxc2q1bbpTVMF9yNlm2vXZqAuw4APUBE626HKv+4PODn+/r0pNDGTnv6+EuT1WeuiJJX+TdchDtyESY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729173157; c=relaxed/simple;
	bh=Rzcol+zyCGVlvHsBgpSwKn04w8oJMo/344Wfw4R5Vjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bDWdVwjEKf1QxVNWqXXNgVyKD5Vj7kJXfUnKFIJTOckKEplD56hUrlNNVPxupzhnwz5lNILi1gKz7m3yHYGrYYtDqBN/MtoYMUU3D0v3qgMN3qpxNSVBSFrlhu47RLq1RAE3zREDWcSCFPXpHm4kuchUOpJ2YEk9Z8bC3rUgUU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eYY+eFBu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CAE5C4CEC3;
	Thu, 17 Oct 2024 13:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729173157;
	bh=Rzcol+zyCGVlvHsBgpSwKn04w8oJMo/344Wfw4R5Vjg=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=eYY+eFBuzoLsOQaqKw2kQNIxtJLYkTilOyUli0IIbIfdxTYwt4k3m5VhMQImrsA38
	 Ycnk5dnGZhd974kMeJESTNmt3t7eWmeD2aj63JrEQCLvQ5SFDm7k5BIm+54OQqeYHz
	 A4P+AvJDQ2JW7EkTGwzLnoqE0VdldhkEfR3gUbUwxlH4cANlhHP6v07niRq/Hy8/cQ
	 MYxAuvEknNtuXVf4YkWogYAWkY+0Mew0cLz7lGYmXor/A02o//DrqI0CORMMoWA6XH
	 TJ71/YW7goqhQGKqZ6vv4M36UpkIDIf0b+1Z8iwGpioRyLYjopO7T/MY9LoUe6XRvA
	 WXQAFCbFhkslg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id DE4AECE08E8; Thu, 17 Oct 2024 06:52:36 -0700 (PDT)
Date: Thu, 17 Oct 2024 06:52:36 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Vineet Gupta <vgupta@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the paulmck tree
Message-ID: <74a77d99-808d-4265-9456-2c3d0e67d465@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20241017182326.12d8a854@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241017182326.12d8a854@canb.auug.org.au>

On Thu, Oct 17, 2024 at 06:23:26PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in the arc-current tree as a different commit
> (but the same patch):
> 
>   8b5e6986360f ("ARC: Use __force to suppress per-CPU cmpxchg complaints")
> 
> This is commit
> 
>   bb5d272ed94d ("ARC: build: Use __force to suppress per-CPU cmpxchg warnings")
> 
> in the arc-current tree.

Excellent news, thank you!  I will remove mine from -rcu.

							Thanx, Paul

