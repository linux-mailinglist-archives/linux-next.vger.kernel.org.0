Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24ECD319926
	for <lists+linux-next@lfdr.de>; Fri, 12 Feb 2021 05:32:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229493AbhBLEc0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 11 Feb 2021 23:32:26 -0500
Received: from ozlabs.org ([203.11.71.1]:35925 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229457AbhBLEcZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 11 Feb 2021 23:32:25 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DcLDb0s9Fz9sB4;
        Fri, 12 Feb 2021 15:31:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1613104303;
        bh=itmzlFUyHqeL4s3wEw4G0ZaKppPV6xrZiajsKNwmq5c=;
        h=Date:From:To:Cc:Subject:From;
        b=UWUD/EHB9ckSxYY0kjmpwWrx71QXjtyZnvxMKXWJG/Mq3dYgBM1jv4JgF+Pe30SBl
         bvq6hAflYEWrJgYvTUO2RQokAxjvVhPFjBTqk+gsJLjNvY5t/yRxHtzEf7gBXmKOG4
         3hEavcGsxOdz135dumfadoXTP2GzhOm6JMmIdqTR7jWcJiwbIruLqHSOrobdoQPnsT
         IkRUG6UnXQ4OOeaLvs500DxCiEaSksEpOFc/6q7vhfJy2KmH51nPpEY2acfHuOLYHy
         1YW2Is6gTeKUMQc+GHFQ36l4I8RYCD8S7iBDkCpGKdQA7FnaBiYWLmrAV27AUE6YdR
         +lmS6VJETSdVQ==
Date:   Fri, 12 Feb 2021 15:31:42 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc:     Christophe Leroy <christophe.leroy@csgroup.eu>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the spi tree with the powerpc tree
Message-ID: <20210212152755.5c82563a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QoTe.d1fVIKxU/bYVpVZf7q";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/QoTe.d1fVIKxU/bYVpVZf7q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the spi tree got a conflict in:

  drivers/spi/spi-mpc52xx.c

between commit:

  e10656114d32 ("spi: mpc52xx: Avoid using get_tbl()")

from the powerpc tree and commit:

  258ea99fe25a ("spi: spi-mpc52xx: Use new structure for SPI transfer delay=
s")

from the spi tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

BTW Mark: the author's address in 258ea99fe25a uses a non existent domain :=
-(
--=20
Cheers,
Stephen Rothwell

diff --cc drivers/spi/spi-mpc52xx.c
index e6a30f232370,36f941500676..000000000000
--- a/drivers/spi/spi-mpc52xx.c
+++ b/drivers/spi/spi-mpc52xx.c
@@@ -247,8 -247,10 +247,10 @@@ static int mpc52xx_spi_fsmstate_transfe
  	/* Is the transfer complete? */
  	ms->len--;
  	if (ms->len =3D=3D 0) {
 -		ms->timestamp =3D get_tbl();
 +		ms->timestamp =3D mftb();
- 		ms->timestamp +=3D ms->transfer->delay_usecs * tb_ticks_per_usec;
+ 		if (ms->transfer->delay.unit =3D=3D SPI_DELAY_UNIT_USECS)
+ 			ms->timestamp +=3D ms->transfer->delay.value *
+ 					 tb_ticks_per_usec;
  		ms->state =3D mpc52xx_spi_fsmstate_wait;
  		return FSM_CONTINUE;
  	}

--Sig_/QoTe.d1fVIKxU/bYVpVZf7q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAmBK4ACgkQAVBC80lX
0GxwDgf+LQNlltZd+xuYSuIXW0zN7QqigfOzpezCQv4daK7jfPropPYZyTsC87JK
lj0vZmkheBapZvKKtKbA1VvhJfeqZsy6ojIc2DsegOmFlBtTiv00xvQ8HKsVvYJs
bumKRtrExhWzPJb4HiUmJ8OgFbOkwzwxULIsRtmDaNjUrElIOHsq0806OjkmMAJ5
p92zn/KegmuUjHRzcxU9OqUOffOIvsHDbcrFRg7UyPvw4ZHJgkzMtiobqkYk5MRj
VIdXT8E7WsSrghK+lbqi7hnmyrB8td65QCzllR6z7kitCDgWFQ9S2Hk6MH8XSTnv
NFYF5HMm8RprUx/cvXw6PhBQ1CHXQg==
=9ePJ
-----END PGP SIGNATURE-----

--Sig_/QoTe.d1fVIKxU/bYVpVZf7q--
