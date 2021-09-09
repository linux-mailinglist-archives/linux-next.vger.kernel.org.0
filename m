Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CCA04046F7
	for <lists+linux-next@lfdr.de>; Thu,  9 Sep 2021 10:25:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230509AbhIII0p (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 9 Sep 2021 04:26:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230157AbhIII0l (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 9 Sep 2021 04:26:41 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4CEDC061575;
        Thu,  9 Sep 2021 01:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1631175928;
        bh=Zt/5HJcbMjfzJ8UOuZ5H+C1N/XFPNnqVufnRZTc8a+w=;
        h=Date:From:To:Cc:Subject:From;
        b=XT0azpN+P95LD7/9bFgbkCwNWAx1hPXlvGyg+K3pxc6wUwDBF6mR1QX5xefTiNSN1
         e9ZD/z3B1MnFe/bNf/vdIYUlBdnfQUR1KBhzYfkrhH+F1SLjA6gXVgB7wZChqyeCrZ
         oXBAPEEGqiNOycdWA9l8GiBBVhE0m6FaDLKQMEbt/DGRBxkWO017B5seLgxb9+zl0Z
         5X6wuhCyffh2jIK1tBkySqSsNJZFPhfYHCSpUuxqrG62bBpgF1SDnoP/XR/kybSqHO
         KusKQVQ5j0CWQEjYQGm52xfxRwibT9XgZbdRfvWdYHoXHi/fgHiUSPxBAn99JEF7xq
         AEOjzzDYJx7Ow==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4H4sWq1gW6z9sW8;
        Thu,  9 Sep 2021 18:25:27 +1000 (AEST)
Date:   Thu, 9 Sep 2021 18:25:25 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Baokun Li <libaokun1@huawei.com>
Cc:     Jens Axboe <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure while building Linus' tree
Message-ID: <20210909182525.372ee687@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BLIJePllvi91nSzSqX.USXA";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/BLIJePllvi91nSzSqX.USXA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Building Linus' tree, today's linux-next build (powerpc
ppc6xx_defconfig gcc4.9) failed like this:

ERROR: modpost: "__divdi3" [drivers/block/nbd.ko] undefined!

Caused by commit

  fad7cd3310db ("nbd: add the check to prevent overflow in __nbd_ioctl()")

The added check_mul_overflow() call is being passed 64 bit values.
COMPILER_HAS_GENERIC_BUILTIN_OVERFLOW is not set for this build (see
include/linux/overflow.h).

--=20
Cheers,
Stephen Rothwell

--Sig_/BLIJePllvi91nSzSqX.USXA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmE5xPUACgkQAVBC80lX
0Gxvywf9FsxUItfWEq1jYlLnD8X1+LGOxJ3f+yuu8TKNLLJONaoeLdgBV3lxkq7K
Y8tJiitM2Q34SAevWKQ1+/v7Vaqrirxz7V1Hm7hrxQru11E4YxYT+BTbGF/ZbD9f
VatSJhOttfxsemEnW+M/8JuJ85K53mrCy0u3SK91/TZJxitZCBqMa0AtalhT/F5C
KT86wCo6OItGmhOjib0pSfI4tf+NZKVM92A2bKN9C6symTWFzBGFMapLGWSQEDvJ
D+8XT/qMx1UA+Tvn0gHWvzDtS57xpauT22CC0CmOwzMM9rkMhcPpR1AnsvsM6VbG
VqChQ7EMs/MzsS6haYzVXFFZqC9/LA==
=CDUb
-----END PGP SIGNATURE-----

--Sig_/BLIJePllvi91nSzSqX.USXA--
