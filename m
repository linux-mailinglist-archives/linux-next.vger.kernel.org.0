Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC6CC1C9FFB
	for <lists+linux-next@lfdr.de>; Fri,  8 May 2020 03:15:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbgEHBPX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 7 May 2020 21:15:23 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:53109 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726495AbgEHBPX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 7 May 2020 21:15:23 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49JC7D1Hryz9sSm;
        Fri,  8 May 2020 11:15:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1588900520;
        bh=fYEX5NyTNYeHcsPw1wDJewWpAjGzrt1vBb05SZWzgbI=;
        h=Date:From:To:Cc:Subject:From;
        b=IrIVDbgCIcMMMM2DIgco5ga/IcgcGrCWG+tuoEsem8x344k82I9PrYByaPbldzSKl
         S3Y7DxiBJiYxbRDu+NDe83lURPl2ac4zz7VcGP2bQs696zfboqR/M7j7J3jKt4FA0v
         7Ou781EZij2lQJayhqFNfbyLAJ5hyDZmB8FjJ86mw2UGKbOL798JnCZ4Aq88BR4MsW
         zIToY6bSig7WNKEhFTnKtifDWETVmDEtMMaP+DGsrR6rkIZemD9HGbamruOuoovVZ9
         EaFwIT5MjAVeIgJxeF4ZUgVq22BWJEXpOWtrXpKJvgw2y9QnWkC3dBhWb5Gwp5sKC3
         gyC8XBwMBkOJQ==
Date:   Fri, 8 May 2020 11:15:18 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Darrick J. Wong" <darrick.wong@oracle.com>,
        David Chinner <david@fromorbit.com>, linux-xfs@vger.kernel.org
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Brian Foster <bfoster@redhat.com>
Subject: linux-next: build warning after merge of the xfs tree
Message-ID: <20200508111518.27b22640@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JuNqr14l__hu6up0y4v5+l/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/JuNqr14l__hu6up0y4v5+l/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the xfs tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

fs/xfs/xfs_buf.c: In function 'xfs_buf_bio_end_io':
fs/xfs/xfs_buf.c:1292:20: warning: unused variable 'mp' [-Wunused-variable]
 1292 |  struct xfs_mount *mp =3D bp->b_mount;
      |                    ^~

Introduced by commit

  7376d7454734 ("xfs: random buffer write failure errortag")

DEBUG is not defined.

--=20
Cheers,
Stephen Rothwell

--Sig_/JuNqr14l__hu6up0y4v5+l/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl60sqYACgkQAVBC80lX
0GwV6wgAhEy/mBgmMwF5v3uDI5dR86qgPS8Sks8IKj4BS6Ec7I5R4c0mulwztpAW
2alPk7MijktAvSZ1Po7RfYv0iNnrgLH7F9S9jC+gkpj281Mb0iE1y3gD6/SWglGv
M6JXOyyFRu1Lq9wJkQTpa+LIFXoPVW5wJhrrhJQgwzI98YeJLwuiCiR07xl5r7I5
dY7LcjeSrCZJdT3uo2L6qKcN+YOdTeU/ND06fwZYb8slTYsDSOwhBRDqz7Ry92Ww
/B3HdcY4jm631u4hz7B5+yEdgnroZwBU0ZBd+yBgs/jyYWIx2frxJFwxmzIfZ7gZ
9P6t1nWNojv9PCphyvBhgmn7gCib5A==
=u0J0
-----END PGP SIGNATURE-----

--Sig_/JuNqr14l__hu6up0y4v5+l/--
