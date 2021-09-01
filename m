Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC5DB3FD210
	for <lists+linux-next@lfdr.de>; Wed,  1 Sep 2021 06:18:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229572AbhIAET1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 1 Sep 2021 00:19:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbhIAET1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 1 Sep 2021 00:19:27 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFBCEC061575;
        Tue, 31 Aug 2021 21:18:30 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GzrQV6ysBz9sRN;
        Wed,  1 Sep 2021 14:18:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1630469908;
        bh=E9tsZTTqR9vbxLmCakTeubeQtIsl4XhvknXxX/iWkqE=;
        h=Date:From:To:Cc:Subject:From;
        b=cY0ipTD25tlicSa9VGZXtkniIGGLSACgvID/6Xxid9FHP6sf5mV7TKOyAeFVpVGVI
         PQk7t6t1Sl3WDUviQZGeUXbiLS8HnsoJAfRK+ouduSPxpyf22t2DbaXmcnOgfaULwk
         dQJZNjZ7lgksSVuew/ikKu21kIqGWejcKiyRkQfaCgqGokRIMK+Fcjxl4hh5/3nSee
         C5PUFawCQwHVdxsQKtkxFj4jFevVJSdNzrgHiERkz3fn6RiytkfivgCb8rHe1VNh41
         juHTXRZcphQol4y6abOltTmqy1ox4qKs+h8z1usU1vMS02QmFRmcxdi+RBRK+kZrS2
         SY7BNUQ/02qyQ==
Date:   Wed, 1 Sep 2021 14:18:26 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Michael S. Tsirkin" <mst@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Uwe =?UTF-8?B?S2xlaW5lLUvDtm5p?= =?UTF-8?B?Zw==?= 
        <u.kleine-koenig@pengutronix.de>,
        Viresh Kumar <viresh.kumar@linaro.org>
Subject: linux-next: manual merge of the vhost tree with the driver-core
 tree
Message-ID: <20210901141826.0c21c43e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/oMktb5DbwdM3bizovvr7h/M";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/oMktb5DbwdM3bizovvr7h/M
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vhost tree got a conflict in:

  drivers/virtio/virtio.c

between commit:

  fc7a6209d571 ("bus: Make remove callback return void")

from the driver-core tree and commit:

  fd704f203ca1 ("virtio: Bind virtio device to device-tree node")

from the vhost tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/virtio/virtio.c
index 1ea0c1f6a1fd,c46cc1fbc7ae..000000000000
--- a/drivers/virtio/virtio.c
+++ b/drivers/virtio/virtio.c
@@@ -292,6 -293,10 +293,8 @@@ static void virtio_dev_remove(struct de
 =20
  	/* Acknowledge the device's existence again. */
  	virtio_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE);
+=20
+ 	of_node_put(dev->dev.of_node);
 -
 -	return 0;
  }
 =20
  static struct bus_type virtio_bus =3D {

--Sig_/oMktb5DbwdM3bizovvr7h/M
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEu/xIACgkQAVBC80lX
0GwcfAf/fHk1KXEeIh2Zcw5zMvJeuU9gY+FDyFg3fwti+52qFOg767ofBGJfyijR
JNU9NNNrJeu7CxhTKnj6pAIiJFdhuiNXRYTbbmDXatHpyphCZXyn2ly6eH4GCpnm
P3CmPB32g6yvUQiZEr51cXaDMyHNIVwsKTzsv5Jf6T/wIZ2iwLzYC/j9G3I/s4NJ
ZkmX6EOtpbb97y+Gkq808G0oNR7xvNjuViRNxgfn92TMzrlI6R7YjhaEzFUGmyiC
BN7itKg6tv7AbgiwRyAbUWBKWqFjiPGFa+NxVTuhxXUU+xdAvGIQW7+QDgkVLQ4K
24Aadh7P5fcXdVyZ7b6tQNMpZiGj0A==
=En91
-----END PGP SIGNATURE-----

--Sig_/oMktb5DbwdM3bizovvr7h/M--
