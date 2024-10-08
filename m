Return-Path: <linux-next+bounces-4137-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 052EE993F55
	for <lists+linux-next@lfdr.de>; Tue,  8 Oct 2024 09:32:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B07CB1F22B49
	for <lists+linux-next@lfdr.de>; Tue,  8 Oct 2024 07:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1140176AD8;
	Tue,  8 Oct 2024 06:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="dxDLcK24"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1691F16EB42;
	Tue,  8 Oct 2024 06:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728368972; cv=none; b=jNiXF+MmEp2qMxPsyoGmDEfGFIjEcIyQhgoK2FTiWYbJZekrGxncclwUqzCZ/FWr+IFQedT3HVgb79/XfN+/drSpl7h+3bFGv+jNOaFD7Mv3dmDgxY9slkCF4o9olzdPMF13YCGoEVSokoDQkKAGnlFebOV0iGCE6SUH8SOnm90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728368972; c=relaxed/simple;
	bh=A+XGWibJ5wCrMh61FWIyGIproZa6J8qxhLcDAG1RBQE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Eo1u1nMZa/7OUICLwy298oreTObPgTMqDrLPfJk7G/UBccneh8Nd0Krvpidvd6v0aJ7Ij5LuVCUUhlw093UstXsufvYaBP989fW5Q/zo+j21Zlz08RkZG9Dzj67O8xxTuLlOkyL7841E41BDFU5564jCbitpulzDdJz7l1TVagI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=dxDLcK24; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1728368967;
	bh=IsQ+J2Ndan5azomYips/VhPYX5BYOhyuF7G1A+/FGU0=;
	h=Date:From:To:Cc:Subject:From;
	b=dxDLcK24zmebYiYL0lA4LfvEyOo+pA9kn3oP7KHhiUY02PGCBCX4mmt844wTOy+xc
	 icrWRsJshObaXdSLZS/RVlHVRMNNT6ZTZuuLaLyosxg5jKpWI+X1Ztj78BiLqo8Trw
	 yhkqhiLVCJDg7+UdBHFfZDzR4akU8QCrzVaobpYR7uaesS0LwCnOe73WBwhNcTTER3
	 Tzt0Fbw6Pt/wWT+xyIMC0Y93cq/Moc3XOcRS6TDfuHEGuk9/bQVj2CwJCJCc6AqS3m
	 dUe14ijJAf3/ep4ZwAwv5d1bejLBSX75Y5GdJ2LMOH1zmh08IQSprNsIZFnUx1MVgY
	 jsB4PwOde6ptg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XN5hk1N0Vz4wb0;
	Tue,  8 Oct 2024 17:29:26 +1100 (AEDT)
Date: Tue, 8 Oct 2024 17:29:26 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Herbert Xu <herbert@gondor.apana.org.au>, Linux Crypto List
 <linux-crypto@vger.kernel.org>
Cc: Lukas Wunner <lukas@wunner.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the crypto tree
Message-ID: <20241008172926.0b995ea7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TKdfoFQeWsZjzjQG8m9Jph0";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/TKdfoFQeWsZjzjQG8m9Jph0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the crypto tree, today's linux-next build (htmldocs)
produced this warning:

include/crypto/akcipher.h:1: warning: 'Generic Public Key API' not found

Introduced by commit

  6b34562f0cfe ("crypto: akcipher - Drop sign/verify operations")

--=20
Cheers,
Stephen Rothwell

--Sig_/TKdfoFQeWsZjzjQG8m9Jph0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcE0UYACgkQAVBC80lX
0Gx2Jgf/WDUiJIcjrFaksEaWx9KdSvYBu8riWCF5SU5pejpslre9D5fmcb+g3Mni
RuqjNHjSxLqm/cO1PQjSWjyJhy6MVZtXKa0a0jlDxKHZx1KZfLepRMgUHh4oCKL2
GYZcVG9fCT9nZdWeHesgtehw9mmu1KUkzVasD4dPUXm4nkEeL/VQtXHOyl1hssHZ
3h9L7kRJE5gA5k6Y0NJPyDPxlNjXayNpYCEmC0/3h69KzPEkMWNWfKdxrotx0gDB
o9J+61AEKytmqa+4ZtxrHiDkVy322U85EA8iErgcZTWanJK6o3b+ffUnbEcJDqia
9rp+JPbMrz+otMlPkRznOA56vUYcbA==
=Xrjb
-----END PGP SIGNATURE-----

--Sig_/TKdfoFQeWsZjzjQG8m9Jph0--

