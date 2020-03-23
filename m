Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B93A18EED7
	for <lists+linux-next@lfdr.de>; Mon, 23 Mar 2020 05:18:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725710AbgCWESN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 23 Mar 2020 00:18:13 -0400
Received: from ozlabs.org ([203.11.71.1]:37907 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725208AbgCWESM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 23 Mar 2020 00:18:12 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48m1ML5wdPz9sQt;
        Mon, 23 Mar 2020 15:18:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1584937090;
        bh=x+NQl/E6Mh/u/ePCkbLu0UGyghT5lcOrFoskFG2kFss=;
        h=Date:From:To:Cc:Subject:From;
        b=OP3TgEiqYBkp7Ld1+48zwifmguIU+duMdNIPLF+15q7fteii/ijNdzQpgZUk82GP6
         AWvcY0StAub1rwCbd3OKvnm+0nuy2MifjMYxUysAtcYAaeRDEe/O76riFm68u3H5jB
         mQWwh8miF0n2FpOQ6rkyUu28QBJtsQsVaXhYgKGRaIqWPV3oijZ82IF0p9275cor5D
         gi3bcuyfeocaSIZbmUfKZgtI9zv3nV9Y1N9oBUskKIYn0xQ5tqQQlxJCh81nUh8GP2
         HmPRGKyXUnOujaExsK+hl/aiREH/aaHbLgdTDqGkGzplwywgDDOwVkhgMO0Pb64JKU
         mVOiBsXZqyAKA==
Date:   Mon, 23 Mar 2020 15:18:05 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kaaira Gupta <kgupta@es.iitr.ac.in>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Colin Ian King <colin.king@canonical.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Chuhong Yuan <hslester96@gmail.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: linux-next: manual merge of the staging tree with the v4l-dvb tree
Message-ID: <20200323151805.6a166c84@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+YgsVGcrL=CGBIIOEoP2Q84";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/+YgsVGcrL=CGBIIOEoP2Q84
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the staging tree got a conflict in:

  drivers/staging/media/allegro-dvt/allegro-core.c

between several commits from the v4l-dvb tree and commits:

  5979afa2c4d1 ("staging: Replace zero-length array with flexible-array mem=
ber")
  e3d21cbfa978 ("staging: media: allegro: align with parenthesis")

from the staging tree.

I fixed it up (see bottom and below merge fix patch) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 23 Mar 2020 15:12:50 +1100
Subject: [PATCH] fix up for "staging: Replace zero-length array with flexib=
le-array member"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/staging/media/allegro-dvt/allegro-mail.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/allegro-dvt/allegro-mail.h b/drivers/sta=
ging/media/allegro-dvt/allegro-mail.h
index 1fd36f65be78..17db665f8e1e 100644
--- a/drivers/staging/media/allegro-dvt/allegro-mail.h
+++ b/drivers/staging/media/allegro-dvt/allegro-mail.h
@@ -169,7 +169,7 @@ struct mcu_msg_push_buffers_internal_buffer {
 struct mcu_msg_push_buffers_internal {
 	struct mcu_msg_header header;
 	u32 channel_id;
-	struct mcu_msg_push_buffers_internal_buffer buffer[0];
+	struct mcu_msg_push_buffers_internal_buffer buffer[];
 } __attribute__ ((__packed__));
=20
 struct mcu_msg_put_stream_buffer {
--=20
2.25.0

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/staging/media/allegro-dvt/allegro-core.c
index 34c3e55be902,1162cc38f3fc..000000000000
--- a/drivers/staging/media/allegro-dvt/allegro-core.c
+++ b/drivers/staging/media/allegro-dvt/allegro-core.c
@@@ -2403,19 -2324,12 +2403,19 @@@ static int allegro_open(struct file *fi
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
 +	v4l2_ctrl_cluster(3, &channel->mpeg_video_bitrate_mode);
 +
  	channel->mcu_channel_id =3D -1;
  	channel->user_id =3D -1;
 =20

--Sig_/+YgsVGcrL=CGBIIOEoP2Q84
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl54OH0ACgkQAVBC80lX
0GxmAwf8CVaSwnMhmRKJkGw0yvaKLQMauUqfhdbhDxhh9Ewn8KWsR5LL+iQvx4lJ
bzaONtVY2fn58CnPf1GxaV0Bt/olslyXJNuTTQh49DTF4Cb9MAKLRhW1G0z099aX
qUhiOqyqOl+6UutN2ae42hil3tez8XI9n5OJaVkQ+D53oT7QHnS6ChNZeXUyaNYy
LcImd1ffEesctCraTGqLQFiTYhP03U1FGtTJuDXnW6QYDP6OIDw2VOyYzKEnavw6
og2OCHLECKMvd8vWPVUuqOcLvf1Dh9mQA+5FdckNPzEJoowT1uPHO8uFVREcmytF
QsX0mk31sgA9V1L0feD4vtYDb8qcfA==
=8vN4
-----END PGP SIGNATURE-----

--Sig_/+YgsVGcrL=CGBIIOEoP2Q84--
