Return-Path: <linux-next+bounces-6662-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA406AB2168
	for <lists+linux-next@lfdr.de>; Sat, 10 May 2025 08:02:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93B02A04EE7
	for <lists+linux-next@lfdr.de>; Sat, 10 May 2025 06:02:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CAB51A38F9;
	Sat, 10 May 2025 06:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NV/viZqF"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC492A1BB;
	Sat, 10 May 2025 06:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746856946; cv=none; b=VyiUl1Fez+4KcP5LMZxrBZqLOgGwaX+n0dsNJLTE7pQ9zxi+mnRNgnKU+5sAPeUVBGRZG/oj4BlZ8RWCbHDLhFckq3kIgaISbVN5R6nRBjvZX1hwImkeCTOezII1YQ60+hI5xmYlCx4PdDpKJAumgcD1d9S6sx7WSszLxgmAUzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746856946; c=relaxed/simple;
	bh=JlSsQetcX37kb+C7A/7Zl2d7NI2PP1OhBJ4yWdB2dq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VpDEL2DqoBL6fWnm2MKmtkkVqif+jlFePROreyy/Z6VQrRUOHQ+cJ7FKQmeWsk2+8wZPlCfonCJdHvrbKl5DYiaJqhYAWTwpO7j49LVK+ZxwsUTB2Fy2EF0FU/LoFhCWRbLojis7NlDbg0sZdIsvvOxlY31Tmb9qwhyvTuqFuSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NV/viZqF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 597E0C4CEE2;
	Sat, 10 May 2025 06:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746856945;
	bh=JlSsQetcX37kb+C7A/7Zl2d7NI2PP1OhBJ4yWdB2dq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NV/viZqFlgmeYeOd+a37GQMGj2Wdbb597buCO2CHtoo5e9okzB+Nv34A5uSb9yT7U
	 T0U8EAQfSlJcGSLoQOiuuV37BPT2TZRRLYdrZg+Bf1h7FYKPqevWoI2XGpD7ZFv4Y1
	 ji3riEIa4f44hkK9/0xN6sFKUXg5wiWnmmFl9xRPL/L7AtODj4a9jdbpPx1Gq9lCsD
	 3NmTdIov3AhWHgJXT9gSdmYwd8K0vCiZ1fGQSnLiBRc1cFDJzHiEKcW4xcfQR011fO
	 rKOMjmaAad2EKQDQN4zhH6H5qvV8zabd6dfFzqfBG7IPuskgqzzU9ah2fg91EEzKSy
	 /t2IFMZsxRXRA==
Date: Fri, 9 May 2025 23:02:19 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Danny Tsen <dtsen@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [v2 PATCH] crypto: powerpc/poly1305 - Add poly1305_emit_arch
 wrapper
Message-ID: <20250510060219.GC505731@sol>
References: <aByX_Y64C6lVRR8M@gondor.apana.org.au>
 <f66620e2-77e3-4713-a946-ddb2c8a0bccb@linux.ibm.com>
 <aByiNZNxqyTerdYG@gondor.apana.org.au>
 <1d2c2fdc-5c36-4d4e-8b25-8289b865726d@linux.ibm.com>
 <aB31DI4QBBZuQObQ@gondor.apana.org.au>
 <20250510044450.GA505731@sol>
 <aB7fvi_FBdnmLUON@gondor.apana.org.au>
 <20250510053308.GB505731@sol>
 <aB7o2SiwNLfBTgQk@gondor.apana.org.au>
 <aB7pCuT2wfEe_xby@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aB7pCuT2wfEe_xby@gondor.apana.org.au>

On Sat, May 10, 2025 at 01:50:02PM +0800, Herbert Xu wrote:
> On Sat, May 10, 2025 at 01:49:13PM +0800, Herbert Xu wrote:
> >
> > Did I do something wrong?
> 
> OK perhaps it's just that the qemu emulation being slow.

Yes, non-native QEMU usually isn't any good for benchmarking the
architecture-optimized code, due to the instructions it uses having to be
emulated.  Just to give another random example, in (non-native) QEMU the RISC-V
CRC code is much slower than the generic CRC code.  But when run on an actual
RISC-V processor it's much faster.

- Eric

