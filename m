Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB939FD1CF
	for <lists+linux-next@lfdr.de>; Fri, 15 Nov 2019 01:05:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727176AbfKOAFF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 Nov 2019 19:05:05 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:36653 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726767AbfKOAFE (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 14 Nov 2019 19:05:04 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47Ddrs3T92z9s4Y;
        Fri, 15 Nov 2019 11:05:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1573776302;
        bh=Z8Krf4nl7BbTsHQgKDM3eQflPpkr4JmWXdsfcFOegaY=;
        h=Date:From:To:Cc:Subject:From;
        b=QQ9f3DZxjf8hS5vTXW1B5lISqfqsM2Au0I2HCoN5g611wYFOJXfbkVy915drYYv18
         gzVO5flDOkJtYV3L2YDTG39ZHpsECZjiJdDwjmbq/1hgcVtsDQFrc1InFmjEH0ww8u
         HPaEL0f3gHy6uCTlh88c6WDJkxXmb1z7hMJT6VY+EnyA6i4sQpVzLCjDH4mNdCVl/7
         lC0OH7FD3ssgRai4fGRx1sRXCqtVQVvB7dEAqB5/87nOOgTRVwj3mdRlOxppnFFSX9
         HSeXbfyJo51uNHM+3yk19zfoU/aA8kGZ17dNn+EsFmsNrVp2BpSzEJ3J8dqlfCeZ8U
         ovbtkHZRH5zWA==
Date:   Fri, 15 Nov 2019 11:05:00 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Petr Mladek <pmladek@suse.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Uwe =?UTF-8?B?S2xlaW5lLUs=?= =?UTF-8?B?w7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: linux-next: manual merge of the pm tree with the printk tree
Message-ID: <20191115110500.2bad45b2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8dHD0qGh0F9UnYxbYqUlngQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/8dHD0qGh0F9UnYxbYqUlngQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pm tree got a conflict in:

  scripts/checkpatch.pl

between commit:

  1d28122131b2 ("checkpatch: don't warn about new vsprintf pointer extensio=
n '%pe'")

from the printk tree and commit:

  3bd32d6a2ee6 ("lib/vsprintf: Add %pfw conversion specifier for printing f=
wnode names")

from the pm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc scripts/checkpatch.pl
index 4b40445938dc,3d1f08fa091c..000000000000
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@@ -6019,10 -6020,13 +6020,13 @@@ sub process=20
  				my $fmt =3D get_quoted_string($lines[$count - 1], raw_line($count, 0)=
);
  				$fmt =3D~ s/%%//g;
 =20
- 				while ($fmt =3D~ /(\%[\*\d\.]*p(\w))/g) {
+ 				while ($fmt =3D~ /(\%[\*\d\.]*p(\w)(\w*))/g) {
  					$specifier =3D $1;
  					$extension =3D $2;
- 					if ($extension !~ /[SsBKRraEehMmIiUDdgVCbGNOxt]/) {
+ 					$qualifier =3D $3;
 -					if ($extension !~ /[SsBKRraEhMmIiUDdgVCbGNOxtf]/ ||
++					if ($extension !~ /[SsBKRraEehMmIiUDdgVCbGNOxtf]/ ||
+ 					    ($extension eq "f" &&
+ 					     defined $qualifier && $qualifier !~ /^w/)) {
  						$bad_specifier =3D $specifier;
  						last;
  					}

--Sig_/8dHD0qGh0F9UnYxbYqUlngQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3N66wACgkQAVBC80lX
0GyNNwf+MljcLS7Y6Hc82Z8yOBygn97YfuFT6keFtfO3L8o/7YuwoS8AcG1C1y1F
spRnriouGH3pwp70UyJequEDNihIYitSwj4ttSHOLJcf13+4Du7tTqKzrug5I3Bi
u3qUpC8F/74vjHLj8edRppXbHAdCBiIp4MKDp1cg6xJXbOxvewKQAzObDkHroBwY
Pj9lm/laWe9biZvXQVVAj6oOpJHkLamwQyjqLipi+fG1fRW9kZga1PFCQZOxDYiz
ggfop/qjoaaaeXzLfVGBORW8FRi1RLAjz6lkr1HZERsw8vHj0j1hVZn3Qp7XGiKF
+LGxhwr5aBqRZNiRa3Gul7OS+BC0OA==
=tIuk
-----END PGP SIGNATURE-----

--Sig_/8dHD0qGh0F9UnYxbYqUlngQ--
