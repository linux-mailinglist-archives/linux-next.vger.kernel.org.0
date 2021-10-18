Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3954431262
	for <lists+linux-next@lfdr.de>; Mon, 18 Oct 2021 10:45:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230416AbhJRIrt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 Oct 2021 04:47:49 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:34493 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230092AbhJRIrs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 18 Oct 2021 04:47:48 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HXr730XQqz4xbL;
        Mon, 18 Oct 2021 19:45:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1634546736;
        bh=dosH8pHHYu8D3D/vD2juZ/2CitdBZKBI4iYXxpuDtSg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Euc6b4NY6UWVWfOnzvItSYplIoEL4rbBjo1nJWywq/mOKmrTrrYXWz4KvQfqONYBl
         vyYSlaUAelIbJqa0Vor/mJk1CKGo2G3fYhORlkjxXpM+2+aFKTsAfWa1bwlYtWdJ7S
         TIiJlrJ+SzAPY/R3gJLECxwsCJg+pfQ2Jpb8EWc0eF+JcCmpT+3QwJMzYsr9+XWjmQ
         vkLy2hbPAju+gP0STE2DGMdM5uyJgbMWi0yUz4DYrMM7K8j5SH2KZ4Q+7rdHaQM6NN
         pYtx0xNUmg7qVeWqDDkV8tshDpyPz7U/LLE9i4onfV+xYxO6f15c6Vm0zuDUa/twFb
         hzLTBvyTkRdnw==
Date:   Mon, 18 Oct 2021 19:45:33 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Message-ID: <20211018194533.7af364fa@canb.auug.org.au>
In-Reply-To: <CAHp75VcDwBkwL4+cFmeJt7b-p6V0w283ai9T9K02y0Sej0WLxg@mail.gmail.com>
References: <20211015202908.1c417ae2@canb.auug.org.au>
        <YWl+0PFixaNqgIxb@smile.fi.intel.com>
        <20211018133538.2a0dec43@canb.auug.org.au>
        <CAHp75VcDwBkwL4+cFmeJt7b-p6V0w283ai9T9K02y0Sej0WLxg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/MECgz2_tIGkl=bc0U/=V/b1";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/MECgz2_tIGkl=bc0U/=V/b1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andy,

On Mon, 18 Oct 2021 11:01:18 +0300 Andy Shevchenko <andy.shevchenko@gmail.c=
om> wrote:
>
> On Mon, Oct 18, 2021 at 6:49 AM Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
> > On Fri, 15 Oct 2021 16:14:56 +0300 Andy Shevchenko <andriy.shevchenko@l=
inux.intel.com> wrote: =20
> > >
> > > Thanks! As a quick fix looks good, but I think we need a separate hea=
der for
> > > those _*_IP_ macros. =20
> >
> > Like this (on top of my previous fix - which I assume Andrew will
> > squash out of existence)? =20
>=20
> Yep, thanks!
> I thought that it makes sense to have STACK_MAGIC also in this header. Th=
oughts?

You might want to think of a different name for the header file then.

>=20
> One spelling correction below.
>=20
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Mon, 18 Oct 2021 13:27:54 +1100
> > Subject: [PATCH] kernel.h: split out instrcutions pointer accessors =20
>=20
> instructions

instruction ?  :-)

--=20
Cheers,
Stephen Rothwell

--Sig_/MECgz2_tIGkl=bc0U/=V/b1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFtNC4ACgkQAVBC80lX
0Gx2JAf/TUkA8/yENQVQ6n41UTWoTrhojp3XqoMqLFiIo88Tvl4bR2aOy+pJ5LhR
NgUmBhEBh0JnM5AGwXfCmxPakySbbLS0LsjvHi1QN4cP8WgvvedZmrZd8jPID0nr
sfzMFlChijRaHfWfDyokAjk9y4pwm5R6C2M/WqacpqXRTZ8JTD3YpzeseVSxyk9g
SanxeNPSygv+oO0IOi5405ChUI7avDebiP4k5q5+a1cupOEKaRE8c9/vPtsVJHJZ
NVMvdVZUIYJD0ZAZhxI+NM4ZuVZPxuNCrrpNsVWc9uEfw80meeM9RT1v8Xadvg1N
L/5HdcQV1KTj1qlFBSDYhSbTCK5Faw==
=OIV5
-----END PGP SIGNATURE-----

--Sig_/MECgz2_tIGkl=bc0U/=V/b1--
