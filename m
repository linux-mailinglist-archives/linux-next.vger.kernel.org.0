Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DDFA3B3CBB
	for <lists+linux-next@lfdr.de>; Fri, 25 Jun 2021 08:37:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233143AbhFYGjX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 25 Jun 2021 02:39:23 -0400
Received: from ozlabs.org ([203.11.71.1]:34859 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230097AbhFYGjX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 25 Jun 2021 02:39:23 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GB6jn69r8z9sTD;
        Fri, 25 Jun 2021 16:37:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1624603022;
        bh=flrdPP4lWetLsGOkpQIJeMolVYEIPwO1A4NA1wqDIps=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=a+UyihcPEH2BycN/Xgq86+jHbHC8F6lupfVFqsRnZzHBF9V1p2AOvpcJ/siTTgAcM
         N/BQP4QgMR04pQ1Hlc/YglEtFwgJRnn7aweFxOSKts4wDvY6qpuzWoyfysrUs/hYXo
         nlNqfnSeH+oGTTu/myexs9hMq5QyBGGQRLvM62E2RuUmqsURwmuJ2kJo0ty7Z+1I6L
         HC0IfWY5zCE2xyTtSIOkyCbLynxgU0ofZYHkH2JfK03vpj8QyGme1eWgko9TsvQBk2
         xD0Ew3kkYvLu22ucrF6NPrlhg28PZ3TpItjQl7mKBqjeXuHGD3vzzsoLNoWV2ZtMJt
         LXss2C4Ragkig==
Date:   Fri, 25 Jun 2021 16:37:01 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Gavin Shan <gshan@redhat.com>,
        David Hildenbrand <david@redhat.com>,
        Alexander Duyck <alexanderduyck@fb.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Message-ID: <20210625163701.407a2561@canb.auug.org.au>
In-Reply-To: <20210625163442.185b8cb0@canb.auug.org.au>
References: <20210624194301.7474ce76@canb.auug.org.au>
        <0b1d5003-830e-b284-0fca-cc62d9192b65@redhat.com>
        <20210625163442.185b8cb0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VNWqLRc1xUsdJ_V1GrO33s9";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/VNWqLRc1xUsdJ_V1GrO33s9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 25 Jun 2021 16:34:42 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Fri, 25 Jun 2021 16:28:15 +1000 Gavin Shan <gshan@redhat.com> wrote:
> >
> > On 6/24/21 7:43 PM, Stephen Rothwell wrote: =20
> > > Hi all,
> > >=20
> > > After merging the akpm-current tree, today's linux-next build (powerpc
> > > ppc64_defconfig) failed like this:
> > >=20
> > > mm/page_reporting.c:14:37: error: initializer element is not constant
> > >     14 | unsigned int page_reporting_order =3D pageblock_order;
> > >        |                                     ^~~~~~~~~~~~~~~
> > >=20
> > > Caused by commit
> > >=20
> > >    223f64d9e679 ("mm/page_reporting: export reporting order as module=
 parameter")
> > >=20
> > > pageblock_order is defined to be various things depending on CONFIG_
> > > symbols.
> > >=20
> > > I have reverted that commit (and the following three) for today.
> > >    =20
> >=20
> > Yes, Please drop this series for now.
> >=20
> > The v3 was applied and caused the build error. Actually, we need
> > v5, which was posted couple of hours ago.
> >=20
> >     v5: https://lkml.org/lkml/2021/6/24/1137 =20
>=20
> Which version is in today's mmotm?

hmm, looks like v4.  So do I drop these again today?

--=20
Cheers,
Stephen Rothwell

--Sig_/VNWqLRc1xUsdJ_V1GrO33s9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDVeY0ACgkQAVBC80lX
0GzJvwf/Vx6YlTbNye3kcYgjpBjofGm9frax40e0qWpMxtE46FfT67wPUCvbOlhE
KSSr96f5WHg5V1u5RWMl54Sn2sffaefwdUgzK6KchWGOsr5wp3aqW9hwUCa7iw2/
anafxtELcErr8CdOl04DaUBcwkV/WRp7H/4qzifVjEzRk2zB7xAsrZ/bNE9lEfwD
tH+6qes66OaEILm83Ox47zMORjrwf6pAK1udugk5vk1VU1Edkl5hz1J2p/+szBmv
Mtn5v6Gz6V+joBYoZXS8vUO1zbZAJIxFlNnESisJpZjkRkFYPA8iEKYk5PAgTtWs
RZnK3yj3LB5zTyIecXODcGqf0s16LQ==
=1hlK
-----END PGP SIGNATURE-----

--Sig_/VNWqLRc1xUsdJ_V1GrO33s9--
