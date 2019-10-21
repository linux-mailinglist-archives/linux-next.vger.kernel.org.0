Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E3F8DE571
	for <lists+linux-next@lfdr.de>; Mon, 21 Oct 2019 09:41:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727170AbfJUHld (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 21 Oct 2019 03:41:33 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:53711 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727144AbfJUHld (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 21 Oct 2019 03:41:33 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46xT960h1Nz9sP3;
        Mon, 21 Oct 2019 18:41:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1571643690;
        bh=FoiT9fnunc6OkHkSYgQ7azeifK6FkObdjYd+oh0it6Q=;
        h=Date:From:To:Cc:Subject:From;
        b=NWqlGQoANpYCLVCWtWIW2a6jamEt7ydE7cNC/gNXxCVAIxVkgIbdJTGf+OJvMEUSv
         UfzRZlkMkX87VWhDFQNU5krzc+pQxzqrXmCwtzzVq0b7mfbeDBTIz9Yd8ZI4/m94sg
         iBMWbijFlfJ8cZNPHt3Q/H5N+dHwrOm0pGPusvQqhNkUcjVMdvJBk/wqR9aRWg8hiT
         JDr8nZsNkwFGD1bc8d1QLmDxUbtSj3lZJQNYKDpaPjQGqP7p9SHvAUIO+PHsYvASWH
         pOFY00k1q6RhObq8hIThSLDWaBMgVMSX8JtXLpMNFyLf0322rvJlD7h/Y9HAyQiCV+
         OPBdmnaqgPDZw==
Date:   Mon, 21 Oct 2019 18:41:28 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Doug Ledford <dledford@redhat.com>,
        Jason Gunthorpe <jgg@mellanox.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Potnuri Bharat Teja <bharat@chelsio.com>
Subject: linux-next: Fixes tag needs some work in the rdma-fixes tree
Message-ID: <20191021184128.601ff09d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BsDK.lSjkBl=4C119vws36T";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/BsDK.lSjkBl=4C119vws36T
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  612e0486ad08 ("iw_cxgb4: fix ECN check on the passive accept")

Fixes tag

  Fixes: 92e7ae7172 ("iw_cxgb4: Choose appropriate hw mtu index and ISS for=
 iWARP connections")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/BsDK.lSjkBl=4C119vws36T
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2tYSgACgkQAVBC80lX
0GzbEQf/SNbWGWz/Ci7V84XoZkrrRn5ZHjKXEUci6ioLJCdmW+UtOGCe/M3/c2S3
NCcpurZntmYjclj9qkPQm9NKB+aCUzzaktTJDZILEaeD9WNf9paolsg3LCmUHan3
q1zGDN2/RPuEjk9rjymyqwQX/lG33NcF7c8yHnaE4hEFnZuKDCw/oeUoN6ttKq6e
y1p38Hi+iQqAWQSGzW8ZJVu0NaNuiTMLT5KbwVwZyTonWdY55pgpuouABNq0890Y
PFX4hA+hykqtSB8pDCFOhF4KDE5qnhlxyTt3JOkM07lPPQhUZU8D4f5nmEDM0HaI
YmkmaHquSutnHR1RpphZRLge7miukQ==
=8KHo
-----END PGP SIGNATURE-----

--Sig_/BsDK.lSjkBl=4C119vws36T--
