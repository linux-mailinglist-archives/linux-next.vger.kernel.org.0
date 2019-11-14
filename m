Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16150FD0EA
	for <lists+linux-next@lfdr.de>; Thu, 14 Nov 2019 23:26:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726910AbfKNW0Q (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 Nov 2019 17:26:16 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:34635 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726319AbfKNW0Q (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 14 Nov 2019 17:26:16 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47Dbfs50kQz9sP3;
        Fri, 15 Nov 2019 09:26:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1573770373;
        bh=//hGcghSCk1TzHNx2Y7EgtJNt+te5RX+Faqm/KvJEDQ=;
        h=Date:From:To:Cc:Subject:From;
        b=YJ1+vD9+T4Pc5wDnB6m8ajzJCfhFXO1PyhoUuk29kkdWEJXY+uKUCJfkbAEaBYPrm
         Gkl+LK230iXFiwW4g8ic1TbOOhIPExUH4eJJLUclSR0xPluBuYTzZUN1KjYCD66cJ/
         yYOi2UBV/YFvMaGvW3UL9E/PMIImDILSM7dKV2A1+6noma1smDhJ23sCzgBVIYVwxW
         Ml7/MkL1RxkuKKMZbvOku3iNDARlG6eZm234hHbCUb1qwwLOoPxPZugmje9cjrjclb
         z0wd/u9D97r9xVBdlyU6Yy/vQPuVFcM6HDCuG+KqOzKg+cm6KUe1zXk2LcaA4KlG3p
         bAo9EZstsTSPg==
Date:   Fri, 15 Nov 2019 09:26:06 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Thierry Reding <treding@nvidia.com>
Subject: linux-next: manual merge of the clk tree with the tegra tree
Message-ID: <20191115092606.79a65342@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8oPxKgGc_L8yzeI3MT42CJA";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/8oPxKgGc_L8yzeI3MT42CJA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the clk tree got conflicts in:

  include/linux/clk-provider.h
  drivers/clk/tegra/clk-super.c
  drivers/clk/tegra/clk-sdmmc-mux.c
  drivers/clk/tegra/clk-periph.c
  drivers/clk/clk.c

between commits:

  929490c73870 ("clk: tegra: periph: Add restore_context support")
  02ee6fe5e67a ("clk: tegra: clk-super: Fix to enable PLLP branches to CPU")
  175ea1f93c33 ("clk: tegra: clk-super: Add restore-context support")
  837d3fa941cd ("clk: Add API to get index of the clock parent")

from the tegra tree and commits:

  68a14a5634da ("clk: tegra: clk-super: Fix to enable PLLP branches to CPU")
  f8fd97521d63 ("clk: tegra: clk-super: Add restore-context support")
  2b8cfd6b52cb ("clk: tegra: periph: Add restore_context support")
  d9b86cc48283 ("clk: Add API to get index of the clock parent")

from the clk tree.

These are different version of the same patches (presumably).

I fixed it up (I just used the versions from the clk tree (since even
though the commits have the smae author dates, the clk tree versions were
committed later) and can carry the fix as necessary. This is now fixed
as far as linux-next is concerned, but any non trivial conflicts should
be mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/8oPxKgGc_L8yzeI3MT42CJA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3N1H4ACgkQAVBC80lX
0GwOnwgAiveimTEZf5CcBS7s8LnCo89p17p6xNn5RJW5X2/rUNZCaFy3jU0Hhzm4
gS/OapmRuIr/jb5oD7e0+jZQnAXVplulGO+bLmxDVfcEfunMmB8AvIWm3qbW1gXD
y+luhsTKAssnNswUQWS/wIPbzX4shuvssaJNwSWHHzEWO3jlHKHf3R0qz0WoAPi/
ez4UCxbH9WpUMbgT3xH9XTqNMdvQpNi6IjMwZ8/wd1VA9Bd6rU/5BXd78ovJxvVr
uL3WewTn+Hy87oeLZFS0t4BCbsBliFkXaxvGCRw8n6EUFiAh3DoWi1ywNDD6KVU3
zI5BNpzeVRFj+q2xVj222zk+FfDvdA==
=DQYi
-----END PGP SIGNATURE-----

--Sig_/8oPxKgGc_L8yzeI3MT42CJA--
