Return-Path: <linux-next+bounces-347-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B57280E284
	for <lists+linux-next@lfdr.de>; Tue, 12 Dec 2023 04:12:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07BB528238B
	for <lists+linux-next@lfdr.de>; Tue, 12 Dec 2023 03:12:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB1EE525F;
	Tue, 12 Dec 2023 03:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="TnvYOyi2"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8496CA0;
	Mon, 11 Dec 2023 19:12:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1702350730;
	bh=gp6e0CjpYzTfweZHrhPCpFYj23TVC2Kc6wxzQsjXuUA=;
	h=Date:From:To:Cc:Subject:From;
	b=TnvYOyi2W9RR7HEFHILNlbS4EMMJm6/0pd1bHDODwGe3Phy4BoJbA8e9bCUVUwrxg
	 iqZBAcMMv1uMFQfk7lJspKCKv2fdsrpdYo+M0YbVEQirHWe9gKtFS/Pj5QhiBpfPTN
	 IR2UMYO82IAvrghqiQghG2NJ7QuAoeG/qgPVNjOYdRZB/FtCqcv1ZR8ir3F0J3Iqm9
	 0S1qqizj5f/1zS4LFbHhQV88rjL/e7sBIPpN/JQSwVzMx4AKPOh11wo4PpaQC6tJFJ
	 f6Ec8jnhWdLC9o88CP52D7ePcP41KL8B8EUszSUpmfgudGoJsnhnX5bWANmW88xc8l
	 2u4g/4mv/e+DQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Sq3Z174hCz4wc1;
	Tue, 12 Dec 2023 14:12:09 +1100 (AEDT)
Date: Tue, 12 Dec 2023 14:12:08 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the hwmon-staging tree
Message-ID: <20231212141208.42ece7fd@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RQ_/sx5xwmKjlfvedWg=mgj";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/RQ_/sx5xwmKjlfvedWg=mgj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the hwmon-staging tree, today's linux-next build (htmldocs)
produced this warning:

MAINTAINERS:27997: WARNING: unknown document: '../devicetree/bindings/hwmon=
/ltc4286'

Introduced by commit

  892a1aa5d051 ("dt-bindings: hwmon: Add lltc ltc4286 driver bindings")

--=20
Cheers,
Stephen Rothwell

--Sig_/RQ_/sx5xwmKjlfvedWg=mgj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmV3z4gACgkQAVBC80lX
0GwDgwf9GlNJ+bj/bA41hLvjhSxo0zswbqfs5eAkPqOQ/PJsmngkqSZTreY+Ou/5
yiVKXy5TZlz2sulcWuOFKTQIj8ZhGAlbYVhJ7xhdNuYd6YEUJcInpFuVs8b8HlGQ
WzdQ8/ZWdOynbCO/KXDMNHtcHUCMRbLzYcHuShzU5BJD6JDiRJ85pajp6lN6dXFm
6KKe8mLtdv2g+/hpcKNRFhHtp8tiiffDs+Tbg7Lg512p5aSfPCk0cWx1h++VeM1F
o7VphXlCzBZc5Sn44xGtvxicllcy/FTYHnaPyiYShRIgEmOac/RYkUaewTB0TRpr
kYwR7h9B7LK+gCl2FygmccO6qBLmAg==
=O9FF
-----END PGP SIGNATURE-----

--Sig_/RQ_/sx5xwmKjlfvedWg=mgj--

