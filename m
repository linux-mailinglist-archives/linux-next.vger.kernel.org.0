Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5999913504E
	for <lists+linux-next@lfdr.de>; Thu,  9 Jan 2020 01:10:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726758AbgAIAKx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 8 Jan 2020 19:10:53 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:50473 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726654AbgAIAKx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 8 Jan 2020 19:10:53 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47tRNC0Vcfz9sRW;
        Thu,  9 Jan 2020 11:10:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1578528651;
        bh=TIL2BzsbLT37ukoZt3FF9QagMGrIFtxVOy965LicdpA=;
        h=Date:From:To:Cc:Subject:From;
        b=M2JjPQusn/oSk7nO3x8OHAfLfiD7dA3xyxZNcajNlW09KGAoEvxq7WnVV3hHBrk/a
         yU1Iif4TN7nUnebSEuWGtg/MwxOT6OwXu4/ZNK67PpcrFg9iv9D0Ddg9CtzKgNPSut
         UqCJt+d+Y9Uj7rq7bhDuzGOKhYgf205Fw6uU4nw71RxxDmcoVfTOqD54hEMbeOARMt
         cemZNZK+6tQfGrUJ4q0Hb+7+lyyU5zIrxAhISQTS3Gj9vm+6IPpz4dSsVr6Imo7iSJ
         Ka7/J6/4c6i1BfYhcdpVpG768kB8ZDDNOHP21k7K7nmstnFA8SccSuQOXdZnL/gyFP
         cn+Dpa8xzcHuw==
Date:   Thu, 9 Jan 2020 11:10:50 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: linux-next: manual merge of the v4l-dvb tree with the v4l-dvb-fixes
 tree
Message-ID: <20200109111050.3a547549@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JunZ+6IJb61MvYi9+Mu9cD9";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/JunZ+6IJb61MvYi9+Mu9cD9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the v4l-dvb tree got a conflict in:

  drivers/media/usb/pulse8-cec/pulse8-cec.c

between commit:

  21d116949e95 ("Revert "media: pulse8-cec: fix lost cec_transmit_attempt_d=
one() call"")

from the v4l-dvb-fixes tree and commit:

  c4e8f760581b ("media: pulse8-cec: fix lost cec_transmit_attempt_done() ca=
ll")

and some other commits from the v4l-dvb tree.  The conflicts arise
mostly because the above commit was cherry-picked into Linus' tree
(before being reverted above).

I fixed it up (I just used the vl4-dvb tree version on the assumption that
you will fix it up properly) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/JunZ+6IJb61MvYi9+Mu9cD9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4Wb4oACgkQAVBC80lX
0GynDggAh2qebxW1/g9EcK9cjOd3v6+WSNb/FDnKOJx0ixLDDcJo7adAjpAv/h/0
Uw3gainwMbTl2cEJuDG3iRWA8aWY6VbkZEYIrU59EVCuf0D385XjYOcVAZJeNePZ
HEoxVMSfC1b06x+W0V6pQFhNbivuonajm0wmfyOArIhk8rrpw1dAXZJkaz//TefR
wgX6/6llXzqzxxfaG5GiaxtmkQqQuXg6K+bGHChg+hF4bq3t9c3GkyV4pmxkrZQ3
0kELJsC6CfNmWgzVxXVp9/OiHzFbvegqXF9qVt0oW6DfWKVqjOLZ3e09L1wFSzIL
26Rzmgjmq0LN2MfH8w/YBrKFJaeqgg==
=F3xr
-----END PGP SIGNATURE-----

--Sig_/JunZ+6IJb61MvYi9+Mu9cD9--
