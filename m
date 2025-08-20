Return-Path: <linux-next+bounces-8044-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44314B2E7C1
	for <lists+linux-next@lfdr.de>; Wed, 20 Aug 2025 23:53:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EAFCB169921
	for <lists+linux-next@lfdr.de>; Wed, 20 Aug 2025 21:53:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23B64334394;
	Wed, 20 Aug 2025 21:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="WPGfDFki"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC3B26F476;
	Wed, 20 Aug 2025 21:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755726810; cv=none; b=LIM6P2dLj3aRcIkSFP5SAIl8pBe/JpjTj1C5Jnl9BUN1S7PgFSrCj8K4V9z8dr6Kx+cO6B3GMb7DEtyGVnJfF9Yfi0fDEqjQbvULIiZK6HC/B/TAzPAlOH/kNr894tp79lJw1O/walYe0ecFx877ieEsoteKINKAbXofRu8bsHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755726810; c=relaxed/simple;
	bh=y7qzAAVclJFJpcTbgE9kH5G6gXPIq972WqopGbhWYiI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=I1I/vDsvIBHsw3nUOThMtg9zL+b2cDmLRDyyHN+9jyFt3n9YexsWAcu4pkulJUNRFlHRXD9Gce2zhO+c6Xpj1WiBp6/IHlChHJNurDnTwBOad8KfmAvr20t4wC+xN/vl6Gu3jx1Q0kwv1IzFbkaBOEhfM1zXwU99tmoIc4oMZtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=WPGfDFki; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1755726805;
	bh=dc9XC+XNASPCditJb9uOE28+slG6LC5pt5EOqfzPI+s=;
	h=Date:From:To:Cc:Subject:From;
	b=WPGfDFkie2NQaJEARtcIjuHg6JSzB8Ex5WyyQEvfeTq7AWloF9tZJF/IenvcscyRN
	 NHO0a6qHC4LAehBp9XCu1SKSILtNuEj5CSVRm/5yX+Reiyy85v60kZIU1CFB1vB4l/
	 HGePC3Gw/W5VuUqIdRqxEDaUiRGLT9ptIP7WPH7Yt3cAF+cO5vfmqpi5MajHPz6ap7
	 ZwHYVICPpRCE5LMU4s1a2aLQrVwcB2Rh4W61hoEpfBAQZg8u3/YUeSjzJKRPpliC/M
	 3Ao2Rx9aQpaeTBDDA5GO0kEns3dwR9SQPy44ryRUU8x1MheHGaH/NwdBDYM0Azjw/P
	 sxTLpskw2RdPQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c6gF10LhXz4w2J;
	Thu, 21 Aug 2025 07:53:25 +1000 (AEST)
Date: Thu, 21 Aug 2025 07:53:24 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the fuse tree
Message-ID: <20250821075324.193a20da@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qkepTnUQHUDVO=yvPlCoo0p";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/qkepTnUQHUDVO=yvPlCoo0p
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  53ad50232e9f ("fuse: keep inode->i_blkbits constant")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/qkepTnUQHUDVO=yvPlCoo0p
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmimQ9QACgkQAVBC80lX
0GywDgf+MzEo//sEtPlypfBEWvX6gkKoxmr5UQIemXWOh3EegKjatJjkdALNM5U7
B8rNSLq+3ZFwsiOW3/lfTRic6T++2MQ2BwsUjz1qEFhdycSGgePcMYUmzfz3PzTn
rQeceJXHWn7Fer+Id4P99jRNudhwYXbGPZz3j8pjpmam5sk42VE8FMjqkN1gzwoh
UObZ6ODph1qvGpLvE51ySFlhwoWtiPT71QS91sJd+5xCY6c0ZL7zVFphXXJKsmTK
CJUENN1QAn/GiLbUgoOIbgZoSPeqyKhaYTV7fOkKmsMcy9o7m9cSNswbnOuHQoDI
ibdXF53Q19acVo7g5C3wwGiR5D/P/g==
=Kl9P
-----END PGP SIGNATURE-----

--Sig_/qkepTnUQHUDVO=yvPlCoo0p--

