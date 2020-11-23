Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67DAD2C172E
	for <lists+linux-next@lfdr.de>; Mon, 23 Nov 2020 22:05:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729128AbgKWVBi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 23 Nov 2020 16:01:38 -0500
Received: from ozlabs.org ([203.11.71.1]:52513 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729041AbgKWVBh (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 23 Nov 2020 16:01:37 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cg0274T0Vz9sRR;
        Tue, 24 Nov 2020 08:01:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606165296;
        bh=6WqTPvVrk4DrbRnfWcKb8zJuICCbIIK+2h1ib4tSU/U=;
        h=Date:From:To:Cc:Subject:From;
        b=DebVeoqWUkd8uHdwvwbfyGZnMDJQTB/XAXsqqljuU/amH9OS5Oq5SQiUInBuUA24z
         a3QDUnx7A/la5PtcJ/ymFqECEbCjlBbvHJ9LI+CoXHrKPVRBmX97yXh4hmNpQa0eZq
         Wge8iZvRj9YzWdCK3Nn7d1/yPIRbJXKS18oC78bKIGhDJUVKixcEEkrqHweATfHJWq
         RlotFvDVzsoACA5ZIew0iRZbiPucEzUOWa72zeXf/mD2E8hV1zTZIFsykzq9nhF4Kh
         DVdCRzbzmCnJb8DG5/7EqR6kkdo3pCAMfGjDETtFFihTwDwjiy2pTKwaz0QfrMopWD
         Gko/vGwRRU5FQ==
Date:   Tue, 24 Nov 2020 08:01:34 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Yong Mao <yong.mao@mediatek.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the mmc-fixes tree
Message-ID: <20201124080134.3f222582@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/p.jD877KEFyO3HyhEOJv7wq";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/p.jD877KEFyO3HyhEOJv7wq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  effbafb07dd6 ("mmc: mediatek: Extend recheck_sdio_irq fix to more variant=
s")

Fixes tag

  Fixes: 9e2582e574 ("mmc: mediatek: fix SDIO irq issue")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/p.jD877KEFyO3HyhEOJv7wq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+8Iy4ACgkQAVBC80lX
0GxsEQf/RCu2HuAHAbU6P9HWRMN7NseEU+zqUgZUstrCAyHlxrNylPvx5++19Swt
fdXLaya4gZHCSTMtD2ceTv5GxaI5HAHyccUYSsDZGEPx3g999JtLUKM8l3etgQUV
lcqKjVuyqYnnVh/H5rs97mC482p2xlcteU0FNGW4A/N75wHgjHuoBdLxQNHAqbPM
5+wmSjeubYdApcveorJiNS6AN5qctG+7Y7rICY72eyMiYEThuvcpNb9Ct5EX6gcT
T7ngT1nx9ejlyJcifhjq57NDlZJaxx+6c4Ls0eZ9S3J00LiRe+QotvV9luBlmMIF
L6CDh2aTDgLEOgy6MeIKtve463JiFw==
=XjLj
-----END PGP SIGNATURE-----

--Sig_/p.jD877KEFyO3HyhEOJv7wq--
