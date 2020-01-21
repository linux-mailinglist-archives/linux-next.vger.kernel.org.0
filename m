Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA6B11447FA
	for <lists+linux-next@lfdr.de>; Wed, 22 Jan 2020 00:03:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726970AbgAUXDL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 21 Jan 2020 18:03:11 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:38345 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726876AbgAUXDL (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 21 Jan 2020 18:03:11 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 482PG45Vx4z9sRR;
        Wed, 22 Jan 2020 10:03:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1579647789;
        bh=N721LsuZkreh9i5+Xx9Q38aIZ+mEDh2n8ZnpN9Ut+iM=;
        h=Date:From:To:Cc:Subject:From;
        b=Cs2oBPPRw9vhG8iexntRRF2ZXLjpe0PFCIGewoKzePm0HrPraYOEUXq5zAp0DVJVV
         R04NAtSBUMUNZMEWlFzokSOC+FA58p36wJh1pTjuMQcLkibKkK7TzFoQ+SgyVh7bPw
         Qd11gpT/5Cen7ozDepcQcQVdVoMzMNMvxegPku/HIsslg6rCQf8Y96w7PKEFqYlqiX
         xXa6P48ySsJ55F2+EM/SaYRxQvS5CaWMiF8VXFhs0mAUFLmE3vnALOjjLUuAg2mc3U
         QLvizMcebP6k4pNl0soV5DJK0Fx3kBk9P6rf+TetEWl/P61HBkvzqLjOjo11v60g9f
         YwIafI6X/YIQg==
Date:   Wed, 22 Jan 2020 10:02:59 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Al Viro <viro@ZenIV.linux.org.uk>,
        Damien Le Moal <Damien.LeMoal@wdc.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
Subject: linux-next: manual merge of the vfs tree with the zonefs tree
Message-ID: <20200122100259.55ab5488@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/b5A/bWBUpu6fiKSS5VK=eTM";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/b5A/bWBUpu6fiKSS5VK=eTM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs tree got a conflict in:

  fs/Makefile

between commit:

  ce8e2158ce5d ("fs: New zonefs file system")

from the zonefs tree and commit:

  c0111e5be2e5 ("fs: Add VirtualBox guest shared folder (vboxsf) support")

from the vfs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/Makefile
index 527f228a5e8a,b807cbff3790..000000000000
--- a/fs/Makefile
+++ b/fs/Makefile
@@@ -133,4 -133,4 +133,5 @@@ obj-$(CONFIG_CEPH_FS)		+=3D ceph
  obj-$(CONFIG_PSTORE)		+=3D pstore/
  obj-$(CONFIG_EFIVAR_FS)		+=3D efivarfs/
  obj-$(CONFIG_EROFS_FS)		+=3D erofs/
+ obj-$(CONFIG_VBOXSF_FS)		+=3D vboxsf/
 +obj-$(CONFIG_ZONEFS_FS)		+=3D zonefs/

--Sig_/b5A/bWBUpu6fiKSS5VK=eTM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4ngyMACgkQAVBC80lX
0GwH/wf+NOxukA55doniWS7JaEch/rJRbqwDUyxJlsztMn48oN3A/kNUpowr9fpU
K7506uMqieqG11DhLFtLdPD/ZSb8N6NNvJdvZo0kha8Yu+Qog5liXP/NAVjw0ost
Bc2Rs9LsadUW+nciZ9UlOMTQx9wCLtHWGdVVZEEoaCwQjmsL1vPLMm7FX9YgQGV1
7Fr/6Y3V+mgT3KDZQeXaRxgfYZQdf25S3zQ63svWgS75EENc3mMtANlOuJ9ieOdW
FkbqvZcKQlKBiEGPMMRbhFUA5NB/B2o+clWJTAnLumD0pNqaDy2yoa47tAU68rlS
ynHVU/gp9bfuJL0XnCDlNncZkyzfWg==
=hQ1H
-----END PGP SIGNATURE-----

--Sig_/b5A/bWBUpu6fiKSS5VK=eTM--
