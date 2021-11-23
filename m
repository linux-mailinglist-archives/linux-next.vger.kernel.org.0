Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B28234599F1
	for <lists+linux-next@lfdr.de>; Tue, 23 Nov 2021 03:04:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232569AbhKWCHc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 22 Nov 2021 21:07:32 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:39105 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229802AbhKWCHa (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 22 Nov 2021 21:07:30 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HynWT2rfFz4xbM;
        Tue, 23 Nov 2021 13:04:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1637633061;
        bh=Hw0gL8JU56hDalS7jteiqnWI/e5vyjdk2xfzjrQqwsA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ePGk5XLs8stTqNJ06pkHLnCIoj1VvUpzHd2nMAPMtDGJoBSe1HolxLa8d+BHWCucz
         43iHz3umTs05aF+NL4AkIH4nd1EsAwKvyqKbhZ1sO/4tFbCL8Y4Hb/y8YCHpz7eHsM
         Dlfq9Ci62PKsDxDNXq6Po48nuIgOyHl9Ud8JYej3Up14o7fUJFuyfKxy85+we8Ro34
         ukw34/4LLZMp3ZAfY/kooSg8zMl3RFKFwunCpzGFCGJPl/rZ2WC1J2SrmwLyEGET62
         pKDWimkBOly0RXeV84QqMNen7Z6gl3pApH7rPQbttO00AcwINecdejZj84RPIYfRRA
         LB4KfsZ5a/23Q==
Date:   Tue, 23 Nov 2021 13:04:18 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Rob Herring <robh@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the gpio-brgl tree
Message-ID: <20211123130418.17878c41@canb.auug.org.au>
In-Reply-To: <20211118112951.2b788952@canb.auug.org.au>
References: <20211116105112.4c99853d@canb.auug.org.au>
        <20211118112951.2b788952@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/O=nYuC6ub8R8cm4SZopC1NX";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/O=nYuC6ub8R8cm4SZopC1NX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 18 Nov 2021 11:29:51 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Tue, 16 Nov 2021 10:51:12 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > After merging the gpio-brgl tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >=20
> > drivers/gpio/gpio-xlp.c:300:16: error: 'GPIO_VARIANT_VULCAN' undeclared=
 here (not in a function)
> >   300 |  { "BRCM9006", GPIO_VARIANT_VULCAN },
> >       |                ^~~~~~~~~~~~~~~~~~~
> >=20
> > Caused by commit
> >=20
> >   ea708ac5bf41 ("gpio: xlp: Remove Netlogic XLP variants")
> >=20
> > I have used the gpio-bgrl tree from next-20211115 for today. =20
>=20
> I am still getting this failure :-(

And still :-( :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/O=nYuC6ub8R8cm4SZopC1NX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGcTCIACgkQAVBC80lX
0GxCNgf+Ku95eA6bBDWG1bL4oTMlyf/aEi5egrumE4aA8+eRVxl2GBN5zLeVNP4Q
ByeK9LRmWRTL6lk28BUlS5T+XD8sM1V8dTk1y7phRyse/raHit1h7nHHxliEjkmw
/W4iMYkwl/b2icxtvrBEyYE1hnaTEz7qW9I36anAN/rlCR8fa8YHdw2+DqT189Zb
6JUaM/mLz/nFg98uw+iHa9Lz2c7b0xXtWbH1PvcagbLRqRTbrzVCU22VSP23VUvQ
WLJnZVOQ774J3oyOBRfyLN3acKo+bjrMICOJJNLaeybSW+hsdpTqCq1Bhx9MlQHu
uEpZ/Bhxp/yrTTWVuTYaiScpka94qg==
=yC0S
-----END PGP SIGNATURE-----

--Sig_/O=nYuC6ub8R8cm4SZopC1NX--
