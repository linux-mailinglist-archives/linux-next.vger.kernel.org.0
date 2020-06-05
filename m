Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3A0D1EEF17
	for <lists+linux-next@lfdr.de>; Fri,  5 Jun 2020 03:31:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726060AbgFEBaq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 4 Jun 2020 21:30:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726190AbgFEBaq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 4 Jun 2020 21:30:46 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA34AC08C5C0;
        Thu,  4 Jun 2020 18:30:45 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49dQ821Bqlz9sTH;
        Fri,  5 Jun 2020 11:30:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1591320642;
        bh=wRyg3wkOjBNFHnsDzKVjVLRDO7RdwvtdVFDaIUOcj9A=;
        h=Date:From:To:Cc:Subject:From;
        b=hSHJM/k3rDkgskcIJQF/j8TacxET7xU/8ojibw2Rs71HzTvqrQk7LIyPfqFipQmKk
         /KXy2okHB1Zlox/mfY3+8e11RU1D5LOECuL2RfJ+7wUwVuaQoOml4KYisPvMp8AZLX
         XJm+jBluHfWjt4QLQI9lZnipHOzPlRfwIL8J3/T9eEEjaTPJ7mK5FxF4ZXbdD0gfvY
         QWvYPeGzPn5fyBXaZqVnjsBYUjiWRgZoowZeDVR/IcQqxgCEW2a8aWsRBkUQgM6Y67
         D3zFsQj747g1DiWNhPUKte+6QK8zBArkmK/MrAEfpcGnt0FQNnYYu0AclQNKywGzZ/
         mWtZc5ral675g==
Date:   Fri, 5 Jun 2020 11:30:41 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: linux-next: manual merge of the v4l-dvb-next tree with Linus' tree
Message-ID: <20200605113041.167b8efd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Vh2xNT/1BZbmsxmsHoCN4lR";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Vh2xNT/1BZbmsxmsHoCN4lR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the v4l-dvb-next tree got a conflict in:

  drivers/staging/media/atomisp/pci/atomisp_v4l2.c

between commit:

  6929f71e46bd ("atomisp: avoid warning about unused function")

from Linus' tree and commit:

  48d15adb0032 ("media: atomisp: get rid of a warning message")

from the v4l-dvb-next tree.

I fixed it up (I just used the latter) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/Vh2xNT/1BZbmsxmsHoCN4lR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7ZoEEACgkQAVBC80lX
0GyVQAgAgLQRyBE6aAV5hvFUguSk+WOLprdS08ECJRfApK1Qwec0xaInzpwBkhj9
7lg17sULT2AsIeAO/8L8iQJ8PtdWGI00fzmS7X1+jDzQIg167tIseW82nYSCXjnw
vix7AB2NmGmfQWm5YYJrGRKO7iHZUKQm2FJCsQ8P6814I+1XkQmYOVijmViHprx2
/xc0HyjXVKaJKO23q1FU8fL2pGcibIX6FSMHmTmGJbMFqpJTL07XBrXLnI13iQlG
EhAYpL/ZOn+KPYNQi3B7c1eZ/LGFW7GCpIxbHZh69zpBm8Dil3ALkrSIXZHNDR1q
WQDqGBsOnOpmGo9AihLgFhGHz7feRA==
=n9kA
-----END PGP SIGNATURE-----

--Sig_/Vh2xNT/1BZbmsxmsHoCN4lR--
