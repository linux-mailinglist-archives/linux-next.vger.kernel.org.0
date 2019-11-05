Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8703EF33F
	for <lists+linux-next@lfdr.de>; Tue,  5 Nov 2019 03:07:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729524AbfKECHc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 4 Nov 2019 21:07:32 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:35471 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729428AbfKECHc (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 4 Nov 2019 21:07:32 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 476Y2n1txCz9sP6;
        Tue,  5 Nov 2019 13:07:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1572919649;
        bh=gxSHooczT1G2LQs4HvOkWBWHVPD5ENWKPDAFMGbTiuI=;
        h=Date:From:To:Cc:Subject:From;
        b=ex1ROfIgksCfKldK8/rKos+JzjF5QHHzXeJgq9u6zNBlC90FHTyzZVBZXd9nD2GzQ
         kEpkC5n/gUWwYD4WDcr4A9ofsS3AjLxhJ2lJty2yojDb+xxY/XtANgkJ5jWZYlRyYm
         uRC+vEy/xYNWuHdrvIX/N1q06L9ZL/EvWluJMjlmxfKBTSMO6mVTXc57jFR9NYDdnJ
         2dBdRzPJ6Mwc9hZLG8ZKJzC6je3MycgGl2emVK1Csj8TzRoI/++PUvyeJN3m8N04BF
         0zwcK8f0hqmLMSBSpKOXMJ4e8o/4cpazTLo/zJyphUnftlSKSfdZxLgK9cMy25Ejw/
         u78vsSwyhae+g==
Date:   Tue, 5 Nov 2019 13:07:28 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Leon Romanovsky <leon@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Parav Pandit <parav@mellanox.com>,
        Saeed Mahameed <saeedm@mellanox.com>
Subject: linux-next: build warning after merge of the mlx5-next tree
Message-ID: <20191105130728.0dd89a42@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/A0QGPcEe_NFlxWcskC=+.tv";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/A0QGPcEe_NFlxWcskC=+.tv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mlx5-next tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/net/ethernet/mellanox/mlx5/core/eswitch.c: In function 'esw_vport_i=
ngress_config':
drivers/net/ethernet/mellanox/mlx5/core/eswitch.c:1356:2: warning: 'spec' m=
ay be used uninitialized in this function [-Wmaybe-uninitialized]
 1356 |  kvfree(spec);
      |  ^~~~~~~~~~~~

Introduced by commit

  10652f39943e ("net/mlx5: Refactor ingress acl configuration")

--=20
Cheers,
Stephen Rothwell

--Sig_/A0QGPcEe_NFlxWcskC=+.tv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3A2WAACgkQAVBC80lX
0Gz8Jwf+LNRqgsmRHhQVY9g9pAyGu1dtsQjpQ370Qj3n83VUCNqjrRH1FKoLK5gi
79N9W6Rb/5ebOIYtxMddDSLxJvHmUVehaMppl7Xhz7/j2AjFkTabxO/HMrhx1J0v
VFYzOMx3mSjwyOTTAICp0GfpK0erckJXKgbKuqS7YXR7zErp2qLLVyF4AOPtmqZX
WyeSumc4RS0vvqfQ7+42NynjWgdZUH0J68SgQ6wRydNnFlDrWBuRU+cbXErDEbKF
9wTtOmZ27XpbdfJyFw376ekwb2VCEQ9r+GZz4tBLjYnf9cJ18orRKZ5jMk9cVE2r
wcMqDzaV4pA1EMIrJQFV9knVdVUc8g==
=gKqk
-----END PGP SIGNATURE-----

--Sig_/A0QGPcEe_NFlxWcskC=+.tv--
