Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D02D223FD51
	for <lists+linux-next@lfdr.de>; Sun,  9 Aug 2020 10:19:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726175AbgHIITI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 9 Aug 2020 04:19:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725710AbgHIITH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 9 Aug 2020 04:19:07 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1306C061756;
        Sun,  9 Aug 2020 01:19:04 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BPX740SrZz9sPC;
        Sun,  9 Aug 2020 18:18:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1596961137;
        bh=uKWy2IfgEzOHSNPz/t4uOiupkdhItCM53w/SOe9uhhw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=bfmNLCMBbaeig7U1WRCbHz0RkVzXFNCjsx9r3w/i98bnVR0HeyxWvNp5pOjdKsAH3
         W822EQCeJEmB4TNkwIPBI1trMhgLofw5jLvDobhW/l3K1A8qRuVSzosi/TLEpfCJMO
         PqdQs7JuGb5Uu4w+qgpIjMsqwjpQeDQ0SyStAUXRvV3SiK5YTmeqDYz6kfP1CURH1+
         ee6X4mjuMLDeJ2P5FOp4kiBSpIce1r67cFK1MejddepNDPTIhy95PrDGhhv9g+3Fp3
         I6vIebu7Ek6GCu7g/y8OCTCtTEXOvtZ26dzFdTeNHhmH366AnV1CsaS9s5ii7w+9sk
         Sho3Mmi0OLMNg==
Date:   Sun, 9 Aug 2020 18:18:38 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alan Maguire <alan.maguire@oracle.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: build failure after merge of the thunderbolt tree
Message-ID: <20200809181838.23c6b829@canb.auug.org.au>
In-Reply-To: <20200630160346.696f6419@canb.auug.org.au>
References: <20200630160346.696f6419@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uLNdZKn8oKfs6EIHutgeU2g";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/uLNdZKn8oKfs6EIHutgeU2g
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Tue, 30 Jun 2020 16:03:46 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the thunderbolt tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
>=20
>=20
> Caused by commit
>=20
>   54509f5005ca ("thunderbolt: Add KUnit tests for path walking")
>=20
> interacting with commit
>=20
>   d4cdd146d0db ("kunit: generalize kunit_resource API beyond allocated re=
sources")
>=20
> from the kunit-next tree.
>=20
> I have applied the following merge fix patch.
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 30 Jun 2020 15:51:50 +1000
> Subject: [PATCH] thunderbolt: merge fix for kunix_resource changes
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/thunderbolt/test.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/thunderbolt/test.c b/drivers/thunderbolt/test.c
> index acb8b6256847..a4d78811f7e2 100644
> --- a/drivers/thunderbolt/test.c
> +++ b/drivers/thunderbolt/test.c
> @@ -17,13 +17,13 @@ static int __ida_init(struct kunit_resource *res, voi=
d *context)
>  	struct ida *ida =3D context;
> =20
>  	ida_init(ida);
> -	res->allocation =3D ida;
> +	res->data =3D ida;
>  	return 0;
>  }
> =20
>  static void __ida_destroy(struct kunit_resource *res)
>  {
> -	struct ida *ida =3D res->allocation;
> +	struct ida *ida =3D res->data;
> =20
>  	ida_destroy(ida);
>  }
> --=20
> 2.27.0
>=20
> --=20
> Cheers,
> Stephen Rothwell

I looks like the above report got lost along the way to you :-(

Here's the patch in case you want to directly apply it:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 30 Jun 2020 15:51:50 +1000
Subject: [PATCH] thunderbolt: merge fix for kunix_resource changes

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/thunderbolt/test.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/test.c b/drivers/thunderbolt/test.c
index acb8b6256847..a4d78811f7e2 100644
--- a/drivers/thunderbolt/test.c
+++ b/drivers/thunderbolt/test.c
@@ -17,13 +17,13 @@ static int __ida_init(struct kunit_resource *res, void =
*context)
 	struct ida *ida =3D context;
=20
 	ida_init(ida);
-	res->allocation =3D ida;
+	res->data =3D ida;
 	return 0;
 }
=20
 static void __ida_destroy(struct kunit_resource *res)
 {
-	struct ida *ida =3D res->allocation;
+	struct ida *ida =3D res->data;
=20
 	ida_destroy(ida);
 }


--=20
Cheers,
Stephen Rothwell

--Sig_/uLNdZKn8oKfs6EIHutgeU2g
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8vsV4ACgkQAVBC80lX
0GxxvggAkwBgTVCErSJxweAYYV171zZEPU7+MpFd4WzZsJSxG0Bih2yrOF9TMqKj
WN3IFrliFsTAZUIrSFZ83NHBT3v4Lk5V/t0cdHiDHDdVJrcA5twlA6cGwjl/Qjqc
NVmOIIEFg1GsVHMhtDzHxqz2G8uMBrICkkgqSh5Ys6fQV6kwifqDcKj0ufpudbRV
AL+PVLMbiaEvlaisSw4e/qkcOktDIyvy76pSGg3wwZJCshv8G1FXDFwTFk6gqaVx
aVweehWuIq7JPl8Su8NqvSoCL3PW5Uj0TkYZ4OSZY5hNNh101Z1iCWXlBKeNoGEf
L6hRJajG+g1mlSrzLPLcGKWrkjVYHg==
=eU45
-----END PGP SIGNATURE-----

--Sig_/uLNdZKn8oKfs6EIHutgeU2g--
