Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55BF336AA63
	for <lists+linux-next@lfdr.de>; Mon, 26 Apr 2021 03:32:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231583AbhDZBck (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 25 Apr 2021 21:32:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231579AbhDZBck (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 25 Apr 2021 21:32:40 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1BC6C061574;
        Sun, 25 Apr 2021 18:31:59 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FT6nS6T97z9sRf;
        Mon, 26 Apr 2021 11:31:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1619400717;
        bh=Bw6NdBcT1NmzqVVWqJ2SQU5j6HEEWdlASd8IS32sOIQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=hpUK47x1MoVyURO+2NAnUZdAGMsOL1TB65UQHaI812nc9foQnKSPi1bwSJuM33HFg
         bURANkdzIac/nb9+4yFANlUMQEzLzn7HAo6SSRW1CQzSJvJjXPpMtqUCEcYhngbzVL
         5HTGrH+mrGnkj7yXPLpvGGxE/30fe9hn6nnV0g9KLEWh56zIMN7yTOKFHokDGeKHfQ
         yp9stOpMM399vYTQoEtv4tieeL89wbNEA+8LhG7IItVfzF/xtIedgIlDcNv4W+HFdb
         gOVS8W6/3oFrmav4Is+lJh0cqFXy6x6/bN5VI1xeHHZpPrLsRpN0cSUwuFICVNZn7t
         dAA/oyzmsil3A==
Date:   Mon, 26 Apr 2021 11:31:56 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mmc tree
Message-ID: <20210426113156.5e445705@canb.auug.org.au>
In-Reply-To: <20210416134907.356dad53@canb.auug.org.au>
References: <20210416134827.1f35b1cd@canb.auug.org.au>
        <20210416134907.356dad53@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XDtYj_mm3YbLuK_cS_VZ7Fp";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/XDtYj_mm3YbLuK_cS_VZ7Fp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 16 Apr 2021 13:49:07 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> This is actually just a warning.
>=20
> On Fri, 16 Apr 2021 13:48:27 +1000 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > After merging the mmc tree, today's linux-next build (x86_64 allmodconf=
ig)
> > failed like this:
> >=20
> > In file included from drivers/memstick/host/r592.h:13,
> >                  from drivers/memstick/host/r592.c:21:
> > drivers/memstick/host/r592.c: In function 'r592_flush_fifo_write':
> > include/linux/kfifo.h:588:1: warning: ignoring return value of '__kfifo=
_uint_must_check_helper' declared with attribute 'warn_unused_result' [-Wun=
used-result]
> >   588 | __kfifo_uint_must_check_helper( \
> >       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >   589 | ({ \
> >       | ~~~~
> >   590 |  typeof((fifo) + 1) __tmp =3D (fifo); \
> >       |  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >   591 |  typeof(__tmp->ptr) __buf =3D (buf); \
> >       |  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >   592 |  unsigned long __n =3D (n); \
> >       |  ~~~~~~~~~~~~~~~~~~~~~~~~~~
> >   593 |  const size_t __recsize =3D sizeof(*__tmp->rectype); \
> >       |  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >   594 |  struct __kfifo *__kfifo =3D &__tmp->kfifo; \
> >       |  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >   595 |  (__recsize) ?\
> >       |  ~~~~~~~~~~~~~~
> >   596 |  __kfifo_out_r(__kfifo, __buf, __n, __recsize) : \
> >       |  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >   597 |  __kfifo_out(__kfifo, __buf, __n); \
> >       |  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >   598 | }) \
> >       | ~~~~
> >   599 | )
> >       | ~
> > drivers/memstick/host/r592.c:367:2: note: in expansion of macro 'kfifo_=
out'
> >   367 |  kfifo_out(&dev->pio_fifo, buffer, 4);
> >       |  ^~~~~~~~~
> >=20
> > Caused by commit
> >=20
> >   4b00ed3c5072 ("memstick: r592: remove unused variable") =20

I am still getting this warning ...

--=20
Cheers,
Stephen Rothwell

--Sig_/XDtYj_mm3YbLuK_cS_VZ7Fp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCGGAwACgkQAVBC80lX
0GzoLAf+K8XbStnBqdLgx2dt3clW8VkIwEcUn2Lr4vLq6EkKXsEfuZ2gj89R4mg1
ZjSTZiU8Es4pEZAJR9Ws9zPAlCIP/is2VZIOrT7ry9GnN0sCgUGDHRsE+s9D8bMU
qZl1DW8RMrrHAVS67eGclawFPC/lJqV5LxjCdPDzEvwpDFzdXLuE6VuuGkBhr/+t
Da4yPdFu5k5qxcMEM9xv6whlZOTgSr+jtddupecZsIkdILT26YHhD7Zir48PLt+c
PDPf8s839QhW65W+WKUPPTf1Zv6FlHq12h353qLqp+vf3arBG77zECWVrHldlEIg
f57IKfsHxKGPMeEbVJLko34eLXnz4Q==
=HF7S
-----END PGP SIGNATURE-----

--Sig_/XDtYj_mm3YbLuK_cS_VZ7Fp--
