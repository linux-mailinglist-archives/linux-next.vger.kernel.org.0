Return-Path: <linux-next+bounces-6260-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 04431A8AC4B
	for <lists+linux-next@lfdr.de>; Wed, 16 Apr 2025 01:45:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 756821902775
	for <lists+linux-next@lfdr.de>; Tue, 15 Apr 2025 23:45:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDD33291171;
	Tue, 15 Apr 2025 23:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="K5e53IWm"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCEC2741DB;
	Tue, 15 Apr 2025 23:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744760705; cv=none; b=NZcyN1i8TDus+JCJoZqN214gCLigLbYyvnlIZ2mzjBk+I7znaJDi1dHOaPM6S9J2igo5clmz3hpak5nm5YpPxSpeUEH1Dl3TtrJKM71E75LAaOQsQ0EcoLhWOX7bBe2TSTV4MjvNIW+x5MbNVwRScniTctwZ7LArlcg5VIsh/FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744760705; c=relaxed/simple;
	bh=JmFojLUPpqlAil0RZM8AttxNgI6Nttnl+AHqaCogRZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=E26rNCOhZgKiXxymx11/wAj03OEHO919NM4sXB1kYVoqnqu/p48g+Yb3/qhYp2GM2gfEcdI5WYz/fRSgMWy4PM2Nenc6CnguBfO0uy6ZP14McMZ+J0IGANiuEZclVlu+WuNcDSL0UKEQpffbw20l/jGvJ1GIgPTksoa+Fj/EXOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=K5e53IWm; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1744760697;
	bh=Z5Qv2OaByhBO+ej9Bvgf4jJrsmKxuFkYrm5PFyK2Wj8=;
	h=Date:From:To:Cc:Subject:From;
	b=K5e53IWmrmpFomMAVhWtvpk2jlMWmhHiIpqkgqZ1tZA4Nm8LfnbfNATpiiRL5ndjs
	 T5PRWNBVmp/fVWi1bsNmUUKikfIfDi5OaGu039kr+LDkRhu04CAF6Zr+MnvmwyCzO3
	 Q+koVy44HxxFVCuWTqgsWHvJdkkiBfrjmSDV++OfoyBLiq/WsmAgY45uyaLa8RZMpR
	 6oBt8GRfHc5hsWh5c6JlUA3pU8Ed9OpQn7tflLI3ojYijo40XmQTyduMhWFJc3hQgN
	 +xmXrfaulqKRgrZ8C37M7oSAcjg1mQVHMNuLzPzLPTPUsjER2+LJ5pT4U6ldd/d3RF
	 b/6cC3JpNvGSw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZcgkK1G6yz4x8P;
	Wed, 16 Apr 2025 09:44:56 +1000 (AEST)
Date: Wed, 16 Apr 2025 09:44:55 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the driver-core.current tree
Message-ID: <20250416094455.55506561@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IpIbbChJEOu0UgSADindf37";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/IpIbbChJEOu0UgSADindf37
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the mm-hotfixes tree as a different commit
(but the same patch):

  b9792abb76ae ("drivers/base/memory: Avoid overhead from for_each_present_=
section_nr()")

This is commit

  ab81406e527d ("drivers/base/memory: avoid overhead from for_each_present_=
section_nr()")

in the mm-hotfixes-unstable branch of the mm-hotfixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/IpIbbChJEOu0UgSADindf37
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmf+73cACgkQAVBC80lX
0GwSMAf9Geagpb81yjwpIzA2/72x+BD6cx/KyT9qzEh8vqWrSDliKcpk7ohDbcb+
OWqvWXNriHXpVbJ7sPJVHbpSmI7524RJYhGVfrPFIj4xlZ1U5DKpkn5XLZuMbz94
ZKvllKTYN5vVNHkwT0vgkOmNo1HFvCwibQEHOo2qYY3r05arECE8gckQmjdS9lkD
nkp+28aCto/seYZ/QgSi3MMLN7JKU7lOYLzHUfN1hH5qFFRYemk3hpOzsXd3gU4E
ccSd0WDqcF/17Hawmb0NmNZfJuZ4mW2o33Pqp62yTPete7XjoX5ZdKAFLLj8P/Bj
/r3D6lIe8P0piMya3dgfubDWAYYq2Q==
=ktvb
-----END PGP SIGNATURE-----

--Sig_/IpIbbChJEOu0UgSADindf37--

