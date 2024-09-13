Return-Path: <linux-next+bounces-3807-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D4221977718
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 04:53:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 895EF1F24D45
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 02:53:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 694E31AD261;
	Fri, 13 Sep 2024 02:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="AP4LpKdw"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E674C1B12D9;
	Fri, 13 Sep 2024 02:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726196003; cv=none; b=CnSTv5S8WDEt4E7Bsroj6dL/t0lipweJRQrajBDbzZlZdl3UkS8d/lBWqDZEfAH0kJEeJZWDpiA0xqtL+8vbb7YWD7/UFvGR90ffCrHuKU0/jQH94csGxT7UqccfF9oqPz05aB15GAg7C+r5lesqq9iCOYNPBD851ZazsDXBgJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726196003; c=relaxed/simple;
	bh=ZIlINa9SOcG4MZbF2agB6DqMpgcQjHz1P9Psf1kMAL4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=S5mVQB+vNxGNKPIS8yXqGmsSCNJSg9jSoywiz1utzB0nT7XfEkoy0Fdn9bxWIPnOYAKcivpPT405CqWvzFvVbQzoA2hI63bfeS/1S0JnGruj1yWab75fILRwQopCdSkyft7nwZ8aWtSrwYMaCYgYzPERC2GhMeSflZlVIGV4w6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=AP4LpKdw; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726195984;
	bh=CiX1cP/h4LBinaVFlkyPk0SGyPohni48VATOBNpIUB0=;
	h=Date:From:To:Cc:Subject:From;
	b=AP4LpKdwxchk4hTiaWkz4x7kS1ZnGs1yxpIImgBOTGoX4TL6gU+vbO9OvlPr1pLfT
	 zmIMAk6xxo/0GrxAraeN/Aaj1bbCkrJyv1elE3f0xgi6puKJgyUnYOLbcOYxuR9/30
	 /ZS7sNLsXSr3FbaR+3wHLdanvoW81XDH0ZppFf/17WHCLS2jUvzZisSJobiLY8NUFw
	 VM+FBLGz7NmHlIX8HefDDAC/ScxXyHrSCeFkflWFdXh9LyEXkkpFwK5vMw2EM6EZhE
	 o3uPVHzY7YosATxdHFne4KpZiCayEbpYiM0DmVcJV9KWj8hOHfArY8JAS6QJy4sFIr
	 IV2iWtWuMyllg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X4f4c4Vjgz4xDQ;
	Fri, 13 Sep 2024 12:53:03 +1000 (AEST)
Date: Fri, 13 Sep 2024 12:53:02 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: Mina Almasry <almasrymina@google.com>, Networking
 <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the net-next tree
Message-ID: <20240913125302.0a06b4c7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Vpa9wRsCwpPBJxbJ8odCzmv";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Vpa9wRsCwpPBJxbJ8odCzmv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the net-next tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

/home/sfr/next/tmp/ccuSzwiR.s: Assembler messages:
/home/sfr/next/tmp/ccuSzwiR.s:2579: Error: operand out of domain (39 is not=
 a multiple of 4)
make[5]: *** [/home/sfr/next/next/scripts/Makefile.build:229: net/core/page=
_pool.o] Error 1

I am not sure which commit caused this, but reverting commit

  e331673ad68e ("Merge branch 'device-memory-tcp'")

(using "git revert -m 1") allows the build to work.

--=20
Cheers,
Stephen Rothwell

--Sig_/Vpa9wRsCwpPBJxbJ8odCzmv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbjqQ4ACgkQAVBC80lX
0Gxa+wf/b9gvh/nx7o4EaTV7mIk80ekUhQ3kkqdYULX7JuqXQrZzPloSraPl6VA/
ZAMEmlTobCzBe9WmaJIYruRr2EKuyGYjmqDzTLr3I1vWoJq81dma5zUrkIg/SS6M
o8UTmK/Y+KWdQjOY3Cl81YFiXR6CX5VHbTzGHkgiGjkkX65paHdcYKSUtFZ6qgEO
vYfNV3gwMzPAcbECVRTq1vJzOYRy9KMmd66msA95EnRiq8GL5RQf92m/JsQ1AbKv
BJtebRtOxt6mHwzDCqFfrqMlRE1jc3WRx3SE9fEPyjsvBybWeVo83Db1xKJJn1wJ
9Qaym53i1WJt9uxp0e7QsD/iGXQ6rA==
=KV3g
-----END PGP SIGNATURE-----

--Sig_/Vpa9wRsCwpPBJxbJ8odCzmv--

