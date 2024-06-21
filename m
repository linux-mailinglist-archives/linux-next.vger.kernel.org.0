Return-Path: <linux-next+bounces-2625-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C77912A7B
	for <lists+linux-next@lfdr.de>; Fri, 21 Jun 2024 17:40:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 536EE1F22ABF
	for <lists+linux-next@lfdr.de>; Fri, 21 Jun 2024 15:40:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8010186ADC;
	Fri, 21 Jun 2024 15:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WLQmNHKS"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B2084FBA;
	Fri, 21 Jun 2024 15:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718984432; cv=none; b=BoEDDMHaUwq7NYzcBGePUQ7VJCezawKHm6znlJF6qsQ0b99Wx2hhVvuaGwtylUWEHXH8r6OdRVhXkOrAH3pKrdWJhbjrSXQjIY1GdsM0GsiIDhL6zsB7LZaLVYUzW0E/1AjnjxWN5byaGJoWmcV5VM72oz9amZrQ3DZW0y9805g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718984432; c=relaxed/simple;
	bh=OxLZ01Q4rKpn9nahG7smR9yP/lKHOyiMDvY7tTjmwjE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u1sJcx/GzxT/fx/nlKKXCFPy8FWuxYfEs1ihCEWjgDyS1Yizg5XlQcWLGm3x7e+QTQecScjiCr1oJk7RKkIJ9QrgLNJlYHxO4AbS9KhRC8dsmUoCRDQorlP+HfsxYGA33bT0TRbLa52Jq68/OOZ11b8tfcVj7vinpXaFYH+l7zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WLQmNHKS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49AC7C2BBFC;
	Fri, 21 Jun 2024 15:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718984430;
	bh=OxLZ01Q4rKpn9nahG7smR9yP/lKHOyiMDvY7tTjmwjE=;
	h=Date:From:To:Cc:Subject:From;
	b=WLQmNHKSQzDP5ozjFKrGiG8rLbc6gUqk4duBlW2+em9kbgUpVfi2bDI5pJ3j8OqnR
	 0GXG2inZ3nA1eqNmkwYCY3ojYQUpKOqPQmNdng3cx54tcG4e5QGFT429K+UD0fmvUh
	 8sIIJJKjBwFDdMXAcu2T5vTrXurs9vICFGHpUqUU2ZEmhu7uQuQpX3Uqc/QBAR4MBM
	 df75fF3zeAlOfs9K0Yj+Cht4+mFutvTRooHMUeIOowsZmh5y1KpMcA9y3xk0RNkkqZ
	 mhpja+8FFBlE/trTCMsH1+4/X3Wj6xYSdK55UJCMZkznkCngDH5fK2VQ805dE1tCNM
	 0EMd5N2+skzKQ==
Date: Fri, 21 Jun 2024 16:40:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Jens Axboe <axboe@kernel.dk>,
	Himanshu Madhani <himanshu.madhani@oracle.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	John Garry <john.g.garry@oracle.com>,
	Keith Busch <kbusch@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the block tree
Message-ID: <ZnWe6sXMxm4RXBcM@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c8bBl3qlcgbS79K7"
Content-Disposition: inline


--c8bBl3qlcgbS79K7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the block tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

In file included from /tmp/next/build/include/linux/printk.h:10,
                 from /tmp/next/build/include/linux/kernel.h:31,
                 from /tmp/next/build/block/blk-settings.c:5:
/tmp/next/build/block/blk-settings.c: In function 'blk_validate_atomic_write_limits':
/tmp/next/build/include/asm-generic/div64.h:222:35: warning: comparison of distinct pointer types lacks a cast
  222 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
      |                                   ^~
/tmp/next/build/include/linux/once_lite.h:28:41: note: in definition of macro 'DO_ONCE_LITE_IF'
   28 |                 bool __ret_do_once = !!(condition);                     \
      |                                         ^~~~~~~~~
/tmp/next/build/block/blk-settings.c:200:21: note: in expansion of macro 'WARN_ON_ONCE'
  200 |                 if (WARN_ON_ONCE(do_div(chunk_sectors, boundary_sectors)))
      |                     ^~~~~~~~~~~~
