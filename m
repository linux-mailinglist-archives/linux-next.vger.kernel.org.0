Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1649B186095
	for <lists+linux-next@lfdr.de>; Mon, 16 Mar 2020 00:39:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728994AbgCOXjS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 15 Mar 2020 19:39:18 -0400
Received: from ozlabs.org ([203.11.71.1]:55511 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728833AbgCOXjS (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 15 Mar 2020 19:39:18 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48gbVq5m7Hz9sPF;
        Mon, 16 Mar 2020 10:39:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1584315555;
        bh=+tUDgcepRWBHlFKHghgW6vo5hJaPg5GMTqtRPTxNt7g=;
        h=Date:From:To:Cc:Subject:From;
        b=BX38o0G8OhdEvAj5bodvalfOhAExxgymnS2iA9L6fa8KWzyNKdEea1LA0YiJJJhoG
         vP9et+8xpBzB4DGhKoAtbe1CRXtgHPja5aQiTwI/CvcHVUWl4YlRs7QOcVmmnDg21D
         O7Z6ERSEcUjHoUE9p0lhCqtZWfLSJJ+AKOXW88KISi2QV92Zr+MyYA2NIsZv/4kxjM
         cMs0/GMV/Q+A4cgXH53D7WEyXvbgLeoNb+6HMs1+bCs1hapbo8hIteZcIQ72srhAWH
         GmgpNi1LLgO+fqGyTbJwSV46ZIkFDiaGAVpid12cnw9c16HY6YvXpeE/DdIiuIoG1l
         erw1nJDIGKT+w==
Date:   Mon, 16 Mar 2020 10:39:13 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Leon Romanovsky <leon@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Saeed Mahameed <saeedm@mellanox.com>
Subject: linux-next: build warning after merge of the mlx5-next tree
Message-ID: <20200316103913.659d3a5e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XcKj.RJIZwhP7uX1zcivCMd";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/XcKj.RJIZwhP7uX1zcivCMd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mlx5-next tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

In file included from include/linux/printk.h:331,
                 from include/linux/kernel.h:15,
                 from drivers/net/ethernet/mellanox/mlx5/core/mr.c:33:
drivers/net/ethernet/mellanox/mlx5/core/mr.c: In function 'mlx5_core_create=
_mkey':
include/linux/dynamic_debug.h:157:25: warning: 'key' may be used uninitiali=
zed in this function [-Wmaybe-uninitialized]
  157 |  _dynamic_func_call(fmt,__dynamic_dev_dbg,   \
      |                         ^~~~~~~~~~~~~~~~~
drivers/net/ethernet/mellanox/mlx5/core/mr.c:47:5: note: 'key' was declared=
 here
   47 |  u8 key;
      |     ^~~

Probably introduced by commit

  fc6a9f86f08a ("{IB,net}/mlx5: Assign mkey variant in mlx5_ib only")

--=20
Cheers,
Stephen Rothwell

--Sig_/XcKj.RJIZwhP7uX1zcivCMd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5uvKEACgkQAVBC80lX
0Gxucwf/ZJwQJSJkO0ByEDptP7IoFfYCM7ovlNvvtf6koIf3uwcz3NEWWs5I7BbA
/gH9MogBhIJX6XJ68f3MU68PBzMKGO4o955F9wxaI1iNwQifTCjcOA2wFWq0EoFT
fgqcOGyLJ2U/xhPshHO+KgV+t6gvOyq5U0AQqSE1iDe4db95wUHs4G3QFLQ16/jj
WuW9DLF6u00VZV6UKDckvfXKr3b85rKlLUeYzCxP6sU7SQhJdrDdqJ+6POUU5y1C
naIUL+ectKgzdYT09I11Vukvls/ZOx3l3yaf+a36WZZhInwwRWhp0pXID3wdmBs2
0U6aFaNs9wxfzWU8Hem+qJYWC1rkig==
=1e/o
-----END PGP SIGNATURE-----

--Sig_/XcKj.RJIZwhP7uX1zcivCMd--
