Return-Path: <linux-next+bounces-7739-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2C2B1473F
	for <lists+linux-next@lfdr.de>; Tue, 29 Jul 2025 06:28:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6864D16D2FA
	for <lists+linux-next@lfdr.de>; Tue, 29 Jul 2025 04:28:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C70CE227B83;
	Tue, 29 Jul 2025 04:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o9JGlKd6"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF042E3708;
	Tue, 29 Jul 2025 04:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753763289; cv=none; b=LcsFd/5ClG2SDdP4SMvLyKIG8tFEGVN73WT4/cOof2BZaturP+nGV//NG7IlWjNvGUMSBpbb45bMyMfQzBIDeVt+ItFDHanHaEzzWf01H0LF/Xr2Ps3lQCpxINXzj6rpKsBetPKMcMzDNI6Yyg43kxYsfpFdxVYJF7prQtbRO7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753763289; c=relaxed/simple;
	bh=2ozTGxu0fPTHFlcMWVB3uzPseyVMI/povk3gNuCyEnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d/A3cJt79rSXSytb3+mqtOf3ASET9zIGX2dk+uS1THI1CnnLpcuhpHjRgnZPUQtZCQSjDJTU0DfKuNsV/jRHqYctNfZhq8j4pUC8ssGsdRWJy79KQmNAxa5STVKn2otyHqCthf5ez/EJC9KZi9g5jkq087sfIcfWp7TjSKL+rv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o9JGlKd6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2781DC4CEF5;
	Tue, 29 Jul 2025 04:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753763289;
	bh=2ozTGxu0fPTHFlcMWVB3uzPseyVMI/povk3gNuCyEnc=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=o9JGlKd6sw09kNcholhe2wvH8GeNtQYvTH7VqzwqQ1MwNLv6vQOUMJlTLMJKzQwZP
	 SUCK78kXxHqg7Qf7mrOjM/nNajFByKP9ZKjMYVzxZ8M9qHP8CkdQWD3Jn0jQfSnzN5
	 65ENnmcWOCNoAE+YHzx+OM1go5vI7fQmJ0TVS1hMsfN8b1uzznhQGE/mhPYlxRkb8O
	 qZJBz4ef0MPPZrkl+fTBGLeFt77+Xrtw8SQXwbhRQ9uVTQlUJPNZxzgACRT8oGPtXj
	 b/tbqryo0jMzgvKzjKwsJFBjZuZTNWfhcr3yeMPAsWR2DirrZRUGLr4tKRib6Ubn6A
	 HyLIzx0sQ/7jg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id BA643CE0F52; Mon, 28 Jul 2025 21:28:08 -0700 (PDT)
Date: Mon, 28 Jul 2025 21:28:08 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>
Subject: Re: linux-next: manual merge of the paulmck tree with the
 mm-nonmm-unstable tree
Message-ID: <e8191e3c-a3cf-4926-95cd-be3e3db4b86c@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20250729104245.6be6957a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729104245.6be6957a@canb.auug.org.au>

On Tue, Jul 29, 2025 at 10:42:45AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the paulmck tree got a conflict in:
> 
>   lib/Kconfig.debug
> 
> between commit:
> 
>   c2d288f7ab13 ("kho: add test for kexec handover")
> 
> from the mm-nonmm-unstable tree and commit:
> 
>   d19e9fa61f60 ("lib: Add trivial kunit test for ratelimit")
> 
> from the paulmck tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thank you, and this looks plausible to me.

There is an extra blank line, but worse things could happen.

							Thanx, Paul

> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc lib/Kconfig.debug
> index 54f11c2713b9,d69d27f80834..000000000000
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@@ -3235,27 -3225,17 +3235,38 @@@ config TEST_OBJPOO
>   
>   	  If unsure, say N.
>   
>  +config TEST_KEXEC_HANDOVER
>  +	bool "Test for Kexec HandOver"
>  +	default n
>  +	depends on KEXEC_HANDOVER
>  +	help
>  +	  This option enables test for Kexec HandOver (KHO).
>  +	  The test consists of two parts: saving kernel data before kexec and
>  +	  restoring the data after kexec and verifying that it was properly
>  +	  handed over. This test module creates and saves data on the boot of
>  +	  the first kernel and restores and verifies the data on the boot of
>  +	  kexec'ed kernel.
>  +
>  +	  For detailed documentation about KHO, see Documentation/core-api/kho.
>  +
>  +	  To run the test run:
>  +
>  +	  tools/testing/selftests/kho/vmtest.sh -h
>  +
>  +	  If unsure, say N.
>  +
>  +
> + config RATELIMIT_KUNIT_TEST
> + 	tristate "KUnit Test for correctness and stress of ratelimit" if !KUNIT_ALL_TESTS
> + 	depends on KUNIT
> + 	default KUNIT_ALL_TESTS
> + 	help
> + 	  This builds the "test_ratelimit" module that should be used
> + 	  for correctness verification and concurrent testings of rate
> + 	  limiting.
> + 
> + 	  If unsure, say N.
> + 
>   config INT_POW_KUNIT_TEST
>   	tristate "Integer exponentiation (int_pow) test" if !KUNIT_ALL_TESTS
>   	depends on KUNIT



