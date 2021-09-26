Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 574A6418B59
	for <lists+linux-next@lfdr.de>; Mon, 27 Sep 2021 00:02:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230171AbhIZWDp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 26 Sep 2021 18:03:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230075AbhIZWDo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 26 Sep 2021 18:03:44 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B845AC061570;
        Sun, 26 Sep 2021 15:02:07 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HHfrF3HKlz4xbX;
        Mon, 27 Sep 2021 08:02:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1632693725;
        bh=D30PMf2VcqR/+OE3jaF02/nP007fkLreMzNwXU2NN7s=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=UwgNkC9DBPEClOQquuuvlZNXIRikkdQaLte0+7++9cIZGcEljiNZ+YmlgtKzRGlSL
         oysfDnl4IofbEzOZW60FbjglgwkW+qS3fIWpb6oxcYS7c5pKPpl7nhachLjc+f3ixX
         KPfb0afBhWNhOmw2QTPpMZUR7S6K6iPzaNlIiMeONNzlSaABJJEca0FFNuCfh/lrfY
         Qm3SmQ+JeBGlKvA/fG7O/OAdcGZy28yVkZqb1Ri2kleTAyCpkp7aYrNWlzkA6O15Ok
         JJgNhW5WfY1qDxAZZjUdu2JZfFeFUDohyvgQLdEXH09yWliBBWG2J5pquUk46gjOj4
         +UWy2rw+kzU4Q==
Date:   Mon, 27 Sep 2021 08:02:04 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Kari Argillander <kari.argillander@gmail.com>
Cc:     Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the ntfs3 tree
Message-ID: <20210927080204.3f2e8c26@canb.auug.org.au>
In-Reply-To: <20210926214700.6mukvekkzqavyczw@kari-VirtualBox>
References: <20210921083158.261517da@canb.auug.org.au>
        <3320944d-8fac-0a22-ee38-f08974fcaed7@paragon-software.com>
        <20210926214700.6mukvekkzqavyczw@kari-VirtualBox>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ck1xCFS2FV7UeRWT4cPHGqg";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ck1xCFS2FV7UeRWT4cPHGqg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Kari,

On Mon, 27 Sep 2021 00:47:00 +0300 Kari Argillander <kari.argillander@gmail=
.com> wrote:
>
> On Tue, Sep 21, 2021 at 04:50:02PM +0300, Konstantin Komarov wrote:
> >=20
> > On 21.09.2021 01:31, Stephen Rothwell wrote: =20
> > >=20
> > > In commit
> > >=20
> > >   0412016e4807 ("fs/ntfs3: Fix wrong error message $Logfile -> $UpCas=
e")
> > >=20
> > > Fixes tag
> > >=20
> > >   Fixes: 203c2b3a406a ("fs/ntfs3: Add initialization of super block")
> > >=20
> > > has these problem(s):
> > >=20
> > >   - Target SHA1 does not exist
> > >=20
> > > Maybe you meant
> > >=20
> > > Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
> > >  =20
> >=20
> > Hello.
> >=20
> > You are right, correct SHA is 82cae269cfa9.
> > Sorry, I've missed this while applying patch.
> >=20
> > As far as I know there is no way to fix this now -
> > commit is already in linux-next. =20
>=20
> This still is not fixed. Can you Stephen verify that rebase is ok in
> situatian like this? Also now we have situation that this thing is 6 day
> old already. I actually also do not know if it is ok to rebase anymore,
> but, probably is. I have checked every follow up patches which has been
> applied after this and they are not affected if we rebase.

A rebase is probably not necessary, as the commit is easy to find using
its subject line (as I did). However, it would be better to avoid such
situations in the future.

--=20
Cheers,
Stephen Rothwell

--Sig_/ck1xCFS2FV7UeRWT4cPHGqg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFQ7dwACgkQAVBC80lX
0GwgzwgAlaC5VSiOvyeeKxnsIivotj26KfIJSuwi/DedBkQI0Ad1ObrCbTJmCoGa
/x0ytKKfDU3TcPLTKYf0/UnS9MyvKuTBGPiWbQxPQsZK7/H1JO2EmXPSLBTstlAW
dtmLpJQrzVo6vHi0vCt9M6T671NLmgHYLQk9BpMLIHQXmKHgvB8jCxtMsRSeqCUV
PJm/zkqoXV34c/nx1IVXb/w325pHeZpZeWTkIMhTI6pHILMXzwfgszOJKOu9N0/F
gHi5cwErG+MtUiqCyv1igu2P1KtsnmomjTRZM+f/UMNEtX9sGL9TEyX5kBvxHsne
d7JNwbQTlJhTn3F/Y8p8rvlStExyZA==
=U6Wh
-----END PGP SIGNATURE-----

--Sig_/ck1xCFS2FV7UeRWT4cPHGqg--
