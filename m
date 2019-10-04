Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85D73CB449
	for <lists+linux-next@lfdr.de>; Fri,  4 Oct 2019 08:05:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387469AbfJDGFR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 4 Oct 2019 02:05:17 -0400
Received: from ozlabs.org ([203.11.71.1]:42195 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387400AbfJDGFR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 4 Oct 2019 02:05:17 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46kzqt3bgnz9sPd;
        Fri,  4 Oct 2019 16:05:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1570169114;
        bh=4ui5xXSt5eQ9TSSNBby49DUJgGjmdOOn/B8Paq5IUyg=;
        h=Date:From:To:Cc:Subject:From;
        b=TuticPeGUFBR71LE62GvmjIbMmMHkeabJIKRCJNPfgcwFVqr+9k808PLuGcJq5edA
         Wj12HcQ/l5fxdLBARp9fq2P2SHj+89pfD990RvXIFWL/MzKy8FRPSRC02IWATOGvKA
         FSJJzpfx8QchgsFYVAnMHpOhybBeUDmGl/OghKpZH0IpgErI6JvskfzrJ2o0JkKMMj
         3Z/lDKR1GEi8HsNY0dL0YaASPFZG1vw5yEJ/si/inLef9R+t+Zn3wV4vT3NAoagowM
         6uVGOg2ZBFs7EYl5CjEqnX6uzfebeQbFc5BTXhfME+XPAHejA/ak76cy/RUhBUpNaZ
         ULR2whFLHSRHg==
Date:   Fri, 4 Oct 2019 16:05:14 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the kbuild-current tree
Message-ID: <20191004160514.238bb6a8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NE.F9aB6u1Kpfps/fIlYccR";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/NE.F9aB6u1Kpfps/fIlYccR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  b2b94fe85175 ("scripts/setlocalversion: clear local variable to make it w=
ork for sh")

Fixes tag

  Fixes: commit 858805b336be ("kbuild: add $(BASH) to run scripts with bash=
-extension")

has these problem(s):

  - leading word 'commit' unexpected

--=20
Cheers,
Stephen Rothwell

--Sig_/NE.F9aB6u1Kpfps/fIlYccR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2W4RoACgkQAVBC80lX
0GwtRgf+OLGfAxmC/239K+AngPkF92IRb9eO5lVUdB9OoF7UNJbqgI0h/d6yrNZb
whPHy1GfN0Hewbku9I63vxpCQB4CC0AwF6+Y2iqx++J81DvgZ37CDN64FIbBof0K
zracPyz+bUejv/y4LdEx3f+Aon6U0CZHvKQXQuNaZaX6VlxCiOYktK33Ijdge/Ds
Ua8f3mlvcLpMvHckFIVyd24YrqPUdrGiRGFQTKDiheQi3SryII/GfTd2xOGPNOtU
27RjMnMNBNr2eyxBPLGwb/rtMM8EiHMLRYy8yGa5SopX8pWtvLc1V+0wjzxN+e3k
fYjPJVnlt5h3CQsezP+BKJK9a4qgZw==
=2PPL
-----END PGP SIGNATURE-----

--Sig_/NE.F9aB6u1Kpfps/fIlYccR--
