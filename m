Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78BB1265878
	for <lists+linux-next@lfdr.de>; Fri, 11 Sep 2020 06:47:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725613AbgIKErM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 11 Sep 2020 00:47:12 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:53321 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725446AbgIKErL (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 11 Sep 2020 00:47:11 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BnjsQ2dfnz9sTS;
        Fri, 11 Sep 2020 14:47:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1599799629;
        bh=Dm+WuyJZSvm1uY1TrDmeskpiMkVr401nDAZRRY0remI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=V9dV4KVP7UOLbKDNoVlGkvw5U4qH8PgOIsa779Fj4uQrVXZulcc1AjsFdXk6wCPKI
         S0smdbM8DoCmcfey+se0qdFePFa0mG+tIStGKqfNVuZ9BZZeQcGKJ+Vx7HJlZBLOxF
         O4NkURlG56aH+Yhm3cP8C4sz93ddyJBbFc3nMd0bxoBvxMrE7CXuL/bw9cMt9OXgGb
         qKfTnD5GiXNcvKtvpV1z1JLwnEgMnN2YI8hrP1siZx1mY2H8B6NBJC25a9vmRL4S0H
         Kc7QnMbNXWHCkcDzOkQbvjDvOUv01xN83SSrz2e3t/HDrxdwxdsFeRN1bGvsfxz83v
         EPxUzr6MzHkJw==
Date:   Fri, 11 Sep 2020 14:47:02 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     James Bottomley <James.Bottomley@HansenPartnership.com>
Cc:     "Martin K. Petersen" <martin.petersen@oracle.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the scsi-mkp tree with Linus' tree
Message-ID: <20200911144702.3d508d31@canb.auug.org.au>
In-Reply-To: <20200902151235.49794c8a@canb.auug.org.au>
References: <20200902151235.49794c8a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Bh34DMm2EpMELx7voOI=bPq";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Bh34DMm2EpMELx7voOI=bPq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 2 Sep 2020 15:12:35 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the scsi-mkp tree got a conflict in:
>=20
>   drivers/scsi/aacraid/aachba.c
>=20
> between commit:
>=20
>   df561f6688fe ("treewide: Use fallthrough pseudo-keyword")
>=20
> from Linus' tree and commit:
>=20
>   cfd3d2225aa5 ("scsi: aacraid: Remove erroneous fallthrough annotation")
>=20
> from the scsi-mkp tree.
>=20
> I fixed it up (I removed the line removed by the latter - it was rewritten
> by the former to "fallthrough;") and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

This is now a conflict between the scsi tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Bh34DMm2EpMELx7voOI=bPq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9bAUcACgkQAVBC80lX
0GxfLQf/UKoDyvOmX3aWkKy51Lfv3RMb1RBceQVD+IIiYeSiWix4j5Du4pZIIBhw
W3bQitICoY0oSlRjS/hn9saW2PQ4/uzrmwu39NSYf0rZ7PaFFkYbN04TymMOhfFs
EenAUKa1sBHxsXXwRG+CwiwLU+tiz+zrg8Iw7K10Hfcx7TRFHw1ntbNjzA3UEsQs
bp1jI0263Ur8xWrzijwI8B8Xg5LeUmc/dx8ksDzbti64xyllosScz8wPjVNuT4/s
sMj5zm5Mlj+qBqpXrLcOP7JcSgvMB8185EWGxE+xx17IQKYTi+oP4LuZaQUz2+9N
u+V44NdYH83GAaEk9zkS2nGaSeg9bQ==
=YnE7
-----END PGP SIGNATURE-----

--Sig_/Bh34DMm2EpMELx7voOI=bPq--
