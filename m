Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79D9418AB3A
	for <lists+linux-next@lfdr.de>; Thu, 19 Mar 2020 04:44:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726646AbgCSDoR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Mar 2020 23:44:17 -0400
Received: from ozlabs.org ([203.11.71.1]:53845 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726596AbgCSDoR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 18 Mar 2020 23:44:17 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48jXp52jlyz9sPF;
        Thu, 19 Mar 2020 14:44:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1584589454;
        bh=8etUWPTqtQkjATtbjyZYzPluA401McEpzaaW2UAYglY=;
        h=Date:From:To:Cc:Subject:From;
        b=tK268a2bLYDFV1xl0cqQmqujdpb696Dq3xl1DmLl0DWqy9rXjntHqDqEHboLPW3ra
         25kt3Oap7sE8GfNRpD/EX/khPFc9yN1c9SB7SFJUrMgqvibUyytt0uZbKwXmhdu/NS
         Er4C3GdTpMf3z1L8ITLqCA5Jj+AeWdeQWBCp7IJSglvuCUe9+73U7vyB7j20kFS3Z3
         6SwcYtIKO0C6T4QDp6rnzd4kSbgMQm1M4f5rK20y3bwMWSzV9Tp2AxUz1HmEJTrXzR
         QnZgLpfZYBUg3glZCgtTTI6kx5tdzcY+nnkooler+Kq8yQ3qHZnzfKc6z1o2yHZd/5
         qwLkqXeN/e2AA==
Date:   Thu, 19 Mar 2020 14:44:11 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Chuhong Yuan <hslester96@gmail.com>,
        Kaaira Gupta <kgupta@es.iitr.ac.in>
Subject: linux-next: manual merge of the staging tree with the v4l-dvb tree
Message-ID: <20200319144411.47150f3b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/__nxe++7r88FQE1eAPyIgUC";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/__nxe++7r88FQE1eAPyIgUC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the staging tree got a conflict in:

  drivers/staging/media/allegro-dvt/allegro-core.c

between commit:

  cc62c74749a3 ("media: allegro: add missed checks in allegro_open()")

from the v4l-dvb tree and commit:

  e3d21cbfa978 ("staging: media: allegro: align with parenthesis")

from the staging tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/staging/media/allegro-dvt/allegro-core.c
index 3c949090e8d2,1162cc38f3fc..000000000000
--- a/drivers/staging/media/allegro-dvt/allegro-core.c
+++ b/drivers/staging/media/allegro-dvt/allegro-core.c
@@@ -2321,15 -2324,10 +2321,15 @@@ static int allegro_open(struct file *fi
  			0, ALLEGRO_GOP_SIZE_MAX,
  			1, channel->gop_size);
  	v4l2_ctrl_new_std(handler,
- 			&allegro_ctrl_ops,
- 			V4L2_CID_MIN_BUFFERS_FOR_OUTPUT,
- 			1, 32,
- 			1, 1);
+ 			  &allegro_ctrl_ops,
+ 			  V4L2_CID_MIN_BUFFERS_FOR_OUTPUT,
+ 			  1, 32,
+ 			  1, 1);
 +	if (handler->error !=3D 0) {
 +		ret =3D handler->error;
 +		goto error;
 +	}
 +
  	channel->fh.ctrl_handler =3D handler;
 =20
  	channel->mcu_channel_id =3D -1;

--Sig_/__nxe++7r88FQE1eAPyIgUC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5y6osACgkQAVBC80lX
0Gzgcgf9H0E/AraQZJRVb0y+72iXqeKhizq2R8LLr6XD4mYzG4P8GFCIvw8P8Vae
Y6v2ytbMsOaXlmA27uu6rFWNF6UljEW7GKgbGmB3q3UvrolbzjtOBnDS6OIuqptC
wrlaGPNbwjLVyatBrIDGDBJXGoHmkODern80i3H8c9fHZ2rCxzHK6oTDu/ugRNWA
9aFvM3+smBJNcweoYrkaQNuJZSeK8Kea61sy38OoaL18k9nAJV9tKYsu7QYNTYnU
EQ21/UBkxYAnTMLizSzcR5YUTF43/Ujn4vDlnV0Qh9qT1PaKAmnAlW0E2nyesWYa
1nDAQf6S7+/KfGHD9BhCINJTmjKfvw==
=GgZX
-----END PGP SIGNATURE-----

--Sig_/__nxe++7r88FQE1eAPyIgUC--
