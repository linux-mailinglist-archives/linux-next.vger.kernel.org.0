Return-Path: <linux-next+bounces-1898-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0B68A2514
	for <lists+linux-next@lfdr.de>; Fri, 12 Apr 2024 06:21:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE7E91F21127
	for <lists+linux-next@lfdr.de>; Fri, 12 Apr 2024 04:21:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F366717C96;
	Fri, 12 Apr 2024 04:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U1JLtu0L"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99E317C7F;
	Fri, 12 Apr 2024 04:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712895657; cv=none; b=gCjYZZMWaq1QOdb33DoqllZv+IQzEPvvOvPzZPBJSkeXXdRb+2BxxvdoyU1qhAq6lJps71969iIiwsujrhq+5s6YDZ5rwExGkIFfF0bQCccUNYAGCotLImNIoyU9Xk7/ezooqzqRYRsTiMPKFUuGGgc9C7r126H7Z41sSudxPl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712895657; c=relaxed/simple;
	bh=4SrIX502XMxyy+GgA9ZIIgXzaxQVw425GdHa+f8SS6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=frsAiFJYGp3+LTRrEWc9LDyZ0gLzAG3sfiKLQQYlsjUyLHxNVotTrl0tR5j7ozlxt14WIAqmVVYhGwkvYyqMH8i7egfKPQvEC7zlJE5NV9qP3xHnVhwGKd5pfx/EOvrClmwU8t8pabrD2/y8sgtE4npxswwKNgr0HAMg9zIuF/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U1JLtu0L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 373BDC2BBFC;
	Fri, 12 Apr 2024 04:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712895657;
	bh=4SrIX502XMxyy+GgA9ZIIgXzaxQVw425GdHa+f8SS6Q=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=U1JLtu0LPUF6ukzJvNUUuLMbNhMCG33WtfYaZO052FrFeqwgCC0faJJHssUT9bSPY
	 2JQYq7omg0i3xh5HdXy6I5R2NxpLPBREkUj7b0gCkkkChT0lD2b8wJg5xw+NNI1vA+
	 5QMWeJHoZJrCHjFmpcwTpHenPIUSQYn1LjwNUw2d2ksaTMRnbVpYSzWya/YGUKKkN6
	 lny7EQgsX/ldsXNXtR69PSvRHJaleLJfwM9gLX4Wyf4cqmqlKKk1gPnxnpmI8IITD7
	 1xSrd2D6yZrVGTsri2ogGftKzuI7LjAXmhI3dwM8fuNL7rw0WI5lQuhnhKzqJcUE1d
	 eikYf7+Zpf76A==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id A9E03CE0F69; Thu, 11 Apr 2024 21:20:54 -0700 (PDT)
Date: Thu, 11 Apr 2024 21:20:54 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the rcu tree
Message-ID: <cf23a2b2-4fea-4b4b-9d8c-11cbd7ab9d46@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20240411164655.781a57d3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240411164655.781a57d3@canb.auug.org.au>

On Thu, Apr 11, 2024 at 04:46:55PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> The following commits are also in Linus Torvalds' tree as different
> commits (but the same patches):
> 
>   56544e22cc3a ("fs/proc: remove redundant comments from /proc/bootconfig")
>   e6f3a323fcfa ("fs/proc: Skip bootloader comment if no embedded kernel paramete
> 
> These are commits
> 
>   fbbdc255fbee ("fs/proc: remove redundant comments from /proc/bootconfig")
>   c722cea20878 ("fs/proc: Skip bootloader comment if no embedded kernel parameters")
> 
> in Linus' tree.

Very good!!!  I will remove them from -rcu.

							Thanx, Paul

