Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C5D6445F34
	for <lists+linux-next@lfdr.de>; Fri,  5 Nov 2021 05:49:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232004AbhKEEvx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 5 Nov 2021 00:51:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231688AbhKEEvx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 5 Nov 2021 00:51:53 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C411C061714;
        Thu,  4 Nov 2021 21:49:14 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hlp1y6qnYz4xdS;
        Fri,  5 Nov 2021 15:49:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1636087751;
        bh=TJFPneVKD0VasBvT5ThyabtbYxmLLMRAMZbosdLcNpM=;
        h=Date:From:To:Cc:Subject:From;
        b=Bg2vfWd+ZvHFzDGphVreUcqGOQXuwU+eFAhwFgZhE2QYBgYZmV0nS2QNtCra85Cn9
         TcZE57/VGDLfQQSPWFYRR5icPLHnhQmHmpSILqDcAW2scVnsU7olrLVNIYOtEmSpXl
         R2hHeEQJc+xE9VC3w0uW5QurRuHY+inFAaR4mtJrfq4POeFSus7h4rEGEUUcUqgh+S
         STJxY0BW/fuMgZ619inFq5848mmAVJETRRlZCS13lcLaC/ASD+jKYNBar051DtUxYL
         hJjqOEGiuZn/bMaGhZy1xY589SKkUYT2DpsVD3au9j+DuyrDOJguRxH8o5H9FzHSBB
         QXCy8WYB/xG3A==
Date:   Fri, 5 Nov 2021 15:49:08 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Aleksander Jan Bajkowski <olek2@wp.pl>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure in Linus' tree
Message-ID: <20211105154908.1017e97f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NZGqdHl1njUT3.BE07mpOdG";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/NZGqdHl1njUT3.BE07mpOdG
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

In building Linus' tree, today's linux-next build (mips
xway_defconfig) failed like this:

    drivers/net/ethernet/lantiq_etop.c:265:55: error: =E2=80=98rx_burst_len=
=E2=80=99 undeclared (first use in this function)
    drivers/net/ethernet/lantiq_etop.c:673:8: error: implicit declaration o=
f function =E2=80=98device_property_read_u32=E2=80=99 [-Werror=3Dimplicit-f=
unction-declaration]

Caused by commit

  14d4e308e0aa ("net: lantiq: configure the burst length in ethernet driver=
s")

--=20
Cheers,
Stephen Rothwell

--Sig_/NZGqdHl1njUT3.BE07mpOdG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGEt8QACgkQAVBC80lX
0GxFrgf+NcFIcB8TWKWgbDlY80PYDZorkK8Bz9EmjlsdUuiPHHbJs3Al+BhyxDEn
QzMmMXXjQIlwb1bAQPvCGLy89wyfw7f9MBf8UflAiaNvhxn0bcZskY/RBnLiyFV+
vV0UvmQGpWIbXSn28JQua6WGZEi4lajE4zljBgUnekV60RVI6McBnRwdBDeLYASH
lXKOnqd0BvaLrZeKfuw/AJyCfQ7r9mP9fbPT6oQfpKGegPiv4b3aB55V0y5PHrCp
CjCNj/tOnEnbMgjInpOcuuKsfnGb9QKGfzgU1hTFMDIP1XLKhVgGBBHOUfEgjoXk
wUlxMXJw2oaYSIJjyqDiXkQ6527UJw==
=z7BT
-----END PGP SIGNATURE-----

--Sig_/NZGqdHl1njUT3.BE07mpOdG--
