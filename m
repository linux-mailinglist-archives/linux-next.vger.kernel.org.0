Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30F722DF7E6
	for <lists+linux-next@lfdr.de>; Mon, 21 Dec 2020 03:58:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbgLUC4R (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 20 Dec 2020 21:56:17 -0500
Received: from ozlabs.org ([203.11.71.1]:48337 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728509AbgLUC4R (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 20 Dec 2020 21:56:17 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Czkbz74JRz9sVm;
        Mon, 21 Dec 2020 13:55:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1608519329;
        bh=f4F491BaNqc7Qn32ON9IjfLdZLIb3j3TCOzNOfuntzo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=sJI6B+KhK58CUPZBBm444cUWSbM6Mjuuf78WKNQs1MsfEE6zfrKNG6HWOUUmsy+1i
         13fYJj47TG26IMIPicKsxjM8buABVDWrBiTyWNufcNiK09Nau6E958smtHBsr2tCEq
         TVelB1yaWwlOGn1KdfDzwW2ukDdHe3dhLsj9jZV8txuR9VPhfcR5Td7ThXukXvfD/+
         V12pu7fSEju9Oqk2S1gplocdlQ+K/0SxmzIQHD1ZUzdBz7TBJ4zPOEumYdz7d9bo7c
         uW9lFciCObDRN97CbRnaHkgGpJMqI5r3zDAw4X7JIoJSw4Efy2mV4lDpOZVMtO7Ln1
         FkdFcMH3Fmt5Q==
Date:   Mon, 21 Dec 2020 13:55:27 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Andrey Konovalov <andreyknvl@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Message-ID: <20201221135527.4cbdb11a@canb.auug.org.au>
In-Reply-To: <1608517898.9171.6.camel@mtksdccf07>
References: <20201221131017.128c89b1@canb.auug.org.au>
        <1608517898.9171.6.camel@mtksdccf07>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nHyfFR7u4_cuD3Z=5bTr1+k";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/nHyfFR7u4_cuD3Z=5bTr1+k
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Kuan-Ying,

On Mon, 21 Dec 2020 10:31:38 +0800 Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.co=
m> wrote:
>
> On Mon, 2020-12-21 at 13:10 +1100, Stephen Rothwell wrote:
> >=20
> > After merging the akpm-current tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >=20
> > mm/kasan/quarantine.c: In function 'quarantine_put':
> > mm/kasan/quarantine.c:207:15: error: 'info' undeclared (first use in th=
is function)
> >   207 |   qlink_free(&info->quarantine_link, cache);
> >       |               ^~~~
> >=20
> > Caused by commit
> >=20
> >   120d593a8650 ("kasan: fix memory leak of kasan quarantine")
> >=20
> > interacting with commit
> >=20
> >   cfbc92088e1d ("kasan: rename get_alloc/free_info")
> >=20
> > Can we please get this sorted out once and for all?
> >=20
> > I have applied the following patch for today:
> >=20
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Mon, 21 Dec 2020 13:07:42 +1100
> > Subject: [PATCH] kasan: fix memory leak of kasan quarantine fix
> >=20
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  mm/kasan/quarantine.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/mm/kasan/quarantine.c b/mm/kasan/quarantine.c
> > index 3f3b3d902c18..091a57f942b3 100644
> > --- a/mm/kasan/quarantine.c
> > +++ b/mm/kasan/quarantine.c
> > @@ -204,7 +204,7 @@ bool quarantine_put(struct kmem_cache *cache, void =
*object)
> > =20
> >  	q =3D this_cpu_ptr(&cpu_quarantine);
> >  	if (q->offline) {
> > -		qlink_free(&info->quarantine_link, cache);
> > +		qlink_free(&meta->quarantine_link, cache); // free once
> >  		local_irq_restore(flags);
> >  		return false;  // free twice
> >  	}
> > --=20
> > 2.29.2
> >  =20
>=20
> Please just drop this patch "kasan: fix memory leak of kasan quarantine"
> from linux-next. Otherwise, it would cause double free issue.

OK, so for today I have reverted my fix patch and 120d593a8650 ("kasan:
fix memory leak of kasan quarantine").

--=20
Cheers,
Stephen Rothwell

--Sig_/nHyfFR7u4_cuD3Z=5bTr1+k
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/gDp8ACgkQAVBC80lX
0GxN7ggAj/R2SMp5gZdUUQl2mbWK2pbglp2idMOQ+VNz6hqtPSHaAz2hWp4choVy
mqiJ4t/YjKoJ8BbvdEvlOFSP2jiuY/4eFlz3ZNVT+x7pEmBaEYKRweIWbpXpe/cO
uJwmiogIH1ZST6s+PtCbJ66iQImGouqhaC4YtZjlU4odQ9rF/IiiSYQ4d92g7MEr
gTW63bKFybLAx9lNWzgI/AVUFBuwrmFZ0eDacZvg5VzGD3qWyp62Al5RJ1bnKAB7
KW6bMoyj2d+b1NzEpgJ5LUgn6BjqwF2azGMpcv7ZMIGf6YZsGalMDIOOBGJWwIhP
s+EgdrnM3zS9s9XRTLvX3zDetvlOUg==
=DsWf
-----END PGP SIGNATURE-----

--Sig_/nHyfFR7u4_cuD3Z=5bTr1+k--
