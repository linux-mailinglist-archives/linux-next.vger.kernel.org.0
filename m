Return-Path: <linux-next+bounces-8498-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E6112BA0ECC
	for <lists+linux-next@lfdr.de>; Thu, 25 Sep 2025 19:39:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A05C43AE79F
	for <lists+linux-next@lfdr.de>; Thu, 25 Sep 2025 17:39:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3599F302150;
	Thu, 25 Sep 2025 17:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="APkvGxvA"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB3627FB35;
	Thu, 25 Sep 2025 17:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758821994; cv=none; b=ojncwI56Y1PcdnFjrKsPDNEnqzoX8Tu2+t3042Za1QICrunBh87bunByVjTZFqbmAfLsUg0uCTx06bOPMhAgwlQUZ7mGX+/hYJJ89tUzvWbIQ9dEOgjwTq0Jg/p1k/9K9+rtH5uE3C2ELRbp9sWYwce1eBQSVYK6NqUkt/Uo6Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758821994; c=relaxed/simple;
	bh=3y9u8nIalasBRWSOH1au4kb2W+k7XBRecWocQUU3wBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qVp9Jq9HxsofeEHauY2BDrq8W/cgnokOQGg+mxs8L48RHrzy41DasckpX+XMFUT24VHec6gWvES2EfiD3QoHEeGeyJE3Ti1nhNt0q3LOirx3AdlHPcBKT2k4EfyaFZIy2+mLRlWhujVj47I7vOlatwxnbNktlSIGdwDt2bH4grc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=APkvGxvA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D052C4CEF0;
	Thu, 25 Sep 2025 17:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758821993;
	bh=3y9u8nIalasBRWSOH1au4kb2W+k7XBRecWocQUU3wBA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=APkvGxvAYFyEKsvw9qfwlJVGvtVPsL0Nqmlon1db2oAOzy521Diog12LtPVNjGoOE
	 XtcbLW/0xifUCFDZ/ILXVgPDGJaFWjfar+7zYZQds2pSL3+VT0ae8feqpGBdbU7G9j
	 CIie1q+5ZV+8fjlLq6f/w3vcOlGLh/yrOaf4egQUnxrS9PqnLA8Hr3FHd+u6/5XOc0
	 MhE4iBFHvoP/J10G0E6PysirYrrJpQxPKkC5vTHXCkgF4aTL16R85zLdKFJ7eesFDS
	 JOew3hgNWYze0LF6XzCDUbgE0/0IC86CYXiGNg9OXQCPBSeIXc4NigIz/hXciikocI
	 j1aPlsD9eHBbg==
Date: Thu, 25 Sep 2025 13:39:49 -0400
From: Nathan Chancellor <nathan@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the arm64 tree with the kbuild tree
Message-ID: <20250925173949.GA489036@ax162>
References: <aNU-sG84vqPj7p7G@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aNU-sG84vqPj7p7G@sirena.org.uk>

On Thu, Sep 25, 2025 at 02:08:00PM +0100, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the arm64 tree got a conflict in:
> 
>   arch/arm64/Kconfig
> 
> between commit:
> 
>   23cb0514208da ("arm64: Remove tautological LLVM Kconfig conditions")
> 
> from the kbuild tree and commit:
> 
>   1cf89b6bf660c ("arm64: Kconfig: Make CPU_BIG_ENDIAN depend on BROKEN")
> 
> from the arm64 tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> diff --cc arch/arm64/Kconfig
> index 56eec3586ff77,69bde40e19e23..0000000000000
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@@ -1492,6 -1494,8 +1494,7 @@@ choic
>   
>   config CPU_BIG_ENDIAN
>   	bool "Build big-endian kernel"
>  -	# https://github.com/llvm/llvm-project/commit/1379b150991f70a5782e9a143c2ba5308da1161c
>  -	depends on (AS_IS_GNU || AS_VERSION >= 150000) && BROKEN
> ++	depends on BROKEN
>   	help
>   	  Say Y if you plan on running a kernel with a big-endian userspace.
>   

Thanks for the heads up, this looks correct to me.

Cheers,
Nathan

