Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 790661FA52D
	for <lists+linux-next@lfdr.de>; Tue, 16 Jun 2020 02:34:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726327AbgFPAen (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 15 Jun 2020 20:34:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725960AbgFPAen (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 15 Jun 2020 20:34:43 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0569C061A0E;
        Mon, 15 Jun 2020 17:34:42 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49m8NK2hLjz9sSF;
        Tue, 16 Jun 2020 10:34:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1592267681;
        bh=zuyz2IEa2pQ5RbyG6lB4bbaQlmEn0QvhKM8+LE3vcu8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=WvrEP9giNi698VcarkNre4pEY2ti6PJTEDJVlm2BGVHJJU/54fHrebbye6Tl2im8k
         yHiVpWbkR1FkkNULkdSFnjx5tgY0/hZYvp7T1lUI/wXBwfJh/fTI95ixf9Omq8zVxG
         OUJLUV2mARwoImahFK4R2ZikKJ2YqpbXORYye3M6VLBXnVUZ/wOwyfB7chSI/THl+T
         TnOHpxKXdt5rQUP0dMD8LbQTpxV9rEKe7rkwJEuP6ZHZCA8f+eIXQTIsdhYfZhMQZ9
         A77TutVeseozH4bzpDCELM9BZbtYUtMCxOSLV7YmbDXq7JyENkt0uMd2DKzezE+RP0
         CFmtByO84mdQA==
Date:   Tue, 16 Jun 2020 10:34:40 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Al Viro <viro@ZenIV.linux.org.uk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: linux-next: build failures after merge of the vfs tree
Message-ID: <20200616103440.35a80b4b@canb.auug.org.au>
In-Reply-To: <20200616103330.2df51a58@canb.auug.org.au>
References: <20200616103330.2df51a58@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mZ3jaWAU0sdh/Kcki4EHBQO";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/mZ3jaWAU0sdh/Kcki4EHBQO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

[Just adding Herbert to cc]

On Tue, 16 Jun 2020 10:33:30 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Hi all,
>=20
> After merging the vfs tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
>=20
> drivers/dma/uniphier-xdmac.c: In function 'uniphier_xdmac_prep_dma_memcpy=
':
> drivers/dma/uniphier-xdmac.c:293:7: error: implicit declaration of functi=
on 'kzalloc'; did you mean 'kvzalloc'? [-Werror=3Dimplicit-function-declara=
tion]
>   293 |  xd =3D kzalloc(struct_size(xd, nodes, nr), GFP_NOWAIT);
>       |       ^~~~~~~
>       |       kvzalloc
> drivers/dma/uniphier-xdmac.c:293:5: warning: assignment to 'struct uniphi=
er_xdmac_desc *' from 'int' makes pointer from integer without a cast [-Win=
t-conversion]
>   293 |  xd =3D kzalloc(struct_size(xd, nodes, nr), GFP_NOWAIT);
>       |     ^
> drivers/dma/uniphier-xdmac.c: In function 'uniphier_xdmac_prep_slave_sg':
> drivers/dma/uniphier-xdmac.c:349:5: warning: assignment to 'struct uniphi=
er_xdmac_desc *' from 'int' makes pointer from integer without a cast [-Win=
t-conversion]
>   349 |  xd =3D kzalloc(struct_size(xd, nodes, sg_len), GFP_NOWAIT);
>       |     ^
> drivers/dma/uniphier-xdmac.c:373:4: error: implicit declaration of functi=
on 'kfree'; did you mean 'kvfree'? [-Werror=3Dimplicit-function-declaration]
>   373 |    kfree(xd);
>       |    ^~~~~
>       |    kvfree
>=20
> Also, from the arm multi_v7_defconfig build:
>=20
> drivers/dma/st_fdma.c: In function 'st_fdma_free_desc':
> drivers/dma/st_fdma.c:233:2: error: implicit declaration of function 'kfr=
ee'; did you mean 'vfree'? [-Werror=3Dimplicit-function-declaration]
>   233 |  kfree(fdesc);
>       |  ^~~~~
>       |  vfree
> drivers/dma/st_fdma.c: In function 'st_fdma_alloc_desc':
> drivers/dma/st_fdma.c:242:10: error: implicit declaration of function 'kz=
alloc'; did you mean 'vzalloc'? [-Werror=3Dimplicit-function-declaration]
>   242 |  fdesc =3D kzalloc(struct_size(fdesc, node, sg_len), GFP_NOWAIT);
>       |          ^~~~~~~
>       |          vzalloc
> drivers/dma/st_fdma.c:242:8: warning: assignment to 'struct st_fdma_desc =
*' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>   242 |  fdesc =3D kzalloc(struct_size(fdesc, node, sg_len), GFP_NOWAIT);
>       |        ^
>=20
> Caused by commit
>=20
>   f0187db056dc ("iov_iter: Move unnecessary inclusion of crypto/hash.h")
>=20
> I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/mZ3jaWAU0sdh/Kcki4EHBQO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7oE6AACgkQAVBC80lX
0GythAf8D+PEiTpq00ZTqEtbWw9fAx8JpqAFgUJGoMtGL2T92u8M3NAILswXMShf
O+cKniJCzTfxBjCgmI8eAEOL9hGsnh0OgatfIrb3PH02YOY35xgV8sF/GOQJVyqJ
6Z+AjgeBndQfTyjhhmHPwRNyuC1vHolStuAKfTgcZ+s3zNcCBlFZtmU4Rpa+TkL9
vMlPSYVAjC7s4aP3xY32/FcBZ++wmF5wiLAjgdS0+DdUeqAlYpaLZ/JFuR53PeMh
rg6yVuirO8M9zbT4pPSaYn7K3uzlVJwNM8MFKIZfTXK1NVoajPZsIL/iMXud8yx5
L94EM+JXgr2OvkUVxNw7Lpn8+7NR5g==
=iysz
-----END PGP SIGNATURE-----

--Sig_/mZ3jaWAU0sdh/Kcki4EHBQO--
