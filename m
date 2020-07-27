Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB6DD22EC65
	for <lists+linux-next@lfdr.de>; Mon, 27 Jul 2020 14:43:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728358AbgG0Mnq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 27 Jul 2020 08:43:46 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:44103 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728173AbgG0Mnq (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 27 Jul 2020 08:43:46 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BFfcc29jVz9sPB;
        Mon, 27 Jul 2020 22:43:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1595853824;
        bh=Bq0/bjaNwroxMJoPXYiAeqay9NJtRS61vlcInRNB8es=;
        h=Date:From:To:Cc:Subject:From;
        b=epo5gD64C643FZK05YBmqmdqECu0cpCLpBmYuXTrNPEDzgdUr/fJKIAr3PvxFhUSY
         3R11gojVu4WpOXTwkr2ylPk072QprN4SjpSGSlm/qAr04OAEzvZaVoN4xKBR9BcJmM
         WXOssjLG/KLfchTZyvHww2x1wkHW6tyIzOb+4/Je8vOguTxm5GzGIUyQ3nM/fqDL6E
         xed5/bCMtlM/+vHgbvBX3HAXtNdtk/KC1eP0uRVigP4b2KRrfxr15a01K9ScUZ6i13
         pDG/KwX0XpHjENgXgV8EC8YYDumvwIl4K0PmtdK/bNTU6XJk9A7NvUguDroba76xMC
         E/Q9ZRMSxTW9A==
Date:   Mon, 27 Jul 2020 22:43:43 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: problem in the fsinfo tree
Message-ID: <20200727224343.5f86c3c8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5lY93W3f7zp8S26LvyCsTp=";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/5lY93W3f7zp8S26LvyCsTp=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In rebasing commit

  348b039216fb ("fsinfo: Add fsinfo() syscall to query filesystem informati=
on")

you forgot to update

arch/arm64/include/asm/unistd.h
include/uapi/asm-generic/unistd.h=20

--=20
Cheers,
Stephen Rothwell

--Sig_/5lY93W3f7zp8S26LvyCsTp=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8ey/8ACgkQAVBC80lX
0Gxfagf+MlwSI+umfygrGiFU74cKs1F80agLui7StDQ7wrvTTjXhxutWFN+fn4v2
+Dp7kDyPBfJ748hfEjZ7xGmZi+KwqHF6uVpQNzrL8saL/KaTWWslQ0Mk8V0sxCdC
cIEZfcrH5WP3a1KjN4xgz2YM0s2EmPhojbxhbGGa7e2MuNeHR390hMiRE7BYsTPD
jh2oHMxProvD8tesTDBNPNSpM5Ui3TMtBu/lWCaJXf2DK+HSEHMS7Fns0h9WBMiI
aMM+VIpDxCpZaUvqYLYB3NlExoqhiVCreOYLfjFtDqR2L0Bo/S50l8WohDipSo3M
Snve8r0PwNdpZo36d8cLSdE+ZUE/NA==
=333+
-----END PGP SIGNATURE-----

--Sig_/5lY93W3f7zp8S26LvyCsTp=--
