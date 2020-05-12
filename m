Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED8F01CF2E8
	for <lists+linux-next@lfdr.de>; Tue, 12 May 2020 12:53:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728371AbgELKxi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 May 2020 06:53:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727859AbgELKxi (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 12 May 2020 06:53:38 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 731AAC061A0C;
        Tue, 12 May 2020 03:53:38 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49Lvmb3mLsz9sSg;
        Tue, 12 May 2020 20:53:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589280816;
        bh=bIy8uBq3y/Wu/2YykH70JeSclHrTB2b071QiJhS3muA=;
        h=Date:From:To:Cc:Subject:From;
        b=DQ705lHOxNB/nDGtDO2EX28brQg1tiHZtV5kXSukX8zVzBd1qI6U5XTIXy2P/tMts
         Z6T0PmAdBYon5pwDiaajARbZ7UswEHVPSkelBWheMZ7Yi+ZC5K13Jb82jIOfCB8xt4
         ttL/UuqKSpenBtfU0J8kK3ng2GZEreL7hloneTGPII/jlAI+BbXkm8r8V+aNN1Q9Yn
         C/7+xA/6r2JngyNs1t5wIM9OI4DFnD9NtMroqrFeRfJ2mFRLg5VcL9JEPAlwM6j39S
         D+/hZ7as36GNv4Z4fli11szow7JbnnHxjmYf+Aq2+I79d6ScZgqPgHI8HHDzx/0xuw
         f13Cq7Z9He06w==
Date:   Tue, 12 May 2020 20:53:33 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>
Subject: linux-next: manual merge of the akpm-current tree with the userns
 tree
Message-ID: <20200512205333.21bcd7f4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//JwsautAs_8SD41GUF6=ikD";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_//JwsautAs_8SD41GUF6=ikD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  include/linux/binfmts.h

between commit:

  96ecee29b0b5 ("exec: Merge install_exec_creds into setup_new_exec")

from the userns tree and commit:

  4bdbcefd2bd8 ("exec: simplify the copy_strings_kernel calling convention")

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

diff --cc include/linux/binfmts.h
index 1b48e2154766,3d3afe094c97..000000000000
--- a/include/linux/binfmts.h
+++ b/include/linux/binfmts.h
@@@ -143,8 -144,8 +143,7 @@@ extern int setup_arg_pages(struct linux
  extern int transfer_args_to_stack(struct linux_binprm *bprm,
  				  unsigned long *sp_location);
  extern int bprm_change_interp(const char *interp, struct linux_binprm *bp=
rm);
- extern int copy_strings_kernel(int argc, const char *const *argv,
- 			       struct linux_binprm *bprm);
+ int copy_string_kernel(const char *arg, struct linux_binprm *bprm);
 -extern void install_exec_creds(struct linux_binprm *bprm);
  extern void set_binfmt(struct linux_binfmt *new);
  extern ssize_t read_code(struct file *, unsigned long, loff_t, size_t);
 =20

--Sig_//JwsautAs_8SD41GUF6=ikD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl66gC0ACgkQAVBC80lX
0GwFTwf/fgxys6r7HXBshJ770Jj2sSDI7ik7yBFmGg85LkbdNd8nQO4F81sk8E+t
GryYhFNeThKgf1/Sc6GN6c2JFIJdDQCtYcpeckcAGdXaDsLiB2oTjDv0V6/QWrbf
bxE2svJ0tQig8c495zmBvvDidPVGh4ieg6vGYTT4hLdMDPMtgC+KA2HS3+xjI+ke
u0OS8KjDonJWuosgqhoUdnP1pqst5eZsMlO2GwGR923pBHDv33ay2uh3JfK52v2B
B9BKIUEHaoqXg9u+icygOVUL3GB+uHao/0Vzej15DxvbNZSVq6TFhiB+9u8JXnQv
VQaUfiV69JTpqJQQJdV9aiuQHjSi4w==
=/NAz
-----END PGP SIGNATURE-----

--Sig_//JwsautAs_8SD41GUF6=ikD--
