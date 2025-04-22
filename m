Return-Path: <linux-next+bounces-6299-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D39F2A959FC
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 02:01:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17BC816A1D6
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 00:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5A703B19A;
	Tue, 22 Apr 2025 00:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="izI04REa"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A446D347A2;
	Tue, 22 Apr 2025 00:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745280058; cv=none; b=ptAtP0dsSSwRd7tkzVLX7n2Lnp/7isOqK/6s2SQYuKAqmeW7ylvYsnGbPGaMozHy+WauLkHz/lJOGnJfZOd5FfHo/pxbHZMjl1KpTG6o3i7g2lmfDvbL7B5OCN/4yFRtERtlwD3+6lgdnWX7NxEVvNNiGsZwwBPs6GXML648QPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745280058; c=relaxed/simple;
	bh=dQRfdMdpYDoH5m1hGaQwHNqUp+FGk/i2v2KCsCYnXAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h56AdHaaKdM8TesuR84Sh9qxlD5ylHHnHiyWTgSQypfWZK95RT7XseArMJtL5nBijqLIZcYHLCA9SstR7FFm5EKbKeDxY00ovE5XgfEGlBkU48Icom5x2URcMtt4lz8l9mw60jer/R3Sj84CgXIOd6lPD4bV8s2DRRMIODBL/MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=izI04REa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 190A8C4CEE4;
	Tue, 22 Apr 2025 00:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745280058;
	bh=dQRfdMdpYDoH5m1hGaQwHNqUp+FGk/i2v2KCsCYnXAs=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=izI04REaNlAAZYlbA0EvTmOfBQiapMhFR5RK+q2P9iQ5e970cczitv5hV/4VQyc6k
	 1LJ7t+U56fTFHT9PlJ8AhVaL+/kD+LUYvU9EYyHSslPg6akupI0YRRWIZtID0UXvZx
	 pwNesC54/Pqb+ujG67X6Dd5VTQEtWngTo4U6k/cAUg78oLz4MhZtS3JI9kNy9xelvU
	 9rnf4dWLE8TXgJMfoWb0YXih8xYMszDhXLlLJsN0KSzx0jQvfz4VL9fpXEmXZO38wh
	 ORyxkneHv71qyNqzQktP4G2VA2zfhdDIQDZYmb4rZF7FKOztr1IgjHYLjB+W+DGCVg
	 q9/ac91n1a/ZQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id A69DCCE0855; Mon, 21 Apr 2025 17:00:57 -0700 (PDT)
Date: Mon, 21 Apr 2025 17:00:57 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Petr Mladek <pmladek@suse.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the paulmck tree
Message-ID: <ef907eca-3a04-461a-9c75-404d65dbaf2b@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20250422093834.57e9e9d0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422093834.57e9e9d0@canb.auug.org.au>

On Tue, Apr 22, 2025 at 09:38:34AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   9e13e90127fb ("ratelimit: Reduce ___ratelimit() false-positive rate limiting")
> 
> is missing a Signed-off-by from its author.

Ah, good catch!  I need to chase down that author!

Petr, you good with this one?

							Thanx, Paul

