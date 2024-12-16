Return-Path: <linux-next+bounces-4961-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B01B9F2951
	for <lists+linux-next@lfdr.de>; Mon, 16 Dec 2024 05:35:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DFEE018860E4
	for <lists+linux-next@lfdr.de>; Mon, 16 Dec 2024 04:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D12F17A5BD;
	Mon, 16 Dec 2024 04:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="j/KEqgaW"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521D0150981;
	Mon, 16 Dec 2024 04:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734323740; cv=none; b=OlOEIkeLwKjnetAbbF3G0DV3YYWy/E2XS6kvoYTsukf33e8O4Z1cn+H+DrizJubmN8VeQrvlGQKPw6hseNnONHRWTnX4LT0JkRWgouETV+weeUJo5puIGJpMWAUPWqtUe6AqWi1jifvGiAg7d4XKn7ehVHJk++JGUhahY8ziW/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734323740; c=relaxed/simple;
	bh=mGtop8vkfJEr4qcLH0V1j8V7bYDWBE8kSRU/V0QvyHw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=cDEOiBBhDwr7fp9yUL++0yCKPDT43gkFYtx/bQpJLNe1UAg8tXzIN+lHyLO2DAtgdFMTpLzcBgHJ4I/DV/0I1viiNo4yzrubw5uc1VylhLvy1MtZsPSwrDRzbGdjAD8R/K/hfLIlWG+v55VkDSaHBI5W81ay4DI+y9tpUYe4FVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=j/KEqgaW; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1734323731;
	bh=wmHh6bp27Olp6vYWKaLvxeDmEwhXw7Xv6jT5w0mW5ac=;
	h=Date:From:To:Cc:Subject:From;
	b=j/KEqgaWAuGlRc3S6URv8y+7EM8cKjNWd852b3wUGbDtKgo3r2h6mKE0U5mowGDlG
	 P9G8qGVFSZ2kTDVj3jxe65lFGq0PmI5pzQL4EHyfEI7L4B5ZzAYGinLsq6nAJAqeKy
	 4NJjwNwXfFHNk3JaP6Rwh6O73v+TDzQsGcMsKOufdOeCVylOAaEbOIZAgtxEeBCB31
	 6Jac0ISipH4Nq9H2YKMnqEktV+J+2pwCMxCctq1PF7LQ4YYxMlC1sB4Jeg/Sw7kOfB
	 Jw0LRL9MJUYA3MdGZjgiFwSUA/WFTxXAMFOTIIfVL1zSkQfNt80iG9QzEcVhkI623+
	 IuQyr7O4is7tw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YBRvR0KQXz4wcr;
	Mon, 16 Dec 2024 15:35:31 +1100 (AEDT)
Date: Mon, 16 Dec 2024 15:35:35 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>, Paul Moore <paul@paul-moore.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the rust tree with the security tree
Message-ID: <20241216153535.23d51bb8@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/U.d1_An_p8BA.1/xP8GSx4.";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/U.d1_An_p8BA.1/xP8GSx4.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  rust/kernel/security.rs

between commit:

  9c76eaf78488 ("rust: replace lsm context+len with lsm_context")

from the security tree and commit:

  4724732dc2a8 ("rust: finish using custom FFI integer types")

from the rust tree.

I fixed it up (I just used the former) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/U.d1_An_p8BA.1/xP8GSx4.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdfrhcACgkQAVBC80lX
0GzNNAf8DJHkMlUUnMH5JKVqljT60jj2Hoz5WhM8XKY6iKJ4I55BmcZbkFa9hpXG
6LyN6qbXps0KjU3ZjT1CX046BGEMFTD6gwSLSJMdi4tVEhBvJuWTvWZNLAJYS2op
tk65rqtgC4dUQMEgIlVlXCLtsKb2Dhitw93Ba440WtpCkf0rE+GkpYh5pO0CZD+r
lHlgGaoI+43Re4XUs3ECbJhqaMlXIPnRvakpodx3Dyrf+E3uuUQ3RTwn7SOHfzhc
KT2C6vpbaXgyUHVksmPc8QbijTW0sqhotSutuywenBGm4veDHWdfKXLQuIKBmxpG
Wz1gMSnFPQOOaE1+5JbCBan3GKDmJg==
=dsIh
-----END PGP SIGNATURE-----

--Sig_/U.d1_An_p8BA.1/xP8GSx4.--