/tmp/next/build/block/blk-settings.c:200:34: note: in expansion of macro 'do_div'
  200 |                 if (WARN_ON_ONCE(do_div(chunk_sectors, boundary_sectors)))
      |                                  ^~~~~~
/tmp/next/build/include/asm-generic/div64.h:234:32: warning: right shift count >= width of type [-Wshift-count-overflow]
  234 |         } else if (likely(((n) >> 32) == 0)) {          \
      |                                ^~
/tmp/next/build/include/linux/once_lite.h:28:41: note: in definition of macro 'DO_ONCE_LITE_IF'
   28 |                 bool __ret_do_once = !!(condition);                     \
      |                                         ^~~~~~~~~
/tmp/next/build/block/blk-settings.c:200:21: note: in expansion of macro 'WARN_ON_ONCE'
  200 |                 if (WARN_ON_ONCE(do_div(chunk_sectors, boundary_sectors)))
      |                     ^~~~~~~~~~~~
/tmp/next/build/include/asm-generic/div64.h:234:20: note: in expansion of macro 'likely'
  234 |         } else if (likely(((n) >> 32) == 0)) {          \
      |                    ^~~~~~
/tmp/next/build/block/blk-settings.c:200:34: note: in expansion of macro 'do_div'
  200 |                 if (WARN_ON_ONCE(do_div(chunk_sectors, boundary_sectors)))
      |                                  ^~~~~~
/tmp/next/build/include/asm-generic/div64.h:238:36: error: passing argument 1 of '__div64_32' from incompatible pointer type [-Werror=incompatible-pointer-types]
  238 |                 __rem = __div64_32(&(n), __base);       \
      |                                    ^~~~
      |                                    |
      |                                    unsigned int *
/tmp/next/build/include/linux/once_lite.h:28:41: note: in definition of macro 'DO_ONCE_LITE_IF'
   28 |                 bool __ret_do_once = !!(condition);                     \
      |                                         ^~~~~~~~~
/tmp/next/build/block/blk-settings.c:200:21: note: in expansion of macro 'WARN_ON_ONCE'
  200 |                 if (WARN_ON_ONCE(do_div(chunk_sectors, boundary_sectors)))
      |                     ^~~~~~~~~~~~
/tmp/next/build/block/blk-settings.c:200:34: note: in expansion of macro 'do_div'
  200 |                 if (WARN_ON_ONCE(do_div(chunk_sectors, boundary_sectors)))
      |                                  ^~~~~~
In file included from /tmp/next/build/include/linux/math.h:6,
                 from /tmp/next/build/include/linux/kernel.h:27,
                 from /tmp/next/build/block/blk-settings.c:5:
/tmp/next/build/arch/arm/include/asm/div64.h:24:45: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'unsigned int *'
   24 | static inline uint32_t __div64_32(uint64_t *n, uint32_t base)
      |                                   ~~~~~~~~~~^
cc1: some warnings being treated as errors


Caused by commit

  9da3d1e912f ("block: Add core atomic write support")

I have used the version from yesterday instead.

--c8bBl3qlcgbS79K7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ1nukACgkQJNaLcl1U
h9BLSQf9FYDRLLA4CfM/8znj9w9t2q4Kyqpw0aX14AwxNfZavIf1KFL4G8gJEMvC
u1vv1c0r6Vnv0bQZ55lUUBhDjFRqAXo/DOCdTPGJWTZt/i7Ob2oTuXLBgC5SQNgp
SJWo8K0UFPwnPfv5Ol6gBvzD84ePWr8bgxwfCBJr5sVoViCplAaM2lc0+u3pYcvr
Jo1e6woYRk/zmjPysgeC7CaYZ+hjJ6LIyVpnpBklC1YPAVm0O1m6Ac7XOdDCj2lJ
N0SzHUKAMWUuG2w3gP/Rv9bHHloHmz6audDNMF4v78Tm/7F5ENzey292q+NAKdCS
LFb2KpN9utEIcccZlmqyw+LyDjezxQ==
=wob+
-----END PGP SIGNATURE-----

--c8bBl3qlcgbS79K7--

