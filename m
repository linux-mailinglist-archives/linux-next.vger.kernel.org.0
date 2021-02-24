Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFDC5323AB0
	for <lists+linux-next@lfdr.de>; Wed, 24 Feb 2021 11:46:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234814AbhBXKnt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 24 Feb 2021 05:43:49 -0500
Received: from ozlabs.org ([203.11.71.1]:45497 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234872AbhBXKnm (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 24 Feb 2021 05:43:42 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DlsvP6ys1z9sVS;
        Wed, 24 Feb 2021 21:42:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1614163378;
        bh=OuUg9oPhAqcCqtNXMNc/R1NcXPIuxZmmGVweNj+ErPQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=IfyUQXHwkUphmnDql6XikodFZUZqtAbXklheVmgPsIFN6nar/ybRySo7pjz3ZQCZX
         UhHWTol2pt0ZPC+gaPZEb5TvvYkeUZIQMaGq2hmvSKpHpQv/u5PTIyXTZxe2AmXBP5
         Z0x7Ga7l1sXG9cCy4KJTXvFen/+wQ4yEPt3tMIHQ7dCVulthR6GwK0P7wLEFRF7WH4
         b0dOiDflCd9cJ48aT49JdL6i1hJdqsLg6mjxKNUlGhOvWxQxbVVtQktSYqWFFKR37W
         DITnVqRf3+0XUplpRl+erTuXGdSo5XrGheGDzWH90YkOULXRz2YVFRbFwZqnBH1nmX
         sAUV91ivvsOfw==
Date:   Wed, 24 Feb 2021 21:42:54 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the block tree
Message-ID: <20210224214254.1e5e35f4@canb.auug.org.au>
In-Reply-To: <BYAPR04MB49657DFD56D260A9D58F9E9A869F9@BYAPR04MB4965.namprd04.prod.outlook.com>
References: <20210224133140.5f02fa0e@canb.auug.org.au>
        <BYAPR04MB49653608E4E792BCC8804616869F9@BYAPR04MB4965.namprd04.prod.outlook.com>
        <20210224163320.2d8d810b@canb.auug.org.au>
        <BYAPR04MB49657DFD56D260A9D58F9E9A869F9@BYAPR04MB4965.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/li2+kjCcO+EjFm=EOTYJm5Q";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/li2+kjCcO+EjFm=EOTYJm5Q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Chaitanya,

On Wed, 24 Feb 2021 05:38:06 +0000 Chaitanya Kulkarni <Chaitanya.Kulkarni@w=
dc.com> wrote:
>
> On 2/23/21 21:33, Stephen Rothwell wrote:
> >> I've failed to understand this warning as rwbs is present in the doc h=
eader
> >> and in the function parameter :- =20
> > I presume it is the missing ':' after @rwbs in the comment. =20
> Thanks, I was looking at the wrong places all this time, will send a fix.
>=20
> I'll setup doc generation using sphinx on my machine, is there
> a particular command line that you have used for these warnings ?

I just do a "make htmldocs"

--=20
Cheers,
Stephen Rothwell

--Sig_/li2+kjCcO+EjFm=EOTYJm5Q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmA2La4ACgkQAVBC80lX
0Gy5JQgAkXvXUvpmOb5bdYocdSe7RndQzKiS7wOJRbfd8VeCUXKFPQvsmHnvAyLI
PNmNPhIRh4p6jL6H/bqjTLAM+r1PdMXDwXF6rP9J98IXT6yNzNCbSSW676gErBvw
ntBFahbfTpSHMEvJ6jjc8hviDP6LdVqYv6jxYhirxPwDYsj9Ta3ikA4dRgzCWFrB
0j01RW9Iv+9zlLKkK4+FVxV/2lZI30Y2KwX0R5NU+4pf5d1/MC9ZfDdBTsRxA9tY
igOOtPD8NH46ji3f2lmPFS0u65eHMcfSjWrH7l1LD5UBDyqfpKm2v1i+asu1/3QU
Dy3ekRfKUs1alj41GWjLHNF1O/cjaA==
=6dji
-----END PGP SIGNATURE-----

--Sig_/li2+kjCcO+EjFm=EOTYJm5Q--
