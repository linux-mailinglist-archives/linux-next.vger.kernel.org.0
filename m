Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC61E3E56E1
	for <lists+linux-next@lfdr.de>; Tue, 10 Aug 2021 11:30:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229679AbhHJJa2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Aug 2021 05:30:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232955AbhHJJaY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 10 Aug 2021 05:30:24 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADADFC0613D3;
        Tue, 10 Aug 2021 02:30:02 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GkSN82zl9z9sX5;
        Tue, 10 Aug 2021 19:30:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1628587800;
        bh=7tvEHHo6wFA/9wFCZ+yXT1VQN4HCIabjZwE1lmKuMNo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=EJpWISnjQkw6oYcqkslG7K9+vUmAfYzdnNsujLGlx8jPiqmXeIITgkZXXZi/o1xTt
         vt+CL0k9pMt1gT5bUGyyqg38Z1t8fM3ZqUK+Dyh1y+ixMLUqsKAnn/u2LVgtJG4UKO
         MtbQwb6XFOzM4f807BD7IQp61k8LPBAyMTPa3dmHbhsV0F7X7q4hjBIIDanvFEdbBf
         Zoi76BVBgFKE23iC59/w6om4HAwOVluSBGuBXUn3Xf2JJgdPkg/MdmLIcDRBZoM5+F
         kb69VxwraHjv0Wsz9asdrQ/kFrLdbydeLHSWKPAyk5g7HbmrIlTq8A67g0oGN4rjAL
         n+px7at3NNusQ==
Date:   Tue, 10 Aug 2021 19:29:59 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        "William A. Kennington III" <wak@google.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning from Linus' tree
Message-ID: <20210810192959.05d6e588@canb.auug.org.au>
In-Reply-To: <20210720173142.00a375c5@canb.auug.org.au>
References: <20210601172026.6bc0a96f@canb.auug.org.au>
        <20210708122544.011171b3@canb.auug.org.au>
        <20210720173142.00a375c5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/triqxUS9/e=uPv==hqm8FPJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/triqxUS9/e=uPv==hqm8FPJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 20 Jul 2021 17:31:42 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Thu, 8 Jul 2021 12:25:44 +1000 Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> >
> > On Tue, 1 Jun 2021 17:20:26 +1000 Stephen Rothwell <sfr@canb.auug.org.a=
u> wrote: =20
> > >
> > > When building Linus' tree, today's linux-next build (htmldocs) produc=
ed
> > > this warning:
> > >=20
> > > include/linux/spi/spi.h:671: warning: Function parameter or member 'd=
evm_allocated' not described in 'spi_controller'
> > >=20
> > > Introduced by commit
> > >=20
> > >   794aaf01444d ("spi: Fix use-after-free with devm_spi_alloc_*")
> > >=20
> > > This has been around for a while (at least v5.13-rc1 and next-2021040=
9).
> > > Sorry I did not report it earlier.   =20
> >=20
> > I am still getting this warning. =20
>=20
> I am still getting this warning.  It is now on line 675.

Now line 672 ...

--=20
Cheers,
Stephen Rothwell

--Sig_/triqxUS9/e=uPv==hqm8FPJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmESRxcACgkQAVBC80lX
0GzEwwgAmvRIHoSdTDPqYSNeMHAeBkhJKY8cKL/Qzq28SsW1wzwd8xGeSXAj2JOi
dEfN214p4101LO9n52s17j59mS4HF0+ecyDJdRWhv7Tkob2ACXCmGrPAVPNClXbM
5BZoWYgVS4twZAYSbzWgZB+LVXF1xnrQMOJUepLBMkVdXwEbX/QaSlz3kybEU6Kl
TTLEt3v53AhX3AE+4zhRjK285xuVvUmxLsj9Les4nRSbMrikSRRhN3pbticIVLBw
IcAvTomQlkigd9nDAYf2oi3yAm45cYGqcf0/chmU/hyVkVroQVhVUYW9gYAa87je
iyuAuTgffcCdi3o5De8CtDb1HqLY8Q==
=v52h
-----END PGP SIGNATURE-----

--Sig_/triqxUS9/e=uPv==hqm8FPJ--
