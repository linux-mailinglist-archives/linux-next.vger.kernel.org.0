Return-Path: <linux-next+bounces-4911-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EB79E8A52
	for <lists+linux-next@lfdr.de>; Mon,  9 Dec 2024 05:30:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D76FD280EAC
	for <lists+linux-next@lfdr.de>; Mon,  9 Dec 2024 04:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00F4A155CA5;
	Mon,  9 Dec 2024 04:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ULtNbjCi"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9FF076410;
	Mon,  9 Dec 2024 04:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733718645; cv=none; b=rJBnhHAtkPkzsK9gOmvpi6pNzi8F7xlBs7vaaTGAarr9kIb83G/6y35/p078nhetj5NgRnhL3/8HekAtssX4ie6bmklu7sD3VvZhZqVDXvfoAqVGfnGn0k7kfdNSeVJRYM23vHhF3Q4EWZIjID2nMJTghv1Ezm8WVMz3IzL7H3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733718645; c=relaxed/simple;
	bh=w17zw5ZLDMdxgc6WMJOJ+6mykRiO6FXCrR1RNJFHXro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vDidXOqhBknHCyQGScsJDEz3Vp8tUPKw7c8+xN2bPQKDF7HRoOBqnQ+mOdXI0khL+ev4QigVi5R2GsimWhUesI7GGpAzlheFJTP6YMM0d1pOe9IJp8Mu4bXBUgoSaWy/8dYU25CXXPfnTbcDU0fL8OgQA0h8kSIIFo8XXtoSrNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ULtNbjCi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38426C4CED1;
	Mon,  9 Dec 2024 04:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733718645;
	bh=w17zw5ZLDMdxgc6WMJOJ+6mykRiO6FXCrR1RNJFHXro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ULtNbjCi7ViFQ+DYgJEVhazQDZrwqfuuqYqSKk6DmDlliK09QPMebY3pvXcDdarSo
	 tLPMIR9AHGk7u79WjuLa1SPG2VZNX+KKLDJv6MjeMFRyKFez3Zcnnbr7264P134KDi
	 7n1taEK5gTe0W3uXHp3Mwn+oFgwxbmbB32UEYF6oLBlPU5wdw1TS+qiFB+GvAzcD2c
	 fwDYBwoYc4USOyuLW8XFBjVH3Es/25DN7I1YGJpUm27420UOFPp7tYeMaMPkLEsq+o
	 DTyF9W8TquNNEu3dwEacWZfm25Kjph1f5uS9zqoGaWPhxKxbqtnWbOcNOSq2OjdyGZ
	 33XFwTqFlzEEQ==
Date: Sun, 8 Dec 2024 20:30:43 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Kent Overstreet <kent.overstreet@linux.dev>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the crc tree
Message-ID: <20241209043043.GA320952@sol.localdomain>
References: <20241209145714.1619f9d2@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209145714.1619f9d2@canb.auug.org.au>

On Mon, Dec 09, 2024 at 02:57:14PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in the bcachefs tree as a different commit
> (but the same patch):
> 
>   cc354fa7f016 ("bcachefs: Explicitly select CRYPTO from BCACHEFS_FS")
> 
> This is commit
> 
>   4fa882d383cc ("bcachefs: Explicitly select CRYPTO from BCACHEFS_FS")
> 
> in the bcachefs tree.
> 

Thanks.  Kent, this is a prerequisite for one of my patches targeting 6.14, so
I'd like to carry it in my tree if you don't mind.  Thanks,

- Eric

