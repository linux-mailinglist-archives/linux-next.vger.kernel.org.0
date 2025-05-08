Return-Path: <linux-next+bounces-6616-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BD313AB0079
	for <lists+linux-next@lfdr.de>; Thu,  8 May 2025 18:30:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1EE651C01FE3
	for <lists+linux-next@lfdr.de>; Thu,  8 May 2025 16:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77EAD2857DA;
	Thu,  8 May 2025 16:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HGBaQZLA"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9512857CF;
	Thu,  8 May 2025 16:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746721799; cv=none; b=SABQEaC/rU2x8oHx4jlLkKGSuZUdyCLCjawdHJSlTHKfl7We/kx5ADhVb4iwR57BI2UJOJIsVVfA/5tE92ptOlOLI4kc8J1o3xDE8HC8fxGrLypKzKQ3EGEiQR0Aa3tQtDM5Jx9qYtB95mgc2nsdvs96Vux5RdCFKKpfCrsIPlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746721799; c=relaxed/simple;
	bh=1vpCh9ihCg/WzOyCbdfoGaYNCHPuP39TPqvdSshMM7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iNr2EwJ7YKfHBMd4G+iUa5P1vdnIQ3qztkz3XBXGrzzcDCGo9KG2NkOflIM4gqiuYqbWe3C0pfCku+PL5CmXRAb0MuC/FuTA+0nNEIWb9NYBNAoYgcEDp/DbAPsuuu1C8vxmwF4/L+99+o7fCYgkqMQe31Lz9Z7yaDDz9ORUWqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HGBaQZLA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC1C4C4CEF0;
	Thu,  8 May 2025 16:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746721799;
	bh=1vpCh9ihCg/WzOyCbdfoGaYNCHPuP39TPqvdSshMM7U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HGBaQZLAfsRJtEufa/W5rNxQ8tIrC32dooxk2WcCjtFCT4kBac14S8h2jmvEbgJJA
	 WyQ1gJIz5L/9+l3KhH2/eSuRcrejQHCuetj7NkdmIWwurbq30u/B/TJkLws6HWM2Wy
	 yjdNgDppOkY/TPburBW68+WYCgSeNoXMr9GmE1N4+73bLr4khrox2QpQYi+NFImiIJ
	 5IfyqAlHTqdV/VNrFxF4DI7ICoPU1/a8PIhkEZXsHZ+WPRPveX/JKqeXM0uV7KN4eL
	 VFpyO4V14hGZrjXCwwgLiLkn10xvqcDKWYbd032SsWInUmH8LwepCGqg45Fd6/JrsB
	 2op/8bWGkg/YQ==
Date: Thu, 8 May 2025 09:29:54 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Danny Tsen <dtsen@linux.ibm.com>
Subject: Re: [PATCH] crypto: powerpc/poly1305 - Add missing poly1305_emit_arch
Message-ID: <20250508162954.GB1218@sol>
References: <cover.1745815528.git.herbert@gondor.apana.org.au>
 <915c874caf5451d560bf26ff59f58177aa8b7c17.1745815528.git.herbert@gondor.apana.org.au>
 <242ebbf1-4ef0-41c3-83cb-a055c262ba4a@leemhuis.info>
 <aBtF2jVZQwxGiHVk@gondor.apana.org.au>
 <37cf099e-d5c2-40d8-bc31-77e1f9623b1c@linux.ibm.com>
 <aBx9OAyiDx7MYAVs@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBx9OAyiDx7MYAVs@gondor.apana.org.au>

On Thu, May 08, 2025 at 05:45:28PM +0800, Herbert Xu wrote:
> On Thu, May 08, 2025 at 02:46:06PM +0530, Venkat Rao Bagalkote wrote:
> >
> > I tested this patch by applying on next-20250507, though it fixes the build
> > issue, it has introduced a boot warning.
> 
> Looking at the history of this code it was never used as lib/crypto
> prior to commit 378a337ab40f88d63ba71d68ff578ead7f5ac8f1.  So either
> this code simply doesn't work as lib/crypto for some reason, or my
> subsequent blockhash change broke it.
> 
> Could you please revert back to commit 378a337ab40f and see if the
> lib/crypto chacha20poly1305 self-test passes with that?
> 

My patchsets "Remove per-architecture poly1305 shash glue code" and
"Finish disentangling ChaCha, Poly1305, and BLAKE2s from CRYPTO", which included
commit 378a337ab40f, passed testing with qemu-system-ppc64 with -M pseries and
-cpu in [POWER7, POWER8, POWER9, Power10].  These issues, both the build failure
and test failure, were introduced by your patchset
"crypto: lib - Add partial block helper".

- Eric

