Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C14742152B3
	for <lists+linux-next@lfdr.de>; Mon,  6 Jul 2020 08:28:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728634AbgGFG2c (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Jul 2020 02:28:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725889AbgGFG2c (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 6 Jul 2020 02:28:32 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAA84C061794;
        Sun,  5 Jul 2020 23:28:31 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B0bHL1HNxz9sDX;
        Mon,  6 Jul 2020 16:28:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594016910;
        bh=CSfTwczMMuvQ4g3DAivl5gAh9rlvh6YmiWzEMt9uuds=;
        h=Date:From:To:Cc:Subject:From;
        b=mnbjh8Xe20FVk7mMsTROVN6HfMfQHqw6KU4acOmWwpJif8UIB2JmX1cn9x8WRPc2o
         VNthzXdrb+7FxkI0oShPuAEA9sfPqfCOmSP3FMnHTuKGcHB0CQ/99QkmX6D03bI9i1
         F2omE15+7ROQJoH60xjT8ENxfvGUMlTADjerdCo+g91J/RELDXRvV35aRR82RY49eR
         tViwLGlam99Tf2FB3kIudmvsHN0qps34VwS0QbWQ7mRU15nvkHwa9q8ReXge3an/ue
         vk0vszi/3VTaUj0Q7+w5oed0mtwt/Qksucvd/M2lrolzCE8SDmIvz+30UZ/fHL7okk
         p2arCXcrdgJ7Q==
Date:   Mon, 6 Jul 2020 16:28:29 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Waiman Long <longman@redhat.com>,
        Harald Freudenberger <freude@linux.ibm.com>
Subject: linux-next: manual merge of the akpm-current tree with the s390
 tree
Message-ID: <20200706162829.2fed3b5b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/h68QK2TVgLs405oId1uaKXM";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/h68QK2TVgLs405oId1uaKXM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  drivers/s390/crypto/ap_bus.h

between commit:

  74ecbef7b908 ("s390/zcrypt: code beautification and struct field renames")

from the s390 tree and commit:

  a0062965cc01 ("mm, treewide: rename kzfree() to kfree_sensitive()")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/s390/crypto/ap_bus.h
index 1a1d5e3c8d45,823de10479bd..000000000000
--- a/drivers/s390/crypto/ap_bus.h
+++ b/drivers/s390/crypto/ap_bus.h
@@@ -219,8 -218,8 +219,8 @@@ static inline void ap_init_message(stru
   */
  static inline void ap_release_message(struct ap_message *ap_msg)
  {
- 	kzfree(ap_msg->msg);
- 	kzfree(ap_msg->private);
 -	kfree_sensitive(ap_msg->message);
++	kfree_sensitive(ap_msg->msg);
+ 	kfree_sensitive(ap_msg->private);
  }
 =20
  /*

--Sig_/h68QK2TVgLs405oId1uaKXM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8CxI0ACgkQAVBC80lX
0GzTkgf/and/d0LRUkMpWdZPpYnOeGVzA+2Cx3vq4RqKIvE84GFT3X1uKVwMOXBX
hUEY03eQ4SJD49aoNnRiTHA4X77Z/pLKpdSd06kX0yZo/jAGRKTGI+2SZgapJdym
tu1UiskDjElbRG32Xmtjvq8VL2yLt+FweIkAVXmjUPQ/JXLCRWuKYt/bxW/M/uJ+
IYVycP3xzYQYxxDlFQiz2CDKVnQcGW45eAp6pCpTU60dJ4wq1d4EPIbhkmpGhQB7
HS9CCxJO4rUI68vTW//lRTNJtL9iejZ9K2nCjmKVT/oF0zzcGUMGTKRoYHkM+vbG
h3G/Dfy3VK8PK02VC0x++mt7nSehnw==
=hNnx
-----END PGP SIGNATURE-----

--Sig_/h68QK2TVgLs405oId1uaKXM--
