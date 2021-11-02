Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B46C1442737
	for <lists+linux-next@lfdr.de>; Tue,  2 Nov 2021 07:44:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229803AbhKBGqk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 2 Nov 2021 02:46:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbhKBGqk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 2 Nov 2021 02:46:40 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDA8BC061714;
        Mon,  1 Nov 2021 23:44:05 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hk0jt1vVvz4xbs;
        Tue,  2 Nov 2021 17:44:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635835444;
        bh=bOOZS5nbUjBv862XOi3I7CszIKPwC88Hl0rQIUzEvRA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=eCwBp7iULU8JA4n6ANcHxf93NjgvmrDE9s/L0iCFfYZK2Z64LeugKulKHuKqCwKKB
         6BUvqKlHg5D6Kk/7jB+DFr6U30eHdnItMk0n0B4xy3F2fiIeHmnUF5B2tW7YD0XnRM
         f5UbNV6hUVLK37LUxBPIrbMLHXtMF18eYQvarDXiquyqqyhFM1RStZtuYfmD2LD8zd
         g9f8iRxZhziOTzfY1yGbJku5g7eQPanCv9f3kZBW/7dljR2ay67Y3urqFJWtAwF5Ej
         AzXpyRyI7MZHXqHL0DJNSuBlpC1mgNT+/LZLzyDogB4FzubAgnMZmSfJUC30v0TzaO
         kESy0n1/0WbEw==
Date:   Tue, 2 Nov 2021 17:44:00 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Anton Altaparmakov <anton@tuxera.com>,
        Joel Stanley <joel@jms.id.au>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: build failure after merge of almost all the trees
Message-ID: <20211102174400.1aaee22c@canb.auug.org.au>
In-Reply-To: <20211028233844.292e1319@canb.auug.org.au>
References: <20211028212651.57beb05b@canb.auug.org.au>
        <20211028233844.292e1319@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Q0i+RCAj50gvq8+yc3sXSIq";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Q0i+RCAj50gvq8+yc3sXSIq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 28 Oct 2021 23:38:44 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Hi all,
>=20
> On Thu, 28 Oct 2021 21:26:51 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > Today's linux-next build (powerpc allyesconfig) failed like this:
> >=20
> > fs/ntfs/aops.c: In function 'ntfs_write_mst_block':
> > fs/ntfs/aops.c:1311:1: error: the frame size of 2304 bytes is larger th=
an 2048 bytes [-Werror=3Dframe-larger-than=3D]
> >  1311 | }
> >       | ^
> > cc1: all warnings being treated as errors
> >=20
> > I have no idea what has caused this. =20
>=20
> With a nudge from Arnd, it seems the immediate case was commit
>=20
>   f22969a66041 ("powerpc/64s: Default to 64K pages for 64 bit book3s")
>=20
> from the powerpc tree switching the allyesconfig build from 4k pages to
> 64k pages which expanded a few arrays on the stack in that function.

Can we do something about this, please?
--=20
Cheers,
Stephen Rothwell

--Sig_/Q0i+RCAj50gvq8+yc3sXSIq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGA3jAACgkQAVBC80lX
0Gy1Ngf/VIQO0QejptIhJB+ipN07FLLi926uVNwNZZq+AhbqM9EjegrZaHdEf6j/
lYGPNRxkTzU7k0+eaPl1sJ0KJ9rqdB+2R/uUJR8/QQxmlxIIffKlc/+FyHEqKFAc
FHmESAn0dpGrgmVrd3GU6oXvKdKgy2kzZqcQ7wM2W8Kbl+6guLHAptSkFBxovEv6
aUY2u2HgeIN18nr9JRPx/8vKNrav74Jyw5l9I59Udymq9iSToE4ere+5HQDFHODo
YxIY7UgVQ4feV7i0O8Lez2cmHiJlIrc3SVDrYFE/yR8hBEfxxxAeyEhAmycKny6A
/C3+ap1aWuaQCdQL9xnGY/HKdZOmeQ==
=aXvZ
-----END PGP SIGNATURE-----

--Sig_/Q0i+RCAj50gvq8+yc3sXSIq--
