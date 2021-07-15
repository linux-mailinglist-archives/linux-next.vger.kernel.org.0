Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15CBB3C958E
	for <lists+linux-next@lfdr.de>; Thu, 15 Jul 2021 03:22:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230471AbhGOBZp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 14 Jul 2021 21:25:45 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:47213 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230087AbhGOBZo (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 14 Jul 2021 21:25:44 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GQGp20xr2z9sWc;
        Thu, 15 Jul 2021 11:22:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1626312171;
        bh=S8dYEGRyMbsUwrAfkSHdZxUQGu4j3Eb0WLbICS0H75Y=;
        h=Date:From:To:Cc:Subject:From;
        b=VAMj0pbNxBO5XarmNnP37VuKb/jm2PDpOKeeJw5K1jh4m43tiuupJqSfRbAiP9nOd
         sw3UifeftxszgL0Tft1uv9TJD/q/zC4pCzFMnQBMwDu9HBTvFOfzKfLe9qfgqcDkuR
         NoytsRB6WuXhU70MUMt6r41WXsFEiwS0T7iTYz6DK7/hKjPmZeSbYlk9QK/G0PWJY/
         m5GXfFUjPVfD02q2Jz78OJYRsEa4VA5PmbGPpwDWlaO/xqCDl09qKDHQfWKemtc5Dq
         2UiIHTQb1CvUf+6kO2mkEBp1HKSYYhwF6D529k0BM4F3enIDdDMybbBoFi7uVFWjb1
         Rhidy9sgHBCPQ==
Date:   Thu, 15 Jul 2021 11:22:49 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Tejun Heo <tj@kernel.org>
Cc:     Christian Brauner <christian.brauner@ubuntu.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: linux-next: manual merge of the workqueues tree with Linus' tree
Message-ID: <20210715112249.3893674b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WtMV7HyEwKj80K7ymvafE01";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/WtMV7HyEwKj80K7ymvafE01
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the workqueues tree got a conflict in:

  include/linux/fs_context.h

between commit:

  d1d488d81370 ("fs: add vfs_parse_fs_param_source() helper")

from Linus' tree and commit:

  7f5ba4806d3c ("cgroup1: fix leaked context root causing sporadic NULL der=
ef in LTP")

from the workqueues tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/linux/fs_context.h
index e2bc16300c82,5b44b0195a28..000000000000
--- a/include/linux/fs_context.h
+++ b/include/linux/fs_context.h
@@@ -139,8 -139,7 +139,9 @@@ extern int vfs_parse_fs_string(struct f
  extern int generic_parse_monolithic(struct fs_context *fc, void *data);
  extern int vfs_get_tree(struct fs_context *fc);
  extern void put_fs_context(struct fs_context *fc);
 +extern int vfs_parse_fs_param_source(struct fs_context *fc,
 +				     struct fs_parameter *param);
+ extern void fc_drop_locked(struct fs_context *fc);
 =20
  /*
   * sget() wrappers to be called from the ->get_tree() op.

--Sig_/WtMV7HyEwKj80K7ymvafE01
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDvjekACgkQAVBC80lX
0GwOswf+MxjIFnL+cXRKTqcbopGhNRrtQYiwoH/3ldfzBQMBvh1e08sXF+IhYfOm
Rf9KNB2KZzJS0ATf0RU3jwx0jBgn6QUM9st6Srymnn2Rmf5j28g6t3pm1WVh5PiJ
JXFcNyOvTkWapl+oKCyscptxbmhJClGDBVbvpshaknSqFWdcBDNtvbsJnSwKiZ3P
LGhn/e0qO58JLHs3IJlM4OhysYCFrsMoEbCjwUrNnur12RWRR0YNhWUBeEJHCW7X
o5QoU7KaKWS1TARXRufFFRFOlZnNs+cjsS/gVCmawvxCoRUWliwFEfldvE0uHHU8
sSACp4h1RofUj67UXQxn8dFLicLYew==
=yH6A
-----END PGP SIGNATURE-----

--Sig_/WtMV7HyEwKj80K7ymvafE01--
