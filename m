Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD5862DA184
	for <lists+linux-next@lfdr.de>; Mon, 14 Dec 2020 21:28:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503149AbgLNU2e (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Dec 2020 15:28:34 -0500
Received: from ozlabs.org ([203.11.71.1]:33155 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2502880AbgLNU2V (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 14 Dec 2020 15:28:21 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CvtH95KYQz9sTL;
        Tue, 15 Dec 2020 07:27:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607977658;
        bh=DfhluT4S4Y8v8FRe9QpVkJAPtSsILegesMre6oxvJKw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=AS9KA2hEMHFjXYybbBaGtBl4akJLvK4TLDrx/5qtrqdnirDc92FUuGZzVTBhhwTOW
         mtcd1CEKM0TPdwbOzxmRUw1MHzA7Qkk3k5VV3mrsO913b4fQWBccbIl2IVEUvFHlc4
         cqwD8uKJvE454wfQBFzg5H7P+MDXd/7qdSWdcu8FbpopEYdOxNXFeGV31o8c4fU/8K
         Pf5qFFxulTHM1gTh/Fa5fX/rlEUgd1lL6BocSWwPOol5uXTKFUnfQK3cPK0uijzs7c
         9ag3uE7Djh+sO1uUotFxWb6JgdMnw/HIyiJMy52QIkJ7J9Ppl39rUtktALv/iYuLCB
         ihYKEm3aHIytQ==
Date:   Tue, 15 Dec 2020 07:27:32 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>, Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the staging tree
Message-ID: <20201215072732.39529a15@canb.auug.org.au>
In-Reply-To: <20201207164601.2b9cefc8@canb.auug.org.au>
References: <20201207164601.2b9cefc8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/S+vopx2qEjnH6_YV4gZaT=a";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/S+vopx2qEjnH6_YV4gZaT=a
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 7 Dec 2020 16:46:01 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Hi all,
>=20
> After merging the staging tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> drivers/iio/trigger/iio-trig-sysfs.c: In function 'iio_sysfs_trigger_prob=
e':
> drivers/iio/trigger/iio-trig-sysfs.c:164:21: error: 'struct irq_work' has=
 no member named 'flags'
>   164 |  atomic_set(&t->work.flags, IRQ_WORK_HARD_IRQ);
>       |                     ^
>=20
> Caused by commit
>=20
>   0449fc4eead7 ("iio: sysfs-trigger: Mark irq_work to expire in hardirq c=
ontext")
>=20
> interacting with commit
>=20
>   7a9f50a05843 ("irq_work: Cleanup")
>=20
> from the tip tree.
>=20
> I applied the following merge fix patch:
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 7 Dec 2020 16:42:18 +1100
> Subject: [PATCH] fixup for "irq_work: Cleanup"
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/iio/trigger/iio-trig-sysfs.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/iio/trigger/iio-trig-sysfs.c b/drivers/iio/trigger/i=
io-trig-sysfs.c
> index 10a3fd29362b..0f6b512a5c37 100644
> --- a/drivers/iio/trigger/iio-trig-sysfs.c
> +++ b/drivers/iio/trigger/iio-trig-sysfs.c
> @@ -160,8 +160,7 @@ static int iio_sysfs_trigger_probe(int id)
>  	t->trig->dev.parent =3D &iio_sysfs_trig_dev;
>  	iio_trigger_set_drvdata(t->trig, t);
> =20
> -	init_irq_work(&t->work, iio_sysfs_trigger_work);
> -	atomic_set(&t->work.flags, IRQ_WORK_HARD_IRQ);
> +	t->work =3D IRQ_WORK_INIT_HARD(iio_sysfs_trigger_work);
> =20
>  	ret =3D iio_trigger_register(t->trig);
>  	if (ret)

Just a reminder that I am still applying this merge fix.
--=20
Cheers,
Stephen Rothwell

--Sig_/S+vopx2qEjnH6_YV4gZaT=a
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/XyrQACgkQAVBC80lX
0GxbnQgAgzkV5vh8nAroR2rOssT2ORPDVGBnn5v78f0zPg6ycRwt4vu1qpsjdd8A
ttBmuOsB8c7WInW1FKj/WGa2PtQSuNgagVy0PnXIOGXxjvWglBfFMdnA8i9M6SCF
cG3+JDaIRJ+izLvuxziMgTFtO3PKWXqyhRgIYDmPzO/uNDOq8FgNlYYfBhZZ3QgG
eg9ST2MujYEJqStXDB3SLmNV+rhujWc8pwZw4urlb7qz7CZEPEQdllz3G4BPBZkl
mOJqAh06aocjqrrG6rOWYu6cFU4wqtQ7pftz/k7FIEn8r/Is0F/5h95vahxoYbjQ
rm/1GuTrXbiWjZKqsnzep+LJ7ZOyrw==
=hcRC
-----END PGP SIGNATURE-----

--Sig_/S+vopx2qEjnH6_YV4gZaT=a--
