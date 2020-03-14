Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54A2418587C
	for <lists+linux-next@lfdr.de>; Sun, 15 Mar 2020 03:12:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727146AbgCOCMj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 14 Mar 2020 22:12:39 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:43145 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726699AbgCOCMj (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 14 Mar 2020 22:12:39 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48ffYJ3vJbz9sQt;
        Sat, 14 Mar 2020 21:53:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1584183188;
        bh=QlsV1HCQHbY2WWpViGPYwW68TQzmVIwuJv9pVD10PaY=;
        h=Date:From:To:Cc:Subject:From;
        b=H4QRWvnSum976mvXURkExDaUS4gbZ8dRNH1uYSsmutv48nSHcRHjL7YfSXYZB58il
         8zOuD1LA4ehxigqlIsKod/l0oc5HHvqeohtctjXz9uIkyGt0sC56PXlZeGTIngMbva
         pZnYZYtaCacFKqz+jAA0vfjY7sl2vU6+X0zBOYz4OHYxXbjUX2ZF33dzD+9/7wuNMq
         3e/PD0iTzSMz+lo0BTpH4ZEqKvUhvceL/OsYTGuwiJMxaZVK1pLyJbOq/1QVDxYggG
         kO6nXIcqoLkY+bLNPrTn/mtlf++HQI5kwUkdXZsQBg1YlU6RqpFFCi3Qd1SudcsAIt
         u42S8MHjCCRYQ==
Date:   Sat, 14 Mar 2020 21:53:07 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stefan Berger <stefanb@linux.ibm.com>
Subject: linux-next: Fixes tag needs some work in the tpmdd tree
Message-ID: <20200314215307.1c5f4a45@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ym6Mtc=/vK3Tn2cnkGWPAft";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ym6Mtc=/vK3Tn2cnkGWPAft
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  606c8d992ba5 ("tpm: ibmvtpm: Wait for buffer to be set before proceeding")

Fixes tag

  Fixes: 132f76294744 ("Add new device driver to support IBM vTPM")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

--=20
Cheers,
Stephen Rothwell

--Sig_/ym6Mtc=/vK3Tn2cnkGWPAft
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5st5MACgkQAVBC80lX
0GyY9QgAjO4PWGuZ2aLFTbw648wqk5zUUAAjur26F03CJfsf/vB4M9OML78aCoxM
OZ6SqJQ4k5b4GNtHheUGFgjHf+NkS3OWhOJ2bt9E/tyrXwH4zWVbqub4nDtEaMgv
2xmXzLde3m9ieDf/RAnWA86bXEfjkYnFcDGZmQ97t2EWJXX7Oem+7Xgk/yBFVORV
Pf9ZXaA3RJdwLc/xjEPWu/gpT+fzQB2xwA0uvtGeUhvceICE3No1KfWJ4bYF36eC
AmpInnYUConGn16W+mL3pdyc44xQ5b7Z80esNM9c7ixub496kqdJrlVHGOi+wXR3
7pOiNJO8Q+y5sPcNtVt7H8RyuPA0tQ==
=6CG+
-----END PGP SIGNATURE-----

--Sig_/ym6Mtc=/vK3Tn2cnkGWPAft--
