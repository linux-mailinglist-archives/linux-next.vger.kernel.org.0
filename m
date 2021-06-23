Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 132553B11FE
	for <lists+linux-next@lfdr.de>; Wed, 23 Jun 2021 05:03:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229890AbhFWDGC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 22 Jun 2021 23:06:02 -0400
Received: from gimli.rothwell.id.au ([103.230.158.156]:35013 "EHLO
        gimli.rothwell.id.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229774AbhFWDGC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 22 Jun 2021 23:06:02 -0400
Received: from authenticated.rothwell.id.au (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.rothwell.id.au (Postfix) with ESMTPSA id 4G8p4Z18xFzydf;
        Wed, 23 Jun 2021 13:03:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rothwell.id.au;
        s=201702; t=1624417423;
        bh=tpbkmo+Rab3fRlKVHkvYxDcBHPUFmaz8By5/gXeHERY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=OQpm9Ac2H6OVAzBSz0t7EGxWobX1ebpN8WWnEkn70jK1OM1A62RBG5B/lm6qPJvt/
         fzE1tIW+pdTFrJzyQYQFY6Iwqfo1WCB/21JtQdXO6bKGw54hfXHCZnZ838ltRV8fVG
         cq+9ZN2Inz4BxVD7x5N5hKW9T8baEJdDVP5PieSwcAiY0CRwylj/jUcr4Dvlmsn6lu
         aR8LQxibQHRECdDABjPzZHRWruNDM+8HgVtOPmCkXw41fk6R0pqyv872OtVXDyI30k
         FqXnisfR5Mc+z2gnJWCe/4CgI1aUM1yoTpeH4+C3hNUv2JJjwUpvUi8oy2hL6v6Tvq
         Zg+erMbzZ0zkQ==
Date:   Wed, 23 Jun 2021 13:03:39 +1000
From:   Stephen Rothwell <sfr@rothwell.id.au>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Kees Cook <keescook@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        David Sterba <dsterba@suse.cz>
Subject: Re: linux-next: build warning after merge of the kspp-gustavo tree
Message-ID: <20210623130339.7e6b4523@elm.ozlabs.ibm.com>
In-Reply-To: <22c088e7-1ecf-3dab-de47-23e865d09d1c@embeddedor.com>
References: <20210623083901.1d49d19d@canb.auug.org.au>
        <a6770d54-7d40-5c21-2d21-f2e25cc5756e@embeddedor.com>
        <22c088e7-1ecf-3dab-de47-23e865d09d1c@embeddedor.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3Q6NdrwXnr=bZqY3i._kx/S";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/3Q6NdrwXnr=bZqY3i._kx/S
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Gustavo,

On Tue, 22 Jun 2021 18:01:02 -0500 "Gustavo A. R. Silva" <gustavo@embeddedo=
r.com> wrote:
>
> On 6/22/21 17:46, Gustavo A. R. Silva wrote:
> > Hi Stephen,
> >=20
> > I will remove that commit and work on fixing those issues before
> > trying again. =20
>=20
> Done:
>=20
> I just removed commit 8d7900f545f1 ("Makefile: Enable -Warray-bounds"):

I have also reverted it from linux-next today.

--=20
Cheers,
Stephen Rothwell

--Sig_/3Q6NdrwXnr=bZqY3i._kx/S
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDSpIsACgkQAVBC80lX
0Gw8rgf/fCYO7O87cIJomO/m6WnA+yAafSLOA+a0LlItrVtLGfXN39xSBnkcaYO3
6Y86yKhc9P9JtY92sPsRsbyzOFMTWCQih4rdgZeCL4LrkH1iV6d7aWblhhl+EzXI
FicVmXY9lF9wJlZ56BdbDctBHCpEtmSqqjUwAKD8GZzsqXeiwITaepQHB1425s9p
95taVcX9S6z4v6B5qALync9V2KlW/nPmn53RqMhUKP/WhpzaJW/iPFw+B4Ds1v9x
S8jfXEqeis7D7fe2X9PN26Qr5NRIZjBdFOrrn5oci/fMQgdOnTmyuoMhovj6sZ4K
PQp+kU4CoCqijuTvimH8ktBm+tCRbA==
=CMSl
-----END PGP SIGNATURE-----

--Sig_/3Q6NdrwXnr=bZqY3i._kx/S--
