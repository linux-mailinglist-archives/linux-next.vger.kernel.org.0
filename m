Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 260292BC4C7
	for <lists+linux-next@lfdr.de>; Sun, 22 Nov 2020 10:55:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727334AbgKVJzb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 22 Nov 2020 04:55:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727330AbgKVJza (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 22 Nov 2020 04:55:30 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4769EC0613CF;
        Sun, 22 Nov 2020 01:55:30 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cf5Hy1wK7z9s1l;
        Sun, 22 Nov 2020 20:55:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606038926;
        bh=EpRtrEwHzliXmZ4bskXozwvzFnxRaMA90Iv/s3DePSo=;
        h=Date:From:To:Cc:Subject:From;
        b=ECEZ/ywYeMB7cnnkll6WntxiJCrfAWGWz+GBmyaocOXyk7Zircfy21rKwwiu9x+qg
         zJILvAtJcf/S721bpnwitjdB76U/GMrxLQ+c6FULH4Edvgsa0jOKMgPrf2OldJ+IFi
         BSTFqax5yESQRalcE3VDkyr0o/NKLUfz3QcN8dnjKUCZU7zFkEVQaDhsDvG4yepTke
         a9cp3Eazstk+JbC12a9+eT8dyVbnnxrvezr1q8VsCeV3l8qaNc5t9sPBM1wcJpOKbv
         KpRNMiVdR4jcvpOCldKUSh4iyTJ+pbTSPHVyOJzC59O4f7uiR3Ule9Wsg0NZv4GF9f
         2TPYTwI41UzaA==
Date:   Sun, 22 Nov 2020 20:55:25 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Bjorn Helgaas <bhelgaas@google.com>
Cc:     Colin Ian King <colin.king@canonical.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the pci tree
Message-ID: <20201122205525.1219bfaf@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4ydlTt1gfWl=cORexYH+jtc";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/4ydlTt1gfWl=cORexYH+jtc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  466d79c1a470 ("PCI: Fix overflow in command-line resource alignment reque=
sts")

Fixes tag

  Fixes: 32a9a682bef2 ("PCI: allow assignment of memory resources with a

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not split Fixes tags over more than one line.

--=20
Cheers,
Stephen Rothwell

--Sig_/4ydlTt1gfWl=cORexYH+jtc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+6NY0ACgkQAVBC80lX
0GxI0wf9EUDMk7swOT0a0Phwh3VlcdXYR18sW9mG2lO7yMfMXt1VUha+n3IXEMcr
Nqli3+R0YT8jkt9hEVU99yAlkOdohQdWqWmXHJry2hOKHtYiVek5jdepqJJUvCAq
ecWUzHf1wT0PK3H0k0rYTN8ux1T/nIJBWDsDqeEjKnQtHDK+Naz0QOqdpZQrYCSZ
QF/bNexinHZvbssuQbXUYXRDOQkdwY5a/W694mGeVhJFokb+VdG5+8Uz7ZlPHaQF
WVTTxtzklRoUy6tG7/1m9wRvWeNRx1uevYHmiYV9ZUsrIWKkl6JgwojpsWckQ9hr
5xNVRMpFjat7P+FTDdLDo26JlQRMbQ==
=JMk3
-----END PGP SIGNATURE-----

--Sig_/4ydlTt1gfWl=cORexYH+jtc--
