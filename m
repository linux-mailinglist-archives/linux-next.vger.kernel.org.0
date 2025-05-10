Return-Path: <linux-next+bounces-6660-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 480ECAB2157
	for <lists+linux-next@lfdr.de>; Sat, 10 May 2025 07:49:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9F7DA0444F
	for <lists+linux-next@lfdr.de>; Sat, 10 May 2025 05:49:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33DA01D435F;
	Sat, 10 May 2025 05:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="LPQAFjKy"
X-Original-To: linux-next@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B841C6FE8;
	Sat, 10 May 2025 05:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746856168; cv=none; b=iRF9WXaoRN/RaLxiXkZQ5VIeM+d5ICaIBIPpt++a8ML0m/Y4ep/9OMPDI4PPNrBt0IaaAUktHlgdu/hH6b1IHGzH8CK+URpGzuKiddjhdZIEl4I9nUPfNF+w/0SusxpzO9s+gpFBDZ/dO+ZrRES/KMJQ69B25uooNr/Ke7m711U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746856168; c=relaxed/simple;
	bh=egYcDK4VvxExZ1yXwO5IpADMHbg4s2onGPsTWzVxahk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VpPjxt2LSVBc3A99bOr9KQaw1qAPAY1QwUT6kP1v6vBS+1/t8JXQxOeAbZIS+c46TGoMXwUoIdGFCY0TbgQ8zUSqVwvqD+ggUbUSlfi7GvuUToZ4iigddBDr+lRzenYxv8OU3JUEi0+Al0JsGR0nHYbViw2uWmnH4ToonXuKPsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=LPQAFjKy; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=RXh0QFVMABOW8IlNIfg12VYz/znZ1YLDkFmTDAQ4dNM=; b=LPQAFjKygEyIyig8xIFhuy9obS
	52c3Q/U7QgoKias8lincusco3CDDbuUY1Eqp9kMpu4+td/th70eOrnhr5efyfkzt80EOay4/GHeP5
	PWuaiSMgv6vJDHCzi7kYRFUyOZGH+7cCqZo0jMRPLNtTd+84oaSGx4n527RgZBsj6FuLgSMqBjolZ
	NytOdJ+eUvpsylAxwoLijqAO5iVy/V2kl8aHx6YyWsuBTl/cWmckLLr2SUioK0LYEY0N7bfST7kTE
	LmXh8WkodE+PAXFEeKo7Xz8P/G5Hn8EcF1ESODdWQGkSKayAadXQXJchjA1aCEhqxsnYyIbok8adS
	btv0exgg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uDd5F-00517o-2e;
	Sat, 10 May 2025 13:49:14 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 10 May 2025 13:49:13 +0800
Date: Sat, 10 May 2025 13:49:13 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
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
Message-ID: <aB7o2SiwNLfBTgQk@gondor.apana.org.au>
References: <aBtF2jVZQwxGiHVk@gondor.apana.org.au>
 <37cf099e-d5c2-40d8-bc31-77e1f9623b1c@linux.ibm.com>
 <aByX_Y64C6lVRR8M@gondor.apana.org.au>
 <f66620e2-77e3-4713-a946-ddb2c8a0bccb@linux.ibm.com>
 <aByiNZNxqyTerdYG@gondor.apana.org.au>
 <1d2c2fdc-5c36-4d4e-8b25-8289b865726d@linux.ibm.com>
 <aB31DI4QBBZuQObQ@gondor.apana.org.au>
 <20250510044450.GA505731@sol>
 <aB7fvi_FBdnmLUON@gondor.apana.org.au>
 <20250510053308.GB505731@sol>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250510053308.GB505731@sol>

