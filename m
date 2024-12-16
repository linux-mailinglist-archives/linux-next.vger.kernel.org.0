Return-Path: <linux-next+bounces-4962-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEF69F295F
	for <lists+linux-next@lfdr.de>; Mon, 16 Dec 2024 05:58:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DAA987A205B
	for <lists+linux-next@lfdr.de>; Mon, 16 Dec 2024 04:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 174DE1B21B2;
	Mon, 16 Dec 2024 04:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="siCNjm8s"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333AB1946CC;
	Mon, 16 Dec 2024 04:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734325088; cv=none; b=Rh3qBiJ2KY+f0DlXqO8/meaah0zfNGInTfVuUQBYaqJxv8lkxXCGlM68pbZz4VGleuco+y0zkc2WN33sSy1p+iyO4s4JAcAaLgwLckD0gQILCYHjTbgpZmX3Udzn6nEr1k3akHvTa9zQJ2Y6qycAU29MmVOIv5hPuGrd1ZpmxrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734325088; c=relaxed/simple;
	bh=2XJ3sjJ0B0h4j2iOoxxuzrpoPaB5O39Ysuqi6VwwHX0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=TWHxiWTr/Vq1q62HNWxn8Aiv9y/UBfD4LKsaKo0HDvGrEKEb4O+y7VaxVtMsOWypdD1U95YdHnaYSMG2+IjrEyXVw2mij7L0B2wdYjBD2rbRIgNEdz1nZymHGgB/KZIsbnVLokoCiJqmXEZw6EP6EzN0OKQcJf/dunXD3XbzpkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=siCNjm8s; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1734325077;
	bh=0gC4SG/i43F52qBgWRck2xqZh5vZko6nuoCzYwkBsxg=;
	h=Date:From:To:Cc:Subject:From;
	b=siCNjm8sE3nz4XAnrsHjI1IG44bSsdSxEI3W+5/7yk3Zgj/9qzWV/kAEoKuyQALWZ
	 pQoCfKAAaKquO+nY3335uQnLzyrUN2AXXhNyvFo3vdBNr2zVI9/Jipcdd6ZjRMl1Q6
	 9kLEm+649r8lkBXv6UfjwmP3RHr3xD6GtjrofNT+jEnbsSi1TvRpkkH5hSDlB4o+8H
	 vz/vX76/BPhzXl8lygVyvRK8dE1Aou8xQCDTbTKhGSctELGhKbRAzngiJeouMA9lRJ
	 ye08ikpy+aHjwd6dvZNBu265ckH4yHABrp2F+e1ZGmjSCTDmqXmuB8VI5jmjf6yljR
	 1P7oKrVgliiVA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YBSPJ6y0kz4wcj;
	Mon, 16 Dec 2024 15:57:56 +1100 (AEDT)
Date: Mon, 16 Dec 2024 15:58:00 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Max Ammann <max@maxammann.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the hwmon-staging tree
Message-ID: <20241216155800.4b0203c1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JWZaY9QrxdiLXzX8F=YobtR";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/JWZaY9QrxdiLXzX8F=YobtR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the hwmon-staging tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/hwmon/nct6683.rst:66: ERROR: Malformed table.
Text in column margin in table line 9.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Board           Firmware version
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Intel DH87RL    NCT6683D EC firmware version 1.0 build 04/03/13
Intel DH87MC    NCT6683D EC firmware version 1.0 build 04/03/13
Intel DB85FL    NCT6683D EC firmware version 1.0 build 04/03/13
ASRock X570     NCT6683D EC firmware version 1.0 build 06/28/19
ASRock X670E    NCT6686D EC firmware version 1.0 build 05/19/22
ASRock B650 Steel Legend WiFi   NCT6686D EC firmware version 1.0 build 11/0=
9/23
MSI B550        NCT6687D EC firmware version 1.0 build 05/07/20
MSI X670-P      NCT6687D EC firmware version 0.0 build 09/27/22
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Introduced by commit

  db6b0c4bcb55 ("hwmon: (nct6683) Add customer ID for ASRock B650 Steel Leg=
end WiFi")

--=20
Cheers,
Stephen Rothwell

--Sig_/JWZaY9QrxdiLXzX8F=YobtR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdfs1kACgkQAVBC80lX
0GxLOAf9Eyqf6hNu6WcbZl+Vih1pwikXN/+NSL8VdX5yY+eJExulzYNsNMZaxzsi
EL6N+NAKV0agoriRboNosluX9QLV5VJT5Y5+0wH9G71cCvh2+3YNjC4KmaNX2LEW
AZsJfAkUu7CbSWETB+cNBGWVQuk7eQjTukW203BTdxcN/N1WQ/3SeThmqMAn9DD5
d6lUE2m2rQ5aU+I6vPJeB61fVdgxSXk5qEP3/Ot9byiMBFSJ6OheT2r2nBEyNXIK
+WOXAbumccucqDhBvupwLGEQS9VZAkgYHCvu9Xf1pY+0xMGi5RC97gDQv6r+orVz
uHr190MGkA06ymT10tPDmvoELr+tJw==
=IW5n
-----END PGP SIGNATURE-----

--Sig_/JWZaY9QrxdiLXzX8F=YobtR--

