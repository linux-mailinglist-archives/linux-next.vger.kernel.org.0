Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA5A7451B9C
	for <lists+linux-next@lfdr.de>; Tue, 16 Nov 2021 01:01:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353418AbhKPAEm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 15 Nov 2021 19:04:42 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:50633 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356338AbhKOXyK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 15 Nov 2021 18:54:10 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HtQv53J26z4xdy;
        Tue, 16 Nov 2021 10:51:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1637020273;
        bh=6Y11D4Irq+jbCU/jwtzY6gL8oN6H9035v/H0R2XbNEU=;
        h=Date:From:To:Cc:Subject:From;
        b=EDiGx2ESK2D0K2WvhDk/XFOfDvjrRStMeRcMybYk31TkzsR1C/OWuEnPzRFbBlC43
         uqq9eSxlPlXluvblRCTIrMVF5DgwVNDCB3k2xhrTSdleiToArJ9cxE4KlFjX3QOuXu
         rB84wiNA5nK4ign7DMYYoxux02uvm14Vmm7qVHp9fpnR1DT/x6R9v7aSakP5WibIGi
         tQ4lOGOeQzkq+0nW1M0c99jt4RO8suAyOj8B7LFYqkFSPeW8Ss5GXgmx7zuOPnSamW
         YOoPBmDkAagb70F9jIg07Q1xWt4/tAQQhmPfetdAqSwdtKPNcSoKEJhmbO+ZjOCyMs
         pb3Va4VHchqUw==
Date:   Tue, 16 Nov 2021 10:51:12 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Rob Herring <robh@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the gpio-brgl tree
Message-ID: <20211116105112.4c99853d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ogrY40bNL.FTQdzLIfsSAR8";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ogrY40bNL.FTQdzLIfsSAR8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the gpio-brgl tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpio/gpio-xlp.c:300:16: error: 'GPIO_VARIANT_VULCAN' undeclared her=
e (not in a function)
  300 |  { "BRCM9006", GPIO_VARIANT_VULCAN },
      |                ^~~~~~~~~~~~~~~~~~~

Caused by commit

  ea708ac5bf41 ("gpio: xlp: Remove Netlogic XLP variants")

I have used the gpio-bgrl tree from next-20211115 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/ogrY40bNL.FTQdzLIfsSAR8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGS8nAACgkQAVBC80lX
0GyBTgf9G1FBwzr4oroOiNalzv5fyzSlaVLCC6xJHjN85FDLVzo6Ia/dpIuhu2FZ
U2ewnRhGudGlsjFtvS78AQXHKP9bufga9rlxkF1wI68cofdgMqTTVd1MBHsQS7ez
0xX3U9BIikxAd11Ml41sdUXqQIH0sT99ZBOS8ASiWaMRteZ83hd4IpmwcVBonpWN
SfLcdAhEj0Nu/p0zL0eLSD6ovt3/znRDRe5LDMjZvc0BL7sk7sVpxO4HwA0hcWa3
jgtlWKKeVURQKFh327UozpCgz65XTue7IDloWMKAcQYlKReCMYKz6Ej6XytSeglX
iGr3DteGJwpNuEJxQr4P4yVkFJBFwA==
=aCG0
-----END PGP SIGNATURE-----

--Sig_/ogrY40bNL.FTQdzLIfsSAR8--
