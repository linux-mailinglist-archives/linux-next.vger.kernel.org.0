Return-Path: <linux-next+bounces-9338-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5357ACA59FB
	for <lists+linux-next@lfdr.de>; Thu, 04 Dec 2025 23:24:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DFFE030BC953
	for <lists+linux-next@lfdr.de>; Thu,  4 Dec 2025 22:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBFD0286415;
	Thu,  4 Dec 2025 22:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="gXveCHbC"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DE725EFAE;
	Thu,  4 Dec 2025 22:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764887072; cv=none; b=McEVBHZeRmLs55NeC8i4oUZCQ3RkQJv+42CPf3slt6uc+af1unHhVDSqVMHRHyHrXBcUcQ+zDWEmfaCaNK1U9TNiykAbhbSKb/8eB7gYuIsPrqM/YElBeQeext7Plhr/xVy57rFpm845zihOFE4PnFXgdu2HmdvPAn8dEFPgMsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764887072; c=relaxed/simple;
	bh=/M+erx4l+a14U0IxB3d5yyoSWReHsgaYBHNF8aBqrlM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=TvYbi4WdplchreuOfPK+kdomRtRlVMVCVwLr0WN6NwkcfS8KBLwcToRP86w8kp88RHrlUKw3evNWrZwU3/GQBWp5gP0yi++ffY7QN9rm0p3RBnfDT/SBzpUdbGw/90BkKW/lLGUL0asjIAENS5x3BoYlLvet+Fv0MLBfM8joT0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=gXveCHbC; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764887069;
	bh=XC9T2v6AKs1HezBZdoByQ7n7LnII1ZhAk0fMvsE+xu8=;
	h=Date:From:To:Cc:Subject:From;
	b=gXveCHbCXFYIT6oOhym0Ti8oke9tJer5kOjUhY51YB3V8LTiyLt6VdHBcGeVDkjjV
	 2rOJt1xFrJsB5mMrk7jkpqkdPkmPGyPe3Mt3jMuJG+DIt4Ssk5kEsguYmvA62oXV9q
	 A647U8ub5R75n8nRC3DXS2esA0k8NxhUh/UZdCKMCnSlZmOA9vwjcNEsDsctXfuFky
	 wf9Q4ke1H6GcJ0JDYPjvkZq6BHiTcDH/Du1LPlKXUkYE59sb24MfVJG1cEEi5nZOnz
	 rCcaroPwP9Gc+pkWrQy3pWgD7wzIkk5ePsxXikkSp3PREjUglQ/LjIi7pgVuOEef7X
	 nH7tqhG9/zMVQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dMpvx0HZFz4w9T;
	Fri, 05 Dec 2025 09:24:29 +1100 (AEDT)
Date: Fri, 5 Dec 2025 09:24:28 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>, Namhyung Kim
 <namhyung@kernel.org>
Cc: Ian Rogers <irogers@google.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the perf tree
Message-ID: <20251205092428.3e2b94e3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CcAauM_3yvxv3o/mEJgLOrD";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/CcAauM_3yvxv3o/mEJgLOrD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  6528cdd61590 ("perf tests stat: Add test for error for an offline CPU")

is missing a Signed-off-by from its author and committer.

I presume the original patch was truncated somehow.

--=20
Cheers,
Stephen Rothwell

--Sig_/CcAauM_3yvxv3o/mEJgLOrD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkyChwACgkQAVBC80lX
0Gxzzgf/dGuSKHGwthMeSjTa58VKK0eeeD4x9C5nWpkCJc5PN00GJsTAVesCmabt
tVO20Hz+Kx1Z8Ww4+ErkP7YOsSs1gUj5lsKdmYAQiWfkfCQhGmk3zIRU7U2b/5e9
v1r+176BT098+eVLmRZ1V43ryQYQw+tQ87yk5wQflC6XvZZSAQTGR8244B4xxN8z
sexaXE+9tGkZuBu+N5rcUkOd/Kfc30Xhgamq6//WDeKF2hNchURiMwPuMnv6ZzEc
y/d498v8CEk2rRxocKyzQQObpVivESlifPuBU58QL7hmuYxDFnRLLh7m1ujw+pJI
nTeDGgB/iHW7eD2Q5JCEF2JLYorcqg==
=lway
-----END PGP SIGNATURE-----

--Sig_/CcAauM_3yvxv3o/mEJgLOrD--

