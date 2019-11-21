Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B916105B15
	for <lists+linux-next@lfdr.de>; Thu, 21 Nov 2019 21:23:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726747AbfKUUXL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 Nov 2019 15:23:11 -0500
Received: from ozlabs.org ([203.11.71.1]:51153 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726379AbfKUUXL (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 21 Nov 2019 15:23:11 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47Jrbd1jZ9z9sPn;
        Fri, 22 Nov 2019 07:23:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1574367789;
        bh=eqDK1WhxlojWXmAMDyuf2xSNfzj80Bb6879dgkPYv9g=;
        h=Date:From:To:Cc:Subject:From;
        b=JgLrQ3br4sWAQYIYfbT2y6E8nXoORGR8SWubdIALpZoKp4cjRT/QPWE2jAdxQ06gk
         D4t5GfL7LUOwan+OplMjeqJuuErobVy3IfnXGKGXvmBeX8C9rWBGqu9w7IRKzF8yhU
         Ts3KMMsAkpE1K9p3eD/Mq9AVLKQ1BZhr3RNOWUrrEEG/ir1vteI2T8KsYXdYPjyFrw
         Yc7Q6O2V2B/RnNQGj5NxG4bsmYVCsIN54yvapeXTJguKgmbWYFOaSrKvR3aRY87aWy
         5k3UTj1PZgXpwYJiZGavhAP4D4FrItWXYvZmYyNLJfjucf/7m0kQEg2YD/K+kbMqsT
         tGivUh5FFU29w==
Date:   Fri, 22 Nov 2019 07:23:07 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commits in the afs tree
Message-ID: <20191122072307.000b6492@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IyKTBIMpdB/+bATquc/AKu5";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/IyKTBIMpdB/+bATquc/AKu5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  297c6f6378a6 ("afs: Remove set but not used variable 'ret'")
  b264b5bc97c2 ("afs: Remove set but not used variables 'before', 'after'")
  b850554983e6 ("afs: xattr: use scnprintf")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/IyKTBIMpdB/+bATquc/AKu5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3W8isACgkQAVBC80lX
0GwPIgf/bGACcpuDrS+ma871O3pgUeoKx+70sozkYnJI5kjZzVsnB3EG8aRJ//Xm
PZeXkgfYLJvOgGM5yaVP/4wRy/uobqwD14+d1nt/jxM8gy3Fs6dAqGxAOdFtghOE
7ARyaYZ3jP5usoq+bxraqUFMKX2Gv4DPlLqGd9oX6PNHJH2IU74Wl9P6Xe56aaYU
NcUkGmufawUHX+jgdpVKus0wwRdweJDftM96k2LBR50qtI3bNV9kIZ/g7ez9Zn0+
L45R4sCpBvwRSKGYyfrtlYW3bsTzGAawaZXjbJhZDrQge830AMyCsTE5r1pCqHTw
HURqnfcbwJKbgzUzRYzy34C0kJBiCw==
=cWOi
-----END PGP SIGNATURE-----

--Sig_/IyKTBIMpdB/+bATquc/AKu5--
