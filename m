Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A4F5301F1A
	for <lists+linux-next@lfdr.de>; Sun, 24 Jan 2021 23:14:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726445AbhAXWNo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 24 Jan 2021 17:13:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbhAXWNn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 24 Jan 2021 17:13:43 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A561BC061573;
        Sun, 24 Jan 2021 14:13:01 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DP6gr73S3z9sCq;
        Mon, 25 Jan 2021 09:12:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611526379;
        bh=36Efgo471+gWYmzqkjsoTsfwF1GbFwhMUd3KUpYDbnk=;
        h=Date:From:To:Cc:Subject:From;
        b=EGPul2dxN87wS2w/WfPs566i33E8DYBIbjqln2SjwTYkdg/bC59oL/2AS3I5STmqL
         h5U9S1SiH1O8i9qNDDigxHJCy0J/loHb1nUZO+ySjhtTmZrjedG7o+MK1M26Z5fYlT
         q253kSfq3ZySuGXoFPefPR2kEJAw2gK7avXb12vFf6KCCFt4Ug8N4bCB7a2J7H1bE3
         1dU/vdW/ABvjEQmWRdoy4k+6z/fsgZ5bQwp2Fmf/jQlpu3mg95U9xfITxFsPRfBn9m
         if8uNOuT8VDt160Ut91BGR4fCAP1qYYsZsEd8mfd2jT60j+kfcfqsSBQCmaik9kq1y
         YA8Kh4kEG30KQ==
Date:   Mon, 25 Jan 2021 09:12:56 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul@pwsan.com>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Damien Le Moal <damien.lemoal@wdc.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Palmer Dabbelt <palmerdabbelt@google.com>
Subject: linux-next: manual merge of the risc-v tree with the arm-soc tree
Message-ID: <20210125091256.302fd411@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xTGN8QTv9nMA9=ndioFeNgo";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/xTGN8QTv9nMA9=ndioFeNgo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the risc-v tree got conflicts in:

  drivers/soc/Kconfig
  drivers/soc/Makefile

between commit:

  89d4f98ae90d ("ARM: remove zte zx platform")

from the arm-soc tree and commit:

  08734e0581a5 ("riscv: Use vendor name for K210 SoC support")

from the risc-v tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/soc/Kconfig
index f357c6c659d2,c0143651f4a9..000000000000
--- a/drivers/soc/Kconfig
+++ b/drivers/soc/Kconfig
@@@ -22,6 -23,6 +23,5 @@@ source "drivers/soc/ti/Kconfig
  source "drivers/soc/ux500/Kconfig"
  source "drivers/soc/versatile/Kconfig"
  source "drivers/soc/xilinx/Kconfig"
- source "drivers/soc/kendryte/Kconfig"
 -source "drivers/soc/zte/Kconfig"
 =20
  endmenu
diff --cc drivers/soc/Makefile
index 9bceb12b291d,fa7071246546..000000000000
--- a/drivers/soc/Makefile
+++ b/drivers/soc/Makefile
@@@ -28,4 -28,5 +28,4 @@@ obj-y				+=3D ti
  obj-$(CONFIG_ARCH_U8500)	+=3D ux500/
  obj-$(CONFIG_PLAT_VERSATILE)	+=3D versatile/
  obj-y				+=3D xilinx/
- obj-$(CONFIG_SOC_KENDRYTE)	+=3D kendryte/
 -obj-$(CONFIG_ARCH_ZX)		+=3D zte/
+ obj-$(CONFIG_SOC_CANAAN)	+=3D canaan/

--Sig_/xTGN8QTv9nMA9=ndioFeNgo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAN8OgACgkQAVBC80lX
0GyHNwf/fYUoDHJAJUb4wmgk4IYVtVW+oz4F9nF+1KZc+wfLK38w4QHJAiVuBKpE
4j4dCx+DOsPK8tC7MK8KPubY/JJJnUWl2ppfut6I5stB+F5VcoOCYAI9EM0JSPoC
vstDwYALy5YiD1+3T5kJcBL2leWUMKgHftTixAwL7zBaijileSr5N7N/HmZbDU42
iAwEOk4cBuYEMAtdyAFOhh88L0uMNFsvRJUfB4jdePKPHMkHcted6y8qRQay3NDL
FbZ1zrYqL2+3wRsFr7yf00lC+TSrSAXwwPnqyXl509NK2m1Rt/yqkEiYJzZ/FyJK
j0HOp/Fzx3DYWrDtDWGGgwshCyIMzA==
=yP1I
-----END PGP SIGNATURE-----

--Sig_/xTGN8QTv9nMA9=ndioFeNgo--
