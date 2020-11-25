Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D67652C3925
	for <lists+linux-next@lfdr.de>; Wed, 25 Nov 2020 07:39:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726114AbgKYGia (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 25 Nov 2020 01:38:30 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:36419 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725848AbgKYGia (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 25 Nov 2020 01:38:30 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CgrnG3ynvz9sSf;
        Wed, 25 Nov 2020 17:38:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606286308;
        bh=cTPEJS09EHhWMwCmle3xYTW+xJkeXBNxP/JaqwEO6Jw=;
        h=Date:From:To:Cc:Subject:From;
        b=apph+BCREdTIXyGW8Ei6n1dIDAuQH9a5UovBJI9T/31g549amhZFZ7+0EuewrlQkw
         DkpXuoCBaTSbocuwbmku/4roXkq694+zHx9a5higPF2bt3lj646Cyxj5O6fHjmknT6
         erpMlJdkaXOMoqDDNDvEIrCUniD+YkiWc/NrDMDL78GfLBBFA41XsPRRuqQkSp9DZb
         0pNoJj37rnLkA9ICxWJdEAebBOqHgwkrbW5r9VXcTGyD3vC1s0OpYes6uv3cAY2sb2
         2Splp4glm8r+IfDERXWdhs7jfycCsiQaLBNfkPZebiH+HkvhsXcYbThaFVVdAUUhyd
         v2rWA4Iv2aQLQ==
Date:   Wed, 25 Nov 2020 17:38:24 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Kees Cook <keescook@chromium.org>, Guo Ren <ren_guo@c-sky.com>
Cc:     Guo Ren <guoren@linux.alibaba.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        YiFei Zhu <yifeifz2@illinois.edu>
Subject: linux-next: manual merge of the seccomp tree with the csky tree
Message-ID: <20201125173824.0e3dbcd7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xt.V3T5AihCa0pLxffcwI3h";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/xt.V3T5AihCa0pLxffcwI3h
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the seccomp tree got a conflict in:

  arch/csky/include/asm/Kbuild

between commit:

  fed76f8679a6 ("csky: Add QUEUED_SPINLOCKS supported")

from the csky tree and commit:

  6e9ae6f98809 ("csky: Enable seccomp architecture tracking")

from the seccomp tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/csky/include/asm/Kbuild
index f814d46d347f,93372255984d..000000000000
--- a/arch/csky/include/asm/Kbuild
+++ b/arch/csky/include/asm/Kbuild
@@@ -3,9 -3,6 +3,8 @@@ generic-y +=3D asm-offsets.
  generic-y +=3D gpio.h
  generic-y +=3D kvm_para.h
  generic-y +=3D local64.h
 +generic-y +=3D mcs_spinlock.h
  generic-y +=3D qrwlock.h
 +generic-y +=3D qspinlock.h
- generic-y +=3D seccomp.h
  generic-y +=3D user.h
  generic-y +=3D vmlinux.lds.h

--Sig_/xt.V3T5AihCa0pLxffcwI3h
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+9++AACgkQAVBC80lX
0Gx8pAgAm2WZ0wRCD7OxzawfY1FAQRDTKch3X8tnhF283L9KOID3N4Y8Vt9WM6/b
+eBD552vIYZUQhm1EixH/KiKkS+Mp2d9CnXDX3zyAVxvuCMawWbDAgz9j+0xn9me
Vn5ElL0pTgy3jK10vTb7+my1whvVtZF1JrmcOog969Uzjx7EN2qm/TK78lqJ++Lu
HONQNAUvG604iClYf5Q4M//GZnrPsCl8XXVWpvurfHgK48lIyYIwUZORaiIFpT1Q
GdzfB7c1OCmnPhBxUxUdL1/vBsQv4QNRLLf/ly6nmYLqcraUkMFFl8ZRWhE/ySDt
0kLaAX4l6Vw6z9XwL0GAaBd9UVn8Hw==
=yD2O
-----END PGP SIGNATURE-----

--Sig_/xt.V3T5AihCa0pLxffcwI3h--
