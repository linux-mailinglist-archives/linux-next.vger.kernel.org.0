Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07402413FBD
	for <lists+linux-next@lfdr.de>; Wed, 22 Sep 2021 04:45:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230184AbhIVCrG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 21 Sep 2021 22:47:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230138AbhIVCrF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 21 Sep 2021 22:47:05 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AA40C061756;
        Tue, 21 Sep 2021 19:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1632278732;
        bh=hWiLtS4XirMMOHneopgK0pThAHTU9okUOxMQqpyNWys=;
        h=Date:From:To:Cc:Subject:From;
        b=gFXfokEwMrFp6R5ff50DyldVtClNRWeNY9r0K0ln+UhWLWzguiABwU17hYdqoQKA7
         4kvyCBQ6dyfnLrg5x/Sg8zjj8lXXM7QUgkkHYMQgk64yAQ7yajKF+8G1RNtZSMH3/d
         ZnrrXI+qgVwh5Wir7YASP37pYxo6KwSlu/i1l5lUMD1V9k77xwoMExPUtS/4Bqt07+
         JIlA58ZlujrCo0eQW6yJEaxODCacaN9fCMrcqDdZYL79gQE6IAmDHRN5e+EIwT4HDW
         HaalyVBOMBAQsrBROLyqh4b/oWDA58UCSDSi/N03nxZh/gu6mf5dakv/e/3n0Onj+o
         TdtK1HAq8FyJg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HDjMb4HR1z9sW1;
        Wed, 22 Sep 2021 12:45:31 +1000 (AEST)
Date:   Wed, 22 Sep 2021 12:45:30 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Larry Finger <Larry.Finger@lwfinger.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the staging tree with the
 staging.current tree
Message-ID: <20210922124530.50a4750b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+AgY_Gn80RN129/8p04SQz6";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/+AgY_Gn80RN129/8p04SQz6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the staging tree got a conflict in:

  drivers/staging/r8188eu/os_dep/ioctl_linux.c

between commit:

  aa3233ea7bdb ("staging: r8188eu: fix -Wrestrict warnings")

from the staging.current tree and commit:

  7bdedfef085b ("staging: r8188eu: Remove mp, a.k.a. manufacturing process,=
 code")

from the staging tree.

I fixed it up (the latter removed the code updated by the former, so I
did that) and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be mentioned
to your upstream maintainer when your tree is submitted for merging.
You may also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/+AgY_Gn80RN129/8p04SQz6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFKmMoACgkQAVBC80lX
0GzwyAf+OT9Vo6hgVaAZSYpoStjwgCXK3eKpqfTKZ8GjhEc0ILCwqCOqT1m0dazZ
gS0JcP/r9e2GIN/MhKOUWrNwG/bymYz9EHgwiPP1bMrwCjfHEma12fLejIvMbKI+
H+9EthEBoX7mwzYmF0H3wt7UMmsijPWd8Lj2B+cI6UI/c1NedY9Mc1DmrAD6s124
Qe98eoxNKBNUDCUe1FYgkqiYj7jlnFat9SR17RklhewnYwBoErW8twGg2nJ9gS2I
c7MK3RAMRa9b3CjDDrr2lR9FXVMPCvKA1dkvybT85yEHZdiQtyuy6UrKMeCDoKqQ
cnMZ1bABbs4OpbbPgHg9e2jLDvTJ9g==
=1D4s
-----END PGP SIGNATURE-----

--Sig_/+AgY_Gn80RN129/8p04SQz6--
