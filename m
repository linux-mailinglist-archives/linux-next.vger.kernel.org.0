Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 270DA28C812
	for <lists+linux-next@lfdr.de>; Tue, 13 Oct 2020 07:02:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731651AbgJMFCL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Oct 2020 01:02:11 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:38001 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726400AbgJMFCL (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Oct 2020 01:02:11 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C9Ngx2HWGz9sS8;
        Tue, 13 Oct 2020 16:02:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1602565328;
        bh=L6loop21vjp8rM3LyPe8IKIyk5K9+q9nJ+nbAp08gnA=;
        h=Date:From:To:Cc:Subject:From;
        b=C0ZK5qjomT0G7jtEpSk+3PYHnIpvtFktxBMplW1dlYdQzkeuDUfVjbbd9P0mFOIEQ
         3/vli67QZBaClg41adZbpuk3VI08MkEovVN1zqrOPa7Rd3qiep/XoTg6jEgJYKi/5o
         qtfpFf3exkt6N8tLmKuH0gKo3Z5b3mbEe/ufc/yLglCiOEgYyH1E95HuCXBI0sHYcA
         nyvgOzTyxWQPMidJt1xeP8SR487GzMrXSPffLGs6z5p3E5jj+56lmj0xz8KZhgRYBP
         uZP4R2gAtADJeoQPdBjogzNbAIh/UjK2COdr2LQZn+6a8/VUf8Kf8NLWdzhNqa5emC
         KL3jMaMIQOI5A==
Date:   Tue, 13 Oct 2020 15:43:37 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>, Helge Deller <deller@gmx.de>,
        Parisc List <linux-parisc@vger.kernel.org>
Cc:     Jiri Slaby <jirislaby@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Subject: linux-next: manual merge of the tty tree with the parisc-hd tree
Message-ID: <20201013154337.080c84ce@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IKFm355XCfXFln==Z4dSxFL";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/IKFm355XCfXFln==Z4dSxFL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tty tree got a conflict in:

  drivers/video/console/sticon.c

between commit:

  fbb75b71b131 ("parisc/sticon: Add user font support")

from the parisc-hd tree and commits:

  d73568c4ccb0 ("vt: make vc_data pointers const in selection.h")
  23f87274f0ad ("sticon: remove no-op sticon_set_origin()")

from the tty tree.

I fixed it up (there is some overlap and I more or less used the former
version of the conflicting bits) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/IKFm355XCfXFln==Z4dSxFL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+FMHkACgkQAVBC80lX
0Gy4zQgAlltIyGGczR2RKi5vbrs09GUfRGuZ3ZGtqC1Gx5BUTciTjTneUm2GTGcg
RHcNxC/wPCNBiimh9NMLlX4flg/PyFi9QYQMYInGLVIfvvsZUMcxp5z98A4Am1rA
Qt4lN3N2eHDa+Q09fxqrs4wldkfcik5ePwciv/qX/mzbCaRlu92GlJ1FPK71RIRe
VURq4HrWGDI8cUuWpgI++oY+QMSqsZgecaGul60Mlsojg5TYFPXl1uJEtBAwLCuu
V0ep+ewN4HYRqZWk3xryIKiHGr0SbqInjaTR3JQJtgeSAZauU9QhRvWX1Dy+LkYi
7Vf58rZZLlePztQ2VDEGQe3wc2aQ/Q==
=5ctp
-----END PGP SIGNATURE-----

--Sig_/IKFm355XCfXFln==Z4dSxFL--
