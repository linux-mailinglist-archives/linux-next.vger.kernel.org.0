Return-Path: <linux-next+bounces-5240-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 62543A1473A
	for <lists+linux-next@lfdr.de>; Fri, 17 Jan 2025 02:03:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5CFD188D3CD
	for <lists+linux-next@lfdr.de>; Fri, 17 Jan 2025 01:03:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4E3625A64F;
	Fri, 17 Jan 2025 01:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="r9uYyeo7"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D340D25A628;
	Fri, 17 Jan 2025 01:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737075792; cv=none; b=j2gJwQUlpVH2s0EbrZg7c4fzMtdZpVDX13zJcfEXD+IhwWSRpwnI7a0HKPyJmvgfShlM58qo4Jk/VQ9iPDA4nEys7GdOPGQMWL2NoZCi1roj2TMwOeDzkv0eh2UuiNBSqcexoWozv6rMd5Ys6fBEV24YkTM0/D4ynyzlUJJUEoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737075792; c=relaxed/simple;
	bh=ne4C0S1UNPhuNl/pX42I2XBk+tUSJ3hETDwezKYdbAY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=b9PN7j8OdYGhfl7LlaEYmaRUnWsiSZyTYy1GqKaHGfYziMdQpIfo2H5/Q0UV9ohdCQ8p1dmy8kpxWhEMapR3/oAeD38D9NIt5J4GDERWsV0I6jsRkZEBHvIcShZemFG+UJcPzNW+Zs9216t4DIRT0J0C7Gzmo4yD292032We26c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=r9uYyeo7; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1737075768;
	bh=I012bLDoCFT/wkfBFnTnsqNx60N8owb2a7/m1oAGE9Y=;
	h=Date:From:To:Cc:Subject:From;
	b=r9uYyeo7sMb/ZX7GQI5HhiSseV/3BJwCaLFOuCv9L/UW7akOYLSKFCUqGAreqzjRy
	 /xqnZ6b6EPtNtgR5HQsC8ZQG3JAFORjlONcgrUNq/eJ6CYs4Tjb+OGNYU4TJWWuw/a
	 YdGJ5Pp9m6A1YC76fBbBnp/nwTviOSzayyeybBntRoB96cxxeIz4qEtPvr/0/1J9Ex
	 dE6ezTqRnQyDMCUqQKRk01R1HirP2LcPNaKtNcQnoTBRaY4iBldZbj9SNbDUqILR1M
	 y0BzPw2fKHzS/5fz45tfK+cU6WZI5EUPMRkk+7e+kx1KlCEp/a0CA5AJOdJltku+pT
	 D3jwR55t8V3Hw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YZ1gD1t0fz4w2M;
	Fri, 17 Jan 2025 12:02:48 +1100 (AEDT)
Date: Fri, 17 Jan 2025 12:02:54 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jonathan Corbet <corbet@lwn.net>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the jc_docs tree
Message-ID: <20250117120254.4dd5c696@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1Bvd2sOpT99zpnzYgTwZA/m";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/1Bvd2sOpT99zpnzYgTwZA/m
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the mm tree as a different commit (but
the same patch):

  b6cdff984c3f ("docs/mm: Physical memory: Remove zone_t")

This is commit

  d8e91542e036 ("docs/mm: physical memory: Remove zone_t")

in the mm-unstable branch of the mm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/1Bvd2sOpT99zpnzYgTwZA/m
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeJrD4ACgkQAVBC80lX
0GyuPggAjDxjP2eNLzaMUK/ReMqfiVw5JtEZROz4QVUoIEmF+C+1p4Y43ZDwr0/z
vZWgPZLht6EcuGgRfTdtFKly91bB6o31ZPTi5zkZVpiXLrKtOiGvyPDDTHZdMPM9
u/SBjqBtXyLTEmYT1YlKglYPuwf0k2pjjybBKGBoQW0Op4CRUitSoaXvPJnklFWp
+5lbF4DoRsgx/2dM/XOJM7dx60gBDn5jjt07ibwa0f+o2N4po7gCvpEiNUk5d9fz
C1Y3ezPey33Wgm6lH4IfjM2+4FwddtUPq9Yx6+qbmwmnFfp+ctDDEgGBmivrjZdA
xyFxxqDk4lIWXlASD/JTWA7f1I46RA==
=tnPd
-----END PGP SIGNATURE-----

--Sig_/1Bvd2sOpT99zpnzYgTwZA/m--

