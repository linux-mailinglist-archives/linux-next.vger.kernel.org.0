Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B3C83C938C
	for <lists+linux-next@lfdr.de>; Thu, 15 Jul 2021 00:04:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236382AbhGNWG6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 14 Jul 2021 18:06:58 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:46019 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229498AbhGNWG6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 14 Jul 2021 18:06:58 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GQBNh20QQz9sWc;
        Thu, 15 Jul 2021 08:04:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1626300245;
        bh=WZ9wco8iKW5aKoUM+qGopusHAQjyc1TOO6yGt0u9ai4=;
        h=Date:From:To:Cc:Subject:From;
        b=FtrZ4irDHECurbleNmP304g679tajhlKuB/gZvr5TEzyrIz1beg9ejzADlCHH1IvN
         9aaMyt0IPwdCSBJbME1NKvg5WEhFzwqoVkWA4qukLm64ZMQBzJUSnEuh4bAXU1qDiN
         lTY7gvkc/9eU+aS3jnAoPFrksaG8WIoryG+qDtdHmZsOZBfPctq69ljKlCA11bCM0F
         9RBnoxnBZOqvXRDSR2WIksv+A8AAAG//ZiRCWbShLPrOS3rPl1PD58vJmLTlRDvtOE
         8IB2XmdSd4GelJJj9Q9Mqg0C7H0T6bMj3yA9tkmNft41sl/gYZg/R5QlJ2jHgSTaxt
         inkfWh1xr3klg==
Date:   Thu, 15 Jul 2021 08:04:03 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Shawn Guo <shawnguo@kernel.org>
Cc:     Lucas Stach <l.stach@pengutronix.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the imx-mxs tree
Message-ID: <20210715080403.0431c489@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Et6RZG8qmJoZXyPqCT9OSMq";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Et6RZG8qmJoZXyPqCT9OSMq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  f5adb50e9aa3 ("Revert "soc: imx8m: change to use platform driver"")

Fixes tag

  Fixes: 7d981405d0fd ("soc: imx8m: change to use platform driver"")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

Probably not worth rebasing for.

--=20
Cheers,
Stephen Rothwell

--Sig_/Et6RZG8qmJoZXyPqCT9OSMq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDvX1MACgkQAVBC80lX
0GwuQQgAmRcGwVDkVhXWD64o1qQy1K/Rbd06ZdbAt+OgWM9g2h250xsLHM7LzF4c
n5h9TFaGhoYT5hAADZSUuoBAnLXBs4luNmLSaauV/lUKRSAPwWoDZq0R7nswsYT2
pXFALk6EC7fUFz4Z+TLsJIPSBxAaiLDu4bliBpqqGyTDFshUbh7F+R+TCXPVGLaL
KVOO7EIaHu0jYTVV761lg0+et5EwG0gl+gWS1vyQEjd9PIONRqQYe1b3GZCAjm2w
c2YjREwTEFicsyeX0ocYTXIsICiluCjBFZTtGAPMzBfH2CL6SKM5EkHZQQVQiOj1
TpcQ/2TJQbspGIvylXYqLSr/ZEMraQ==
=jzmn
-----END PGP SIGNATURE-----

--Sig_/Et6RZG8qmJoZXyPqCT9OSMq--
