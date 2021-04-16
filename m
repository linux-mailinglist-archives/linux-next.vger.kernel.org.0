Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E245361856
	for <lists+linux-next@lfdr.de>; Fri, 16 Apr 2021 05:49:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237585AbhDPDte (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 15 Apr 2021 23:49:34 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:38705 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234662AbhDPDte (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 15 Apr 2021 23:49:34 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FM2JN5N7Qz9sRK;
        Fri, 16 Apr 2021 13:49:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1618544948;
        bh=3qi+EVpAA9jE8avfFTx8hF47aGoPAkBUd3YXLg1Crrs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=nkbZRP8vfer3IZBEK9PvsQ0Z/koBeWl95wYSqPEPdZg83cwOnNuW9hBLtKBL5qePX
         x2D3cNYAlRTdFJE/OsfYOU2su/xVe3zYqY/pT80+7Kr4PXYYM396gnPO1wkOw3N87Q
         9u/jZNYyHLyOGS6FYcneHgklCramtERn76t17Z+I8lzE8TijjSZDTFOC6ORGCzZddg
         v7bOVHLBv8PYf6osjK7OkwO2SXgBL0+v5CNvXrL2UWf6RRraFdyvvznO1JT6tSgTMr
         X8iQvCjUZ/MOFmPBdKydjNIfbr3rKPS3Q+kz8IO+O2Vj471fJaiF9aVXTVzAZSDSaw
         T0+jgxVHEm2Pg==
Date:   Fri, 16 Apr 2021 13:49:07 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mmc tree
Message-ID: <20210416134907.356dad53@canb.auug.org.au>
In-Reply-To: <20210416134827.1f35b1cd@canb.auug.org.au>
References: <20210416134827.1f35b1cd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dd+_vlhjOu/_gJTNgmxArlj";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/dd+_vlhjOu/_gJTNgmxArlj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

This is actually just a warning.

On Fri, 16 Apr 2021 13:48:27 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Hi all,
>=20
> After merging the mmc tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
>=20
> In file included from drivers/memstick/host/r592.h:13,
>                  from drivers/memstick/host/r592.c:21:
> drivers/memstick/host/r592.c: In function 'r592_flush_fifo_write':
> include/linux/kfifo.h:588:1: warning: ignoring return value of '__kfifo_u=
int_must_check_helper' declared with attribute 'warn_unused_result' [-Wunus=
ed-result]
>   588 | __kfifo_uint_must_check_helper( \
>       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   589 | ({ \
>       | ~~~~
>   590 |  typeof((fifo) + 1) __tmp =3D (fifo); \
>       |  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   591 |  typeof(__tmp->ptr) __buf =3D (buf); \
>       |  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   592 |  unsigned long __n =3D (n); \
>       |  ~~~~~~~~~~~~~~~~~~~~~~~~~~
>   593 |  const size_t __recsize =3D sizeof(*__tmp->rectype); \
>       |  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   594 |  struct __kfifo *__kfifo =3D &__tmp->kfifo; \
>       |  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   595 |  (__recsize) ?\
>       |  ~~~~~~~~~~~~~~
>   596 |  __kfifo_out_r(__kfifo, __buf, __n, __recsize) : \
>       |  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   597 |  __kfifo_out(__kfifo, __buf, __n); \
>       |  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   598 | }) \
>       | ~~~~
>   599 | )
>       | ~
> drivers/memstick/host/r592.c:367:2: note: in expansion of macro 'kfifo_ou=
t'
>   367 |  kfifo_out(&dev->pio_fifo, buffer, 4);
>       |  ^~~~~~~~~
>=20
> Caused by commit
>=20
>   4b00ed3c5072 ("memstick: r592: remove unused variable")

--=20
Cheers,
Stephen Rothwell

--Sig_/dd+_vlhjOu/_gJTNgmxArlj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmB5CTQACgkQAVBC80lX
0GwgKAf/f3KFEewMzmmh1J7yQlcHiylGbUweYWZsiy8gsCtS0wdA/BU8qSeapq+i
D7d4zDwJlbBMqORy2sYuW2MgCpZ9ZD4mzhLxgRm6/CjD+8Xo4Fa0+xUE33gMXV8f
rPA14Jk9RI5+KjaPR/U4PC3eHUIHCCGLsxCACrx8GTcmIuNCJ7ltOMtcFOmIsg4A
Vym4isBeJE/jRcR4Xl7bbDRugrkyC1V7eXtKqo8/AG73zvrdHPClllk1hn+gkJZX
MpBsDhk+q9TX4E69qflDpdpaVkiCdfSpBYjephDiyg5ijugu1mGnyZs/D0An0R1o
E3aiNQL8M2qhCfqKJHMtBOa8p1x+jQ==
=chKg
-----END PGP SIGNATURE-----

--Sig_/dd+_vlhjOu/_gJTNgmxArlj--
