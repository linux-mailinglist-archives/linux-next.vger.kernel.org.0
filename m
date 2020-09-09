Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEFB7262429
	for <lists+linux-next@lfdr.de>; Wed,  9 Sep 2020 02:46:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727088AbgIIAqX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Sep 2020 20:46:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726660AbgIIAqX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Sep 2020 20:46:23 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92E18C061573;
        Tue,  8 Sep 2020 17:46:22 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BmNcX5L7zz9sTW;
        Wed,  9 Sep 2020 10:46:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1599612380;
        bh=LcyqUDdmTFo/hpRQO2EuNKhJuisUTlJ8dkPNFe9MyJU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=c6LQWgXAjJWSgZFeuU/T5fGLN50G2Y6jvVmtiPWLTJFQMHSO8GOwRgjNiMkhyA/4i
         qxESn7015hbbwP4x0HK09pRCY0rvEXHhgC+5ZIK1Xm80k4+HaMt7QqRaxG9LDHY28V
         6QE07ZT3AhmGjn3M9MaCZ2uhVjzLAPAA+/oIn9WdWIFgj6nSoljzzSHbIJP142kKsP
         xmRWPLgCatjEqayTG+p5bf6a3E9uiE5AcIqOAxskpdwLHn6AHot4mr+KCW7cO+ZOm1
         f3h7m8By11mU6rFMG2dUAjfw7MNnWJDM6D62MN5mXoP49dIpJ+NClWVYpdVfHnZBkc
         UFQV4tQhO7d/Q==
Date:   Wed, 9 Sep 2020 10:46:19 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Brendan Higgins <brendanhiggins@google.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: linux-next: Tree for Sep 2 (lib/ubsan.c)
Message-ID: <20200909104619.0902238c@canb.auug.org.au>
In-Reply-To: <84531c68-2ac8-924b-5e71-077f9abb2503@infradead.org>
References: <20200902180950.4bc7c4de@canb.auug.org.au>
        <3abfa193-a56e-66ba-1080-885906fa0196@infradead.org>
        <fdf322d4-cc01-2c85-67cd-86b2d6f4ebff@infradead.org>
        <CAFd5g44g6OrL3fxQNRZ1rR0PruAty8tBZr8JDzM-oonZJRDZyw@mail.gmail.com>
        <84531c68-2ac8-924b-5e71-077f9abb2503@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EXWxTn/MK9ozwgFhmWyLq_J";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/EXWxTn/MK9ozwgFhmWyLq_J
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Randy,

On Tue, 8 Sep 2020 07:38:31 -0700 Randy Dunlap <rdunlap@infradead.org> wrot=
e:
>
> On 9/4/20 12:59 AM, Brendan Higgins wrote:
> > On Thu, Sep 3, 2020 at 11:12 PM Randy Dunlap <rdunlap@infradead.org> wr=
ote: =20
> >>
> >> On 9/2/20 8:44 AM, Randy Dunlap wrote: =20
> >>> On 9/2/20 1:09 AM, Stephen Rothwell wrote: =20
> >>>> Hi all,
> >>>>
> >>>> Changes since 20200828:
> >>>> =20
> >>>
> >>>
> >>> on i386:
> >>>
> >>> ../lib/ubsan.c: In function =E2=80=98ubsan_prologue=E2=80=99:
> >>> ../lib/ubsan.c:141:2: error: implicit declaration of function =E2=80=
=98kunit_fail_current_test=E2=80=99; did you mean =E2=80=98kunit_init_test=
=E2=80=99? [-Werror=3Dimplicit-function-declaration]
> >>>   kunit_fail_current_test();
> >>>
> >>>
> >>> Full randconfig file is attached.
> >>> =20
> >>
> >> Hi Brendan,
> >>
> >> Do you know anything about this build error?
> >>
> >> I can't find kunit_fail_current_test() anywhere. =20
> >=20
> > Yeah, this got applied for some reason without the prerequisite
> > patches. It is from a two patch series, the other being here:
> >=20
> > https://lore.kernel.org/linux-kselftest/20200813205722.1384108-1-urielg=
uajardojr@gmail.com/
> >=20
> > which in turn depends on another patchset which didn't make it into 5.9.
> >=20
> > Again, I don't know why this was applied without it's prereqs. Sorry ab=
out that.
> >  =20
>=20
> Well.  Who is responsible for this small mess?
> It is still killing linux-next builds for me (2020-0908).

It came in via the kunit-next tree (Shuah cc'd).  I will revert commit
abe83f7621ee ("kunit: ubsan integration") today.

--=20
Cheers,
Stephen Rothwell

--Sig_/EXWxTn/MK9ozwgFhmWyLq_J
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9YJdsACgkQAVBC80lX
0GyK+wgAjTHDhBW6vb4+obLH3Ebgk9/5ea0BdLvPmuHn6X2dVOldQRwLDdPEoqUg
Xwrz+9aPXZVeSy+rcTEnQIjEB1+qXhmpbBVu9NUtp9yeowrFU0XHAcRafDamVSB4
o4hHgb4MLvlUd3E22QvacN/Ed4yLFXR4t5x27nlXKpc8heX1h606y9NO878AKVui
ngi4GaQXUSRlNSbwdMGb7fED9o+HiUsJ1ogxl5U6uF9s4fk5zFcLV+yR+AdiCpxJ
89aFZtozDKsKVyu7FLLS8xn1MipzPdLdoLaNsR7LHcR8rOuaD1PAXfwj9E9iz/Y2
XGigs29hVDUCytHm73nPDSTv367JQQ==
=tOVS
-----END PGP SIGNATURE-----

--Sig_/EXWxTn/MK9ozwgFhmWyLq_J--
