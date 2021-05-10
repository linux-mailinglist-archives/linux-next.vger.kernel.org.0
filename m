Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7817F379AE6
	for <lists+linux-next@lfdr.de>; Tue, 11 May 2021 01:46:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229875AbhEJXsA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 10 May 2021 19:48:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229736AbhEJXsA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 10 May 2021 19:48:00 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E831AC061574;
        Mon, 10 May 2021 16:46:53 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FfHlG538kz9sRN;
        Tue, 11 May 2021 09:46:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1620690410;
        bh=E84NztXNBg5isZIQ/v1LhB+IEGL/UeJsDlfkw6y/7/k=;
        h=Date:From:To:Cc:Subject:From;
        b=cAlBHEMLeB1eapE8QxWY7Krj8cFjm7Hej/+bIrgb3yzPByAuKkoGGXxFMi/gpj5Nz
         ME8JJ+/DkKBGyfpGvEviiw1PneigjsBuN19FAo69Cwfe2UXQJfCnLMjAfSHpnDpZUZ
         8DSB3j/77y2APbwGOdQ+GaIKcpB4Ab2fRw/VF9HW2V6qalBYp7LfS2DKp+jeGM+Cs+
         RHb8yfZfS0Wu9Qd1AD/k3xvrS02xbngXOhUqqedW0KZRwpI1weCAsfpcTBOfJFpDiS
         jIk7fuUDLmtQusSpabCbDEycC0kbEk4OGrm5JurQeRHkKUgKUtERIxm9Rq1aIXKBPj
         FLcXELt42FKcw==
Date:   Tue, 11 May 2021 09:46:49 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the v4l-dvb tree
Message-ID: <20210511094649.41e707c7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/81jvEOFgzm62/OXwZUTLCOK";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/81jvEOFgzm62/OXwZUTLCOK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the v4l-dvb tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

drivers/media/platform/exynos4-is/media-dev.c: In function 'cam_clk_prepare=
':
drivers/media/platform/exynos4-is/media-dev.c:1287:6: warning: unused varia=
ble 'ret' [-Wunused-variable]
 1287 |  int ret;
      |      ^~~

Introduced by commit

  59f96244af94 ("media: exynos4-is: fix pm_runtime_get_sync() usage count")

--=20
Cheers,
Stephen Rothwell

--Sig_/81jvEOFgzm62/OXwZUTLCOK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCZxekACgkQAVBC80lX
0Gwvawf/Vw3XO+mBgb3nrlVzCUXlrKvZ9wbITE5+zqlrjhEOIEQ9ef2eQpIZJ8rx
25qZZJbq5iJLEqAh022zKYDXR+0D+B8+CT1Jq1rDrfELsN8GqlFtdSPOqG07Tcd7
HuJA+9PUZl9FeBjUUHsleAPDPQq++Obw6Qn0n1EVvP30MZ22u5B8Y0TqRRqyenrr
7fhypUiAnKUY/LcCZfGw/AoZu6iITSfmngdmUtO8ciDKu8ZfKQTw4P8g3bgbojNf
krgN8EbZRWyptbeyFJrtGUwIVyKlcfQ9pmZjYNOCno9viQbYkMOZW2ho0SK+tk74
FYjNn8vrGXSoBOPAZXC2qd+zq3lA0g==
=rkCz
-----END PGP SIGNATURE-----

--Sig_/81jvEOFgzm62/OXwZUTLCOK--
