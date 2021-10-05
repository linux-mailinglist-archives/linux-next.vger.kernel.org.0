Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC7E242345E
	for <lists+linux-next@lfdr.de>; Wed,  6 Oct 2021 01:15:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236799AbhJEXR0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 5 Oct 2021 19:17:26 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:32945 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236700AbhJEXR0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 5 Oct 2021 19:17:26 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HPD2t1jCFz4xbP;
        Wed,  6 Oct 2021 10:15:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1633475734;
        bh=iW8IftypfeGxIUo6hwPJer+5e05jw1KXZaKeX6UGt48=;
        h=Date:From:To:Cc:Subject:From;
        b=KfmSEja+j6bttnOYmUzQeyUlQysZSiPSIi8Yx6APSo+JVVOLlIKr80DeZXrxTMsdV
         NO4NKHiwLEC4REuyTmBMobxZjleq8RL9Pgewf362QadEfjMI3O/Ih9SWEOoQdllK/Z
         +JgEs57ZfsZmik6dE7Ubl3Apjwt1KlBWueBchlQMH0cwcAROKdgiQvX7iU0ORJZCfx
         Op0dig/ebmFns2SFFFiJtxaupHNc/atXNpAarPOJbrXKW7gv9NSUwQCDWykihewoXb
         wUHfwp+KKoqE0vWhVEHWe9d5VA9nBe+EvxrCZPh9K41ncWTcyntvJwI8H92xXs1Rvl
         M8o40XaBsZDag==
Date:   Wed, 6 Oct 2021 10:15:33 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the ntfs3 tree with Linus' tree
Message-ID: <20211006101533.3556de51@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Zm4nTs/eG.=535cdB7lUCld";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Zm4nTs/eG.=535cdB7lUCld
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ntfs3 tree got a conflict in:

  fs/ntfs3/xattr.c

between commit:

  f7464060f7ab ("Merge git://github.com/Paragon-Software-Group/linux-ntfs3")

from Linus' tree and commits:

  d81e06be921f ("fs/ntfs3: Remove locked argument in ntfs_set_ea")
  95dd8b2c1ed0 ("fs/ntfs3: Remove unnecessary functions")

from the ntfs3 tree.

I fixed it up (I just used the latter where they conflicted) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/Zm4nTs/eG.=535cdB7lUCld
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFc3JUACgkQAVBC80lX
0Gwa4Af/TCRTiVz4WtgvJs5o1JyCTFNfrPMyY1+/gPYJf9bDo5lPzbIZtJAf2Tg1
ySwkcLpaf+0M2aI9yqVDVFTzqqJaDIW0gUC5rFYHezc3LuExUSqn7I4kyhNts3I+
zPYFCfG07v3Y3p9uHTsws+mjUeMAVLY92zR4w3VRDbtwNEMCquaFe+Z/qZ3ntEXu
za8wWxAT9SfsqMufPvynH+f+RGpwcLQsPAnlnyI+0mOzn2yDuzW5qq7u6WtfDG9K
PIIt68Lr+9XBeHXbeoszrYAPpOpcdHB5ZNMWGCqigBd5YbyeaPqMMcoEqcCFfPVW
GhZmGrZbHq8/85Fc73s5q0WlC8uixA==
=sNMU
-----END PGP SIGNATURE-----

--Sig_/Zm4nTs/eG.=535cdB7lUCld--
