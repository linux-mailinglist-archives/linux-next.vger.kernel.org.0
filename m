Return-Path: <linux-next+bounces-3196-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B59944513
	for <lists+linux-next@lfdr.de>; Thu,  1 Aug 2024 09:01:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 142781C21FBC
	for <lists+linux-next@lfdr.de>; Thu,  1 Aug 2024 07:01:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2D25157493;
	Thu,  1 Aug 2024 07:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ngpAelec"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7964013C8EE;
	Thu,  1 Aug 2024 07:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722495697; cv=none; b=Xq9wGCYy9UzCnQ/c4alsVRopKhLlJu8PREYUew0eReEp1ZZRw4AmR39PGbTRrVW4PXu15+wHtqrB/Au2BG5EFvFlIgQEFVnghmhWyq9YHd+i9/BrXzhjFhgvWe01bP/cDw/Gb7l2z1jwpTX4mPdPPalaNY2C1/JAnR6Qy9pcsj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722495697; c=relaxed/simple;
	bh=t4oe1h6ARIYukz5ntLHOvl/6PsViw30vLhpK32B46Sw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UBLTc5HwiGuxPtAPgU23QDoV6wkOq8rZtd1MYIGuIQUmfdqyNYTgEs0uQ8HB7ncsWgIjWgAlYmWsdKnGBu8lurmve7nqJWneuip5omgfjwIisONvjOmlWXH3dY7ZHIInCcDuhebli1+BaMfqawsYC80yipafbBRykpOWbNw1BVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ngpAelec; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C443EC4AF0A;
	Thu,  1 Aug 2024 07:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722495697;
	bh=t4oe1h6ARIYukz5ntLHOvl/6PsViw30vLhpK32B46Sw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ngpAelecGTRu+p1gSUC1asbffv6PcZ8FaX1TOegLWic0/I8CdZBxLovwySoeoATjk
	 tauJutQYnJY5ZiGHJvdDQ9y/RhxVz1+Ba7LVUfUO+17vMd3X+MJWPjZlNBj9wbnA9m
	 Nvah9q2Ij/28SytVso36s41KmbpVxq7hXlh8kJ4IUPR6EJVHXH0vK1LS5tOkftkrUb
	 HRMtq9OlZiFdInIU9JZVM1i9NYr24anSU8ycCJlL0E0bMp4/TGZlKP1AcZwYwdNAle
	 Jw8MoG3S/8YWkG1ieHCnxWQUl/OvSkChU60SnIXWJr3DPUynMSFUmJdptv956Yx27i
	 GSRjGTRLZNSYQ==
Date: Thu, 1 Aug 2024 09:01:32 +0200
From: Christian Brauner <brauner@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the vfs-brauner
 tree
Message-ID: <20240801-annullieren-kaufkraft-d10108e91017@brauner>
References: <20240801080554.6b9bffb5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240801080554.6b9bffb5@canb.auug.org.au>

On Thu, Aug 01, 2024 at 08:05:54AM GMT, Stephen Rothwell wrote:
> Hi all,
> 
> Commits
> 
>   9861c8945bc7 ("qnx6: Convert directory handling to use kmap_local")
>   2d6834a509de ("ufs: Convert ufs_check_page() to ufs_check_folio()")
> 
> are missing a Signed-off-by from their author and committer.

I already fixed that but didn't push out a new tree yet because my test
machine wasn't available.

