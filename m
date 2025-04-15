Return-Path: <linux-next+bounces-6244-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 19310A893F3
	for <lists+linux-next@lfdr.de>; Tue, 15 Apr 2025 08:29:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AA47C7A6488
	for <lists+linux-next@lfdr.de>; Tue, 15 Apr 2025 06:27:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E9F9275107;
	Tue, 15 Apr 2025 06:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="sn8lzVy1"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A171FE470;
	Tue, 15 Apr 2025 06:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744698533; cv=none; b=UwutUwNQqkLXHDC+KwTtorgZFzz6CGMaeJaarDmJhwM2CtPdIQIQSx/EOUG2u5jeNX9GF9ftDrTFPOPt2MbPOjnLdvUDjy9ST8u5m94p6PKucATcUBmUAUvd3QWFuMZuzEv/gY5MuykttVzBx4xf1rfhVFY6xChJO7BqvJ/pFSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744698533; c=relaxed/simple;
	bh=LkvwlZuc4zPShMh2CETDblzezjHO0QmfrjstraLatls=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=pO5mCS7AKU0zcw7yFr060Z40AmfrkjneK8BY9zB3FhkdJpvnX2E6YWtASbSNvPerbp0MW42vQ/h7oYdcgx8QJHthz7QAPItA7X866qDFLNYp3ywsgFkWVl0uLOiXBn/08X2u08i+Uvj217t8CM/mBK1mhPb7wkoikRFJIsYBx8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=sn8lzVy1; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1744698523;
	bh=9JBSf82ILFFYdAZEyBljpeJ40QAKjN3IhD7aCT8Ghic=;
	h=Date:From:To:Cc:Subject:From;
	b=sn8lzVy1EynOvk6QLBc+LNNuzyxrw4CZbxaiJJkWTkoMdbPR4bnCApkL8dwZUrM0u
	 UHNAgu8M0kdDCHdX9Q1/tR6oFh4kSl86yjB7QU4J7F7SKH8coEWMFD26SguUldxMTW
	 xJkvtcf4R17lxUrC8oj4663pyihzLEAwLuC5Cu7EI/0UOZ0M3X4vsJZ5LnvGPCARqL
	 cArtEtqbDP+78gpPtX9b9W7OFSYjgummyL9MHpZsEunlVTEyhwrf5t0gUVg8rOxVA8
	 fpYhsMVNdtTKo1zaMVM8VjV1RCwgzYd986WYHVnxGn8Siw4bMkWQ4/cDKcblinx8LP
	 ALCf9LpSipAgg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZcDkf6r36z4xN0;
	Tue, 15 Apr 2025 16:28:42 +1000 (AEST)
Date: Tue, 15 Apr 2025 16:28:41 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc: Angelo Dureghello <adureghello@baylibre.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the iio tree
Message-ID: <20250415162841.5b9ddb79@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zgl4ZLjurS/8Y/+fqQBn6Ul";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/zgl4ZLjurS/8Y/+fqQBn6Ul
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the iio tree, today's linux-next build (htmldocs) produced
this warning:

/home/sfr/next/next/Documentation/iio/ad3552r.rst:55: ERROR: Malformed tabl=
e.

+-----------------------+--------------------------------------------------=
----+
| Debugfs device files  | Description                                      =
    |
+-----------------------+--------------------------------------------------=
----+
| data_source           | The used data source, as                         =
    |
|                       | ``normal``, ``ramp-16bit``, etc.                 =
       |
+-----------------------+--------------------------------------------------=
----+
| data_source_available | The available data sources.                      =
    |
+-----------------------+--------------------------------------------------=
----+ [docutils]

Introduced by commit

  9a259b51e3ea ("docs: iio: add documentation for ad3552r driver")

--=20
Cheers,
Stephen Rothwell

--Sig_/zgl4ZLjurS/8Y/+fqQBn6Ul
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmf9/JkACgkQAVBC80lX
0GwYwQf+NuWr5q8iMqYml4s1irCWlhNvyLT9qclJtyZLh7mtlFj3JZWgcH7NOMtU
VWLUUdS3YTodsgeUwl5YsSEFHzmtk6uMDqU9JIFNUxo5HetZX6wIMBBdTmjyOQkF
8GCzsweeFLtsGesThYUMzDNGZp/pEdjbBMJ07PsPZqFZQ+DhFL78ZGMHsJLWIrAB
FkP92a+DhB05iYeAUR4gA3Qf9j1idV2w1MsnjBZjvWXn4gAhdgmiVopOwTL6oJSw
vW0FPMRsXbyL/trUbFnu5XxVqg4yu6A2DEVE985xfe2ZzAwckz5/56ZrkTAjeDCr
LxGrY3eS8srZN67iWqeQpfjZjAq66w==
=JHVZ
-----END PGP SIGNATURE-----

--Sig_/zgl4ZLjurS/8Y/+fqQBn6Ul--

