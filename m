Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 240793FFA9A
	for <lists+linux-next@lfdr.de>; Fri,  3 Sep 2021 08:49:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234722AbhICGum (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 3 Sep 2021 02:50:42 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:37957 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234697AbhICGum (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 3 Sep 2021 02:50:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1630651781;
        bh=k/kTU8gulMix2w7+8gbEBC9pUu/h7/SRitnGBhbwNnw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=h7p7mprTFC4FHybF1tmFdThjKH/sly1ZXjWG2ic5vlE8BOrX1Saf+T1q/XG3W60Ez
         Anzs9969VBZ1+18+jUFJwbd2Ea7LWmoaQZSja+w+2jeYO/gxy1FvD0eMDo7l0F8kcP
         Dh8/RUheGtFrReoX1GfyYJ6chOIXggynijPgfuhvK0qTdAY2Ou87YCZAZPmEwVfBiB
         Ekv91vibKglFKTIXa81jJ++vUgQX1mm6PI68vfC3XTY3OrAyCLuI0njqhD/huE3QxX
         v//I8HE7nqT/sgAi/6tG4saIK/Wp3dQEnW5wK7seSPOToRkgfeAd/KYonKAb0He8Bb
         ml07S0ARDB9bg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4H17h46rtFz9sRf;
        Fri,  3 Sep 2021 16:49:40 +1000 (AEST)
Date:   Fri, 3 Sep 2021 16:49:39 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the block tree
Message-ID: <20210903164939.02f6e8c5@canb.auug.org.au>
In-Reply-To: <b2492209-732c-9871-6085-6a17659f6429@kernel.dk>
References: <20210813194116.3a0297d6@canb.auug.org.au>
        <b2492209-732c-9871-6085-6a17659f6429@kernel.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VP/5W2H=tRTMCw3OfZfaIjU";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/VP/5W2H=tRTMCw3OfZfaIjU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jens,

On Fri, 13 Aug 2021 07:54:51 -0600 Jens Axboe <axboe@kernel.dk> wrote:
>
> On 8/13/21 3:41 AM, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > After merging the block tree, today's linux-next build (htmldocs)
> > produced this warning:
> >=20
> > block/bio.c:1689: warning: Function parameter or member 'nr_vecs' not d=
escribed in 'bio_alloc_kiocb'
> >=20
> > Introduced by commit
> >=20
> >   1cbbd31c4ada ("bio: add allocation cache abstraction") =20
>=20
> Thanks, fixed up.

Not really :-(  I am now also getting this (the above has moved to line
1704 as well):

block/bio.c:1704: warning: Excess function parameter 'nr_iovecs' descriptio=
n in 'bio_alloc_kiocb'

--=20
Cheers,
Stephen Rothwell

--Sig_/VP/5W2H=tRTMCw3OfZfaIjU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmExxYMACgkQAVBC80lX
0GyanwgAmCCTOTRJPBvTtFLAOWiYeDf9AarjFgtBtjAEVhbhQuvBmD37VKMa0lxY
qvAnolLwVa/mJLthdLSA0ubysxMSowJBd9aQufUg+eCdDJ2rjwohhZ2OY7Kkmxyk
r2Q4tfu1U2njxE8h2FTdGwH5SYDxzHSDOFqkCkoZodRNIE2hmZ/pphOPSc+nv9rh
5JFtxg5tXVWBcZk5a9EPSCXNF1AiVYkOqa8bAqa5n9/dPOpAkGyDCbJbwH5b6JJQ
XE7k88i11HqXnxT7B9vkKTMXcYT3TGsOvWC8oj2+p+FCzw3UxLqgUFymVVQc5BwN
fdUtYJPG78ieHJ2P8xOLd8ZASzPWtA==
=h5pc
-----END PGP SIGNATURE-----

--Sig_/VP/5W2H=tRTMCw3OfZfaIjU--
