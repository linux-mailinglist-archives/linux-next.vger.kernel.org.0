Return-Path: <linux-next+bounces-4909-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D96499E8A0A
	for <lists+linux-next@lfdr.de>; Mon,  9 Dec 2024 04:57:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7D6E18853A7
	for <lists+linux-next@lfdr.de>; Mon,  9 Dec 2024 03:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49AF11537C3;
	Mon,  9 Dec 2024 03:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="K/kNaEsK"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC48576410;
	Mon,  9 Dec 2024 03:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733716641; cv=none; b=aOvCGhUfGtYYOGR8QJP2DDmvBlIsfsNxRYyFWYmt72X/Yl3G/vCaUhznvrMR83qZAp7f+Qwt/dOEa3tf7QGYbqhE5a5srz1soJ4W/261Fj+i1fKEmwtN/KYWeuBbS2319mp1T8D8As+I/ACKNck/PkJsNMjna9YJrueRXuHuLII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733716641; c=relaxed/simple;
	bh=OJQ4NV97OvgcQbtnU0cIyaNnGXALz6uCQlF9nrnz48c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=F6DqJtyjXUPcnzhKfQ8SNILNYorY0C8ZV4ptHHXwA0fTA2MPEdIELe7wbijFIQFtpQrD28ByOy/5JCy3VAtg8fnU1o8VZsv7Ug5RM+KaFa/TF7/E63IXfmLkEMzzZaVomHkmXktH5CrB/t6Qhobx33FHSUgbAlGWerHm2tgk480=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=K/kNaEsK; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1733716631;
	bh=IvVcyf69nkGKjuzXZ0OAo9TnoGuATxPJxH1Hw0rR0ls=;
	h=Date:From:To:Cc:Subject:From;
	b=K/kNaEsK4ONfUnqTkV3D+bhZq22fiDoC0COAqtg6sTOg1QP4UCEETkbOlku+l7Sp8
	 zHTtSJr81YE/CG6jKowbVntnU0GBqUYJpVQXKWm13eK11YTchkakT0dFjQitBdinM3
	 sYd1z32IYt+AZK9pMvd2aZNF4HP6Q78pMRv3u0GhRsKDFOJH/TqDYPz/kGwS++M8zo
	 +IP7jRZtGDJo+v9YYcHva0A7PnyaaW/MTweAp8vMosGk2zAQl3xFsmtJt+Th5CWeBc
	 IU3JaVAInfwcz4SN2rC4839c33isJq2N2r5jXwgf2T9KxXdIPSRB1zzpoHmUgfY4de
	 jNJ89MCy/FyZw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Y67NQ4vS5z4wj1;
	Mon,  9 Dec 2024 14:57:10 +1100 (AEDT)
Date: Mon, 9 Dec 2024 14:57:14 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Eric Biggers <ebiggers@kernel.org>, Kent Overstreet
 <kent.overstreet@linux.dev>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the crc tree
Message-ID: <20241209145714.1619f9d2@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/PPLmtII4z7PDUDrokig1Lsi";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/PPLmtII4z7PDUDrokig1Lsi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the bcachefs tree as a different commit
(but the same patch):

  cc354fa7f016 ("bcachefs: Explicitly select CRYPTO from BCACHEFS_FS")

This is commit

  4fa882d383cc ("bcachefs: Explicitly select CRYPTO from BCACHEFS_FS")

in the bcachefs tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/PPLmtII4z7PDUDrokig1Lsi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdWapoACgkQAVBC80lX
0GxhRAf/UvuWyhiOiPz+2sWiOT02on86kTZ7nWDN167jNVdGhXPG2rqvTyLhDCVG
SbrBkjvh4JWtBsCipxdzgEPVXpUkIiXPZyyp9Nxk8T2F36c1BZp7tNtjZ2CEOA8r
rLPmM3BPrtjjO9zRAyzuOgQpB7f1tsuuD7KddarhdyfKG19RtKRte/3tA2OCxRrc
hpGNGYUNHreTrjcxTP66qSlJ5N9a4CftKtICbH6reARNt1TDjRfFNxgohOBDZaDa
au+pUVqarIdFsUsn++ZRD9JgJwewnuuR/gqHp3yUQx+Sy1HbccWhjbgRVbyRZ7Dk
8iEdpwe9YRXepeaujaskdsCPZF8YYQ==
=oG/i
-----END PGP SIGNATURE-----

--Sig_/PPLmtII4z7PDUDrokig1Lsi--

