Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 279563020FB
	for <lists+linux-next@lfdr.de>; Mon, 25 Jan 2021 05:14:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726707AbhAYENz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 24 Jan 2021 23:13:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726652AbhAYENz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 24 Jan 2021 23:13:55 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 064C8C061573;
        Sun, 24 Jan 2021 20:13:14 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DPGgW0PzCz9s24;
        Mon, 25 Jan 2021 15:13:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611547991;
        bh=0zRp2f+FnEeYPYUg0U+E8NnwFQ5VNR7q+AeuQvaXrXI=;
        h=Date:From:To:Cc:Subject:From;
        b=gPyCx8Bq9myqWhNRyXJZLqzN2Y9x9hWpzHQcJIeuhXjRvMqtZQKCOkKqp3v6m4Oii
         sDXtO7NWHlypQdLJoqaH0ZnP6RebQuPMEYNeC0bdX7OZ6Qb6+61wlypjduwitPp5DT
         7uIMNfV1I9SbN3bm7tuRWYHHAZZ/lZlINN+N7Tej08Ay22hVofwHyKVnahyMycw2Vo
         hM9hVtIOzsOquUyUyz7W6SPEnFcnevo2Y3/QM/c3kwLv4cKDexUfcqbPsmY5AmOg68
         Xw8SuxTQbYeWw61k6QFdintWl/0Gr6ODzJniyJg3dOMgFknULOfUDPqo9EC26Fquxy
         8iUtIh8yr/xzQ==
Date:   Mon, 25 Jan 2021 15:13:10 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     Douglas Gilbert <dgilbert@interlog.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the scsi-mkp tree
Message-ID: <20210125151310.20e71400@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+hhkXc1x=fIunLL/Pg+S1Ej";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/+hhkXc1x=fIunLL/Pg+S1Ej
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the scsi-mkp tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

drivers/scsi/sg.c: In function 'sg_find_srp_by_id':
drivers/scsi/sg.c:2908:4: error: expected '}' before 'else'
 2908 |    else
      |    ^~~~
drivers/scsi/sg.c:2902:16: warning: unused variable 'cptp' [-Wunused-variab=
le]
 2902 |    const char *cptp =3D "pack_id=3D";
      |                ^~~~
drivers/scsi/sg.c:2896:5: error: label 'good' used but not defined
 2896 |     goto good;
      |     ^~~~
drivers/scsi/sg.c: At top level:
drivers/scsi/sg.c:2913:2: error: expected identifier or '(' before 'return'
 2913 |  return NULL;
      |  ^~~~~~
drivers/scsi/sg.c:2914:5: error: expected '=3D', ',', ';', 'asm' or '__attr=
ibute__' before ':' token
 2914 | good:
      |     ^
drivers/scsi/sg.c:2917:2: error: expected identifier or '(' before 'return'
 2917 |  return srp;
      |  ^~~~~~
drivers/scsi/sg.c:2918:1: error: expected identifier or '(' before '}' token
 2918 | }
      | ^
drivers/scsi/sg.c: In function 'sg_find_srp_by_id':
drivers/scsi/sg.c:2912:2: error: control reaches end of non-void function [=
-Werror=3Dreturn-type]
 2912 |  }
      |  ^

Caused by commit

  7323ad3618b6 ("scsi: sg: Replace rq array with xarray")

SG_LOG() degenerates to "{}" in some configs ...

I have used the scsi-mkp tree from next-20210122 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/+hhkXc1x=fIunLL/Pg+S1Ej
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAORVYACgkQAVBC80lX
0GyRZQf/X8Qlmo2KEBELDlREkqpbBC1B56zvbP0HFBm/GO90zGe1QYeyl6LFm8e+
xlQIrxhKrJk4sza0c30ZV1uPDRNzNUwhq/YvFigt6ShprWnmYAx3Ap879t3i5hhK
yUF3vmX9aTilOID9QdAwA/zWbmU7/bFE8WZukqRn1BB3A7YYIgAsYD635ud5TVQt
lrEmcie4FwFrxYesEn/IEY+iLUzEDGpfgLkyQMTpL+LbxBRD9W4FV7D0MBorurqw
WGQZAEaNUVhzPPrhmtPBTfGBRZ7mVJLgJYMcmOpXgEJ+JOqvL6WuPWlesg46z1Hn
7EYuy6Q83zHJpc9+4N7n70jSyHKTnw==
=2O5f
-----END PGP SIGNATURE-----

--Sig_/+hhkXc1x=fIunLL/Pg+S1Ej--
