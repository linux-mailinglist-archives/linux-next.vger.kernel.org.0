Return-Path: <linux-next+bounces-2984-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A639930BBE
	for <lists+linux-next@lfdr.de>; Sun, 14 Jul 2024 23:27:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 28898B20E22
	for <lists+linux-next@lfdr.de>; Sun, 14 Jul 2024 21:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B780F13C9DE;
	Sun, 14 Jul 2024 21:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="a0/Z65ay"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CF810A11;
	Sun, 14 Jul 2024 21:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720992465; cv=none; b=iXGYTBC7gDMDweb1nq+L11JqMI9vuYM3YiD/IufQq8+5QiVFlocikp5Wjyq5Y5D8arASXMZSfCgDshC1G7/+BpsTDoLPnj7hLdwYP+JIY57tqc+hN15PiMtIoyAr5HmRy2SNvNH3qV8CKVe0aZ6bbEjsj7Fiy7eDRq2WGcx9L78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720992465; c=relaxed/simple;
	bh=0GRLEPscJTLtdsnaUX0cb/KY2ehZd5L1gNWfv8B7TKs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=j07k3vyP8aFGAdZuXRMxF2a3r/vpwSX32jrApTQrvyJWyBJ3YO7JndEZBiDIsoIsSKg2Mj8onohsi58BZDgpRCanHYgekFRwUBR2QQqUyByFMR1veQ+YrUKSsGwM3fSKFV0EqmwTPjSBMGejMZW9mUotJMXaW1wqrXFGU9FVDdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=a0/Z65ay; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720992457;
	bh=OK6tOFx59VWlQ52L2/SslGUs3SXMEwFYEeS4A0GD/2s=;
	h=Date:From:To:Cc:Subject:From;
	b=a0/Z65ayvEq2rdrYzPe1pO1sRD6ybn6bcv7OjzSt9KMZRkNrA3hvaRR/jSWx1Dp5L
	 mVxbLyTKHa2HNFmag0tyxAGUcCNe6BzqWkzmSNXOcYCJxcAXAuVwDrmQZrpmRsaalM
	 QNXFjtaxkMdtinWJuJejuz4iAJRXagzIIb8VhmNlPnR65J3Y08o0pEcNR1du22q65z
	 J6zPED30u4MIMKGapf96vRXIs6BE26G6WJE4vS9Ng0zJ4yvZaHKa3Nm57oYZpLRRL6
	 lSF7Tc6ZNQeZYHT3/Zj+Do5nqKwfesISmMfDcDMi5I23CUsebbhUyTIVBbgJsMQt2/
	 OeZN0YQ+INhog==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WMdhn0WSJz4wbh;
	Mon, 15 Jul 2024 07:27:37 +1000 (AEST)
Date: Mon, 15 Jul 2024 07:27:35 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the mm tree
Message-ID: <20240715072735.4fade208@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_Y496mAEmrxmLD6X8HFEPQ+";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/_Y496mAEmrxmLD6X8HFEPQ+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  0f59cd3ed361 ("mm/hugetlb: fix kernel NULL pointer dereference when migra=
ting hugetlb folio")

This is commit

  f708f6970cc9 ("mm/hugetlb: fix kernel NULL pointer dereference when migra=
ting hugetlb folio")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/_Y496mAEmrxmLD6X8HFEPQ+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaUQscACgkQAVBC80lX
0GwpYQf+P/c61DjZib1Q1DXv6KS/IWguZhBV3CworiUnkWuRDRe+E2NF4iE3UcsJ
VOulWVwi5X2091kCmSIO7usUDXb2+nqy3swFNOyQouiskv8LrP0HH1vQvuk1dUsF
O5jGfrrVjaDjem08CyR7mzOCpTm1Qb69HPQALCDQH1dvqJCLnD2dbWvDaR9zFd0Q
IliVannCsJtWqBtArMtUhYl6YxLjf6igLBUwllWAtg7u457Sli2h6h56GNqPSlYx
62kFw/si3FuHMjbIDqfwS1Crc4pf1up0/9ly0hKQl46fBKyPz1qNyE5smzIkfYK6
lKRCDCA0jPmdxhrbawsK9EbHT2We6A==
=D+lR
-----END PGP SIGNATURE-----

--Sig_/_Y496mAEmrxmLD6X8HFEPQ+--

