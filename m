Return-Path: <linux-next+bounces-6579-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E87AAE781
	for <lists+linux-next@lfdr.de>; Wed,  7 May 2025 19:13:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 721D59C6DCC
	for <lists+linux-next@lfdr.de>; Wed,  7 May 2025 17:13:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EE7728C2CB;
	Wed,  7 May 2025 17:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kEujl9TV"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545A71A0BF1;
	Wed,  7 May 2025 17:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746638026; cv=none; b=Yf5h+qpkXdkT+58AqylGrlsJw0LTUroFv78oxPNXDEhp0ciGmQxOnsm7lSUIWV69sgz7qutg2+1eoczXWlNDjW3MkZzItsyWqqpSj9rHcC8ELF9tBGKfEEZTiw06yH/Cj0vCUo6dNL5NNB6qqGnoFpB6SwJb9vjcMhwsWfk2vsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746638026; c=relaxed/simple;
	bh=PmE5AMWayhcd+e54onh5bX8GqZApiSRs1f3o3moTGPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CCZdlpZ04FAoc8qRzP8tiCzu7dDap82qyORUEN4EBlkjL3BI+h24DsaVg/8MBoE/StpoNTSB3pwmYIa/qrg865PPzuSvRneGY6h+urUWUNvbrALKD5qVuPuJW5cftRWYrt4Is9ByP6sKoRalosE4OZ1YHnqVDMOCmSRlV+W+qKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kEujl9TV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75484C4CEE2;
	Wed,  7 May 2025 17:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746638025;
	bh=PmE5AMWayhcd+e54onh5bX8GqZApiSRs1f3o3moTGPc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kEujl9TVEBQDx+MuY1AJNXxri6mnV2fYcT60715clOBJaWQfCh+DzuWmGVKzBXe37
	 RM89XVjYUo9Fx0AuyeKEekx/jVESLEHPY/Xf7oKAe5hCI+bBzhDU11R3Wwj9mkbmwI
	 Ot/gf2J0geVXdc6UNy7jTN2NJihrLn/k130KUHiuLL6up9SbmjWpcr9FJk1/MvFLZM
	 kvjOH/h2r1DCC2qrKkYndauzzceZR6dAXvOGup/9mc8PhP6b/HgKBKGY6HCVdB1jsT
	 FWGJ6KMAbw8pgQT4yPXWaX1TNinw97P/bm8diyw+ZHu3F5y/m3jwD9U/oz59IM5o0P
	 rTw1F1g0jfwTQ==
Date: Wed, 7 May 2025 10:13:41 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, oe-kbuild-all@lists.linux.dev,
	Ard Biesheuvel <ardb@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	kernel test robot <lkp@intel.com>
Subject: Re: [ebiggers:sha256-lib-v4 4/13] /tmp/ccoCWqTC.s: Error: local
 label `"3" (instance number 1 of a fb label)' is not defined
Message-ID: <20250507171341.GA181648@sol>
References: <202505071811.yYpLUbav-lkp@intel.com>
 <fe4c8f86-17d9-4e00-96e9-9f24c22c58a2@leemhuis.info>
 <c4a017e9-0169-4f7a-99a1-7ae1bbee4a19@leemhuis.info>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4a017e9-0169-4f7a-99a1-7ae1bbee4a19@leemhuis.info>

On Wed, May 07, 2025 at 12:56:22PM +0200, Thorsten Leemhuis wrote:
> [+linux-crypto and +Herbert Xu, who committed that change that showed up
> in -next today; sorry for forgetting this earlier]
> 
> On 07.05.25 12:50, Thorsten Leemhuis wrote:
> > On 07.05.25 12:25, kernel test robot wrote:
> >> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git sha256-lib-v4
> >> head:   849682242c36727c23430b6cfed12e4422313931
> >> commit: 9f2dd94847c914bb716be744e12cb02f175638db [4/13] crypto: arm64/sha256 - implement library instead of shash
> >> config: arm64-randconfig-003-20250429 (https://download.01.org/0day-ci/archive/20250507/202505071811.yYpLUbav-lkp@intel.com/config)
> >> compiler: aarch64-linux-gcc (GCC) 9.5.0
> >> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071811.yYpLUbav-lkp@intel.com/reproduce)
> >>
> >> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> >> the same patch/commit), kindly add following tags
> >> | Reported-by: kernel test robot <lkp@intel.com>
> >> | Closes: https://lore.kernel.org/oe-kbuild-all/202505071811.yYpLUbav-lkp@intel.com/
> >>
> >> All errors (new ones prefixed by >>):
> >>
> >>    /tmp/ccoCWqTC.s: Assembler messages:
> >>>> /tmp/ccoCWqTC.s: Error: local label `"3" (instance number 1 of a fb label)' is not defined
> > 
> > I ran into the same problem today when building -next rpms for arm64
> > Fedora using the approach and configuration used to build the kernel
> > rpms shipped in Fedora rawhide.
> > 
> > Full build log:
> > 
> > https://download.copr.fedorainfracloud.org/results/@kernel-vanilla/next/fedora-rawhide-aarch64/09006679-next-next-all/builder-live.log.gz
> > 
> > Ciao, Thorsten

Thanks.  https://lore.kernel.org/r/20250507170901.151548-1-ebiggers@kernel.org
fixes this.  This was specific to CONFIG_PREEMPT_VOLUNTARY=y, which I've now
added to the lists of configs I test...

- Eric

