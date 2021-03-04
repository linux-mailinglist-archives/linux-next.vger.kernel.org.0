Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1EF232CA1C
	for <lists+linux-next@lfdr.de>; Thu,  4 Mar 2021 02:42:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232704AbhCDBlu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Mar 2021 20:41:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232712AbhCDBlu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 3 Mar 2021 20:41:50 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BDB3C061574;
        Wed,  3 Mar 2021 17:41:09 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DrYVV1Cckz9s1l;
        Thu,  4 Mar 2021 12:41:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1614822066;
        bh=UblDfmf0pR8nO78Latk89CJcPDsjlnVTl63VKsuauCE=;
        h=Date:From:To:Cc:Subject:From;
        b=gSkLOyjfZzKLBg9/x74jKWDvTneREmUpmRLdM5vinc5jazsAhhNZ2lSEooGRir4kq
         SGaH8wxDgCpY3kriGNaQKEX/Ejc7D4Klyu3gvvL0oyBGth39YDB2OR25r+OTWcErMC
         2MObFgJ0CoYfCXH1y10/Lr9MuMR7O4Mbm4lKPpwF+gmG77LyrW/CugFdslvAYfAMBg
         SKnhBDeIt/jRJU7LQa3C30lEVN94xMxNDyeb4l/VDqItwxm94XLIWKo+gLhBeDdm1T
         pMn3rPB6iTXWlYwFGQ+XyUXfAOsuYVu9OFJYigCaOaxkRyIIEBKs9GUzatXqCGCLQq
         bOqePfg+Z/Gsg==
Date:   Thu, 4 Mar 2021 12:41:05 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the rcu tree
Message-ID: <20210304124105.7844dca6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WfRQtgs5qEyUeWKmN8xXGnG";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/WfRQtgs5qEyUeWKmN8xXGnG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the rcu tree, today's linux-next build (htmldocs) produced
this warning:

kernel/rcu/tree.c:3824: warning: expecting prototype for start_poll_state_s=
ynchronize_rcu(). Prototype was for start_poll_synchronize_rcu() instead

Introduced by commit

  7f9a26bbfff2 ("rcu: Provide polling interfaces for Tree RCU grace periods=
")

--=20
Cheers,
Stephen Rothwell

--Sig_/WfRQtgs5qEyUeWKmN8xXGnG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBAOrEACgkQAVBC80lX
0Gz1Mgf8Dal56GFCDvFQsmMwQOJ2sFvzeMCHCt6WQaXe9ys/9W83EivNH6S2tYFh
cz/MC1ZIMUIsnlpIbh9PHWOgUkJWqvXhXy5rocAj1ejO+EvwLKdGPik3oqzeQGo5
zDOqOwT0zxybUeviS4OYHUdctW6HXI84efR/UjflCOnPg4xdR53GhzQR3er60VIA
QaJmYvX0E9Udtc9MtsdLrNSsH7ePK0prh71bQQXPsMc3KV/D4+UeZHaQjEgHi/lh
XPCLzuGPZ/Hd9go7x8i3dqEZU/zKndFNhS9+LfkifiuX0u9FBZSvHiyEhB1zgcFN
Swqml0ekbKvcNpUBJDdURR29pvC8bw==
=4Ik4
-----END PGP SIGNATURE-----

--Sig_/WfRQtgs5qEyUeWKmN8xXGnG--
