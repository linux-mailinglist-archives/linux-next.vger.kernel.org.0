Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7889215158
	for <lists+linux-next@lfdr.de>; Mon,  6 Jul 2020 05:23:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728720AbgGFDXn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 5 Jul 2020 23:23:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728634AbgGFDXm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 5 Jul 2020 23:23:42 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 655E3C061794;
        Sun,  5 Jul 2020 20:23:42 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B0WB15kLrz9sDX;
        Mon,  6 Jul 2020 13:23:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594005819;
        bh=nj0RuQRsuAhyG0rorP8n52Ccb8NraLQMk4Bc4nG1HJ0=;
        h=Date:From:To:Cc:Subject:From;
        b=r/laXZ69rUpAXrBqcU/Apo2fIT/Mr2N4nzx2yitRGTuKURrAVSV6h/6iWsiqRpO3B
         hFOJpswDiINPMwmElhcNRfBE1lYrHkR9ZRzmi5X1oxtksBisCjl/vKLhMZKbFgQ8EH
         ZS+o9Vrca7C2k/zOPNFpyVTugxU2rEA8Z2CQkziyW8MQb61gC6RbrwEVTtEWeHFYYh
         os+1AXta/dMrdOpEXhlcrFjtYAm88DTFLRrrM56rKZwquVwQpClAMQwOQKskmvJIEk
         CD5bzzvnPNEhg+9ATu7GWqauwWFuV80DmVHQd1cXlhOrpsZs+D1h9tjdVL9XU3kxzW
         e/Im4kuTiLWGw==
Date:   Mon, 6 Jul 2020 13:23:36 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>, Rob Herring <robherring2@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: linux-next: manual merge of the driver-core tree with the
 devicetree tree
Message-ID: <20200706132336.5daded08@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/frh3=0AlpBzUIrCZw3HzXgM";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/frh3=0AlpBzUIrCZw3HzXgM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the driver-core tree got a conflict in:

  include/linux/device.h

between commit:

  7d34ca385484 ("driver core: Add device_is_dependent() to linux/device.h")

from the devicetree tree and commit:

  67dd07723969 ("device: remove 'extern' attribute from function prototypes=
 in device.h")

from the driver-core tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/linux/device.h
index b5ac86e356d9,9a62f7f43d55..000000000000
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@@ -814,27 -808,25 +813,26 @@@ static inline bool dev_has_sync_state(s
  /*
   * High level routines for use by the bus drivers
   */
- extern int __must_check device_register(struct device *dev);
- extern void device_unregister(struct device *dev);
- extern void device_initialize(struct device *dev);
- extern int __must_check device_add(struct device *dev);
- extern void device_del(struct device *dev);
- extern int device_for_each_child(struct device *dev, void *data,
- 		     int (*fn)(struct device *dev, void *data));
- extern int device_for_each_child_reverse(struct device *dev, void *data,
- 		     int (*fn)(struct device *dev, void *data));
- extern struct device *device_find_child(struct device *dev, void *data,
- 				int (*match)(struct device *dev, void *data));
- extern struct device *device_find_child_by_name(struct device *parent,
- 						const char *name);
- extern int device_rename(struct device *dev, const char *new_name);
- extern int device_move(struct device *dev, struct device *new_parent,
- 		       enum dpm_order dpm_order);
- extern int device_change_owner(struct device *dev, kuid_t kuid, kgid_t kg=
id);
- extern const char *device_get_devnode(struct device *dev,
- 				      umode_t *mode, kuid_t *uid, kgid_t *gid,
- 				      const char **tmp);
- extern int device_is_dependent(struct device *dev, void *target);
+ int __must_check device_register(struct device *dev);
+ void device_unregister(struct device *dev);
+ void device_initialize(struct device *dev);
+ int __must_check device_add(struct device *dev);
+ void device_del(struct device *dev);
+ int device_for_each_child(struct device *dev, void *data,
+ 			  int (*fn)(struct device *dev, void *data));
+ int device_for_each_child_reverse(struct device *dev, void *data,
+ 				  int (*fn)(struct device *dev, void *data));
+ struct device *device_find_child(struct device *dev, void *data,
+ 				 int (*match)(struct device *dev, void *data));
+ struct device *device_find_child_by_name(struct device *parent,
+ 					 const char *name);
+ int device_rename(struct device *dev, const char *new_name);
+ int device_move(struct device *dev, struct device *new_parent,
+ 		enum dpm_order dpm_order);
+ int device_change_owner(struct device *dev, kuid_t kuid, kgid_t kgid);
+ const char *device_get_devnode(struct device *dev, umode_t *mode, kuid_t =
*uid,
+ 			       kgid_t *gid, const char **tmp);
++int device_is_dependent(struct device *dev, void *target);
 =20
  static inline bool device_supports_offline(struct device *dev)
  {

--Sig_/frh3=0AlpBzUIrCZw3HzXgM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8CmTgACgkQAVBC80lX
0Gy+Qwf/dBVbv2VNEpH9gvF95vasobucoVm8PbFIaHHGBJhrf6BfMpSNnruA98uE
Ihwb7QGg5aS6XfbDvmPrS7kM0NqbJOKm7AoyNyNWXnOoEvahZ6nIyKvGiBLZuQ2O
8DvLHU3+Oo7sY2yb8mGz601GEd8QW1bHlTJ4GMlqq2s10TFdPQ42ruPglxcBRSUX
Lsd54iZ4Y3N32JHU6XIm/PfY54J4/DH64bzhZxV2qxCmDwp8i4QhdhKY0U1xXQd+
LL1wGz39dzLlC1naUF+K0NU5w6m7U5M5Rap7dWvRi72zSQeL7AIFcK4c3BMe1d+0
MT88jNTwXifQe5NPweU7pXU2vX8bOg==
=MD2g
-----END PGP SIGNATURE-----

--Sig_/frh3=0AlpBzUIrCZw3HzXgM--
