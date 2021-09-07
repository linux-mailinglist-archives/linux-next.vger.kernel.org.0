Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBC794021FC
	for <lists+linux-next@lfdr.de>; Tue,  7 Sep 2021 04:30:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233000AbhIGBDT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Sep 2021 21:03:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229975AbhIGBDT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 6 Sep 2021 21:03:19 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72A6CC061575;
        Mon,  6 Sep 2021 18:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1630976529;
        bh=HtpABVeSZeu1ftNUCNlSIMFtuUwHNeJrMqx/kkq0MN8=;
        h=Date:From:To:Cc:Subject:From;
        b=liDqcNxwcuuMkYtF1qtWA3AVuRPcj7VMfWp8vSQWL73SEAFRLu3ylH7r+otiaFl1f
         pmhvAiYGZzopesOx07B6IE1JzpMJttGJehmtqrL11hkUo8DM/FTiQZAPz1jUJ/Z901
         ZB4LpkcHfd9CLZ3E7RA5MHFk1fISmcxZxq1fslJy9HQv7TEzU2/dj7DZCwBw+9hHU2
         4PoTOk7YJneI8D8yijCD6cmvqU/6aU3xORqXZ93ZLgPQV3nd0GCkLdFAtvYDiA/uPc
         0t+Z751nj271qcHN+Pv8uZo8YPKMkiJAL8DLXJSiuzn128UP5uc6MsyVWZtwZUwKxe
         hK5+b1+VsOF1g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4H3RnD5mRvz9sW4;
        Tue,  7 Sep 2021 11:02:08 +1000 (AEST)
Date:   Tue, 7 Sep 2021 11:02:07 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure in Linus' tree
Message-ID: <20210907110207.2b718631@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ghcMmdC16VD9cf17Yqdl7zL";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ghcMmdC16VD9cf17Yqdl7zL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

While building Linus' tree, yesterday's linux-next build (mips
rbtx49xx_defconfig) failed like this:

drivers/net/ethernet/8390/ne.c:909:20: error: =E2=80=98ne_add_devices=E2=80=
=99 defined but not used [-Werror=3Dunused-function]

Introduced by commit

  4228c3942821 ("make legacy ISA probe optional")

--=20
Cheers,
Stephen Rothwell

--Sig_/ghcMmdC16VD9cf17Yqdl7zL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmE2ug8ACgkQAVBC80lX
0GwoTgf8CYoPYDrsXYCElbwcCTuo+GgUGXEKe9/1Nn4nGTfBkQJOtjqk0OGLzqwV
r3HY/rhLxMxCiP08zwpDuJVN7/j83gwl4RR9WgJVqzo9IzARDnC6/zHgMqmfBgZ0
ryOwom17l2CfXQl63FVaUheEBfXXXDXB7ozGD0ZylrBbVjXLiOLk3M/xe2DcyolP
UhL5gwfPhEYjo+O68G7/JXBehyCmeZW5DvhhM+tQfuFeMEqfXvaTz145o4mzjnob
O1ufdvnWAEBV4lq4y9BmPJiNEpPTrpzfH2cIAIhq7L3Y2m5MSVI6q0CTBhFKpA4N
Tfjes+3RwbeQ1QkcXrNL1wmIu3YCJg==
=JBFw
-----END PGP SIGNATURE-----

--Sig_/ghcMmdC16VD9cf17Yqdl7zL--
