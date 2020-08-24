Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73EFD24F0B5
	for <lists+linux-next@lfdr.de>; Mon, 24 Aug 2020 02:29:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726765AbgHXA3D (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 23 Aug 2020 20:29:03 -0400
Received: from ozlabs.org ([203.11.71.1]:38199 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726737AbgHXA3D (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 23 Aug 2020 20:29:03 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BZXzv4Gb0z9sPC;
        Mon, 24 Aug 2020 10:28:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1598228941;
        bh=vHs4RTWcZM5T3fu2Aa9rbVkBMT/eMxX4oKyudLhBnWc=;
        h=Date:From:To:Cc:Subject:From;
        b=bY8Fx18r17qxgxX1fLNE5HlLn9B1vHUmnsj3alS/3F9UhnMjghoXIdsC+N+HL3zw2
         hs+Ah49qlj9VSP8vFycRLkbZP32bqvqpOnn8CjFL3PAqDmUrIxbgkLeV1BOEXpqNdb
         /iw4HZP7aCb7WAwYjWyGl5BAXZ7m+jaOCTX5iL8tfhX7lGOlxb6yj827osd/pXI/kE
         5yg4jV8uCu6W860we2Qna8A2SvoiVAeCFsdGjROws/HWnMFCvenw8tipaxKEQXhKLx
         5wXilOU7fXD6yzX4UktoG3+3vgwa1GB9ireX+yRUmYNh3yhd99K56EdZQ0pSz1RNZS
         CmT1gf8P193Nw==
Date:   Mon, 24 Aug 2020 10:28:58 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stephen Kitt <steve@sk2.org>,
        Alexandru Tachici <alexandru.tachici@analog.com>
Subject: linux-next: build failure after merge of the hwmon-staging tree
Message-ID: <20200824102858.5554a2b2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.lLsBfq8uOnJ6g0GogGX27A";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/.lLsBfq8uOnJ6g0GogGX27A
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the hwmon-staging tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/hwmon/pmbus/adm1266.c: In function 'adm1266_probe':
drivers/hwmon/pmbus/adm1266.c:478:31: error: passing argument 2 of 'pmbus_d=
o_probe' from incompatible pointer type [-Werror=3Dincompatible-pointer-typ=
es]
  478 |  ret =3D pmbus_do_probe(client, id, &data->info);
      |                               ^~
      |                               |
      |                               const struct i2c_device_id *
In file included from drivers/hwmon/pmbus/adm1266.c:20:
drivers/hwmon/pmbus/pmbus.h:492:73: note: expected 'struct pmbus_driver_inf=
o *' but argument is of type 'const struct i2c_device_id *'
  492 | int pmbus_do_probe(struct i2c_client *client, struct pmbus_driver_i=
nfo *info);
      |                                               ~~~~~~~~~~~~~~~~~~~~~=
~~~~~^~~~
drivers/hwmon/pmbus/adm1266.c:478:8: error: too many arguments to function =
'pmbus_do_probe'
  478 |  ret =3D pmbus_do_probe(client, id, &data->info);
      |        ^~~~~~~~~~~~~~
In file included from drivers/hwmon/pmbus/adm1266.c:20:
drivers/hwmon/pmbus/pmbus.h:492:5: note: declared here
  492 | int pmbus_do_probe(struct i2c_client *client, struct pmbus_driver_i=
nfo *info);
      |     ^~~~~~~~~~~~~~
cc1: some warnings being treated as errors

Caused by commit

  9832ecffd8f8 ("hwmon: (pmbus) Add support for ADM1266")

interacting with commit

  d46dc459db38 ("hwmon (pmbus) use simple i2c probe function")

I have used the hwmon-staging tree from next-20200821 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/.lLsBfq8uOnJ6g0GogGX27A
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9DCcoACgkQAVBC80lX
0GxVJgf9FBfGDPCdyvIcnk7535AEPUTXPEgAvQmAlEubLxbOe/TCk/nePS/IRK/D
vcojQdq1yQre2/WvN4gDHmANfvQRAzAvx2zn/ZbTgPf/G+5sySYl2o2CSbuJgfM7
OvouEOQJN7x16oMR0/9eQxRY7Cgk7w8lJkV0Yvb3O+YblCJIJJvJk6wzXAThY5In
/eKNhjxpMWCHFPyKkcI9ALnEQvvyqsrZTilk4/6lhFY6w5b1sUAnZDgjpkKcTg7m
w0mRY+x7eS776/XzIxhNdFx/5gi9N/JwRcMTKZ7eYGE9awPLmZIt6lE9ybln4F92
NcoHaldBz2bLllX0XHfSr3BEKFJKMg==
=0W4C
-----END PGP SIGNATURE-----

--Sig_/.lLsBfq8uOnJ6g0GogGX27A--
