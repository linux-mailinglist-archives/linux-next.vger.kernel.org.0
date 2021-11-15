Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0000B451937
	for <lists+linux-next@lfdr.de>; Tue, 16 Nov 2021 00:14:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231455AbhKOXQZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 15 Nov 2021 18:16:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350184AbhKOVap (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 15 Nov 2021 16:30:45 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C1DDC02982A;
        Mon, 15 Nov 2021 13:15:57 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HtMRq5Vgwz4xbM;
        Tue, 16 Nov 2021 08:15:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1637010952;
        bh=2PQkiML75nH5gTjFrmbLQEay2Mw4j+3cq9G3Vz10pxw=;
        h=Date:From:To:Cc:Subject:From;
        b=VBc38h/i+Jm+bhlGc95+AwVfhnsZQgPY96byZGfuKrOaXBDZ8g5SJAY+Kx9EGGW22
         +7l1dJ3pTy5JNcmvcSKfRTfN2Tmw8Jx9nR1WtbCaOSEaXTuNHitHRS2BylHFEyDh/C
         eWKYzVw1/3FR1ykc46WHM9mMhwsjGEFyj7iJOD4X/5cjuygUz/b8gX2pak/3iZWJRJ
         2PrrTKtpd8wTHHZJhTVusprsErLDSgZ489KPQfG8En7FU/nJzjU1THDg775IuHpdwx
         /HC7RAxPypJPytxArt4ZrBrdfF55CBqZj/CxVS2bPQrBsGFlszgM1J2rSxXo8QpPIj
         JNCPuhqFO4Rgw==
Date:   Tue, 16 Nov 2021 08:15:50 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commits in the leds tree
Message-ID: <20211116081550.7cb196bd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yalkpAx+/PzSTyn4mysE06u";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/yalkpAx+/PzSTyn4mysE06u
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  2f61f240215d ("leds: led-core: Update fwnode with device_set_node")
  5b9fbb94ff5a ("leds: tca6507: use swap() to make code cleaner")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/yalkpAx+/PzSTyn4mysE06u
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGSzgYACgkQAVBC80lX
0Gw/6gf/fbGNVaKgSz7HPYXsJoBOl5YyUGA+KxZjbrQkxxWU5lpfyph9l21taopV
INM80jYDSX8lXtJEEMalsynwo+RVPgUDM82COzLK9PEhT2Z8P4SIEVOKPw8FCpTe
i5Ei3JiF6mntFQPJMA/ns9JzEeyCbFVEgb0Y8WVQR8/BJ/Nlt12TRP04uncilVkI
947yoeh7IhCTK9t+q1O4ucBgFXbEycoM3crTQ+KkOjtm1AMvbYUQnW4nD3buRyPj
m4pdzILifmq8U1R2OWKfoPO5NdjG3FiRLSQLPPYYH33jUNBAOmsZnXWgsK2tJY4d
DhCIrI8vJFUl2/6sXzvqBhlf+gVaug==
=nAmJ
-----END PGP SIGNATURE-----

--Sig_/yalkpAx+/PzSTyn4mysE06u--
