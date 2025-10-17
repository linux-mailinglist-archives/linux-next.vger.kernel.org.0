Return-Path: <linux-next+bounces-8611-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA0CBE8D4C
	for <lists+linux-next@lfdr.de>; Fri, 17 Oct 2025 15:26:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFE5B6E309E
	for <lists+linux-next@lfdr.de>; Fri, 17 Oct 2025 13:25:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61C9134F49C;
	Fri, 17 Oct 2025 13:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hl9K3Kdt"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CE434F488;
	Fri, 17 Oct 2025 13:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760707557; cv=none; b=O+QxIMpFptNrNpRxdtQ0HWMcEkon+7y6TSEa1ysaXzE/asO46m1ISqKgesoQRjcPqW4/3dPMY4BD0QQXU8GQYlxj60ViOrFmniFJd2kUe7Uyz6P4yCQxQi8dcxWRVaRevfKj5/rLCshqR2lfLJCmw1NFW1Fx6JFPqV00bnPq8Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760707557; c=relaxed/simple;
	bh=F5AmajmpnPBRBI2uEDOgSmLNwwhZYE0bxvBKjozKgwE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aRgOJktEyxCdpUBidDoSfsSqKFfk4aQ0L9SROAyiSSjZRztAGq8HY6WkJkRCmjctK/yjn9Sg/9VetPymUPnTSOiXFFqnPipz1KTepCuqhVfmOhxGTzECiN0FP5saJvOVayEFGfD5jp1xRC6QXQZx3BeIk5ZcwBkf0txSRMjXOvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hl9K3Kdt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B3C8C4CEE7;
	Fri, 17 Oct 2025 13:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760707556;
	bh=F5AmajmpnPBRBI2uEDOgSmLNwwhZYE0bxvBKjozKgwE=;
	h=Date:From:To:Cc:Subject:From;
	b=Hl9K3KdtekI1aco1QPo8kAuLPbZIdFFDG8YxC+kh3T6JQLBA4cZv3quSRUrBmqdeX
	 1Y37VxeHDI1DzwMnlaPY3Td5m8dm3Tm7KfOwCapuR/44m9vBvpLFYdRzaKCRwZwmjG
	 njpgJuRfZoURt3M3VlMJZ6xjQKfHyYgssdXMcjPzHW5lJ808YH7CAf47kcbRrv5gGG
	 0JMD5EF6KZTPzTQZjGWwBYfqCrjJXXTUciWM6TQrrgLqtifjVqzJszOE8PY9UxjDa+
	 esTQY8Z6b5xtlsjkrSHTOXs5ILCOU/emzBUcVVx77MoprXy5vwGi/LH2yKkNbBn12x
	 0YnpopQs7XMNQ==
Date: Fri, 17 Oct 2025 14:25:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>,
	Wei Yang <richard.weiyang@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	"David S. Miller" <davem@davemloft.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the mm-nonmm-unstable tree
Message-ID: <aPJD4ANRWUDVDqKc@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Xf2lC4zb2Byn2Z3o"
Content-Disposition: inline


--Xf2lC4zb2Byn2Z3o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the mm-nonmm-unstable tree, today's linux-next build
(x86 allmodconfig) failed like this:

In file included from /tmp/next/build/samples/vfs/test-list-all-mounts.c:11:
/tmp/next/build/samples/vfs/../../tools/testing/selftests/pidfd/pidfd.h:28:10: fatal error: kselftest.h: No such file or directory
   28 | #include "kselftest.h"
      |          ^~~~~~~~~~~~~
compilation terminated.
make[5]: *** [/tmp/next/build/scripts/Makefile.userprogs:29: samples/vfs/test-list-all-mounts] Error 1
make[4]: *** [/tmp/next/build/scripts/Makefile.build:556: samples/vfs] Error 2
make[4]: *** Waiting for unfinished jobs....
make[3]: *** [/tmp/next/build/scripts/Makefile.build:556: samples] Error 2
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [/tmp/next/build/Makefile:2010: .] Error 2
make[1]: *** [/tmp/next/build/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2

Caused by commit

  f46a41a153634 (selftests: complete kselftest include centralization)

I have reverted that commit for today.

--Xf2lC4zb2Byn2Z3o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjyQ98ACgkQJNaLcl1U
h9C6Zwf/QuOPchuqdhkVPjYiiukxuoOiLuQl6gntRKtxshrVfFMBROT/9ACQGxol
SI3b6wdPv6fBJdYzumIsc6mD1yE+PbaM+VN+Rv2cWt22GoFS0S7wfRB1vFy5CX+q
jP4hik1r+IAe2Rzug1GL5REierHEFd/c+hhRGm/9kYkesw5LluOzeLMuGQB1ekxn
HVWpQf6JOetR7tajNo0RruCIFrongQGfYHumrufWRbgMBGPGoTf0gmrWhpPAqQNz
EZ3IwFnqcSW632ll4iq70rvrfyWOix8BIwMqMd28feuz/n+a+8o8xLc1ft4p67OK
yf/NoxwwNgcIBqk39RFhPZd1pbQhXQ==
=3g24
-----END PGP SIGNATURE-----

--Xf2lC4zb2Byn2Z3o--

