Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1607FFBB5
	for <lists+linux-next@lfdr.de>; Sun, 17 Nov 2019 22:16:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726171AbfKQVQ3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 17 Nov 2019 16:16:29 -0500
Received: from ozlabs.org ([203.11.71.1]:58909 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726119AbfKQVQ3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 17 Nov 2019 16:16:29 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47GPyx3WLxz9s3Z;
        Mon, 18 Nov 2019 08:16:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1574025387;
        bh=pPHlo48yEc1CtacGM4xou38J36W0+FgI5KZCO70rz64=;
        h=Date:From:To:Cc:Subject:From;
        b=M7iDKIUx7hvI9as+zZSM1HZgbbdxGDEha5YB/wwbnWfhJal5D/gOfwgc9BhFo0v0z
         eUKPxSMvLYDJxPX3I5Tt0GU3ss5GnshR1ebvJwXE92HDxH1aHSW0pdv3EWcSmVXGha
         46LgNcNmQYSOQFFoZ1hN2svefTmLNprFt/yDvdmvkqEDebvWhm6HPXtG8/RlDdeqT5
         6wUoJCBL4V/+9U/hJeFLx+301ic4Ow0IZrl3EvDA0ip++eiet9CbkJlKpbj7TaCjs5
         nNy36IIHw8OUqbE53cSxQROxmPoYXxHDMfAaMphBBFo5hc97t63gwulWNMtFlW7H+l
         bI2liSOFzD4PA==
Date:   Mon, 18 Nov 2019 08:16:17 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Lubomir Rintel <lkundrak@v3.sk>
Subject: linux-next: manual merge of the arm-soc tree with the kbuild tree
Message-ID: <20191118081617.2b7c61eb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Y5vKrcCIUoU3Eg+ILrp_ua1";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Y5vKrcCIUoU3Eg+ILrp_ua1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the arm-soc tree got a conflict in:

  include/Kbuild

between commit:

  fcbb8461fd23 ("kbuild: remove header compile test")

from the kbuild tree and commit:

  32adcaa010fa ("ARM: mmp: move cputype.h to include/linux/soc/")

from the arm-soc tree.

I fixed it up (I just deleted the file) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/Y5vKrcCIUoU3Eg+ILrp_ua1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3RuKEACgkQAVBC80lX
0GyG5wf+IQ+Q+2LXKtHpHFQjdvYsU3UOP8T4Rl/XI8B5ka8hii8IFEKmn/3gkNem
YZEYcLyOblvKPwe7GD1NU2BSoowgn+hW86OhAmHg5E6WC0AXKuZIXNj2wm3DNnjg
VvlA2WZJ+gXkSZb22fDkrFY9E34eRNTwptUco50cFaYFE6zaTlW6YM8O/cqphFwP
vnDI5jlJ/JLbjWhXUalOTHKOejyL1pJQ0L1bD6w3xwMBtPB0y3dddTUb17/eLxxk
UswLa0S4sSVkLr9Orljwyzrox5GKff6D6nBUDn38qYbk6XOpZJEfEEQYo6OqdZOt
LQ5/uh1JjrEnqpMU6+F87E+cv9GgNg==
=XRv2
-----END PGP SIGNATURE-----

--Sig_/Y5vKrcCIUoU3Eg+ILrp_ua1--
