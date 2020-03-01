Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 714AA174B93
	for <lists+linux-next@lfdr.de>; Sun,  1 Mar 2020 06:39:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725843AbgCAFjD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 1 Mar 2020 00:39:03 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:50617 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725821AbgCAFjD (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 1 Mar 2020 00:39:03 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48VXBr2lCJz9sPR;
        Sun,  1 Mar 2020 16:39:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1583041140;
        bh=HjGjm5lcjEEBj4MMk5QA3YgRbDP2x3UrOqRuYrlmKS0=;
        h=Date:From:To:Cc:Subject:From;
        b=icnN2MtKkNEx+0jxWttKcM3sHj9x5Pe/TQeR7Jnnm/3/+g6UmfpOWjUBffckT7v/n
         vnFvc9b4bx65eQHVN5/oylIm7WHIdiyqFoIeeGt6kA3gD/VZuxFjwERO/wxjfrq88u
         02aTzFBM16OP1VDjjfiyNVsJREftMyLpGPjquhI6sRVwWqHRvAsbV4lSbJ+DNIf5Fk
         SinkegKO/zlMwWmgJsENLyRGpdJi4s1zHAMv08s9AuTd4Y5DI31z+dhx+2o6Ia+e0j
         oj3nTR68sAc3yquAzZxy/LndMY7h25mB/kiJN3OxGO/2H9BIYGxm6wk9Er8Fmsj7+p
         tSUtrCuzlyxuw==
Date:   Sun, 1 Mar 2020 16:38:54 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: linux-next: Fixes tag needs some work in the sound-asoc-fixes tree
Message-ID: <20200301163854.72175a0a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/H3vTgm1f8fO_vZpACRYwV4r";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/H3vTgm1f8fO_vZpACRYwV4r
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  f1861a7c58ba ("ASoC: soc-component: tidyup snd_soc_pcm_component_sync_sto=
p()")

Fixes tag

  Fixes: commit 1e5ddb6ba73894 ("ASoC: component: Add sync_stop PCM ops")

has these problem(s):

  - leading word 'commit' unexpected

--=20
Cheers,
Stephen Rothwell

--Sig_/H3vTgm1f8fO_vZpACRYwV4r
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5bSm8ACgkQAVBC80lX
0GznlQf+IKzfSHIFXIkHDpKmpO9vJzdPQCbyDWYlA6bGWsJ2g/t2Yi/81yv8PNYM
7GF+FO69ak7AvQfBFtUTYo0S4WvbnNJ7aZO2ZBbZaPkyPuGjb9W1X1IOMS5Xa7L0
Yp8vOOCP/aHXoN51PkMyQkTwFvt4oM5FWNexeHmecvbWwLCdxd9MUB0GrDBOy2hX
51XturHCU537DRF2ts8ybPBtbuQQ1NKOz1Ny36lURmBdj/WFAMm7TLDHSbBNz7dP
pxI+DtopO+a8Fhr+xH7gC2mvgQAUo/PXaApccWwm/ExErp6bIraPZspOz5KQ9EBc
6BZ3IQrUjT1vGY0evvkj9zL9hwCcuQ==
=hKLP
-----END PGP SIGNATURE-----

--Sig_/H3vTgm1f8fO_vZpACRYwV4r--
