Return-Path: <linux-next+bounces-6733-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 782BEAB4EF4
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 11:14:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1946819E497B
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 09:14:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8009C21420F;
	Tue, 13 May 2025 09:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tGE2CZ0J"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A03213E8E;
	Tue, 13 May 2025 09:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747127644; cv=none; b=TWcUAfyKMXMK7OwV0e8my5FTMOaPvJGLQPjwz7YvrcKwWBNHrpPgZCDUd4Gcs9smBvkeumrGP8QF8V/QAijm2gh40YMnzuhn+ujmw9BdsZ5D9PP7AnwoHW5qrJ5fH4MCet6oU1SKVfy6guC4UoDlPTrRPT/hpzlpvRFX8EMJb4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747127644; c=relaxed/simple;
	bh=4i/eB7zIrwsbVxlRpErlZcw/+Pc6eLHJZ4Oleg7Ad3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rsMigaoxPnGYFKShQeRx9YdQy+zXwbYnw62sxqEuGr8UWKyMEicQjE1Vyzr6U3rIWQZYfTMiHy3tTUUIJ3O0/IjCjCcqx+3bZTB/Sy6llYlOE3nM2bIfuIEpVIecExeKYkSpgzOxdC3ncLmdnVrCWcIk7pCAFoEB990Y7qkhGZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tGE2CZ0J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E13AEC4CEED;
	Tue, 13 May 2025 09:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747127643;
	bh=4i/eB7zIrwsbVxlRpErlZcw/+Pc6eLHJZ4Oleg7Ad3Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tGE2CZ0J/B22aEHl1gKMgZJXNDMrnRjN0ykzNjnHP5MteTUNkNc+rnInCtaKK4Cv4
	 WJ8W54eM+OQfPx8jemc2eieiYmaLtd8iVha3eqYyMX2Kdurs6zAnOj5KU+ybSee9uF
	 BqbTb+HMSmyiQvcB1HlSgdnecWjF3d+4fcXIP49wi/wwFDpFcKCTsmF/fapZnSxBtK
	 Gu1MiuNqvM5dE7QcBpsNpe02vEYBQG11dDPwkZAXeWTdiqtaVCullW1a80dvvr8fQ8
	 xe5g2iRA+fhiXKTHw5TYEnE68VzD8uNSERiyhmyW6AS0CFm+DYZHSuE3vsDALhtU/H
	 vav3hQncNFEfw==
Date: Tue, 13 May 2025 11:13:59 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Subject: Re: linux-next: manual merge of the tip tree with Linus' tree
Message-ID: <aCMNVzmguCy-_bMT@gmail.com>
References: <20250513165439.762fd52f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513165439.762fd52f@canb.auug.org.au>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the tip tree got a conflict in:
> 
>   include/linux/cpu.h
> 
> between commit:
> 
>   f4818881c47f ("x86/its: Enable Indirect Target Selection mitigation")
> 
> from Linus' tree and commit:
> 
>   4e2c719782a8 ("x86/cpu: Help users notice when running old Intel microcode")
> 
> from the tip tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

LGTM.

Note that I have resolved all conflicts in -tip as well, so these 
manual -next conflict resolutions between -tip and -linus should go 
away after today's -next integration.

Thanks,

	Ingo

