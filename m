Return-Path: <linux-next+bounces-7347-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C77AF8571
	for <lists+linux-next@lfdr.de>; Fri,  4 Jul 2025 04:07:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 809D3542865
	for <lists+linux-next@lfdr.de>; Fri,  4 Jul 2025 02:06:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 462DB189B84;
	Fri,  4 Jul 2025 02:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="TP52TdbF"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51132869E;
	Fri,  4 Jul 2025 02:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751594820; cv=none; b=p56FBAVb9+cv99NEwe9UOAy6EwaLWKHv1kXa8e9tonmzcrXcDVkANmesicqwCsYU+eTUR6jab1uysMEb4wQdfFtUjbe9DqJP+/dTt2PXbJVJbm4ppC4X/XVLqou+SL8NUc8u4+zN/sz9UzQTjy0KeCkkYmyz+5pLBwOw7gahDhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751594820; c=relaxed/simple;
	bh=nlSj5oOfHhL225CQcU/OxzIGpXKCMV0HHijs0iru3XU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Oz7jw/Hrn9C9Z63A+j0kIS0Eg3TgktCYccRi6mgC48rmEgkC2XsMsTS3IOA5DWU0GqxqV3GNDjA73VLsFXWSPNuBXwT8faDqAFFBRzqWnkSHrE44yQttNfOok8dJQr3p3Noj5DutQ2PU/FE4PIf67jJdxLmoc54PsnIF7i81Ols=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=TP52TdbF; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1751594788;
	bh=dRkoz7iHiauJxHNSareOKZ8GuXECg08x76qUzBSBYW4=;
	h=Date:From:To:Cc:Subject:From;
	b=TP52TdbFaUsq+SJkxVbK7iqx78Q4CdYzLGIGENs3XajtnPv06S3Is7N+tdNlNYLy8
	 W6T808MUwkduA69idIJX/LQpegxYagv7ifIorDIsi2I5vYsfW+pyavg25PWxAtCM8H
	 AhUC1yG2ixbwtRODGQ4wsHRRwAWN3HsHlrZPyFv/fH1TNt/6qmSTq+TLIGtMJYCRGj
	 P/8I36U+Emfk/EEMERSU0bgzDo2yhlRJ0uRXcIkvaYYeJoTuK2+kX33rF8bGZQ6aET
	 4bVry6SwPwlpMiH/h0uLIUFwxR0Q4VYs8iyzpPp+MmKSDA13vROX/MTQH2W37GmVuy
	 cvrUH8UuRjwRw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bYH7842HLz4wcg;
	Fri,  4 Jul 2025 12:06:28 +1000 (AEST)
Date: Fri, 4 Jul 2025 12:06:55 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the arm64 tree
Message-ID: <20250704120655.3d65235e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2HQxllJKo4B/BaG4q2l3VFk";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/2HQxllJKo4B/BaG4q2l3VFk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the mm-unstable tree as a different commit
(but the same patch):

  093ae7a033cf ("arm64/mm: Optimize loop to reduce redundant operations of =
contpte_ptep_get")

This is commit

  b95cb1fa7a8d ("arm64/mm: optimize loop to reduce redundant operations of =
contpte_ptep_get")

in the mm-unstable tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/2HQxllJKo4B/BaG4q2l3VFk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhnNz8ACgkQAVBC80lX
0GwzDggAm6ZWYUt0vBGkjyYvcC9Xezq9d6lHfJkuX34YyKiU5ZFrQmB9ghTX94CA
UZL4U/AW0m7CZvJwgVWM2iwh6xYl03E0tqwPLduBJ+JaX/t/OBIuZV2eywy41/tI
CDYFeVYHwaJqkU0ViLzhrUceukCYAAEgKseJHKaEzx/LFPLulrn9ZgCayGNO4cnA
1S6W9IYBEURbELWp69vjEHNsAryhk4L7d1QeRkSUVyoCahYxbmSZG5RQlky/Kpw7
ZiXqhmVlLL5iW8YYC6ASlPIBK1WPsyvr7mI6gKoHs3iQeksb6pAPhK5UTS3jQctD
esjxRdvd1kFMJnJKTAORId+yP65CKQ==
=sOAP
-----END PGP SIGNATURE-----

--Sig_/2HQxllJKo4B/BaG4q2l3VFk--

