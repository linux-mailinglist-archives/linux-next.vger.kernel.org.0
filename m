Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0521A302227
	for <lists+linux-next@lfdr.de>; Mon, 25 Jan 2021 07:35:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727173AbhAYGcm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 Jan 2021 01:32:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726714AbhAYGcF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 25 Jan 2021 01:32:05 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC339C061573;
        Sun, 24 Jan 2021 22:31:24 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DPKkx21W9z9s24;
        Mon, 25 Jan 2021 17:31:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611556281;
        bh=tpU/E/0bVPrr7Tn36QNdlHcCQh3nwC+ZZpOR9eeH2yU=;
        h=Date:From:To:Cc:Subject:From;
        b=S+Qmv9Tx697as9kIS4VhDPszfPczI4eE1WaiDKtn1t9hJ6DBy+XDQFSrigUyjLn6v
         5KoCB5YheIkm088k0meUordYn9utm0FllPWA4CfM2L0ioyRoIdXR0BRXRxJBtD32RS
         g5FOtu2ro/J4RNDrpGVD3CBkDOCKtaC0bQfMUazX5Zs8jfyd4/xIOY0/YVFfDqFbtI
         WjnwTjh3GlDWZALuiqJv99sB9v3WVm2/aZ3rXKLbovL0mRAr+5UKXj+1UHgF9U15x6
         o/KeXOkgUisWYmHe7F4V67oqQBEYf4yL83rV7CxvEMLXYIky0LUkC1FupFpfrS5REI
         r6Yd3Rp3H9+rA==
Date:   Mon, 25 Jan 2021 17:31:20 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christian Brauner <christian@brauner.io>
Cc:     Christian Brauner <christian.brauner@ubuntu.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mimi Zohar <zohar@linux.ibm.com>,
        Tushar Sugandhi <tusharsu@linux.microsoft.com>
Subject: linux-next: manual merge of the pidfd tree with the integrity tree
Message-ID: <20210125173120.28b94105@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QcBChY=cbjHOgxvRZNyQHnO";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/QcBChY=cbjHOgxvRZNyQHnO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

FIXME: Add owner of second tree to To:
       Add author(s)/SOB of conflicting commits.

Today's linux-next merge of the pidfd tree got a conflict in:

  security/integrity/ima/ima_main.c

between commits:

  2b4a2474a202 ("IMA: generalize keyring specific measurement constructs")
  291af651b350 ("IMA: add support to measure buffer data hash")
  d6e645012d97 ("IMA: define a hook to measure kernel integrity critical da=
ta")
  9f5d7d23cc5e ("IMA: extend critical data hook to limit the measurement ba=
sed on a label")

from the integrity tree and commit:

  a2d2329e30e2 ("ima: handle idmapped mounts")

from the pidfd tree.

At this point, the whole thing just got too hard, so I dropped the
pidfd tree for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/QcBChY=cbjHOgxvRZNyQHnO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAOZbgACgkQAVBC80lX
0Gy/hgf/fbVkmln8clINAm+zrAUGJXLd7QWN5xBjmSEiZLBGd+ZCMhzwzEtdfZf9
FQ6l59Bp9iJYNOqNhPxdlRaS9oGARECHPpIuNqTvO+/ZI2OhCsntHhVWaASJeY9W
WxnoE39oyuaOWAyL5Lvj8NOfeD6oFN5utPo6KyrpVhCtHY7SrZcUU1fYVNW5wBBe
D2zdz5PtpilxeeazDfzUyh6t6tQWw/sZrteu6fJKaWG7wIqNR5zRz9Q07krLi5M/
OBOW8M/sKr+vA0zHiSIHdF4hSnW6Q7A4E/nkQ2wOfOOvadGTcDBg0fNrBO97D1NS
WbCFKkGf+pa8s1qbX0S0LoRovbxd7g==
=UC5o
-----END PGP SIGNATURE-----

--Sig_/QcBChY=cbjHOgxvRZNyQHnO--
