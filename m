Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58729286966
	for <lists+linux-next@lfdr.de>; Wed,  7 Oct 2020 22:53:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727424AbgJGUxD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Oct 2020 16:53:03 -0400
Received: from ozlabs.org ([203.11.71.1]:57155 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726013AbgJGUxD (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 7 Oct 2020 16:53:03 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C663x0k8Jz9sSf;
        Thu,  8 Oct 2020 07:53:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1602103981;
        bh=6On4I/lPQImdHo2JDVbFdEInIVX2xUyLpHkwtMClg/I=;
        h=Date:From:To:Cc:Subject:From;
        b=vFWXRighcPC3w6R90VdXugAczl6KKNmhEuBwRNEe0BRNjirmgVCEZZp2vkBYVN19K
         fbsleaxqZrGEgVkkt9mifwQpzoiNjSGWHVRVJ0Do9sExWUAjyAwS8lQr4l53oMTIzv
         LXmykfwGr6eG46KcLOa73MpW61jFCoyOMpLogbMDdGXnSwMXeiy9duvTMUzJHt0Xea
         B3nz/kCGD4h1k/yL6PhHaytmb2+N53MUBvr7f6/m2oSbhti4jvIslifJigeYaOUJMm
         QavccieupVYYDZ0XUybdX6G0yugkh7l9WAB5mwc/rn9SZUh8V2gy87IGw133pOV7sw
         cOe51LdCV9oOg==
Date:   Thu, 8 Oct 2020 07:52:59 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the gpio tree
Message-ID: <20201008075259.3523669c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wFuAdb4w9bIXluHEu8aLUk4";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/wFuAdb4w9bIXluHEu8aLUk4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  62ba77749ead ("docs: gpio: add a new document to its index.rst")

Fixes tag

  Fixes: fd1abe99e5fb ("Documentation: gpio: add documentation for gpio-moc=
kup")

has these problem(s):

  - Target SHA1 does not exist

Maybe you ment

Fixes: 2fd1abe99e5f ("Documentation: gpio: add documentation for gpio-mocku=
p")

--=20
Cheers,
Stephen Rothwell

--Sig_/wFuAdb4w9bIXluHEu8aLUk4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9+KqsACgkQAVBC80lX
0GyRAQf+LqNLB4tb5lYsmKjVAZM0leW1t++XeZbNp62kIuFl+vQekm6COUhdBhHO
jHrIoTEN+kVCKR7HbdFJyPBRUAsEL5RQOFo1Vh7V8csBZT8B5IbzGjjgaTJhr548
NNZ10uwZrhMaaPSR2ZXk14Ls1+oTK/rj6e91N7zxCG/Lcff7mqiMgmutP5FeJ6UQ
qWkho3ABUTWutBd9QVXD646FWPDmvSER1WSiRpsOnhe49zvX4lPK1Qt5plIh9GeY
jyxkJOIDJPEpezHW0wfB9hYHodvVIf6jLsjGJQSya4Xj2o24o0K7mlgEFsGItC6v
rxlHPxr7uT4/EVtM8GzKJPjLiFcS8w==
=pS6W
-----END PGP SIGNATURE-----

--Sig_/wFuAdb4w9bIXluHEu8aLUk4--
