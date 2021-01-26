Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9FDE3037A9
	for <lists+linux-next@lfdr.de>; Tue, 26 Jan 2021 09:15:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389727AbhAZIN7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Jan 2021 03:13:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389715AbhAZIMJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 Jan 2021 03:12:09 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67FC3C061573;
        Tue, 26 Jan 2021 00:11:20 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DPzvp35NKz9sVv;
        Tue, 26 Jan 2021 19:11:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611648678;
        bh=XJ9MCsqHCH/AZGffqF8J0BGJNW4yeE2Rbm3wm4r18ZI=;
        h=Date:From:To:Cc:Subject:From;
        b=fjhZCrndQ+bDy/s6611EofzOQP0aM1W96LI87gFhlCh5iM/Mnogsd1MJMfFoTfTiM
         EXj8EiCJxZOGBlxMoUJb05A3IrzI8+2vN7SBnR6GTRRVW/WwFtCNaowEDYS3t/4eo3
         hEobPiGj+GGVlwxLMs18ylkzGi8wFxbzwk4vIOqzj55NyI9IydBmdbc+9jyo2mWR5v
         Njh4/O+1Wg8JX31n+N/Ve/kFIp9dYTjMpxVxsqSJGm3rCH6zOu98/2SFYOtN0AW+nn
         pUEskt8U7fQYv2e4LXNjxBJVAN8Zg937gPRkeDfqG7psLr8VwCia3Nqved76gJsUMX
         RqphEwERzdQ1A==
Date:   Tue, 26 Jan 2021 19:11:17 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the raspberrypi
 tree
Message-ID: <20210126191117.47fffe80@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xqshCHkoRL1Xpx.t.mURkzA";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/xqshCHkoRL1Xpx.t.mURkzA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  7a5936445053 ("ARM: dts: bcm2711: Add the BSC interrupt controller")
  69894e0baa0c ("ARM: bcm: Select BRCMSTB_L2_IRQ for bcm2835")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/xqshCHkoRL1Xpx.t.mURkzA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAPzqUACgkQAVBC80lX
0GxJ7Qf/dz1HadafFEXcOpzhz9hNDcAGRBl0HLi0ylJTnaR8xggSdEs0mT9fAuns
UrdvT7qFP6tFMkvbTF9CvLzeyAz1Euy3kdHkiNhaGEW8M4hNQjwXyxz8kky06mgL
tADkGTcf2Ndo/sxUG1ZKhA/808QvrWMPPIoaC7bqL5Nx0WDRYA73Ebl56YjVD7G9
aJj8bfFOj3ueHA6QIehQrFDs8vuso1DJXKEXnEk15wjAODHPo+l3T1akrjIyNSM9
hsYkkQFgXDATj2brgqjoD2262aaNZyho7jgEenduira4jgaudUDwK/h2uK/Pc2XP
mxlCrglak6k5ALmdan52JHvqNc4Ajw==
=kzaz
-----END PGP SIGNATURE-----

--Sig_/xqshCHkoRL1Xpx.t.mURkzA--
