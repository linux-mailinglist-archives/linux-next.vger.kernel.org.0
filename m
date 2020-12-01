Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7886F2CADFF
	for <lists+linux-next@lfdr.de>; Tue,  1 Dec 2020 22:05:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388252AbgLAVDl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Dec 2020 16:03:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388236AbgLAVDl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 1 Dec 2020 16:03:41 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5CEFC0613CF;
        Tue,  1 Dec 2020 13:03:00 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Clvh12NBKz9sPB;
        Wed,  2 Dec 2020 08:02:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606856577;
        bh=qgIdUNIu2b01Tkur1AWAWWTMSomrYrJ8vZk5vbj8pj8=;
        h=Date:From:To:Cc:Subject:From;
        b=KpfJmBZWVxUNhbTb9Iqcl2dlHRji6tU4byPOvAodOR7r9YWed7oG0G33fXwWPZ5f3
         FG/NXXCotR+ZvriIihBtyJ3phiWko09eYNLPEPgHa1u+T33wAEctdn1AdbZJqhTmDH
         8gzbL6jZTsIjW/xJSClMiFCV2k46PY4+42nhNunsf2kj335Ro7S8maInhGzua54tn/
         8w55X32INrdvcaXSrUN/B3hPe65nBYLzaYNIGwPMvOYAYz4zgfcSLy7Whnaakoddf/
         9jOUXZ82bAoHubFlqqKY514yDvPsDwBNZHEaqwK3eQ9Q7H2btoOSuZZIyExeM/Q5KD
         J5pJrgiUnMmaw==
Date:   Wed, 2 Dec 2020 08:02:54 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the block tree
Message-ID: <20201202080254.4e8dbb43@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lo+Fo=NVdSKesZ096DsfIWq";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/lo+Fo=NVdSKesZ096DsfIWq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  573cc9d095bc ("blk-cgroup: fix a hd_struct leak in blkcg_fill_root_iostat=
s")

Fixes tag

  Fixes: ef45fe470e1 ("blk-cgroup: show global disk stats in root cgroup io=
.stat")

has these problem(s):

  - SHA1 should be at least 12 digits long

For the future, this can be fixed by setting core.abbrev to 12 (or more)
or (for git v2.11 or later) just making sure it is not set (or set to
"auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/lo+Fo=NVdSKesZ096DsfIWq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/Gr34ACgkQAVBC80lX
0GwJpAgAkOvgcvzToc1gYC9AVKxr7ZotDfQjpVQtXhIV+BY2holWXaMlEurJZXaG
HehmhuWIumnnLSsUsOYymebVHF/SFzWCazs3xqoDtVVNIIT/KgZfXwWdBnhUJqLi
Q5QKZbKZtVRbhPCH6pDSIhV7nhw6k5FFQW9TjHSCO71rQDbqViOONKAF/oj6dlrA
FlPo5oiB0kcePVlrQuWzgrNEONnIo08eiIkttwSdHO9TUmnfBFFwxib0W4J0NdlV
g+508pXmJ74e0UwxSurZ3069sFfsQ+T85XxIDBfq2Dy2CQKBqo8LioQDuSxE4NZ4
Ya+eD/w1WkP8KxnzHQwoDFB9JP6QTA==
=z+DD
-----END PGP SIGNATURE-----

--Sig_/lo+Fo=NVdSKesZ096DsfIWq--
