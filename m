Return-Path: <linux-next+bounces-6242-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4E5A89292
	for <lists+linux-next@lfdr.de>; Tue, 15 Apr 2025 05:35:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BAA4175552
	for <lists+linux-next@lfdr.de>; Tue, 15 Apr 2025 03:35:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4DEB2163B9;
	Tue, 15 Apr 2025 03:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="VxHEaHJn"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA8F8460;
	Tue, 15 Apr 2025 03:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744688128; cv=none; b=F+9QGEAi04kZGN17gOxWxgnO3sfqWFeCfKBcwdJ0vDcZ8ifANoSo0l4HJ1bkyLQBOwJzxajFoZkhe4UIJ8eJAQ13Y83LRKsCPvl9DWgelVMoA6cUEzsRcxpNXs0zQn+VYIQ7cawSNvCBdasa9hO2Jan4QFlsuvzz4vXSGW3rxW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744688128; c=relaxed/simple;
	bh=rS1xIEqZiprr7MmvqMcRQf9Fqwve12yo2C37rcMBfdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=B9n5XPxk5qxzSGAw9j1YYk/Yc4/Ry8LbvBBOqA70fV2kDt9jEEjteFGopsu0lSkij1Wan3VTmiwiqeb823milBI5ywDjn5PEvSTXl0r3ifq79uR3V43LgEdiYCaalunLLqenqwa/Tu85rBFjBvo/iKbtFAd07Lp8Xa3U48zqldg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=VxHEaHJn; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1744688120;
	bh=8vi4vgdSRJfJO/CaqWhgLQTeETdRh/cQnZ9cDp6bWXw=;
	h=Date:From:To:Cc:Subject:From;
	b=VxHEaHJnvaA3pkBquYxWV9zzFBhUw9gII8gBQJEq/+z97MhAd8joDQMo00P1Q9bjP
	 LNjrSCIbPRyC8bHV5jyvcgBe5N7e4g3L/PoYsNbDwtYu7hdzbwau6KMp6QyH4PqA0b
	 Bhi0rDyIUHvyoluCFl6eWNo0mQsHpruampkenXZK9TSND08OJZYvWqC0iEOx6/XzqH
	 Wc1eoiIWnfBDOeZbNd9iJgvfl73JnP0k9DZJgIYWeWq+ZwdmnBap2Blqi6PQnvUN8n
	 aVvvu/X4atwgr9ZmOmM0TlzOgBGNF4sZS4cc+W/GjTOcGfQtblbykGdUWftYSijQTh
	 O1H43jO5BAR+w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zc8tb6L9Gz4wy6;
	Tue, 15 Apr 2025 13:35:19 +1000 (AEST)
Date: Tue, 15 Apr 2025 13:35:18 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the tip tree
Message-ID: <20250415133518.2c8d4325@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LMS94S4B4M9ULS=xh1N7B68";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/LMS94S4B4M9ULS=xh1N7B68
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (native perf)
failed like this:

diff: tools/arch/x86/include/asm/amd/ibs.h: No such file or directory
In file included from util/amd-sample-raw.c:12:
tools/include/../../arch/x86/include/asm/amd/ibs.h:10:10: fatal error: asm/=
msr-index.h: No such file or directory
   10 | #include <asm/msr-index.h>
      |          ^~~~~~~~~~~~~~~~~
compilation terminated.

Maybe caused by commit

  3846389c03a8 ("x86/platform/amd: Move the <asm/amd-ibs.h> header to <asm/=
amd/ibs.h>")
or associated commits?

This a native ppc build of perf.

I have used the tip tree from next-20250414 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/LMS94S4B4M9ULS=xh1N7B68
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmf90/YACgkQAVBC80lX
0GwyCgf/YMYuultE1nuuBDMehCvq8yS7dPUAeIy8MfBADgHkeorGbID/voz/96kq
4S/egEKPo8BB1EaZ493B65l8grUoYeXTT/cr56FqpPnZv+q2eCg3PPv/O8LyPNsC
yaCxAH/PGth5nlLFSeZIWEonjULOmNFAvb5BZl+xSZANHrCy7mqiRV+M0iJe+oer
W91cLWHjTcme522TGQqLSIGTDLRB31J9e3+xuJFVCPe/EVGoZ6GDa/vqpiPHiBeg
KCXdFC2NzRCqllG+7XJu0u1dXgXZO66dNmCnUtQ6VxtN5ZCpLbCGDxcKOmIqHEpX
Jbd7QzgnY5fTbFc5Qn7tT0+zXr724A==
=JKd9
-----END PGP SIGNATURE-----

--Sig_/LMS94S4B4M9ULS=xh1N7B68--

