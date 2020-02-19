Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12CF7163AE4
	for <lists+linux-next@lfdr.de>; Wed, 19 Feb 2020 04:14:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728219AbgBSDOs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 18 Feb 2020 22:14:48 -0500
Received: from ozlabs.org ([203.11.71.1]:44275 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728203AbgBSDOs (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 18 Feb 2020 22:14:48 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48MjWT3rh0z9sR4;
        Wed, 19 Feb 2020 14:14:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1582082085;
        bh=l70p6WIfuvehxohIBC7bOFj6bRmxHn6UwJWb6KzqtPY=;
        h=Date:From:To:Cc:Subject:From;
        b=dKtueKASof9wEWmUu21G2GnQhNdiYq16jAKxEosHKEcvUEGt+O+bG+NQ7U25XQBsz
         wDhmkqUCGPQ1VYb4dSia1W9XVT+AEch4KPvv2e+qyVyZkuu+ms7kToGsfaRaQX+Ngj
         VcXGcmMcXOSKu/DjfgQUsvuCmorzTXSNhaXy1G5+9zvNgsl87QJ2EbBSfofgtQlGXC
         XceWZVkvEP+kVfu2/7WwocmVuUfc0PNRoxAz7nrzk858GodkqBNPtPGvEChixO1RqI
         MjjViMRkchI4+3d3uZGM/WW7mOZhnxKqhjveDANNk3jUl6jwYrVdSZeN5+VNSwNLXD
         xPXhv8d12uFCg==
Date:   Wed, 19 Feb 2020 14:14:44 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: linux-next: Fixes tag needs some work in the sound-asoc-fixes tree
Message-ID: <20200219141444.591d20cb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ch0rVMCaaFH9OOh4aD8NHd8";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Ch0rVMCaaFH9OOh4aD8NHd8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  310006cab991 ("ASoC: tas2562: Return invalid for when bitwidth is invalid=
")

Fixes tag

  Fixes: 29b74236bd57 ("ASoC: tas2562: Introduce the TAS2562 amplifier")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: c173dba44c2d ("ASoC: tas2562: Introduce the TAS2562 amplifier")

--=20
Cheers,
Stephen Rothwell

--Sig_/Ch0rVMCaaFH9OOh4aD8NHd8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5MqCQACgkQAVBC80lX
0Gzp1wgApMDM/9z2RYrwDjT68mFYXmlTg/joagutWWvEruANswcYWqnFMXe6jUdI
LMOkY1nhpKl6StYEuiI6R5Yl3fMIoz/kvEtC34CDZ3JlYfY9+02kuhCyctUpyVbo
QAvCmJtjvJSsJhVvxlKAihf5OnBssXNFiXi3urq1zUrGDCRdEqqJuCeg5K2SqnA5
eq0DQwsJrBvfd7J3MImwuE0hEefHKHnvMKSueQDquMqEJYa0Z0V/KTUJOB7yvOFP
u4AzYT1suGaTCPOVS3aewpOyiBKNi+o51VtKOqbYxkvn4WA8EhJBpE53lHksbLru
kgPM6Mlvp7/fNh/KL2Hcsa5FwLtJOg==
=axYj
-----END PGP SIGNATURE-----

--Sig_/Ch0rVMCaaFH9OOh4aD8NHd8--
