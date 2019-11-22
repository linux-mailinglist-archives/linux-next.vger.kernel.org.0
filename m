Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F826105D82
	for <lists+linux-next@lfdr.de>; Fri, 22 Nov 2019 01:07:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726362AbfKVAHc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 Nov 2019 19:07:32 -0500
Received: from ozlabs.org ([203.11.71.1]:54319 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726038AbfKVAHc (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 21 Nov 2019 19:07:32 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47JxZT2NMmz9sPT;
        Fri, 22 Nov 2019 11:07:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1574381249;
        bh=+Q23UOxI0xuUC+pc88ITU9qv6sl8Q6tM19Ex8pgLKq8=;
        h=Date:From:To:Cc:Subject:From;
        b=OYINSOs5hT/PaK+Cic/lgcFeYAqyvXfm3v9/y76RnaiaynhNCb+0SGrTFcRq4QvPP
         Xz5Od39hKwTsXbIAHNpSMwq/rGGP9YL0MjhonAOPdye9SGRjNf1Ac/SNTszTwqfx+7
         mHaxYLFzNVGdwQ30wc2/HyZqUmET7JxwN1oGxRhIqdzyI2A37Eg/NRVYzAQPzlRNej
         tcDW4dR3o3z7vTsFXkzEUclekJgkj+znpk9+ZjgCVF0epUue7uJmbVxi+EqOwMqAZv
         hkU+CDr8UBfx0norqz7OI8xLf33tmGCHWf2dDUK2OVA2tbvSR5IebQUeiWdhia2qDo
         0FlJwzlCTWHnA==
Date:   Fri, 22 Nov 2019 11:07:11 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build warning after merge of the bluetooth tree
Message-ID: <20191122110711.3e894cc6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QX8d/X.PSDGU/eDy_wN+Bsb";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/QX8d/X.PSDGU/eDy_wN+Bsb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the bluetooth tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

net/bluetooth/hci_core.c: In function 'hci_dev_do_open':
net/bluetooth/hci_core.c:1447:8: warning: 'invalid_bdaddr' may be used unin=
itialized in this function [-Wmaybe-uninitialized]
 1447 |   bool invalid_bdaddr;
      |        ^~~~~~~~~~~~~~

Introduced by commit

  cadbc2f459be ("Bluetooth: Move error check into the right if-clause")

--=20
Cheers,
Stephen Rothwell

--Sig_/QX8d/X.PSDGU/eDy_wN+Bsb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3XJq8ACgkQAVBC80lX
0GwWxggAmaqJAvo2iVtdkyCxAqQeEF2IrMuc+hwQW+NDRIRrvQJj6dEBiGOU50tU
yl2RVKxNdkQ3JDs6pY904taWykj2TSeMkJGEJG3tRmcsvcfFoR/toZ4v5S+aH7oz
iZOUbtH82E0TBEVwLb+CSksUhpU7Cw4Kx0ZEExbqGFpBGpBqFDUwYqTl08TrVGwV
GGi0bQZqlxTo3vWMz/yG5ro1pZQ1NpSl7PoqPppEX37r4cmL+Ag479TiqubJf2xS
ALQGxlFqonLOr3vH0F24tEo5D2WgBbMREz94OeLqCTfnWQhqJaQweZq73878Qu/1
9JIXz1iJpEZyAhFbbWWjhJHysj6pRA==
=fcrP
-----END PGP SIGNATURE-----

--Sig_/QX8d/X.PSDGU/eDy_wN+Bsb--
