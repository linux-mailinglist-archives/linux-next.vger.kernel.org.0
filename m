Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74F923CCDD8
	for <lists+linux-next@lfdr.de>; Mon, 19 Jul 2021 08:22:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234663AbhGSGY6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 19 Jul 2021 02:24:58 -0400
Received: from ozlabs.org ([203.11.71.1]:35129 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234654AbhGSGY6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 19 Jul 2021 02:24:58 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GSsFK65vJz9sW8;
        Mon, 19 Jul 2021 16:21:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1626675717;
        bh=mWq6pt4uDBgoevGOdLGZbUz8qtM/TNHZ/vWBfA0OhxQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=pcYqVAo0JexlIoj+h9KwKPyLQWX9yVdtz/hf6QkvBeTfILhoIAs9X92X2MaBNkZ37
         HpeNZcX+nW4NGttunrR+GSCXyb0nj9/3xY8kcL43S0pL041D6N5LJu742Up0vJFPlS
         iQ2ktEvodKYVRYncGXGo9kjs9NxF327+lPuri/UGLzdWHT/69OsKf+oH+9uLJVw/w1
         wwJQ99XUK4NXlfWOKNzz6neKLCh+dmT0Csrh9oPwGTvdXBuNjTqEGvf0QbsXLo3Edu
         yMvkiRjCgPEWjhCBFdRmW778Y0UoxoYhLOnUxPtJIujEkH7n33kf15d/4EmeD8Qqzf
         GTfn8MhNkOi5g==
Date:   Mon, 19 Jul 2021 16:21:56 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Moritz Fischer <mdf@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the fpga tree
Message-ID: <20210719162156.0c51f644@canb.auug.org.au>
In-Reply-To: <YPSvr1r51Y2MkSZc@epycbox.lan>
References: <20210719081926.5ea11131@canb.auug.org.au>
        <YPSvr1r51Y2MkSZc@epycbox.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/86pP6K_UajSaDk=k0ooEq7l";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/86pP6K_UajSaDk=k0ooEq7l
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Moritz,

On Sun, 18 Jul 2021 15:48:15 -0700 Moritz Fischer <mdf@kernel.org> wrote:
>
> On Mon, Jul 19, 2021 at 08:19:26AM +1000, Stephen Rothwell wrote:
> >=20
> > In commit
> >=20
> >   6c17b7ff1d11 ("fpga: zynqmp-fpga: Address warning about unused variab=
le")
> >=20
> > Fixes tag
> >=20
> >   Fixes: c09f7471127e ("fpga manager: Adding FPGA Manager support for
> >=20
> > has these problem(s):
> >=20
> >   - Subject has leading but no trailing parentheses
> >   - Subject has leading but no trailing quotes
> >=20
> > Please do not split Fixes tags over more than one line.
>=20
> D'oh. Do people fix these things generally with a rebase?

It varies among maintainers, but a rebase is the only way to fix it (if
that is what you want to do).

You could just take it as a lesson for the future.
--=20
Cheers,
Stephen Rothwell

--Sig_/86pP6K_UajSaDk=k0ooEq7l
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmD1GgUACgkQAVBC80lX
0Gw/ywf+OcPxJRxhQuPpW/ZqErR3EYcvV+0urIzFai20Sa6b4HiLLyG3/DsUOy2g
fQG3/gWer8m3dAeAZjqfr3HI/HRvOPysAMlBzlqNBqiOyyqmtGD4EkjeoHE5Qnhv
h/yVo0yCpf7EkQQJTMhdnXRyyyM3dVyOmIDktN8JgMQxctRZjbv0Ywcx1dku2x4S
iz/Sz2ltZRu7MENlhE8iwngPPr4dviZOWaqzfbcmhLIRtb5WnNHX5Rvd9ngY7IV4
tBTk/k3P6lCX1lkGTPhyRo1p1tECTooqJ0a7BMgLoyuGd4yYo0ML2HBvkIeqPcPm
sRiEMzPNQZLWUyZH8SjuIq/JvcdVKA==
=b2T6
-----END PGP SIGNATURE-----

--Sig_/86pP6K_UajSaDk=k0ooEq7l--
