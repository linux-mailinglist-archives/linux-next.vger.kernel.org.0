Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF28B2A21DF
	for <lists+linux-next@lfdr.de>; Sun,  1 Nov 2020 22:24:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727033AbgKAVYW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 1 Nov 2020 16:24:22 -0500
Received: from ozlabs.org ([203.11.71.1]:54263 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727016AbgKAVYW (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 1 Nov 2020 16:24:22 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CPTZV5nZVz9sVH;
        Mon,  2 Nov 2020 08:24:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1604265860;
        bh=xOnVOpZk/z3UruF0MWGzkNThIDOcfMIJNe1idDp//80=;
        h=Date:From:To:Cc:Subject:From;
        b=LAznYQ4CMfMv0CGZek9E0lNg1E5g2p40HXK/EFleiyknWmhoLdHWao5d7EU9ElgKV
         qFydObdhs1lkYwaRGeNWz3t9GiGP0Uh6Dx5K2GRkXVrPKfxEn7E+jrbZblziCinoNE
         dplMHM+VVhfTAQ2PXNzkCIUp8RigkxJYojILSn2FHBYLbgxAbVco89KJn+TjpXQ8sd
         J1N1byCOOT/yQc4u9taT7+v4HwSKGTST1bg1RBr3VEOGrbEKDDmkgD2tprWwxDDnC8
         q+l+va6hJ+zz2/fpV7muwencdx3E9TasTPjBSYNuDsKGGhV5WIbmG4otXBuGwX4UcK
         x47ZfOMpjQ9Yg==
Date:   Mon, 2 Nov 2020 08:24:13 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Shawn Guo <shawnguo@kernel.org>
Cc:     Oleksij Rempel <o.rempel@pengutronix.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the imx-mxs tree
Message-ID: <20201102082413.0087d34b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/o390T4FjXu.DOFbkVcXwtKs";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/o390T4FjXu.DOFbkVcXwtKs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  d969e9c05f83 ("ARM: dts: imx6q-prti6q: fix PHY address")

Fixes tag

  Fixes: 0d446a50559 ("ARM: dts: add Protonic PRTI6Q board")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/o390T4FjXu.DOFbkVcXwtKs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+fJ30ACgkQAVBC80lX
0GysuQf9GLFkAKjvycaB+GkgUWEreXfb6lLEoF+L/TKRwLevr1UQ6KZfyW5L+iqF
A9YvwH7hpDhaqq9OW2d6aMpXGREiDh/bpmqUcfggoHg0GGyJ8ooUpXNlZ0hu3qD8
cTM8NtvDRgm2f5qMY8CgqvLbFDsQRu8IqitDQ0jklPMavlFRwVxjVDd+TK9lqFXV
1H/YsTTdzbc7bXeiivA9oZBnhilUfk4SDZvS+6ieg17QTZ/G9+zDLmDNhxl2CC7S
ysRRAk+x4stXaf0roZmJqBOJDLYA/kftNDoPFR/lsf2d9EnIdK0FYChUBa8wrsJs
U49gaMa/wJhI31f3/F1ng6NajKrstA==
=kF7V
-----END PGP SIGNATURE-----

--Sig_/o390T4FjXu.DOFbkVcXwtKs--
