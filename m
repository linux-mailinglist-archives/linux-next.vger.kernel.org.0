Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5F353FFA8C
	for <lists+linux-next@lfdr.de>; Fri,  3 Sep 2021 08:46:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346291AbhICGrA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 3 Sep 2021 02:47:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232218AbhICGrA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 3 Sep 2021 02:47:00 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD351C061575;
        Thu,  2 Sep 2021 23:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1630651558;
        bh=Sv9AHa7x6bwTPNF8+oZryfYBqGW90VCGoqNa43VPZeI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ohpERJbyG0ZfNvmmxk/Uh52fR6b6R/WgYpEUTGe2/JqKUq+DJCxebf5vFeUKEsMaD
         /56Su6Sai+x9rkMubgCNd9TBlIh/Oe11jDyO+YHvqk1f7Glu2Nk5dOcWQF5ODUh1wr
         rN1Uul4df+2N79Arz9J1ixwip8Urk1n1t/S5K9LdAKkg7gv945DblL84xb/5reBI9T
         CKocDwV//p/VIL6ZQRswUID712zwFuCvj4NB0isdIGr05Iguf34EY9K9gD5huOA6EN
         x5uUmuHusN58BedoxLkPffII2bf4PrrDLylzHDysEUx7eBRyJRsuGwWCcpzN6CpYqC
         ASecJH4w0mG2A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4H17bp2YpLz9sRf;
        Fri,  3 Sep 2021 16:45:58 +1000 (AEST)
Date:   Fri, 3 Sep 2021 16:45:57 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Logan Gunthorpe <logang@deltatee.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the dma-mapping tree
Message-ID: <20210903164557.24569a83@canb.auug.org.au>
In-Reply-To: <20210813171134.4ad7d640@canb.auug.org.au>
References: <20210813171134.4ad7d640@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/y1Rz00bqncefj6Hk_WxFmqd";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/y1Rz00bqncefj6Hk_WxFmqd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 13 Aug 2021 17:11:34 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> After merging the dma-mapping tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> kernel/dma/mapping.c:224: warning: Function parameter or member 'nents' n=
ot described in 'dma_map_sg_attrs'
>=20
> Caused by commit
>=20
>   fffe3cc8c219 ("dma-mapping: allow map_sg() ops to return negative error=
 codes")

I am still getting this warning.


--=20
Cheers,
Stephen Rothwell

--Sig_/y1Rz00bqncefj6Hk_WxFmqd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmExxKUACgkQAVBC80lX
0GyCrQgAmmZz/t+jTiUv5/W2dddv9hqw6pip6ZuBhmhcYlKo+71Bd9Qk72T1u7Nj
nIoXpWojoFhp+0GYkN3FHAQ9lxZO3v+IXbipwr9O1iX+Sg+ohiIrJiiQUNg4rQqw
WYcHNCfP6ifLZPpZYfxp3wCXZKSU1Jkus/hpm+4M3n1cTZ3Dr/X1y0/jA30ZolUu
OUOXxqa8DAYUautc3tMsZg8ersavvWV9VNEhZweJRjmzgVC+G0D10X+sG4eX4RTJ
QDQgILJIXi9RWf7W655n5L2KFtKQcLulPyXVR/pLOTpZxe3luIqsgdkEIfN37SNL
KAaqekE16Hgg2rJYZDhFD8vrGId6hA==
=KeY2
-----END PGP SIGNATURE-----

--Sig_/y1Rz00bqncefj6Hk_WxFmqd--
