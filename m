Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F5F0230547
	for <lists+linux-next@lfdr.de>; Tue, 28 Jul 2020 10:24:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728134AbgG1IYD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 28 Jul 2020 04:24:03 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:39759 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728068AbgG1IYD (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 28 Jul 2020 04:24:03 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BG8pS1NyFz9sRW;
        Tue, 28 Jul 2020 18:24:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1595924640;
        bh=60mZRoWM2idPyLTMkNGGtMlwz70fmdg4RXl5UmowsdU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=HKHeOMmtJz8kLW8dWnEyVdXXSFrawjEsVH/W5ODJ/9RLFTFrmM1JRFf8vmtAYnoAZ
         W/Yceq0MYOTGblXw37yDc8cbqVZb0sbd+aFqyy15R19sb9aHJtYDUWx4cFU+RKTQEH
         6vh4/4k93uuwIogUr8yaQtCNiX+/1lwXRoLAAkdjygHc0Zit04klYJecK41jR+u7br
         zIYkyX+BGMffABaZq8g7LgK1xgS8nqqTLOAT4hwEbWaC+rD9h1HRkjAt7IkS/ti7W7
         CU2fxtylh8yuEfyllUZVKRHmeAz1HT45svcFUZ7wC48+FXWQPzm9xO+AKKsMbcMoaI
         besgCas1fsEiw==
Date:   Tue, 28 Jul 2020 18:23:59 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Oded Gabbay <oded.gabbay@gmail.com>,
        Omer Shpigelman <oshpigelman@habana.ai>
Subject: Re: linux-next: build failure after merge of the char-misc tree
Message-ID: <20200728182359.2b9b31bf@canb.auug.org.au>
In-Reply-To: <20200728075336.GB351768@kroah.com>
References: <20200727180831.6c356fc1@canb.auug.org.au>
        <20200727092448.GB1764157@kroah.com>
        <20200728173331.5bf1f438@canb.auug.org.au>
        <20200728075336.GB351768@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wkuDAp/IUbg_VsGwI2uOlDA";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/wkuDAp/IUbg_VsGwI2uOlDA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Tue, 28 Jul 2020 09:53:36 +0200 Greg KH <greg@kroah.com> wrote:
>
> On Tue, Jul 28, 2020 at 05:33:31PM +1000, Stephen Rothwell wrote:
> > Hi Greg,
> >=20
> > On Mon, 27 Jul 2020 11:24:48 +0200 Greg KH <greg@kroah.com> wrote: =20
> > >
> > > On Mon, Jul 27, 2020 at 06:08:31PM +1000, Stephen Rothwell wrote: =20
> > > > Hi all,
> > > >=20
> > > > After merging the char-misc tree, today's linux-next build (x86_64
> > > > allmodconfig) failed like this:
> > > >=20
> > > > In file included from drivers/misc/habanalabs/goya/goya.c:8:
> > > > drivers/misc/habanalabs/goya/goyaP.h:12:10: fatal error: habanalabs=
.h: No such file or directory
> > > >    12 | #include "habanalabs.h"
> > > >       |          ^~~~~~~~~~~~~~
> > > > In file included from drivers/misc/habanalabs/goya/goya_security.c:=
8:
> > > > drivers/misc/habanalabs/goya/goyaP.h:12:10: fatal error: habanalabs=
.h: No such file or directory
> > > >    12 | #include "habanalabs.h"
> > > >       |          ^~~~~~~~~~~~~~
> > > >=20
> > > > Presumably caused by commit
> > > >=20
> > > >   70b2f993ea4a ("habanalabs: create common folder")
> > > >=20
> > > > I have used the char-misc tree from next-20200724 for today.   =20
> > >=20
> > > Ugh, this is a mess of a merge with this driver.
> > >=20
> > > Oded, I'll take Stephen's merge resolutions here and push out a new
> > > version, and try to resolve this error, but if you could verify I got=
 it
> > > correct, that would be great. =20
> >=20
> > The conflicts are gone, but I still get these errors. =20
>=20
> Very odd, I can not duplicate this at all here.  I just did a clean
> checkout of the char-misc-next branch and a full 'make allmodconfig' for
> x86_64, and it worked just fine.
>=20
> Are you sure it's not coming from some other tree?

Do you build with a separate object tree?  I always use make O=3D...
which makes the difference.  I tested with just your tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/wkuDAp/IUbg_VsGwI2uOlDA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8f4J8ACgkQAVBC80lX
0GyZBAf+JOBkbFTavF6sh5WjNeVue+y+tHkuofKhbdU3DJrSpkGTQKpl7f9DNaP9
lAO47a1QwTQ8HAQrGtuLM6DhX20/QJfBxmk/kDtBWSo/0qiyuuL7EF7LvV6eMgSJ
qgTuAoZtSy6Fd1m0w3DtpJtwXdHgaPmYFzwJmmHd4PstrQy5m76rCmrIyAGlumJE
0CqqD8lQsLFhwYqEbtSralKIdkzzrVFkH86G/67RXuZUmi0z9b2SflEpvpobuyHv
Nc3DZK653swd2z2AzUgKLOsu03QC9Q25w5pLZM16vQKA29L/4xupYOqgUZJQsZ/d
sobdabDztFePUPIWL6W71UbBwoMiRA==
=bXqx
-----END PGP SIGNATURE-----

--Sig_/wkuDAp/IUbg_VsGwI2uOlDA--
