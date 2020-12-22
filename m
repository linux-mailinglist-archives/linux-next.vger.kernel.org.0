Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D7562E10A3
	for <lists+linux-next@lfdr.de>; Wed, 23 Dec 2020 00:48:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbgLVXsM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 22 Dec 2020 18:48:12 -0500
Received: from ozlabs.org ([203.11.71.1]:51625 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726072AbgLVXsM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 22 Dec 2020 18:48:12 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4D0tL94z3Hz9sVj;
        Wed, 23 Dec 2020 10:47:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1608680849;
        bh=TFWgwqaVABLxmJK9b93kYixw0ANZLnTE3RszfaGlu0U=;
        h=Date:From:To:Cc:Subject:From;
        b=o8NlhBMJ/9Udv0rQB4GUtuUVTAGX+JeYMQjiIh+vNTNEPqc4ktRTBEYiYG3V60cC3
         hzHNGQgcp8/48OJKuIySV2cUiHpDlJxdBbkAipd6uxZdFBZ5u6lXim0zrbhHJDBV2I
         /0TiEOxK1DQXGcLNH8BNHZ5I8P0tLH9QFxDeyQdsMPvSW1EM60+atdfVie4kCC2t9J
         SNs4sXpbaIRPp/VN8ZdSyRty8ome+L7/fDWgFtQOv4MEDZMYyFR9+Y+W4D4g2I2e3o
         4UYfEkJwCSqQR9MBFFQf6dwRVrgh4KOZ37MjsiUFEr6qayMAG9A3sUCmWSzK4HlPG+
         8CQ4TM4CorDPQ==
Date:   Wed, 23 Dec 2020 10:47:26 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Pavel Begunkov <asml.silence@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the block tree
Message-ID: <20201223104726.36ec2aaf@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hQE9kjucqLwVRemRJ5/5n3U";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/hQE9kjucqLwVRemRJ5/5n3U
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the block tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

fs/io_uring.c: In function 'io_uring_get_file':
fs/io_uring.c:9408:6: warning: unused variable 'ret' [-Wunused-variable]
 9408 |  int ret;
      |      ^~~

Introduced by commit

  efc2519f427b ("io_uring: fix double io_uring free")

--=20
Cheers,
Stephen Rothwell

--Sig_/hQE9kjucqLwVRemRJ5/5n3U
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/ihY4ACgkQAVBC80lX
0GyxBQf/Vt6ztSlHE0seAoG4P+2ZTkVT3dEfk8xc2lLVA8s06fG2GX2YvvqAXBU/
eYDLsHnD7voLRKGdtYkDiVUXUZ6UdXngVJ1n9zz1l9JAzQxz1fHzT0jTDa4p17+t
ROXWqXAz+jw8vksiNv2WPA+MTPzHGWJjH0e8LuHvSRIAGINxdMHZNIBJ2bPXb8Ef
cmqEI1Rg5YTbHSm8UFrvuE/5odojOLBEiIg/3+cDhjs7jGF2S83eBBXWDt7f5dQL
Ac8UqEDEDu5e2EZpPeXvFGtR9spq9HSSWZXH7Fehw/cZXFPjLCNtavfLicop4wl5
KbgJwcROJzJBvjNMrOVKAARUd+r5OA==
=bO5o
-----END PGP SIGNATURE-----

--Sig_/hQE9kjucqLwVRemRJ5/5n3U--
