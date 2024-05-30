Return-Path: <linux-next+bounces-2423-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E028D51B8
	for <lists+linux-next@lfdr.de>; Thu, 30 May 2024 20:23:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DFCDEB216BC
	for <lists+linux-next@lfdr.de>; Thu, 30 May 2024 18:23:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3FC14CE04;
	Thu, 30 May 2024 18:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MQFwHd9n"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE4F45BE7;
	Thu, 30 May 2024 18:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717093405; cv=none; b=VL7zGP/odIfJrMhFcuJMPNIFjAql+eLfrw8SYnMy6lo0AP+IfEJEtgl+80qvLFYnpY/smd2jsiN0nW9l1x6eVGjL4lOFqJH/B+qqlqfMCgVj8vm8OZujeNqpoOivmJJo795AYZtMqMY7rw/h/M+UHsiWTEMAzVKuKlaU48/TaN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717093405; c=relaxed/simple;
	bh=UFD4h93+j16vWqtu35EKx3VSnv6aiNL7yfTJXeQSQM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U65zIROFSfPiYZnkocVHfO2KwW5zwCLxlEjJEoHpzr0veON43pCQSaNkJDjp48SSBRr1idVvx6UpAyUnVff4EQ4y02jdEkgsgGQqfKjx9gVt1D/umsuoyDbbf4bnAQXVP6xOm6KMuvuFoPecRoasWnNGvIl6F51YBZvAox2mg2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MQFwHd9n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CC1BC32781;
	Thu, 30 May 2024 18:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717093405;
	bh=UFD4h93+j16vWqtu35EKx3VSnv6aiNL7yfTJXeQSQM8=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=MQFwHd9ndaJYZq5AsMeFhLirahmWH/J+FAO6wdmu/D8w5NMLFiRn5M09+JEEa1lXj
	 GjYF+/vj2Z0BBG9aRu6IWwOF/AJLFwMK2GmJMdCitFhN1ie06Ol+pDJY/wr5NnTuq3
	 1eU9OKG0LWXSylqtE2OYvvpGve7bswz/1jeAjcdBmKSUHXLu5u7WuTgSGw+IIxiM28
	 Z7nF0n6umkQHfGa4MlyfEi8WN07v7QucYhBxKqFmtOY6R9GNmTJPyjDKhC6R+cImjp
	 zWGutLSLn9/uq5qEIZSHK5g0db5ceRgw8rwarWT/5LvI8YgiPJcUjZJ5m2bXw7/bNj
	 NFONAHfzzd8jA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 7CD02CE075F; Thu, 30 May 2024 11:23:24 -0700 (PDT)
Date: Thu, 30 May 2024 11:23:24 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the rcu tree
Message-ID: <f4304c77-7b1e-49d3-8a32-70f40f2d068d@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20240529081011.6f8c3366@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240529081011.6f8c3366@canb.auug.org.au>

On Wed, May 29, 2024 at 08:10:11AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   6bfd01c430b9 ("rcu/nocb: Don't use smp_processor_id() in preemptible code")
> 
> Fixes tag
> 
>   Fixes: 8feeeba60711 ("rcu/nocb: Use kthread parking instead of ad-hoc implementation")
> 
> has these problem(s):
> 
>   - Target SHA1 does not exist
> 
> Maybe you meant
> 
> Fixes: a1ae3280882c ("rcu/nocb: Use kthread parking instead of ad-hoc implementation")

Thank you for catching this, and will fix in a few days.

							Thanx, Paul

