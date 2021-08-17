Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 588313EE5DE
	for <lists+linux-next@lfdr.de>; Tue, 17 Aug 2021 06:49:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231616AbhHQEtq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Aug 2021 00:49:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231549AbhHQEtp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 17 Aug 2021 00:49:45 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A9FAC061764;
        Mon, 16 Aug 2021 21:49:13 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gpdpq6rlxz9sSn;
        Tue, 17 Aug 2021 14:49:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1629175749;
        bh=Ct3FrTHjWLMdS/SxPif1yBfRoNMfp0kR8yKxVWZpQrk=;
        h=Date:From:To:Cc:Subject:From;
        b=dCG61rZ11RglJibsfvB9Jgbl9xnKI/CpD2PCpOReGc1+PLaxhbv8kKwL0j4FtE5mz
         H7XsIHG0eWuNgCYJUjx4TBwwpBx6oFJMXN2cR9DbyQvO/vf5Qc7TC/+Z5XzYOUz1C4
         reXx3XBltmtPQ/890NkD9WoN1VM5niKc6Q8XjsCnTOuKDmGgnQMFb7yHkBGzkrR7TX
         WIrgkz2n1IUHv+SzsV8jHtBM5LejxxCyQgeKIzh+1CSdmLa4VnW67e2aX7pXxA2NTe
         fDGJaBG6tc78PsjKTP6pohH97EYyV22qTLLM32UKfrznKnxMOZt84HocUZTW8QERqk
         8LQ9L3mAdvD6g==
Date:   Tue, 17 Aug 2021 14:49:07 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Richard Weinberger <richard.weinberger@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Sean Young <sean@mess.org>,
        Zhihao Cheng <chengzhihao1@huawei.com>
Subject: linux-next: manual merge of the mtd tree with Linus' tree
Message-ID: <20210817144907.2e691d0d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WvQ7wYwMy++u_yizy40pvmc";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/WvQ7wYwMy++u_yizy40pvmc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mtd tree got a conflict in:

  drivers/mtd/mtd_blkdevs.c

between commit:

  2b6d2833cd1d ("mtd: mtd_blkdevs: Initialize rq.limits.discard_granularity=
")

from Linus' tree and commit:

  c7c12c7ce6c1 ("mtd: blk_devs: make discard work on FTLs")

from the mtd tree.

I fixed it up (I (arbitrarily) used the former version) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/WvQ7wYwMy++u_yizy40pvmc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEbP8MACgkQAVBC80lX
0GykeAf/eLLhdslHhjHXAy0iQT17bu6VfbYz/kJYQe6FEtyBgObc2nOqSYVtIu10
HvJJrVedDDdIZyYs4VThrMc6MDIpC6rYyAOHyiLGfdp8zYNekHpG9ZUxsaSDgXMI
VhwMp0M1J4SlBe9kJJt8FuK9C9YJpC66kvOQ+rAlsVmG4uhYgq9lKHCOva7ti+t0
qAzY7KXmCOSKjVmjGWXR2hulc4kzHRgf9+oJPTtqOdGjq7Ykuv++PzSyXxl0P49B
Y1FNr5MbCeuuGKvIHzMTF2ITuXQIBmFPqW059yapgoD0laaqvYJBZ/11iNrO0lcU
BVt1Iutu8iMGkB31ZFNf4OUQevOKuQ==
=1Dej
-----END PGP SIGNATURE-----

--Sig_/WvQ7wYwMy++u_yizy40pvmc--
