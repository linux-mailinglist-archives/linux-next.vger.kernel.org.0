Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FDBD3F9222
	for <lists+linux-next@lfdr.de>; Fri, 27 Aug 2021 03:53:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242698AbhH0Bvp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 26 Aug 2021 21:51:45 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:41967 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241109AbhH0Bvp (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 26 Aug 2021 21:51:45 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GwjNY5PvQz9sCD;
        Fri, 27 Aug 2021 11:50:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1630029053;
        bh=aie5UL26z3IQ5fv1fpFPM2km8A8DxItUauX8vRqXMQ8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=d3VpRXtx9lRO29DJZechbnch5sqCXEE09otKf7utmO2b3Oipm/uHYif722Acbk2Sa
         iXsREwMG/P+fL2oAd6uvk6M3qLJcn0u0g5CZJWaf91qRh3CLxWSBjtLkE/du5tT+HR
         QyQexDPJ7LOGlrlbfBBCAWA6nlRlvyWVUZbz0kZRLBQ0epcjgKq/4MX9a9rzNS/i2v
         LhUy793wR9pyc/3dbZqTBL9SP3XIUD0O6zwRFwUDFU7Y9xF9ljqg/jhYG4nuHXBToh
         T1+RjrbEFSZ416TOV4q+vtVLRe2xAIRbclVrzVxuCpSxRXEhO/US8TOqRN9iD+WU21
         6Ta0XXiZP3tag==
Date:   Fri, 27 Aug 2021 11:50:52 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the kbuild tree
Message-ID: <20210827115052.00391d9a@canb.auug.org.au>
In-Reply-To: <CAK7LNASL2JNb4zT7UFr41dLO0oEuvc6yUg__qhc59q8aNqWxEg@mail.gmail.com>
References: <20210826191330.40dc43e8@canb.auug.org.au>
        <CAK7LNASL2JNb4zT7UFr41dLO0oEuvc6yUg__qhc59q8aNqWxEg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pbFC=aYT=Ha0qdZMl6CCJYx";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/pbFC=aYT=Ha0qdZMl6CCJYx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Masahiro,

On Fri, 27 Aug 2021 09:52:18 +0900 Masahiro Yamada <masahiroy@kernel.org> w=
rote:
>
> On Thu, Aug 26, 2021 at 6:13 PM Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
> >
> > After merging the kbuild tree, today's linux-next build (x86_64
> > allnoconfig) failed like this:
> >
> > make[2]: *** No rule to make target 'scripts/mod/empty.o', needed by '_=
_build'.
> >
> > Caused by commit
> >
> >   624a912f84bc ("kbuild: detect objtool changes correctly and remove .S=
ECONDEXPANSION")
> >
> > (at least, reverting that commit fixes it)
> >
> > I use a separate object directory and, in this case, it is newly create=
d.
> >
> > A build with V=3D1 and -s removed (and no -j) gives this around the
> > failure:
> >
> > make -f /home/sfr/next/next/scripts/Makefile.build obj=3Dscripts/mod
> > make[2]: *** No rule to make target 'scripts/mod/empty.o', needed by '_=
_build'.  Stop.
> > make[1]: *** [/home/sfr/next/next/Makefile:1309: prepare0] Error 2
> >
> > I have reverted that commit for today.
>=20
>=20
> Hmm, it is strange.
>=20
>=20
> I re-applied that commit based on today's linux-next
> (git cherry-pick  624a912f84bc)
>=20
> allnoconfig built successfully.
>=20
>=20
> My build log is as follows.
>=20
> Can you tell the exact steps to reproduce the error?
>=20
>=20
>=20
> masahiro@grover:~/ref/linux-next$ git log -2 --oneline
> 5046c6516ca2 (HEAD -> tmp) kbuild: detect objtool changes correctly
> and remove .SECONDEXPANSION
> 88fac11862d3 (tag: next-20210826, origin/master, origin/HEAD) Add
> linux-next specific files for 20210826
> masahiro@grover:~/ref/linux-next$ rm -rf /tmp/foo
> masahiro@grover:~/ref/linux-next$ make O=3D/tmp/foo  allnoconfig all

I did more or less the same:

$ rm -rf ../x86_64_allnoconfig
$ mkdir ../x86_64_allnoconfig
$ make ARCH=3Dx86_64 O=3D../x86_64_allnoconfig CROSS_COMPILE=3Dx86_64-linux=
-gnu- allnoconfig
$ make V=3D1 ARCH=3Dx86_64 O=3D../x86_64_allnoconfig CROSS_COMPILE=3Dx86_64=
-linux-gnu- -O

I do cross builds hosted on a PowerPC LE host.

--=20
Cheers,
Stephen Rothwell

--Sig_/pbFC=aYT=Ha0qdZMl6CCJYx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEoRPwACgkQAVBC80lX
0Gz0OAf/TND0I+ka0YsiXbao+m9ht/s1Pw5GaGxosCynGQbJvb/Pu5WBKV/QaOcI
QnF1wRP5Wl2d02eJRf+SQ/6QLXz5H4XcZdAGSdokCw2GOhvPKkID1rNWs71X8kNd
TxqhvVnCdla6UXorkI62uBd4cb53CY3xRbL1W5RIwqYeBd7g/GcQZiYD9wVYJHiN
RBP2imAhBG9XXgpSKLyfNBz3mwWOtyJxZjSA+gk10756CPHuHqHHQ2mHnyT+Fv7c
Hcga6X6UJ6zFPVI953J0gUJMxVZjx+AyfaY0JYyzWgq2xB7CeCRJU8ZURAuoxc88
2Lf5TPL2RJek1T95AGeDlzxZ4MnbBw==
=A7YH
-----END PGP SIGNATURE-----

--Sig_/pbFC=aYT=Ha0qdZMl6CCJYx--
