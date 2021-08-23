Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62B153F48C7
	for <lists+linux-next@lfdr.de>; Mon, 23 Aug 2021 12:37:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234188AbhHWKi2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 23 Aug 2021 06:38:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233899AbhHWKi1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 23 Aug 2021 06:38:27 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7164EC061575;
        Mon, 23 Aug 2021 03:37:45 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GtTGH0jB7z9sWc;
        Mon, 23 Aug 2021 20:37:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1629715063;
        bh=9t3C/iREO5sH++MPba8Laj5fbg4WX2W1szvEXVb10Q8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=GnykghnJJCqlTDrqxtukrKZUsUi6AcKTtkD7f23c573Sn3XCwAFeEpq1lSV5xaUJx
         K57xAEmCyMfWH7cH5j+XZV89JIv1KkXnk65DS4qcoiX4+655mM0srHhPmmWTY8FQGj
         jRYNvlgoV0hPW/S0pBJwZK/xbaPs8n+wKvF8ZS5Ooq6/mKhngd0RTU3I8WrSlu2OMa
         BNMDSE3H+6Eib3kC1qy305lPnJK8p7pIG2/RVaBs1iqKvEqEztjz2Jgd8MH58Z8Hlf
         WvFbgoKwf+hwsbyurcB92KjwJ7oUcymtTvRo4L7ExP8X63jlZ6TU7VQtcQGrmHKwwC
         oGfCt1W5R1HUA==
Date:   Mon, 23 Aug 2021 20:37:42 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Kees Cook <keescook@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nathan Chancellor <nathan@kernel.org>
Subject: Re: linux-next: Tree for Aug 20 (Wno-alloc-size-larger-than)
Message-ID: <20210823203742.5169ad54@canb.auug.org.au>
In-Reply-To: <8b9cb816-9d8a-2633-1afa-f5c4597a8314@infradead.org>
References: <20210820192615.23e2e617@canb.auug.org.au>
        <2706a406-9f72-7df1-03f6-f8e852897eb2@infradead.org>
        <202108202248.921E8C66@keescook>
        <8b9cb816-9d8a-2633-1afa-f5c4597a8314@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/H5_=Jn3oZB3+lLt516dPwFR";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/H5_=Jn3oZB3+lLt516dPwFR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Sat, 21 Aug 2021 12:09:48 -0700 Randy Dunlap <rdunlap@infradead.org> wro=
te:
>
> On 8/20/21 10:48 PM, Kees Cook wrote:
> > On Fri, Aug 20, 2021 at 02:54:05PM -0700, Randy Dunlap wrote: =20
> >> On 8/20/21 2:26 AM, Stephen Rothwell wrote: =20
> >>> Hi all,
> >>>
> >>> Changes since 20210819:
> >>> =20
> >>
> >> Both linux-next and mmotm have many of these warnings when using
> >> gcc (SUSE Linux) 7.5.0:
> >>
> >> cc1: warning: unrecognized command line option '-Wno-alloc-size-larger=
-than' =20
> >=20
> > Ew. Thanks for letting me know. I thought I'd verified this existed in
> > gcc going back to 4.9, but it looks like I did something wrong in that
> > test.
> >=20
> > I think this should fix it:
> >=20
> > diff --git a/Makefile b/Makefile
> > index b0fafc41b686..e33ffa05899e 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1097,7 +1097,7 @@ endif
> >   ifdef CONFIG_CC_IS_GCC
> >   # The allocators already balk at large sizes, so silence the compiler
> >   # warnings for bounds checks involving those possible values.
> > -KBUILD_CFLAGS +=3D -Wno-alloc-size-larger-than
> > +KBUILD_CFLAGS +=3D $(call cc-option, -Wno-alloc-size-larger-than)
> >   endif =20
> >   >   # disable invalid "can't wrap" optimizations for signed / pointer=
s =20
> >  =20
>=20
> Well. That didn't help. This is very weird.
>=20
> This -Wno... option works (is accepted, no warning) on most files
> that are being built, but a few files report an error with it:
>=20
> ../drivers/gpu/drm/radeon/radeon_object.c: At top level:
> cc1: warning: unrecognized command line option '-Wno-alloc-size-larger-th=
an'
>=20
> ../drivers/gpu/drm/amd/amdgpu/amdgpu_object.c: At top level:
> cc1: warning: unrecognized command line option '-Wno-alloc-size-larger-th=
an'
>=20
> ../drivers/hwmon/dell-smm-hwmon.c: At top level:
> cc1: warning: unrecognized command line option '-Wno-alloc-size-larger-th=
an'
>=20
>    CC      arch/x86/kernel/cpu/proc.o
> cc1: warning: unrecognized command line option '-Wno-alloc-size-larger-th=
an'
>=20
> ../arch/x86/kvm/mmu/mmu.c: At top level:
> cc1: error: unrecognized command line option '-Wno-alloc-size-larger-than=
' [-Werror]
>=20
> ../drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c: At top level:
> cc1: warning: unrecognized command line option '-Wno-alloc-size-larger-th=
an'
>=20
> ../kernel/trace/trace_osnoise.c: At top level:
> cc1: warning: unrecognized command line option '-Wno-alloc-size-larger-th=
an'
>=20
>    CC      kernel/dma/mapping.o
> cc1: warning: unrecognized command line option '-Wno-alloc-size-larger-th=
an'
>=20
>=20
> It seems like it might be related to some .config option.
>=20
> I did a couple of partial builds with V=3D1 but that info didn't help me =
any.
>=20
>=20
> If I am the only person seeing (reporting) this build warning, it could
> just be (another) SUSE GCC-ism. (had one just last week with  -Wmain and
> kernel/trace/trace_osnoise.c)

Today, I am also seeing thsese, but only with my sparc{,64} defconfig
cross builds.  This is with gcc 7.3.1 built from sources.  I also just
get a few of them.

Also, I have the above "fix" patch applied (Andrew added it to mmots
today).

So something weird is happening.
--=20
Cheers,
Stephen Rothwell

--Sig_/H5_=Jn3oZB3+lLt516dPwFR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEjenYACgkQAVBC80lX
0GykJwf/QxVBaCpsGAeHrI4VbaB1d79xCF+eidpgQzwwD0tm3bw9lXb+H8IGu65R
14KGzd2vRuVaSqG/AWeg2/uiffSqho1Tzkouo2Qy0C8p9DYjxDIrDevfPW7XebGw
bL49NfWTqI1O0DgqgdpekAzrpGeHjP1r+6csc66Z9OSUpWMvfdNcXrBcGe9a2wX3
wqMtkV0ppvPJnLI1nUUhQ6xnX9KkF+EV99FOPiGm+g3iylEUA2GbQqfHyR/wKEDA
SXwUbeQ6EJ8k5ePg+MW1OUOUvj4T93AXZezEzbDBVjnqTmelQgyHWPGR9IEqrcuz
reNUIxcU6+QbZNlrsN6h1is/RL0YdA==
=ZbXJ
-----END PGP SIGNATURE-----

--Sig_/H5_=Jn3oZB3+lLt516dPwFR--
