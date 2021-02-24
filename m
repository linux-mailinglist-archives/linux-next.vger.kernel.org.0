Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AAD73236E7
	for <lists+linux-next@lfdr.de>; Wed, 24 Feb 2021 06:34:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232177AbhBXFeI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 24 Feb 2021 00:34:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231445AbhBXFeF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 24 Feb 2021 00:34:05 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94772C061574;
        Tue, 23 Feb 2021 21:33:25 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Dll2960Ltz9sVV;
        Wed, 24 Feb 2021 16:33:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1614144802;
        bh=C6XcG0ZqyBYzqgo5pcbsT5QPz1KFp4FZCC329QMx1ZA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=u9zpMiE9s8U46rn2km8UsSVlET+T1xm491gQHx4povGho3WqJggDUzzCf8R14ODig
         Lf9xULblBqb5TbXUtXzwz0tgFPuvMLe5VYrxsMZTE8U18iXZcpCnu6sk2H9xZMFbz3
         7ONh3bWIYGmeG12y01OUGaJuUZU2cQzwh911uESST2W95Y9BZSpTeZSf6a9JkTQ3Tf
         dvuPSlYoLcB4FprBxiIklvOH/rf9pVV8xvdQiy7BO4p7bqpLN/oqeSzo1kiTdvEBDI
         cm7jyNFpTxLZCY3y3ZDFllkIw+ypiNQ5xpu2lZumRWpQlS0ifAAVuMiqihOzuhZAeG
         dFyy9vokazWKw==
Date:   Wed, 24 Feb 2021 16:33:20 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the block tree
Message-ID: <20210224163320.2d8d810b@canb.auug.org.au>
In-Reply-To: <BYAPR04MB49653608E4E792BCC8804616869F9@BYAPR04MB4965.namprd04.prod.outlook.com>
References: <20210224133140.5f02fa0e@canb.auug.org.au>
        <BYAPR04MB49653608E4E792BCC8804616869F9@BYAPR04MB4965.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CPEGNstj98ZwpjqBEWMZ63M";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/CPEGNstj98ZwpjqBEWMZ63M
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Chaitanya,

On Wed, 24 Feb 2021 05:25:49 +0000 Chaitanya Kulkarni <Chaitanya.Kulkarni@w=
dc.com> wrote:
>
> On 2/23/21 18:31, Stephen Rothwell wrote:
> > Hi all,
> >
> > After merging the block tree, today's linux-next build (htmldocs)
> > produced this warning:
> >
> > kernel/trace/blktrace.c:1878: warning: Function parameter or member 'rw=
bs' not described in 'blk_fill_rwbs'`
> >
> > Introduced by commit
> >
> >   1f83bb4b4914 ("blktrace: add blk_fill_rwbs documentation comment")
> >
> > -- Cheers, Stephen Rothwell =20
> I've failed to understand this warning as rwbs is present in the doc head=
er
> and in the function parameter :-

I presume it is the missing ':' after @rwbs in the comment.

--=20
Cheers,
Stephen Rothwell

--Sig_/CPEGNstj98ZwpjqBEWMZ63M
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmA15SEACgkQAVBC80lX
0Gx7NQf/eT8Z1qwVFTMJIkhGrC8n2Y8BsUy8dSefw7V2t5TVo4sUl3mVQ4tN3l40
BdvDvcNfAvAEdcUypeLi3GC4L2aLEECS1TASvtv4CNrqyi7VCsuKwc+393bMlMxH
JlGjeLrAYTrMjGRuF78wvM7Nz/4mxF3PI6Y7AM2dShIG/+S2BdHkvuehvTauk7bT
s1AnrJs1TRmDA0ExMRVycpFT7YKi2eio4fbMc14tq+jc20fJwawd6wiKLAxAM8+w
5gy84IjYSUnCwiQAi6rxa26fh+/YvkRCaebxYiRdw8vuGzPkp6Rl/aXtF3T8Rqhy
1BSaDkPVjFz7k5EaP7O/ScHxFAmRRg==
=8Uhm
-----END PGP SIGNATURE-----

--Sig_/CPEGNstj98ZwpjqBEWMZ63M--
