Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B625FA8092
	for <lists+linux-next@lfdr.de>; Wed,  4 Sep 2019 12:45:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729650AbfIDKoe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 4 Sep 2019 06:44:34 -0400
Received: from ozlabs.org ([203.11.71.1]:58695 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729644AbfIDKoe (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 4 Sep 2019 06:44:34 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46NgRy2ffgz9sDQ;
        Wed,  4 Sep 2019 20:44:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1567593871;
        bh=q51v6jMKfuMMsSNQkaFTfC+YDlmgKQBdULryscFJ038=;
        h=Date:From:To:Cc:Subject:From;
        b=PZrcsQdvrc9rYmb5r9Bk1LoYEA8tbrMSzxY1x3Q9nasSr9ar1TiKhiVvD29wyBWGp
         Z/49E+ypr6HdyobnOBw9FanboRg9CnYE3hiNL5eX31EA2fpbG7AncidoL44kwne9aT
         J4JrFOt1fAjd1xRajN9WL4t8gkHkw5SLPG5vHV/kKmrqVsLyT127l8Y1FdyuUJFQcC
         l1L/qX6Vkr9YyV4xsMYNGJ7DZq5h4UN4rVtNpyx51SE2rHCd3YGz6EthJLB2lCE3V0
         Jm/06Y5dvhBqDpALoeE8J9KPvbJfelPKjjizntlV5En4HHz6KBXKUcxGkL0OA70eZs
         Hv0foYU83L7qw==
Date:   Wed, 4 Sep 2019 20:44:27 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Vinod Koul <vkoul@kernel.org>, Olof Johansson <olof@lixom.net>,
        Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: linux-next: manual merge of the slave-dma tree with the arm-soc
 tree
Message-ID: <20190904204427.1e1a064f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/j1zaefufpuug0qMHWw8wW3c";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/j1zaefufpuug0qMHWw8wW3c
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the slave-dma tree got a conflict in:

  drivers/dma/iop-adma.c

between commit:

  00c9755524fb ("dmaengine: iop-adma: use correct printk format strings")

from the arm-soc tree and commit:

  d17d9ea95727 ("dmaengine: iop-adma.c: fix printk format warning")

from the slave-dma tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/dma/iop-adma.c
index 03f4a588cf7f,003b753e4604..000000000000
--- a/drivers/dma/iop-adma.c
+++ b/drivers/dma/iop-adma.c
@@@ -116,9 -116,9 +116,9 @@@ static void __iop_adma_slot_cleanup(str
  	list_for_each_entry_safe(iter, _iter, &iop_chan->chain,
  					chain_node) {
  		pr_debug("\tcookie: %d slot: %d busy: %d "
- 			"this_desc: %#x next_desc: %#llx ack: %d\n",
 -			"this_desc: %pad next_desc: %#x ack: %d\n",
++			"this_desc: %pad next_desc: %#llx ack: %d\n",
  			iter->async_tx.cookie, iter->idx, busy,
- 			iter->async_tx.phys, (u64)iop_desc_get_next_desc(iter),
 -			&iter->async_tx.phys, iop_desc_get_next_desc(iter),
++			&iter->async_tx.phys, (u64)iop_desc_get_next_desc(iter),
  			async_tx_test_ack(&iter->async_tx));
  		prefetch(_iter);
  		prefetch(&_iter->async_tx);

--Sig_/j1zaefufpuug0qMHWw8wW3c
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1vlYsACgkQAVBC80lX
0GyEsAf/Qnjvf6g+5SsGilNzTBLfT4HNlal2P85915JvP7smyeAL6gS6QYZMUm1h
owyQdt/jEdTuxm1ICfrYoy/RgMr74rjpd9BpCpoXKOyc13o+pOhni819sL9B9kTP
0uvJVqt3FXqYQHvGBhbikc1aRgG0Qzq1BnZBaju6GYTXDtc1zf2OlHwgHlgrkurx
QjK13fMQBhLHVVHGUi2wMGDLCnc+4jDYYfV39FzXGtBOUT823/zMVKpsUe36l92q
vgkmXWjSmmAR5+J6jioYvVK47sf2TJ7kAn/1BEutuBKCn/GdfDAyfmQz1cOS02pR
v06nhsPXiUXb73XePYFYQFPDppbKFQ==
=RjA1
-----END PGP SIGNATURE-----

--Sig_/j1zaefufpuug0qMHWw8wW3c--
