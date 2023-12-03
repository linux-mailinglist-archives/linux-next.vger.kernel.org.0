Return-Path: <linux-next+bounces-193-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76125802842
	for <lists+linux-next@lfdr.de>; Sun,  3 Dec 2023 22:59:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17E82280CDB
	for <lists+linux-next@lfdr.de>; Sun,  3 Dec 2023 21:59:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E33B3199D1;
	Sun,  3 Dec 2023 21:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="CT+m6Zjq"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47620D5;
	Sun,  3 Dec 2023 13:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1701640776;
	bh=jOZ2ydFmcCUIltUjegzVrxzH+K2UgOk9snLESSEWhMU=;
	h=Date:From:To:Cc:Subject:From;
	b=CT+m6ZjqUgfxRqpBfuomKCQj2kbTuZjj3K4usTC4bzkPPAYp7BQBp3yvKAZj8wxRC
	 tfg58uI0INgzboVflxT7oAxwHnJg70v+QpgW7YnBriK4vl1z6WWtd5IzUEWg9fOd5h
	 nbnwcU/EaXuP9ODYYAq4X9ZEtLIbQVAoaLeVLiK/sx8jLNKn511WIKHAxq0tTsOKKI
	 Hg8jmxtGhr3ILgKYfF9bCqfo2vC0bB952zokHiR6kpJtmoJzd8qpM9Tqzs2FBVU3x8
	 y3Wqnw6mldaN6hRUwEWyAHWF0j+0PUyBs0/t/A2BvIRwFeGuBBCFuYlS8y+OGdaBVr
	 kMxt+8lsWX5Lg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Sk1143rStz4xVP;
	Mon,  4 Dec 2023 08:59:36 +1100 (AEDT)
Date: Mon, 4 Dec 2023 08:59:17 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Kees Cook <keescook@chromium.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tags need some work in the hwmon-staging tree
Message-ID: <20231204085917.42dae9fd@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/aonhYZtP_tWotU+q+9QTgrj";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/aonhYZtP_tWotU+q+9QTgrj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commits

  43a2b23f31e3 ("hwmon: (nct6775-core) Explicitly initialize nct6775_device=
_names indexes")
  06d0522c544c ("hwmon: (nct6775-platform) Explicitly initialize nct6775_si=
o_names indexes")

Fixes tag

  Fixes: 8cd470cda3fe ("hwmon: nct6775-i2c: Use i2c_get_match_data()")

has these problem(s):

  - Subject does not match target commit subject
    Just use
        git log -1 --format=3D'Fixes: %h ("%s")'

--=20
Cheers,
Stephen Rothwell

--Sig_/aonhYZtP_tWotU+q+9QTgrj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVs+jUACgkQAVBC80lX
0GwQYggAh2QrVQc/oKWnAijeSZOWYpUJPRu9mXcgBAGCl8ahS5uX/gkDg/iY2UqX
J3KnVYzJ0+ATN2Rn4IzxUw1uYPe7C5UMtPWGzf4v5zjoX3KvnVAxbbvWXUSA2Gb0
OoJtEFj2HURSt2T+++zNFW5cAH8/J4gqO8Vj51rwhDsfiNhhbjNmfWLuejS3tpp0
jOJrC5dQFaAvckyPdhhDlY174Pa0RqCUb+VaHPuF2W3xhXEiHnaGWKD3Xj5zWvtr
TtdA7m5AmeYWI23SZ1KLBZsQHn5t1yPKOlokiBGKPjYmG7v8H4W1WqDND2pTpY9p
Sor0XyeVAHxWrZgYboUADmqysgrr5w==
=hYXR
-----END PGP SIGNATURE-----

--Sig_/aonhYZtP_tWotU+q+9QTgrj--

