Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D2ED42E428
	for <lists+linux-next@lfdr.de>; Fri, 15 Oct 2021 00:29:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232619AbhJNWbu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 Oct 2021 18:31:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229995AbhJNWbu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 14 Oct 2021 18:31:50 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCDDAC061570;
        Thu, 14 Oct 2021 15:29:44 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HVkbj0MBNz4xbP;
        Fri, 15 Oct 2021 09:29:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1634250578;
        bh=7J+zMFVVCPk6f3qKqBKYj68sCRxcMV7azRCODVCP33Q=;
        h=Date:From:To:Cc:Subject:From;
        b=KX1JP2IaN3R+DtzxXSnn+arxXPtkXajtiKJA7H36EygEx+2whXtKwbBLjQSnva7qF
         O3kZM/cA1shq0uc00NKuxuQkHYnNkbMnXK6DTRgUHshpkXsLdZ0h6vrtX+Y+w4Xzhk
         gzem8KtmnQ6LViIF821GrzZtp5DQXL7x8vW7aqcjbGigVztYTPz6FnaNh8magxPru8
         1chH7ZPsltQnd5Lj5Xkn2qrGlNxAZ1EjITgxx9Jsx80eWLrp8FtF+GXw0kMUD0LCsv
         g1GLQR6g/B9E9UBHA2a+bdJ4Tfi+2uVJPxAiJr0DTZ8TP4K8iKU9eylTv6btoM9+it
         eeNyeGT9TQ4IA==
Date:   Fri, 15 Oct 2021 09:29:34 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the arm-soc tree
Message-ID: <20211015092934.726ed2d4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/P_JF0YxXo2u.I8RG_E4cXs1";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/P_JF0YxXo2u.I8RG_E4cXs1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  3f3247285461 ("ARM: dts: bcm2711-rpi-4-b: Fix usb's unit address")
  13dbc954b3c9 ("ARM: dts: bcm2711-rpi-4-b: Fix pcie0's unit address format=
ting")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/P_JF0YxXo2u.I8RG_E4cXs1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFor04ACgkQAVBC80lX
0GxdFQgAgryV5L20c3Mq6mOj9qLZhHhW7i+wDIFtiiWy7oPMvzWlT3oawP1gPw+c
w4G7wOmXdw1aDEs+9su4oUka5SIwuApIBg4wrft0WfFZWUkwglXq6IpR9YdQPbUn
/aGc60zsutiKVgbRI7lTvxQzthiVorI/bwrbpH43oW3ehRvtjV7PkCvo6ZU1c8XZ
h8tLUkDAquG8fxg3ClhxjDLr5v7dYoRbJqZWzEsriV/tJRPLtHhU5wLBTUUz+juD
qVdRC/M5+a08zt0IRTTaM+J+AIGA9euvg59SMHNlbC2EViQ3IS9kou8Z3DOkzQn1
Hlm9QsPxCTI9A68C/W365oUnlnXS4g==
=gelo
-----END PGP SIGNATURE-----

--Sig_/P_JF0YxXo2u.I8RG_E4cXs1--
