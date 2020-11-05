Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65FF82A7884
	for <lists+linux-next@lfdr.de>; Thu,  5 Nov 2020 09:03:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728048AbgKEIDq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 5 Nov 2020 03:03:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725827AbgKEIDq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 5 Nov 2020 03:03:46 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E843EC0613CF;
        Thu,  5 Nov 2020 00:03:45 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CRbcv4zGNz9sSs;
        Thu,  5 Nov 2020 19:03:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1604563423;
        bh=POksiKPA1qa1KB8wRh5C1SmgYhsq74oyVXJoGkVdJuI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=GNV2e/C6AXx2DFMdnI1Y+KHU/2+al1eViJCJUsnsJyKsmy7k+EY+ZuFwYKwWV88y/
         kc+1FhsOrEJT96LN2E+1fkYrEi67VxYAhYhpuu+9TyVkzq3LcxrjXSfbq5AQC4deUB
         wwCgQjMvK/FxJS35MUc1WxUFC+2Q65T1Og40LTmFIe7JsrrCxl1GzAuaDddSCFQsED
         xK7SIZ31I/1ARlzXYKQhQDP1eMHRQ0uSlBas5h5lZzKn3Ogv7md6Kx6K1jKnIsy/D2
         JcvFiSkD8RD3PjTGdYR/qHCAD4RQ1nwR0lzV9IOee4jMScv+jCv1uBBiMOT8rxBfVG
         JRS5qJTeDyefQ==
Date:   Thu, 5 Nov 2020 19:03:43 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Anand K. Mistry" <amistry@google.com>
Cc:     Mike Rapoport <rppt@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the akpm-current tree
Message-ID: <20201105190343.7f7bcfd3@canb.auug.org.au>
In-Reply-To: <20201105190011.7089f9a6@canb.auug.org.au>
References: <20201105174549.614c2de4@canb.auug.org.au>
        <20201105070311.GU4879@kernel.org>
        <CAATStaMD=w+onf==L-=MQ7suJf6EaNoup5o8yW-TEbfajkbdaQ@mail.gmail.com>
        <20201105190011.7089f9a6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vRi2KX9xRiR8z/Le8rRGQc4";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/vRi2KX9xRiR8z/Le8rRGQc4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Anand,

On Thu, 5 Nov 2020 19:00:11 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> On Thu, 5 Nov 2020 18:42:23 +1100 "Anand K. Mistry" <amistry@google.com> =
wrote:
> >
> > How would I go about fixing this? Send a new (v2), fixed patch to the
> > mailing list? I'm not that familiar with how patches get merged
> > through the branches. =20
>=20
> Since this is in Andrew's quilt series, either a v2, or an incremental
> patch (to wherever the original went - including cc'ing Andrew).  If
> you send a v2, he will probably turn it into an incremental patch and
> then squash it back before sending it to Linus.

And if you cc me as well, I will add it to the copy of Andrew's series
that I have in linux-next (so I won't have to worry about the warning
until Andrew gets around to sending out a new version of his quilt
series).
--=20
Cheers,
Stephen Rothwell

--Sig_/vRi2KX9xRiR8z/Le8rRGQc4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+jsd8ACgkQAVBC80lX
0Gz1pgf+NtRLg3uZ4uuZeAym0lxMbo7NxHjgjE0oM6a4l3M4KZ6R3iqIZ/rWH8oj
1OaNvwOC5IOLtXb74DkcR/wUpxAX5xPDm0W0PG76rOMpFbaNj/dQy9JdXya2v+EZ
EZ03ALC7xXGXL2I03F2QltA5kDwZ0ekKYVQ8VdTlVG/ikbzLlqNCTDhP6xeRCdwp
HfvagUIahd+QCi3aBXmdogbLtJFD06oQm657blyEmwcptHWvzV/2DD+brc0W66IG
aLATTXmimcjkPIaFadVhDOzwBkrKHGo1gLE/kHWFgz/bIoaxw6bZpbIMqmgmhOhZ
+OOB1b4KxmiMRRywdsSS5PG4suTR3Q==
=2OvE
-----END PGP SIGNATURE-----

--Sig_/vRi2KX9xRiR8z/Le8rRGQc4--
