Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6857443551D
	for <lists+linux-next@lfdr.de>; Wed, 20 Oct 2021 23:14:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231310AbhJTVQy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 Oct 2021 17:16:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231381AbhJTVQv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 20 Oct 2021 17:16:51 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7E5FC061755;
        Wed, 20 Oct 2021 14:14:35 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HZNfJ72Xpz4xbY;
        Thu, 21 Oct 2021 08:14:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1634764473;
        bh=i55a1HSDNmPR5SZbehP+SYOTuEd6t2kRJ3NIW2Uy0xU=;
        h=Date:From:To:Cc:Subject:From;
        b=TNDwDASTjDDU0TVCSwL/0uk4IuQ/MQEqcsmrymSe/rxQdGEjseBv3Wsr53H7ZuUhK
         r/Dn8rLPvfbxcz+c3BQFYMp0kzwau/uq6cwywHhgkYnf7oBOkVdFkc5TOY5Fj5PJwe
         i8rKS+BdFwH8N4SedIQpCURCMGg2oaRwlMFuJoSGb9PRmpmx52qO7ogvUgQb45Lqiu
         R4ywFZqgJML1ACdgeHWQ+dhsssTPbNmZ06IE3W832wMnZM729LS5LZroaGQFTyLGq7
         NYq1B3XW5ezd0lWwCuKdUkAQbYIkiDHsqetBGQW9JM2at7+VstpBdCynisqqx2Aw0O
         LS33Emk0QXsjw==
Date:   Thu, 21 Oct 2021 08:14:31 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the arm-soc tree
Message-ID: <20211021081431.49f9c84f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/L=ce+pSJ8uFvqC/s8cYSv8Q";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/L=ce+pSJ8uFvqC/s8cYSv8Q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  3e70cee46cbc ("ARM: dts: ixp4xx: Group PCI interrupt properties together")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/L=ce+pSJ8uFvqC/s8cYSv8Q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFwhrcACgkQAVBC80lX
0GxNaQf/afXD9HLtKMzVvWpRz7dwetORz69jYAVYBSWNFp5G2325ejs3PHP5doCE
n1MnTvjzmnEk52aDwNQ7SWI8dfSC/XeHJsW+Dd2eiobm1wZJH8IOlDnQeyQdJ3gA
4FwrAb3TLXYFXT5kJGhr5k0PMOhYH/TjVOHvskFngBa3SxjzuPd/iZ4fMGdSSwVe
643hm8uK8rANROADSHHGBQeTMBy1Ja2mNr1CeW4pMYpnyPIwTEPyL1Q7WKdpfBk4
uKvAIcXBm4b/+O5nOdVLq5Dx8MTHnQCJAGaKTiEhAyWinPHIcNKx6wL/eEsBsd7z
f+VIczbnAPelketCJ579uL64BCVUkA==
=FVsm
-----END PGP SIGNATURE-----

--Sig_/L=ce+pSJ8uFvqC/s8cYSv8Q--
