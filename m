Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30F14FFCDE
	for <lists+linux-next@lfdr.de>; Mon, 18 Nov 2019 02:39:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726047AbfKRBj4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 17 Nov 2019 20:39:56 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:47053 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725905AbfKRBj4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 17 Nov 2019 20:39:56 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47GWpx27mQz9sPT;
        Mon, 18 Nov 2019 12:39:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1574041193;
        bh=McuSmKWMCSmG2luaUhgvdQQPJyZpZyN5PX1y1kXU/3I=;
        h=Date:From:To:Cc:Subject:From;
        b=nVFPQ12rbENnRPYhwo0X+HKChEztiCjvHyqU/4MNTdJqCZvG0HlPu366MtxJAtGRi
         qFhtHdVrmOv7xixFCjXInQbVxzJwGK/ssMlfMaGbc3T6OJU+Pk+83/vKbED096u8u2
         /NN7vumZn9R4gDBvUg/tauOL8h6IILakOeA7cUqZp53IxBBBAbhjT0TsNW1aNVbSkd
         d4i6DebgYypqmvPZfzDIKDKbIB9ruLYZYmWJfR1lB+gtBoVQbyZDTvKCVfnH1g+5Mz
         5aNamC+Znxig3KYOS8q47e9UXjcczOvqgcBbri2s8WXD/K4MhVsTIjqcZwdklMP4K9
         v9iaAtc2m96SQ==
Date:   Mon, 18 Nov 2019 12:39:44 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sumit Garg <sumit.garg@linaro.org>
Subject: linux-next: manual merge of the tpmdd tree with the kbuild tree
Message-ID: <20191118123944.5fbeec1e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vxReaO5_VyzMQGEoXUwfz+7";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/vxReaO5_VyzMQGEoXUwfz+7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tpmdd tree got a conflict in:

  include/Kbuild

between commit:

  fcbb8461fd23 ("kbuild: remove header compile test")

from the kbuild tree and commit:

  47f9c2796891 ("KEYS: trusted: Create trusted keys subsystem")

from the tpmdd tree.

I fixed it up (I just removed the file) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/vxReaO5_VyzMQGEoXUwfz+7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3R9mAACgkQAVBC80lX
0GyppAgAlSXV2mGZ46e/oUYQ/gJ7GmOjX9KXfqT2sXKXd8rUyIEhpLWogKlb8sHS
1Q5M6rso/rdixSawwSyDADPZIdSDwtUj7crUcwZ0ibPKViAAsVW0LDZ/bPphYgcJ
TKfEBBHcgtbv+24UWa8VcOLrNrJHGgILhaw5v4CIJwnU5yct72IUQty8cOL1iJac
9EEJlWl21mCIF3dTmAPp5p+S4Fi8XVzF2KxDltuVuRBG/qP4fKwJ5KaJVt4YPuwu
E88903xO13eyYCvEG00MND2XfzZHi1BUMhKg3YteoAvG5nVogjp1Po0XV65cDiDU
oZi2LZ/MOjkIGOsJHpWpUrmahebWFQ==
=oTFL
-----END PGP SIGNATURE-----

--Sig_/vxReaO5_VyzMQGEoXUwfz+7--
