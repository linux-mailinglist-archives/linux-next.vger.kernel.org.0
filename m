Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 145B83AFAA8
	for <lists+linux-next@lfdr.de>; Tue, 22 Jun 2021 03:38:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230059AbhFVBk5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 21 Jun 2021 21:40:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229663AbhFVBk5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 21 Jun 2021 21:40:57 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51486C061574;
        Mon, 21 Jun 2021 18:38:41 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G88Dr1Y2Fz9sW7;
        Tue, 22 Jun 2021 11:38:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1624325917;
        bh=kFNyeEu6D6PCkxM1bXD76xhK/Fffg6Ex74qR+O4GdD8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=bSnIPzbN57C39X71d36glQXmMEvh9jz1UWqz203W4koW+ql0vagYBf6ZcudptKqQM
         yccEHoFdr+jdO+Fv1w3p/QKMMaRv1zVRFMpTxON4xM1xbuPBnjpTex3fnT+XRbzrLL
         xO2y0Q61d3DE8SImAGRG0htNMEozHluGZz8NSUz6CZgbj/CQ5TmQ95Ue9XEyfbmiok
         gGQ7YH8xpas30C4Ewaol6IcB6aYgyMaCmsJCMYacx8LzrgCwKLiaMWPKQ2GVGvHlpj
         7pMnr+XOruQj05dhGIbxEb5HtHBoJjhNjEpbsEN+eP9MFwSeWwKx5ZPkw5XN1siEpB
         dO1FX/SSxQ3Aw==
Date:   Tue, 22 Jun 2021 11:38:35 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steven Whitehouse <swhiteho@redhat.com>,
        Bob Peterson <rpeterso@redhat.com>
Cc:     Al Viro <viro@ZenIV.linux.org.uk>,
        Andreas Gruenbacher <agruenba@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the gfs2 tree with the vfs tree
Message-ID: <20210622113835.58589c3d@canb.auug.org.au>
In-Reply-To: <20210611111231.7750bb60@canb.auug.org.au>
References: <20210611111231.7750bb60@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Bb6dVEWX1e4Y8BWWyqADAkO";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Bb6dVEWX1e4Y8BWWyqADAkO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Steven,

On Fri, 11 Jun 2021 11:12:31 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the gfs2 tree got conflicts in:
>=20
>   Documentation/filesystems/porting.rst
>   include/linux/uio.h
>   lib/iov_iter.c
>=20
> between various commits from the vfs tree and the same, older version,
> of the commits from the gfs2 tree.
>=20
> I fixed it up (I used the vfs tree versions) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

I got more conflicts today.

Can we please get that (old, buggy) version of this topic branch
removed from the gfs2 tree (and replaced with a merge of the new less
buggy version (assuming Al will guarantee that it won't change again).

--=20
Cheers,
Stephen Rothwell

--Sig_/Bb6dVEWX1e4Y8BWWyqADAkO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDRPxsACgkQAVBC80lX
0GzPtwgAl9rWp2b7TsgHSXAWpm5rE8XuQ0uukGPP/22LPLBsZ3HsEoSVcppIS4RL
Gojt/RSmuv+/PNXg/OzywAkC4xb69f99Dd6GoNyFmxZi0ymmzLX0JLCLEtyN+6dY
tZiQ03IadZYneQAHYyJs3RLbriPSbdSKuLLV6tL+gREkAmn3TdriwxlK8oEOLbij
xuYsaDLJIjQQlmiYHsAarioebRflBSwDDaEEZ2ZT+FBCGBSp2hMLm7Bl9vCjPmCu
fuSCF/rCzsh8pAZcrJb1/UHj8zDMZWfhV9lywu/PJlquZVX8IxMLmUWW3o3VbNc7
7e5yKGuIaj1sr038EqUF1rQlyQXGLg==
=OEWn
-----END PGP SIGNATURE-----

--Sig_/Bb6dVEWX1e4Y8BWWyqADAkO--
