Return-Path: <linux-next+bounces-4287-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A696799FD4A
	for <lists+linux-next@lfdr.de>; Wed, 16 Oct 2024 02:40:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B6642827D8
	for <lists+linux-next@lfdr.de>; Wed, 16 Oct 2024 00:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3261B10A0E;
	Wed, 16 Oct 2024 00:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="NjN+wfnH"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195D31078B;
	Wed, 16 Oct 2024 00:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729039218; cv=none; b=NJpUO3B450xCxEhKUQxSXOfvHFYcyNTl2cfDHgKn6SqAlTtY6QRvxlYPElp9wxmqTvqWjDh2oW51In4ES/Q0IhfuUf66dGRioMnS0C68ZB0gJFOBodBMpSMFI/7Bpxj7nFd5cYcfaqEtNUNF3trh5HQEdiRCI14QJIHSXJeY7/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729039218; c=relaxed/simple;
	bh=GLVruwFWVTz0wRTmofVnvzSyIYOMa12IIPY2nPPvGd0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=eDXZQi00h4Nax07uXJqsyPbz4VveljwX9kPxTJkAgF2RTzzmhZjaG3NKYgg+s5hSKAh2ifz5CcQ7BWOHHK1ytk1bEk9eqxDOsbmhvS+J7xXUTcy0YxrMxCC4cIYVMbIS2v9YiXVDal20auV/owcbL9gv9HxaZ1YJ9lwDaqTT/zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=NjN+wfnH; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1729039213;
	bh=m3SSqPNg5cdqB/jyc2ZUh+Kf6hcOrHPzq39ybdyldqo=;
	h=Date:From:To:Cc:Subject:From;
	b=NjN+wfnHB/pO56FfiLN9Dvx5Jkk8Qtkbj8btGPmLoYzz5h8+0KzxHocXufbfAjah9
	 EYYoTEPkyIRksnUEr0nP2AqiQPsVe16pCp4j7v6ZHYzhzyls4xwSvpTMcpX9PEEFug
	 myneeY7I7pEfeo2MS9g0JTjZyCjI9HwAsKqt6/387W2tUKjND+ohqcYUf67UBlppmY
	 jkusQpRWsvY+qeMIKN1wqznmic1dOJ0al3vFpR+iroGhBw2YnTHdwL8hYD5iX+rEq0
	 EjFep4TyXTUYbpC9aBXYIPTnI9JpwgcO2Z5xUlCVsM1xqO2iR3FFPPfoTNer4c32Zj
	 ewI67x11sZvfw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XSsZ51VTPz4wcy;
	Wed, 16 Oct 2024 11:40:13 +1100 (AEDT)
Date: Wed, 16 Oct 2024 11:40:13 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the v4l-dvb tree
Message-ID: <20241016114013.37522900@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vwuH3yolwJUuz/z/08lPuld";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/vwuH3yolwJUuz/z/08lPuld
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the mm tree as a different commit (but
the same patch):

  c5120f3b20a1 ("MAINTAINERS: mailmap: update Alexey Klimov's email address=
")

This is commit

  d6f369d3d989 ("MAINTAINERS: mailmap: update Alexey Klimov's email address=
")

in the mm-unstable branch of the mm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/vwuH3yolwJUuz/z/08lPuld
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcPC20ACgkQAVBC80lX
0GyvOAf+Nn5ihH4EYZs/ShV5VmE6QRO9OmNnQe3YyQnY+J+usuoFsGvJyvgfE6O1
dYX/ntwtDjVAZqlXNC76dA/qzA8pj0DB2qqPa0tshv4hrwwoVZnvYGtPTvZiwuMz
lAwX0N21l42eYIeE01u7GNA5jl0P2o7olaWU132GNLOj41m66kvwyAyykgqV4U3z
7/V0e2FOjbPD4akenMy6AY7hK47zbpRMW0C2PJiGaa8WW4fr6DJ3P+YgoVy4NTGR
qFAvi63qJEHQMgdPkiEZUSP6YB91Xx1Nsn5OD/H6ZfpLp3U+bMiiZ2ZBiNTJ59R4
zPC8geKs7koHZOiDlVvFEn6TFJ8E+g==
=kgbl
-----END PGP SIGNATURE-----

--Sig_/vwuH3yolwJUuz/z/08lPuld--

