Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBE7D2D0D4B
	for <lists+linux-next@lfdr.de>; Mon,  7 Dec 2020 10:46:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725976AbgLGJqF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 7 Dec 2020 04:46:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725770AbgLGJqF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 7 Dec 2020 04:46:05 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D6A1C0613D0;
        Mon,  7 Dec 2020 01:45:25 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CqJMJ36HYz9sW8;
        Mon,  7 Dec 2020 20:45:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607334323;
        bh=xm0uPgA5vDeRFmjvLyy2JrwjhgwDVHCThsDosfgNrGg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=hme1BKh57yugsacKGK9oP1lN8FcW+ft06tPIQfRBJtpiMFudW2GEq/5/Kx7epHang
         o9U4DFIw1VXweJw5HYiwGHsqHxY3R1JAbLnODpEBZI6x2i5ajN51K51y5l8Zj+qHL/
         iYS64e62qaro4sGsF3AtRTYt+VSFdjavE4jwCjxLhIr3TSBW2w/oVO1ZyoFdxaaW5L
         jnqs5Wq2upBH3GPDlkU8Z0nhszYbbycqP07SLrD1avABFYJ4tL+h8lfXmmJH5SI/Th
         XxoWkHGHB8gSacFAG8c2Ya+JW//fhd1wElBZ8yXI3H8Kpd69G8lf4J4hAvhkuVhjoH
         0d4tv/LUSQdOA==
Date:   Mon, 7 Dec 2020 20:45:15 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the staging tree
Message-ID: <20201207204515.617298c5@canb.auug.org.au>
In-Reply-To: <X831Lg9D6Rg2rkwJ@kroah.com>
References: <20201207164601.2b9cefc8@canb.auug.org.au>
        <X831Lg9D6Rg2rkwJ@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jKHYR+3sMWP9BuYWk=Zkyrd";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/jKHYR+3sMWP9BuYWk=Zkyrd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Mon, 7 Dec 2020 10:26:06 +0100 Greg KH <greg@kroah.com> wrote:
>
> > diff --git a/drivers/iio/trigger/iio-trig-sysfs.c b/drivers/iio/trigger=
/iio-trig-sysfs.c
> > index 10a3fd29362b..0f6b512a5c37 100644
> > --- a/drivers/iio/trigger/iio-trig-sysfs.c
> > +++ b/drivers/iio/trigger/iio-trig-sysfs.c
> > @@ -160,8 +160,7 @@ static int iio_sysfs_trigger_probe(int id)
> >  	t->trig->dev.parent =3D &iio_sysfs_trig_dev;
> >  	iio_trigger_set_drvdata(t->trig, t);
> > =20
> > -	init_irq_work(&t->work, iio_sysfs_trigger_work);
> > -	atomic_set(&t->work.flags, IRQ_WORK_HARD_IRQ);
> > +	t->work =3D IRQ_WORK_INIT_HARD(iio_sysfs_trigger_work);
> > =20
> >  	ret =3D iio_trigger_register(t->trig);
> >  	if (ret)
> > --=20
> > 2.29.2 =20
>=20
> Is this patch "safe" to take now, if the tip tree isn't part of my tree?

Unfortunately not, as IRQ_WORK_INIT_HARD() is introduced by the tip tree
commit.

--=20
Cheers,
Stephen Rothwell

--Sig_/jKHYR+3sMWP9BuYWk=Zkyrd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/N+asACgkQAVBC80lX
0GxXxAgAnvWOKNUbxPtx44gn1PqQtc6sdB741P+6um6QSrPyNA5cfMOu8sgQoZUc
7nTq+nAJthHlUa32h0ExcO8ctbAWLaxTzv/cvSB/siVJNdud8gnryctZ3KESid47
Z6GUqAxJFQstr1e4hnZPz+p9GyaWeOdK12O6icpYhYvkTx8otvThrd9+vt2YMCd9
8HmcyVRWf4O7ZiRVcdjTKNvRK2qhABFVVhCLUqKsoYzAoklGm8EfGrc+igfq89KW
ZRwFysTZ/lW/xVEx+hnL/C+MmXv209BPCuWcoSIUBLX+VxBAJM7ZxEFBU+LzmGIP
WXsoimnS8bBS02bS1QNEU6DDnLz2Bg==
=7UXl
-----END PGP SIGNATURE-----

--Sig_/jKHYR+3sMWP9BuYWk=Zkyrd--
