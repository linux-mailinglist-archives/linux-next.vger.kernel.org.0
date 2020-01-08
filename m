Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35C89134F4F
	for <lists+linux-next@lfdr.de>; Wed,  8 Jan 2020 23:14:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726390AbgAHWOz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 8 Jan 2020 17:14:55 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:57509 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726179AbgAHWOz (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 8 Jan 2020 17:14:55 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47tNpN0DpTz9sPK;
        Thu,  9 Jan 2020 09:14:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1578521692;
        bh=LUg4U1DK+Uedq+MbLvO7g0l+TyKvlMI2N0DwLT+I9ko=;
        h=Date:From:To:Cc:Subject:From;
        b=DLgkLFEkCc75WSkFuLhgCsadqtPquDBxR3zv9dwtffT35jDZAHbdRO+998TYhLEOX
         bAHfvn+h+yUVjEVRBxmgtmOI0XpGm7WaJbvsGPSFUslPiwySzH+yiwv3tCwGCfLFeT
         JjMkfNangTZ52EzDrkuStLXh118thKXb7XMzaGLvF/rOxvF3heFsmlxOF+JM8t6qge
         cuR3SBYAOr2z2egbJRqARxJcmkq+LdYxdo4rYCCaobiedEk6EOs1qy3h3bASSM4TvW
         eS1fMh77l5qJ9DIUfSkD4v1wocGstYmEI9TvBrzfDNcJHjs9F6UOThUYSAGvOOzwTV
         b5mSyLajuL0+w==
Date:   Thu, 9 Jan 2020 09:14:45 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Sterba <dsterba@suse.cz>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Josef Bacik <josef@toxicpanda.com>
Subject: linux-next: manual merge of the btrfs tree with the btrfs-fixes
 tree
Message-ID: <20200109091445.48b9ec2f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SVo4Pf59N5eq0KyYlby0BzA";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/SVo4Pf59N5eq0KyYlby0BzA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the btrfs tree got a conflict in:

  fs/btrfs/inode.c

between commit:

  045d3967b692 ("btrfs: rework arguments of btrfs_unlink_subvol")

from the btrfs-fixes tree and commit:

  f8b3030e0807 ("btrfs: rework arguments of btrfs_unlink_subvol")

from the btrfs tree.

I fixed it up (just different version of the same patch - I used the
former) and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be mentioned
to your upstream maintainer when your tree is submitted for merging.
You may also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/SVo4Pf59N5eq0KyYlby0BzA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4WVFUACgkQAVBC80lX
0Gz7EAf/T0whbUeRFqGRgtXxd7rDYmVxU8INeR8w8lCBPuOPxnt+W4boIObaRQEo
0/egJLMo5S4upJJJKd0o//Jg/eZEVCZmFvFVVV5ZT/kSkrhs3PLGpeXCdMi2Iy1H
e5mjpKdbE5Xdt7R7Uftu40ZR9ExoxnQ3OmZxfRSyhlzk13Vdh7t67RB20+ZZr7ve
VcwOXN2LnMiKL6bOei7wpAjtn973kvtpT8qDdzfhFXah1VBsWReoF92lRPmCBxYa
RADippVnsdgWD3SV3otfWKsE9CdGIiRKuK868IoIL6FbF6/yb+XOp786PIYZxgVm
phAI8QMRyAgk7A1qUQecP5Fhg1iJKg==
=3QlM
-----END PGP SIGNATURE-----

--Sig_/SVo4Pf59N5eq0KyYlby0BzA--
