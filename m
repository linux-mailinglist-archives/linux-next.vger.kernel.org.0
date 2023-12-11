Return-Path: <linux-next+bounces-311-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 409E780C05B
	for <lists+linux-next@lfdr.de>; Mon, 11 Dec 2023 05:25:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E14CD1F20D47
	for <lists+linux-next@lfdr.de>; Mon, 11 Dec 2023 04:25:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1106F171DC;
	Mon, 11 Dec 2023 04:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="CUftbjG5"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 920C9102;
	Sun, 10 Dec 2023 20:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1702268698;
	bh=NkK4CcQOtCz9gszouJKdQt7Kfuc3mtS0aQVX7Rv73y8=;
	h=Date:From:To:Cc:Subject:From;
	b=CUftbjG5wwLra6KP/KGhCofJDEtmjGrW0cswOWKbDVcJiyxQuVetZ6QVnrUHZDfC8
	 5A4TDyzylKr3Q4p4r5+twCKxwV26isPZQJabcsB2nvE/V0EiyzE7ThfaOtyIPtawEP
	 bj+tPHNo4df/02S3GNbnNGTfASzW5HSl1WjF++AYDGooCTs996hMfJEoflcfr8tuQ3
	 qsrTFFFYC37T+gbCudqdYZhOmhWRMUqT95bsaHEuL/zBLrGisMPzNWQzKDsyz1Tgpy
	 gheQ/QJRSA5IKab4FMqw7BYVOwBCOPiUJWFabv2RSA3Di0Qpm+RITJanfsD27+VQlO
	 xzKm4aInDdDgA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SpTDT5xZZz4xGM;
	Mon, 11 Dec 2023 15:24:57 +1100 (AEDT)
Date: Mon, 11 Dec 2023 15:24:56 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the driver-core tree
Message-ID: <20231211152456.7526822b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bgHJd+WFM5_7hbJRAgrSwjw";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/bgHJd+WFM5_7hbJRAgrSwjw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the pm tree tree as different
commits (but the same patches):

  3babbf614ae6 ("device property: fwnode_property_get_reference_args allows=
 NULL args now")
  1eaea4b3604e ("software node: Let args be NULL in software_node_get_refer=
ence_args")
  bef52aa0f3de ("acpi: property: Let args be NULL in __acpi_node_get_proper=
ty_reference")

These are commits

  a66cf024b377 ("device property: fwnode_property_get_reference_args() allo=
ws NULL args now")
  b912c6530332 ("software node: Let args be NULL in software_node_get_refer=
ence_args")
  cab48cbdfd27 ("ACPI: property: Let args be NULL in __acpi_node_get_proper=
ty_reference()")

in the pm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/bgHJd+WFM5_7hbJRAgrSwjw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmV2jxgACgkQAVBC80lX
0GzXJgf/YeW7C8pLps9MERYbK/UpV0OjUpEBiw81XE1tg7Gormf/fCw57mQHqKBl
FSr8G5T+JpFVdMwm4k4yCL1HkT1aRQ3wXJm56WRIQMG1wBrRpmsAuoUltEQvB8fr
ZmAyBhElsuB9VW5EJPNYINWPERXTwAgy4RQm9E1YfonRYZlwFvmKZVBgkFqY6ILt
40cONShzCDYmBC87HsR5cNEQZN3m5G0wdeblD4Q8yv8ll821GPEkY/n9dOAfBukD
NhKtE7mxOowKe978NUgP4QhxGbqF5rTZeYwIgmkIyMd9pwn6kJuMESNp6WftKiZ5
Rv8qD9bMdSR789Mub0uTA+IRZF11zg==
=AhGB
-----END PGP SIGNATURE-----

--Sig_/bgHJd+WFM5_7hbJRAgrSwjw--

