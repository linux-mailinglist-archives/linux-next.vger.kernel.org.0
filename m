Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70CE225A4DB
	for <lists+linux-next@lfdr.de>; Wed,  2 Sep 2020 07:12:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726247AbgIBFMk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 2 Sep 2020 01:12:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726177AbgIBFMi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 2 Sep 2020 01:12:38 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B903DC061244;
        Tue,  1 Sep 2020 22:12:37 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BhBrz6Kp2z9sV8;
        Wed,  2 Sep 2020 15:12:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1599023556;
        bh=OVgpZwxPKZezs4JAEifU3gj0ckhtJSxC91J7cHQ4v1w=;
        h=Date:From:To:Cc:Subject:From;
        b=UUWGYckU+kitR0kgC1HoK27w+JH3/e8ZUqVUNDveqaeSCa0hTNfwQdsfZkY2+4XQz
         rhP2836bMdMo3H4N3Jgm8ouf9nguQARZpOQj5D0kAuaLzVnVP+2gkmUvgnLWnMRNc3
         bmlWWPgailmz4BCqvnTePYlvqXNi4c5Hlf45+05QdxKuq/Ir0BqyLsMvpRvKxJCR1w
         /RMipEpHL2L6R2BMvCvoHpQZ4sFd44VL7769O5Zd1Ht0EAgKFe9+cAYdWnwPLiGPat
         LwSN8YUGh/4JsRv5m0CUZAgYFCtKRAZR00QG6HCj2y7rox+ZlDQ74UiRi7GWcHigTI
         /xv9aBtQ9gd4A==
Date:   Wed, 2 Sep 2020 15:12:35 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the scsi-mkp tree with Linus' tree
Message-ID: <20200902151235.49794c8a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xl2_zGKK.=F9mmU41lRmPsK";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/xl2_zGKK.=F9mmU41lRmPsK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the scsi-mkp tree got a conflict in:

  drivers/scsi/aacraid/aachba.c

between commit:

  df561f6688fe ("treewide: Use fallthrough pseudo-keyword")

from Linus' tree and commit:

  cfd3d2225aa5 ("scsi: aacraid: Remove erroneous fallthrough annotation")

from the scsi-mkp tree.

I fixed it up (I removed the line removed by the latter - it was rewritten
by the former to "fallthrough;") and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/xl2_zGKK.=F9mmU41lRmPsK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9PKcMACgkQAVBC80lX
0GzpWQf9GYOr24YfmpdQL8abruYVhTYJGW54jz3DJzz9fN1j3AaLNaFybN7mqWAg
PSK6de6pmUc2QklsSS39/Ppdz5Q+JWODIMy8mPsBIMbfw2/3bTSVPfILhfNpu6oV
IHPHAGcwFB/8keBjwu6W1TOaVEOU29TiVIMQ/Y6ohebjVhQ0th7hoip6sDTHdD0n
rQKHc4gKV2bNpc2w9etWeHRl7uXZE2Ql3LGoe9EqUIQ1n6KbQMQeMEkQsph4gXqH
VUkxxNtuADAq5cAaYDgWKZHZwxoiIbXAJ/nN8SpXvwQBAZJseptA+lkT3eUjzg2h
0gySE3OBZgyQuhrP9jb4ip6HkXDV4g==
=459c
-----END PGP SIGNATURE-----

--Sig_/xl2_zGKK.=F9mmU41lRmPsK--
