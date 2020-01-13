Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92C15139052
	for <lists+linux-next@lfdr.de>; Mon, 13 Jan 2020 12:45:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726934AbgAMLpK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 13 Jan 2020 06:45:10 -0500
Received: from ozlabs.org ([203.11.71.1]:57525 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726180AbgAMLpK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 13 Jan 2020 06:45:10 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47xBbQ4bRrz9sPn;
        Mon, 13 Jan 2020 22:45:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1578915908;
        bh=IXKyUBUCDLTAywTR1RL6Xi0GNhSjDf+D2mhoFHC6EQg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=q3nLPy4z0RX9D785IyiL7XwSL9oH26CwvrNLRpid5WAanrMziqXiApq/q7eYlHWt3
         oPJbcauXKpDSs4tyNdv6D5tzqZp9S1MQ8jRIkBrAf55TkTUY8xFTR3gDvxE70PsMZy
         IQFKiCNswGyOgiLNDU6KM6C8a1hIUAMge9wkQtgbLHr9rHke5HxXEfx3u9Axxm0GLk
         nq2w0UASDm3ODKmGuKie7z5bZSX5t+aKFr52i2+zfU+SlTfZxwixs9NiR/VwF8duvA
         Aw4MPsOut2pFO4zj/h0Zn3f1guzfIkEZR4CaSfpQ36jhkKRDifMIX5Te1OTUwblUcx
         pES2wBz9XshMQ==
Date:   Mon, 13 Jan 2020 22:45:03 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "=?UTF-8?B?5ZGo55Cw5p2w?= (Zhou Yanjie)" <zhouyanjie@wanyeetech.com>,
        Paul Burton <paulburton@kernel.org>
Subject: Re: linux-next: manual merge of the gpio tree with the mips tree
Message-ID: <20200113224503.1e1e3235@canb.auug.org.au>
In-Reply-To: <20200113091237.GA1748@aptenodytes>
References: <20200110155150.3942c3fc@canb.auug.org.au>
        <20200113091237.GA1748@aptenodytes>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XVqxA34AbA8M9k+VfVfN24r";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/XVqxA34AbA8M9k+VfVfN24r
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Mon, 13 Jan 2020 10:12:37 +0100 Paul Kocialkowski <paul.kocialkowski@boo=
tlin.com> wrote:
>
> Thanks for the fix. We might want to keep the list ordered though, with
> "xylon" listed after "xunlong" and before "yna".
>=20
> >       description: Xilinx
> >     "^xunlong,.*":
> >       description: Shenzhen Xunlong Software CO.,Limited
> >  +  "^yna,.*":
> >  +    description: YSH & ATIL
> > +   "^xylon,.*":
> > +     description: Xylon =20
>=20
> So reversing the two blocks above.
>=20
> What do you think?

Absolutely.  I have changed my resolution for tomorrow.  What really
matters, though is what we end up with in Linus' tree.

Thanks for checking.
--=20
Cheers,
Stephen Rothwell

--Sig_/XVqxA34AbA8M9k+VfVfN24r
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4cWD8ACgkQAVBC80lX
0GzXPQf/RJ1akP2I79Hp8O/XJOfOG5jJYa7/NoHvmkbh5STF6VLA2ZKypKADn6X3
URmKbWQfdD5JDC9hO/FuCeQ5yk3qtCmM3lnY1Xjo3RxH9IlkLlCkiZ2N6gnCcsY4
y9luesBrOsgV+LUABbDOl7XWAiq4+5UBo8qYaiaSHK5skCIkCl4Gvu0TqgNsxbxC
EmKODQ7sjOK6bGc3K9FBV/4My0xvGeVklemVioxd/CQJHfYhz5AORH9AFIma3jFb
iwwyetKDfALPO0a/4gn7wqevwAoiia8ePe8YfMrtDSPVibJFchpCYF+4a8PokPJ0
20iGgZ3160ei0HfDrhK1vmc4SlI2fQ==
=AuZX
-----END PGP SIGNATURE-----

--Sig_/XVqxA34AbA8M9k+VfVfN24r--