On Fri, May 09, 2025 at 10:33:08PM -0700, Eric Biggers wrote:
>
> Yes, the PowerPC Poly1305 code incorrectly uses VSX without first checking
> crypto_simd_usable().  And PowerPC also doesn't support VSX in softirqs, or at
> least it doesn't claim to (it doesn't override may_use_simd(), so it gets the
> default from include/asm-generic/simd.h which returns false in softirq context).
> Maybe add 'depends on BROKEN' to CRYPTO_POLY1305_P10 for now, and give the
> PowerPC folks (Cc'ed) a chance to fix this before removing the code.

I just noticed something weird with this code, running a speed
test using "modprobe tcrypt mode=217" shows that the p10 version
of poly1305 is way slower than the generic:

qemu P9 CPU:

May 10 13:36:46 test-p10 kernel: [   59.585264][  T374] tcrypt: testing speed of multibuffer rfc7539esp(chacha20,poly1305) (rfc7539esp(chacha20-generic,poly1305-generic)) encryption
May 10 13:36:46 test-p10 kernel: [   59.586011][  T374] tcrypt: test 0 (288 bit key, 16 byte blocks): 1 operation in 1374 cycles (16 bytes)
May 10 13:36:46 test-p10 kernel: [   59.587446][  T374] tcrypt: test 1 (288 bit key, 64 byte blocks): 1 operation in 1359 cycles (64 bytes)
May 10 13:36:46 test-p10 kernel: [   59.588025][  T374] tcrypt: test 2 (288 bit key, 256 byte blocks): 1 operation in 1778 cycles (256 bytes)
May 10 13:36:46 test-p10 kernel: [   59.588639][  T374] tcrypt: test 3 (288 bit key, 512 byte blocks): 1 operation in 2323 cycles (512 bytes)
May 10 13:36:46 test-p10 kernel: [   59.589342][  T374] tcrypt: test 4 (288 bit key, 1024 byte blocks): 1 operation in 31624 cycles (1024 bytes)
May 10 13:36:46 test-p10 kernel: [   59.594178][  T374] tcrypt: test 5 (288 bit key, 1420 byte blocks): 1 operation in 4408 cycles (1420 bytes)
May 10 13:36:46 test-p10 kernel: [   59.595317][  T374] tcrypt: test 6 (288 bit key, 4096 byte blocks): 1 operation in 9719 cycles (4096 bytes)
May 10 13:36:46 test-p10 kernel: [   59.597512][  T374] tcrypt: test 7 (288 bit key, 8192 byte blocks): 1 operation in 20168 cycles (8192 bytes)
May 10 13:36:46 test-p10 kernel: [   59.604616][  T374] tcrypt: testing speed of multibuffer rfc7539esp(chacha20,poly1305) (rfc7539esp(chacha20-generic,poly1305-generic)) decryption
May 10 13:36:46 test-p10 kernel: [   59.604916][  T374] tcrypt: test 0 (288 bit key, 16 byte blocks): 1 operation in 1356 cycles (16 bytes)
May 10 13:36:46 test-p10 kernel: [   59.605564][  T374] tcrypt: test 1 (288 bit key, 64 byte blocks): 1 operation in 1393 cycles (64 bytes)
May 10 13:36:46 test-p10 kernel: [   59.608308][  T374] tcrypt: test 2 (288 bit key, 256 byte blocks): 1 operation in 1845 cycles (256 bytes)
May 10 13:36:46 test-p10 kernel: [   59.609002][  T374] tcrypt: test 3 (288 bit key, 512 byte blocks): 1 operation in 2392 cycles (512 bytes)
May 10 13:36:46 test-p10 kernel: [   59.612109][  T374] tcrypt: test 4 (288 bit key, 1024 byte blocks): 1 operation in 3349 cycles (1024 bytes)
May 10 13:36:46 test-p10 kernel: [   59.613289][  T374] tcrypt: test 5 (288 bit key, 1420 byte blocks): 1 operation in 4418 cycles (1420 bytes)
May 10 13:36:46 test-p10 kernel: [   59.616233][  T374] tcrypt: test 6 (288 bit key, 4096 byte blocks): 1 operation in 21600 cycles (4096 bytes)
May 10 13:36:46 test-p10 kernel: [   59.620221][  T374] tcrypt: test 7 (288 bit key, 8192 byte blocks): 1 operation in 20013 cycles (8192 bytes)

qemu P10 CPU:

May 10 13:40:56 test-p10 kernel: [   91.672877][  T392] tcrypt: testing speed of multibuffer rfc7539esp(chacha20,poly1305) (rfc7539esp(chacha20-powerpc,poly1305-generic)) encryption
May 10 13:40:56 test-p10 kernel: [   91.674615][  T392] tcrypt: test 0 (288 bit key, 16 byte blocks): 1 operation in 1471 cycles (16 bytes)
May 10 13:40:56 test-p10 kernel: [   91.680240][  T392] tcrypt: test 1 (288 bit key, 64 byte blocks): 1 operation in 1733 cycles (64 bytes)
May 10 13:40:56 test-p10 kernel: [   91.682975][  T392] tcrypt: test 2 (288 bit key, 256 byte blocks): 1 operation in 3248 cycles (256 bytes)
May 10 13:40:56 test-p10 kernel: [   91.684445][  T392] tcrypt: test 3 (288 bit key, 512 byte blocks): 1 operation in 15211 cycles (512 bytes)
May 10 13:40:56 test-p10 kernel: [   91.687603][  T392] tcrypt: test 4 (288 bit key, 1024 byte blocks): 1 operation in 20500 cycles (1024 bytes)
May 10 13:40:56 test-p10 kernel: [   91.690926][  T392] tcrypt: test 5 (288 bit key, 1420 byte blocks): 1 operation in 10159 cycles (1420 bytes)
May 10 13:40:56 test-p10 kernel: [   91.695009][  T392] tcrypt: test 6 (288 bit key, 4096 byte blocks): 1 operation in 25917 cycles (4096 bytes)
May 10 13:40:56 test-p10 kernel: [   91.701320][  T392] tcrypt: test 7 (288 bit key, 8192 byte blocks): 1 operation in 63352 cycles (8192 bytes)
May 10 13:40:56 test-p10 kernel: [   91.713863][  T392] tcrypt: testing speed of multibuffer rfc7539esp(chacha20,poly1305) (rfc7539esp(chacha20-powerpc,poly1305-generic)) decryption
May 10 13:40:56 test-p10 kernel: [   91.714182][  T392] tcrypt: test 0 (288 bit key, 16 byte blocks): 1 operation in 1502 cycles (16 bytes)
May 10 13:40:56 test-p10 kernel: [   91.714871][  T392] tcrypt: test 1 (288 bit key, 64 byte blocks): 1 operation in 1778 cycles (64 bytes)
May 10 13:40:56 test-p10 kernel: [   91.715508][  T392] tcrypt: test 2 (288 bit key, 256 byte blocks): 1 operation in 3322 cycles (256 bytes)
May 10 13:40:56 test-p10 kernel: [   91.716463][  T392] tcrypt: test 3 (288 bit key, 512 byte blocks): 1 operation in 20980 cycles (512 bytes)
May 10 13:40:56 test-p10 kernel: [   91.720775][  T392] tcrypt: test 4 (288 bit key, 1024 byte blocks): 1 operation in 8000 cycles (1024 bytes)
May 10 13:40:56 test-p10 kernel: [   91.724348][  T392] tcrypt: test 5 (288 bit key, 1420 byte blocks): 1 operation in 10155 cycles (1420 bytes)
May 10 13:40:56 test-p10 kernel: [   91.727952][  T392] tcrypt: test 6 (288 bit key, 4096 byte blocks): 1 operation in 27711 cycles (4096 bytes)
May 10 13:40:56 test-p10 kernel: [   91.735306][  T392] tcrypt: test 7 (288 bit key, 8192 byte blocks): 1 operation in 52874 cycles (8192 bytes)

Did I do something wrong?

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

