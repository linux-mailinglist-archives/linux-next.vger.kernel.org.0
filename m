Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CC8C26CEC0
	for <lists+linux-next@lfdr.de>; Thu, 17 Sep 2020 00:31:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726365AbgIPWbZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 16 Sep 2020 18:31:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726311AbgIPWbZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 16 Sep 2020 18:31:25 -0400
Received: from pasta.tip.net.au (pasta.tip.net.au [IPv6:2401:fc00:0:129::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF90EC06174A;
        Wed, 16 Sep 2020 15:31:23 -0700 (PDT)
Received: from canb.auug.org.au (203-206-41-51.dyn.iinet.net.au [203.206.41.51])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by pasta.tip.net.au (Postfix) with ESMTPSA id 4BsFF273WQz8t8V;
        Thu, 17 Sep 2020 08:31:17 +1000 (AEST)
Date:   Thu, 17 Sep 2020 08:31:15 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Miller <davem@davemloft.net>,
        Networking <netdev@vger.kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Saeed Mahameed <saeedm@nvidia.com>
Subject: linux-next: Signed-off-by missing for commit in the net-next tree
Message-ID: <20200917083115.23fb84a0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_bd_+EkqQoKkoHQQ.57U3zV";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/_bd_+EkqQoKkoHQQ.57U3zV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  0d2ffdc8d400 ("net/mlx5: Don't call timecounter cyc2time directly from 1P=
PS flow")
  87f3495cbe8d ("net/mlx5: Release clock lock before scheduling a PPS work")
  aac2df7f022e ("net/mlx5: Rename ptp clock info")
  fb609b5112bd ("net/mlx5: Always use container_of to find mdev pointer fro=
m clock struct")
  ec529b44abfe ("net/mlx5: remove erroneous fallthrough")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/_bd_+EkqQoKkoHQQ.57U3zV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9ikjMACgkQAVBC80lX
0Gwjjwf+JYNxkXnjBVO+jpqvSYjaUtkUgjt/7MCHMmo24i5qti1tnchXNVWvqqJA
VoCx+xdoTPv1oVCDX1ur/LmUW3D0OZJjAMRzTacexi9vF2mIndlVQvSvgtfOmFfY
udzu4HgYogtSFrSvN55hv/f5faax+tY8TcXFHdVVM/K/9bvn5UOyxMq9Uknp+Ljk
Ipst5xbNQeJi6WBbf5MiFOa2DWqf+qlxGUem9Pocusk7G1erPiU+lJnGaalK7A1G
OX5ZC9JO9cP8e9tw1jlmFPZioa28S3/uoW+6njLCQBjYT47xi4bfT7Rz1ygN9N1x
DXdPhJhg0oBe/mjoOAuJYrnzYs3UEA==
=PTfZ
-----END PGP SIGNATURE-----

--Sig_/_bd_+EkqQoKkoHQQ.57U3zV--
