Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C395B1606B7
	for <lists+linux-next@lfdr.de>; Sun, 16 Feb 2020 22:26:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726043AbgBPV0J (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 16 Feb 2020 16:26:09 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:47797 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726036AbgBPV0J (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 16 Feb 2020 16:26:09 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48LKt64b7pz9sRG;
        Mon, 17 Feb 2020 08:26:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1581888367;
        bh=lExeTftvs7DIRZyWte6FEXzUw6Bw12Pkh0soWbIZrVY=;
        h=Date:From:To:Cc:Subject:From;
        b=ecCtJFNQjrkV5YhebWSTuY8bmNuNUZTwYmU+fw2lo87h+QGUGmBn2YdJIDM+8Dsxc
         IVhmcfQCk2L+Zadj4uklhyzzrmytPJZcU0s7Uuh5/w5tQStkNkufq7vaDWUWq4nXhj
         OFI42NAcfpTVO1HHWE6laWsOazUQwSNMgJ5HboikFYdGHRLdyBufQmT+0d4L5BmItD
         Qh4b8yOcsfM7uv0g+15UaPlKEo/1wwA9Oo25fSeb4qB1EUTMCHl6kkYeKWUnF8e7Ae
         MK3jBwasyP+jWocbxr/fO2of3YR2a+li81JkcCupOsuz5TfuzzgmLL7TLnaxhn83ql
         19LmDz4lE9siA==
Date:   Mon, 17 Feb 2020 08:25:59 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Kevin Hilman <khilman@baylibre.com>,
        Carlo Caione <carlo@caione.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jianxin Pan <jianxin.pan@amlogic.com>
Subject: linux-next: build failure after merge of the amlogic tree
Message-ID: <20200217082559.73e736d2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CC+J/jj=GiH0KthB5lCYi0W";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/CC+J/jj=GiH0KthB5lCYi0W
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amlogic tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

arm-linux-gnueabi-ld: drivers/soc/amlogic/meson-secure-pwrc.o: in function =
`pwrc_secure_is_off':
meson-secure-pwrc.c:(.text+0x4c): undefined reference to `meson_sm_call'
arm-linux-gnueabi-ld: drivers/soc/amlogic/meson-secure-pwrc.o: in function =
`meson_secure_pwrc_off':
meson-secure-pwrc.c:(.text+0xc8): undefined reference to `meson_sm_call'
arm-linux-gnueabi-ld: drivers/soc/amlogic/meson-secure-pwrc.o: in function =
`meson_secure_pwrc_on':
meson-secure-pwrc.c:(.text+0x128): undefined reference to `meson_sm_call'
arm-linux-gnueabi-ld: drivers/soc/amlogic/meson-secure-pwrc.o: in function =
`meson_secure_pwrc_probe':
meson-secure-pwrc.c:(.text+0x1ac): undefined reference to `meson_sm_get'

Caused by commit

  b3dde5013e13 ("soc: amlogic: Add support for Secure power domains control=
ler")

I have used the amloginc tree from next-20200214 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/CC+J/jj=GiH0KthB5lCYi0W
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5Js2cACgkQAVBC80lX
0Gwrewf+NdHnAFT4xMtbNFHh60tBLEuF/0plXNQebci7ShuyUK9raxLYikcdKqkq
pSqGXWeiK1ymwx15+rMt4otssaDlzV9dV0mbstvmDlqnfkxy9xdhxl9gfUxdKcP4
N05CrwcU1JfJnooZ1+SSf4JcS1hutzT4kldeLU76sc7lrCQ6NHukCRiEbyHwp0DQ
ae5CIAdOYfHw6dh8jR0cFP0n/v9qCaEbgTP2pWzBKmHxkcrozTR+K2sVx/seBYgQ
eXlQd7NMv8tbUaErBFJYGj75BldCkWxuJU0V3J7Agx01cEtnxM0gzYwlMMlm3SSS
KMzmWPPffjPbd6UUT0/Vj52iobKsDA==
=O42W
-----END PGP SIGNATURE-----

--Sig_/CC+J/jj=GiH0KthB5lCYi0W--
