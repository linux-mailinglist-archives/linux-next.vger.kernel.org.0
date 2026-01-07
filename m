Return-Path: <linux-next+bounces-9565-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C257CFBA3A
	for <lists+linux-next@lfdr.de>; Wed, 07 Jan 2026 02:57:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 23ECC3047DB1
	for <lists+linux-next@lfdr.de>; Wed,  7 Jan 2026 01:57:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A0C6230D35;
	Wed,  7 Jan 2026 01:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="TSunKLhc"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9EC22F74A;
	Wed,  7 Jan 2026 01:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767751037; cv=none; b=dOaY5brmuJAeNMAoo2Dz+J0ij0USdEZxI8XwqUZjOizE8l+IDti687agLeQ9UQAY+f3BLcfK687H7OGmKlpndx4I+pB2R5A/yC8NBrZgW7zDmi/NWWnkCpzNXG8HJsPyUpdCplyyh4E1HIowEkjnWZZfeyFsBNp17/lrOApae4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767751037; c=relaxed/simple;
	bh=h9yHAbZX6YnKh2XHgbzLO8GvcR58P9Y5IWt25L3jA+8=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=twSGRkBJQs4n8iXZbW9WmP1CeaZaOi/MLxeqktCcaP7dwFKNdKSZ/uA2IdkY6WYgfvJelj+EFqQ4s9rPCsstO9otRPchc4l8WJN2HSfmDQcKVMfh7Gu/8rR6VQwa0nyMWsUP4OaE2/tdNpT2uYP2Uh0WSA744gYPlC9FpFfEbV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=TSunKLhc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9DD2C116C6;
	Wed,  7 Jan 2026 01:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1767751037;
	bh=h9yHAbZX6YnKh2XHgbzLO8GvcR58P9Y5IWt25L3jA+8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=TSunKLhc0t7ksAWAnUJ4X/wE40uz1SjuUNbFNx/YHyrh0NHF6Pm4BdFVIIcNCP7Uk
	 KbPdYNYIuiNWS7QInLnuuFyqqZHMxy6y+c+SvLDA9vQ52G47/AY4+quFKcv8boRI4o
	 +0TppFevmwCMbeMPlgDkFhB39xL8OLpzwXe2ohoo=
Date: Tue, 6 Jan 2026 17:57:16 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the arm64 tree
Message-Id: <20260106175716.f09a1af6cf6df934e5ef62b7@linux-foundation.org>
In-Reply-To: <20260107124037.1f78c38c@canb.auug.org.au>
References: <20260107124037.1f78c38c@canb.auug.org.au>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 7 Jan 2026 12:40:37 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> The following commits are also in the mm-nonmm-unstable tree as different
> commits (but the same patches):
> 
>   98cc091262ef ("arm64: Avoid memcpy() for syscall_get_arguments()")
>   35c3dcb1ac2c ("syscall.h: Remove unused SYSCALL_MAX_ARGS")
> 
> These are commits
> 
>   f43c18b3062b ("arm64: avoid memcpy() for syscall_get_arguments()")
>   99630b951468 ("syscall.h: remove unused SYSCALL_MAX_ARGS")
> 
> in the mm-nonmm-unstable tree.

Great, thanks, I dropped the mm.git copies.

