Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA82A96E69
	for <lists+linux-next@lfdr.de>; Wed, 21 Aug 2019 02:33:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbfHUAd4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 20 Aug 2019 20:33:56 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:53095 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726478AbfHUAdz (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 20 Aug 2019 20:33:55 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46CpYq4Hwhz9s4Y;
        Wed, 21 Aug 2019 10:33:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1566347632;
        bh=Fl8sSGoKsB1MkwUu7+QjZsqdQFPC+W4fihQ2Ozm2/CI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=qn1uM/h0WQROjUOtOJPm7wDgPZJuDuUZgjBKAeqa1uDSQLjGQlVwAzGk+JypaoWK1
         0vZdFP/jcUGwJac7F9GErPo8g6vaR0w8Cad3zbUxHYR07uG3CjgmHi6bd0QJEfDyFb
         X6xC47/YjZZr073/0tTuG6gkVKWuhiEL1pixvsBhcx1t+01UlOwYqV12e1smUhX56Y
         cP1xpTlz4QUJrilMALxMOu6Id06GT9DzcuU5LjQf/cDOegYIT2r+k7rMqJ03Bj0wUH
         8V+LyZgkx+cN1voxqde6kU/y+NL0SGA71rYk39l2BxEXh3V19dNUtY/bFlP3fxHP/w
         im4DlLJb+pmXQ==
Date:   Wed, 21 Aug 2019 10:33:50 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Joe Perches <joe@perches.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Julia Lawall <julia.lawall@lip6.fr>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux@googlegroups.com,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: rfc: treewide scripted patch mechanism? (was: Re: [PATCH]
 Makefile: Convert -Wimplicit-fallthrough=3 to just -Wimplicit-fallthrough
 for clang)QUILT
Message-ID: <20190821103350.5db50b02@canb.auug.org.au>
In-Reply-To: <14723fccc2c3362cc045df17fc8554f37c8a8529.camel@perches.com>
References: <c0005a09c89c20093ac699c97e7420331ec46b01.camel@perches.com>
        <9c7a79b4d21aea52464d00c8fa4e4b92638560b6.camel@perches.com>
        <CAHk-=wiL7jqYNfYrNikgBw3byY+Zn37-8D8yR=WUu0x=_2BpZA@mail.gmail.com>
        <6a5f470c1375289908c37632572c4aa60d6486fa.camel@perches.com>
        <4398924f28a58fca296d101dae11e7accce80656.camel@perches.com>
        <ad42da450ccafcb571cca9289dcf52840dbb53d3.camel@perches.com>
        <20190820092451.791c85e5@canb.auug.org.au>
        <14723fccc2c3362cc045df17fc8554f37c8a8529.camel@perches.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xAmH51UGfy068NWyuk2K7em";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/xAmH51UGfy068NWyuk2K7em
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Joe,

On Mon, 19 Aug 2019 17:08:00 -0700 Joe Perches <joe@perches.com> wrote:
>
> A few examples:
>=20
> 1: a patch just to MAINTAINERS done via bash script:
>=20
> https://lore.kernel.org/lkml/904551f1f198ffac9a0f9c3c99aa966b0a7c76c1.cam=
el@perches.com/
>=20
> $ git grep -h "^[FX]:" MAINTAINERS | \
>   cut -f2- | grep -vP '/$|\*|\?|\[' | \
>   while read file ; do \
>     if [ -d $file ]; then \
>       sed -i -e "s@${file}\$@${file}/@" MAINTAINERS ; \
>     fi ; \
>   done
>=20
> This one is trivial and takes almost no time.

That one seems ok (except you need "s around the $file in [ -d $file ]).
In this case, I guess the plan is that I run the script and commit the
result using the commit message and authorship from the above mail ...

(I would also replace the first three commands with

sed -En 's/^[FX]:[[:space:]]*([^[*?]*[^[*?/])$/\1/p' MAINTAINERS

/me puts away his yak razor :-))

> 2: would be Julia Lawall's stracpy change done
> with coccinelle: (attached)
>=20
> This one takes quite a bit longer as it has to do a
> cocci --all-includes scan of each source file and each
> of its #include files.

What do I need to apply that "patch"?

--=20
Cheers,
Stephen Rothwell

--Sig_/xAmH51UGfy068NWyuk2K7em
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1ckW4ACgkQAVBC80lX
0GwFxwf+MPJLLRcIsd54FINNuPTxfuI+rg8YgOcfHqkefg7X12vpCauMoaukc2ZO
BzhtoYN0OxezS7idZ4vivAwsC5QRf2i9MQKB3g+7nUiron+nGvyYXk/FKTIx+ScW
n09WjpJ8gof/lDgPiCvmQdgGJslQatGYyNfn0W5gKeFbQMEs2SOWN+Ycir21tgEq
5/Fs/2oHDKNTIMOoEEk/Ictc+z5tXiWYoTW8I43+c2OZHRIai0KXIIUT+FuBWPTV
xsjQqZMDuLJkwKbea2Hhut0w+xKNdGNPTcpQ8rmjSFniREhHUfDWj/HV3k9AeVy4
QBs9fxzZ32bQxTs/mkU+Gu+uQUHMuQ==
=IU9A
-----END PGP SIGNATURE-----

--Sig_/xAmH51UGfy068NWyuk2K7em--
