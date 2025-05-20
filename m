Return-Path: <linux-next+bounces-6847-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC31ABD861
	for <lists+linux-next@lfdr.de>; Tue, 20 May 2025 14:45:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BFFC37B238B
	for <lists+linux-next@lfdr.de>; Tue, 20 May 2025 12:44:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D6921DDC11;
	Tue, 20 May 2025 12:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="PXf7YfxV"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411281A314C;
	Tue, 20 May 2025 12:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747745110; cv=none; b=RC0hrIY27DBcAM2/xsJop9DDYiVCofBepStLaaPU+Em9o5dxr/asDU/35xGCLq1e9MKssVELeYZgs7HGtE04D9BxJiZkkaBnQVuXrwP28gnbi+f6ZjPmlpRyCv4ldZEK7iAe4FPk73Uw8YpdWTNxMAIsItjgqR1mnPmkgofpheU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747745110; c=relaxed/simple;
	bh=/Bu5JoeggmmYsgYMlQJvoiHTFaiR1GhV3A0BYsQYMaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rMv/w33ocn9fZrsGkBSGPujlvPM6tdR7CZs92lZ2LVzPS4nKADrtVjUqH0kqF8lo0BS8Y/+170vo95fHXgN2l7GC8OPfHb1kwkjrMeuiSxZ0RvjaZ4ZC77tch1488JKTn7IC7S03XXhRIaUikdf3ERMv8jAQEOHK4oyQXJBZiOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=PXf7YfxV; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747745101;
	bh=mg6aKkZQLTEQjbbwlb5kNbIkwBaVOTUMSjCEbpPqIcs=;
	h=Date:From:To:Cc:Subject:From;
	b=PXf7YfxVtdGpsC2nh54hcxK0eKz4a7QgPNBRigRwVE2BH3l3ftsZuv/+do4sL5Uqw
	 ztWRRlHQ0pJUHxVkq4gFJDXjBtkSART9/Oea7FtMgZA6AY1kSCx/iU4rxM2tSGAiD8
	 O4kKZG5ZPtkJc+X6tGeNITOB0N1599i1W0MAUE6IrMH0njCEw2ZeK3RBE1cUu2O7Pp
	 dPpEFAxUGraWo+9627YMLOlA9//ukuFI+sgkK9lKJOe6jwavHdaaZgucHR/UXvGnfS
	 hjrSOme/KwEwP8mikpM458eBp7/Vmkg62OY+E1mNk+iHsCb4NwMXQjXF2+R38BnVo9
	 oOscSjSsGTsiA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b1vQj5kxPz4wcd;
	Tue, 20 May 2025 22:45:01 +1000 (AEST)
Date: Tue, 20 May 2025 22:45:00 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Herbert Xu <herbert@gondor.apana.org.au>, Linux Crypto List
 <linux-crypto@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the crypto tree
Message-ID: <20250520224500.4d3b7d16@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/e70/c5jrQ7WqOkCmO5/3iiu";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/e70/c5jrQ7WqOkCmO5/3iiu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  d9f88adbf117 ("Revert "crypto: powerpc/poly1305 - Add SIMD fallback"")

is missing a Signed-off-by from its author and committer.

Reverts are commits as well and so deserve reasonable commit messages
and Signed-off-by tags.

--=20
Cheers,
Stephen Rothwell

--Sig_/e70/c5jrQ7WqOkCmO5/3iiu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgseUwACgkQAVBC80lX
0GxXMwf/Vjk6VdxnikXK9Yzh0gy75Bq1oLd6B8yLoG7+6g7URHg2N9KEpD0kM/W8
QS/f4IllXfP2xWmPX+uGjL3FmZQQY6rTHArUj8CsVMPGTx/zuFZNnkSkdsKRndE4
QLdiNSz0ZNOu2oD613FaORmuKPI93r9zv5XRNNBVaRu3uIEW7IdrjXPRiFUSGUyl
yfncHm+hXPxHWlkJIfSKETl+ggu8pZ1AwRaihkikvd/QrrEkpPhtuULeqSSYYZ3C
wPkXUrSSaIyATHcbeXuk085XRKDlFkyK1OEz6Z8ebWcDJssC39E1ml43nCSrElqv
SzewNAX8oq/S24SUL+UNUEjsnBX0Dg==
=is5l
-----END PGP SIGNATURE-----

--Sig_/e70/c5jrQ7WqOkCmO5/3iiu--

