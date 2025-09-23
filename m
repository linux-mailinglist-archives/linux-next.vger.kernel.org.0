Return-Path: <linux-next+bounces-8451-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0E4B96B47
	for <lists+linux-next@lfdr.de>; Tue, 23 Sep 2025 18:03:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DAECB7B277D
	for <lists+linux-next@lfdr.de>; Tue, 23 Sep 2025 16:01:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72806258EC1;
	Tue, 23 Sep 2025 16:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="po6v0PYT"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB25257842;
	Tue, 23 Sep 2025 16:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758643327; cv=none; b=Z96HUY+Jsv8OyZWEZh+xMm4xIs3rJIDtSZyuwfK9zFg3fB03RKhgNfN9rlru4JOb7cHl+dEAuNIFjz+f0t32C8sgLS2xBFrblhWppTdm46wmfAJ1jkIXp56R10ZVbMEwuFTTgGUTIN41jMJB9VBGA47SLxJMgUm7VO70qxywF/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758643327; c=relaxed/simple;
	bh=w0sVCvXy0DDxPUCrOxSax2pR5zUr1+hiRARBZzFwmO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UHSBvtEl+VvV542i+GMaCBQ49qlRMBew/eGtw24BGhh2jvWL0nvrxIwS4vtobQK5967H5ejGfbM6xBsfSCbJsvcziC3vQWCJqs7kqMFO5MP67kL6qoV7f2o1lzZHim6XB2FCWHqiffPcgHbEQ4ydI16vy/SOQx4xIgIJsKHXh4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=po6v0PYT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 709CBC4CEF5;
	Tue, 23 Sep 2025 16:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758643326;
	bh=w0sVCvXy0DDxPUCrOxSax2pR5zUr1+hiRARBZzFwmO4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=po6v0PYTNN03cibWv36snKQGThZVMgKxWiU/U//Ow67+F3ka6OHH6z7PhJ949THnt
	 KRX10/YmjQXNjEQgKa5QizwWGulPJHcjtE2L3FgapOPopCkitL1WeHqzrhMZRNYf3r
	 uG0m72lvfuqFZVHwQwZV0fE6z1zqVw4FE1G8tSYDHuffIEFQvIV80zYJHQ0JwYl1y9
	 yz3wdWTa400kY0vWHeJg9jkOkLDz6r4I7T7zk+I+7W6eUXeYxl/OKcS640uGa7SR9P
	 u2efT+br3WY0SCcQ/clJVXYCOg2d7TyKWdm33o2dohf9mOEsNwIVdHWTA73H1ZfuXg
	 v/8bBSbY/B+4A==
Date: Tue, 23 Sep 2025 17:02:02 +0100
From: Will Deacon <will@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <maz@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the kvm-arm tree
Message-ID: <aNLEem8ryBiqKfDr@willie-the-truck>
References: <aNK8hSSKKZhEHZbt@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aNK8hSSKKZhEHZbt@finisterre.sirena.org.uk>

On Tue, Sep 23, 2025 at 05:28:05PM +0200, Mark Brown wrote:
> After merging the kvm-arm tree, today's linux-next build (arm64
> defconfig) failed like this:
> 
> In file included from <command-line>:
> /tmp/next/build/arch/arm64/kvm/at.c: In function 'setup_s1_walk':
> /tmp/next/build/arch/arm64/kvm/at.c:229:30: error: 'TCR_SH1_MASK' undeclared (first use in this function); did you mean 'TCR_SH0_MASK'?
>   229 |                    FIELD_GET(TCR_SH1_MASK, tcr) :
>       |                              ^~~~~~~~~~~~

[...]

> Caused by commit
> 
>    4f91624778b27 ("arm64/sysreg: Replace TCR_EL1 field macros")
> 
> from the arm64 tree.  I have reverted that commit.

Thanks, I'll drop it from arm64 as well.

Will

