Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09AD9169506
	for <lists+linux-next@lfdr.de>; Sun, 23 Feb 2020 03:35:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728419AbgBWCfB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 22 Feb 2020 21:35:01 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:39463 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728110AbgBWCfA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 22 Feb 2020 21:35:00 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48Q8Rk3hndz9sR4;
        Sun, 23 Feb 2020 13:34:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1582425298;
        bh=dRb5zLS6ETe8D++xeu8xpRqKrDs7UJOVhNBa9XQTBHY=;
        h=Date:From:To:Cc:Subject:From;
        b=SpFbpKVOGZBGSO0xACHxQSWyW/acnCZyUhDincIsvQK2/Gra60X8gkh7YZz9SSmT/
         3a0PnE4M56LRzvK9lt+35j1pkgI5ejvT+7zKRNkyB4Z6pxbTFs0RttLaiDC/8axJ6G
         2iJA7YwhXXssoCeIXhL83dLOyKOQgyEaxjQ6Kjj9Z61Klocm2mWNVemfkdjJJ15izC
         Qs+PaA75xE5GBnY4c0z7Oc0ZkSfTCeNz2icPEmKE+VRxyL8yl2XG2E5EVpQ3Syt7Oe
         kPcWJ2bkMwsjPgKS0oURiGZ3m9ZQ76akE3AzlFehVlVADJWVgR/ldbYE9HQZISDrpu
         dnIeGehhO4vSw==
Date:   Sun, 23 Feb 2020 13:34:51 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Guo Ren <ren_guo@c-sky.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the csky tree
Message-ID: <20200223133451.0c8c0f09@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/X9iNySGKKX_gbiMwpaVRvMG";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/X9iNySGKKX_gbiMwpaVRvMG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  24cfce6b33f2 ("csky: Replace <linux/clk-provider.h> by <linux/of_clk.h>")

is missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/X9iNySGKKX_gbiMwpaVRvMG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5R5MwACgkQAVBC80lX
0GyG+Qf+MMuLExVboEViTvo8N/+g5AafwdhCM1fc+87FFTrqo8mvb/en1ky8rxYo
zCkaKn9gpBuCy6RBb2SNBfY9OVwtBsxsr5D1boX/JgOMveOlEniMqwhVXUCFccfF
vSSjOokdKB/5JkvmFglWyP0NcR0/qFvy+fnrvGMP1BtQVMK+hXSc0YU/OZpDESGG
WxsOgs+eWPHH0fG9v2R58YWQL7uR/xe+z1XNiN/5j0kmuhgIIZZhEdIpnoyJkk3T
l0rLluQt/ah23Iung7mPCpQTJhMdD+vXS2VFLTnXKJRnnrd+lJ05Ouyq4hdi/IGb
A5/qdFr6AfPM2D01bvsVhh5nV74JUQ==
=5gJ5
-----END PGP SIGNATURE-----

--Sig_/X9iNySGKKX_gbiMwpaVRvMG--
