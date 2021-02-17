Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF4ED31D4C3
	for <lists+linux-next@lfdr.de>; Wed, 17 Feb 2021 06:08:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229468AbhBQFID (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 Feb 2021 00:08:03 -0500
Received: from ozlabs.org ([203.11.71.1]:32839 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229459AbhBQFIC (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 17 Feb 2021 00:08:02 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DgQnH429jz9sBy;
        Wed, 17 Feb 2021 16:07:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1613538439;
        bh=HQjL0w5hzGU39nX6zl1CFqYXPyGjIVpcJad29S9dcOw=;
        h=Date:From:To:Cc:Subject:From;
        b=eV3NInWOGLnX7DXzMu5rkNfkptXhUgMiZUaU9SXvesRtAuZmRvsJWLLNIFYj4S4mQ
         q5SzGVjfZFMuVH2BAPG6x2Zh1n1E5IWXJUDO6AZ49JtRD1Tu9etTvsKmXfgIT2J8K6
         IloQGrUtLN1B2GWhzBVDGRp8epazvN9p2EWkhIAsda94h6I6IICkP9CQxwculcan9H
         juIbkyRq+6N7RSwKGtB8MhKiEyi64wdOGF1twyLe6C6VfC3rq7Qvec5g/Y8j8TKDml
         HB04FPRxjwejEL6GPne58REkuQSOiwqEQr5N9OLogaDVM/Io+rgCoCwjrCQCFtDZAx
         bBjTwa/bjTteQ==
Date:   Wed, 17 Feb 2021 16:07:14 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Borislav Petkov <bp@suse.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: linux-next: manual merge of the tip tree with the pm tree
Message-ID: <20210217160714.7c1fcaac@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wKSUvSh6GRuIdKDk0BS3huY";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/wKSUvSh6GRuIdKDk0BS3huY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/x86/platform/intel-mid/device_libs/platform_bt.c

between commit:

  4590d98f5a4f ("sfi: Remove framework for deprecated firmware")

from the pm tree and commit:

  bdb154f074a6 ("x86/platform/intel-mid: Convert comma to semicolon")

from the tip tree.

I fixed it up (the former removed the file, so I did that) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/wKSUvSh6GRuIdKDk0BS3huY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAspIIACgkQAVBC80lX
0Gy8+gf6Au1D5ZF9dOgQcwyGjpaEhmEEgtKbzzQapBnAAbP9D2CXn8AO39JM43EX
VyzAOJzjA//Xg9aClM1l1ibYf+ebHYmAkzZuP2zJve0DHOJ6HHEC3ivgrWHyrBYO
8SlkvNGmySBHtTF8bgI5GPG1//ODR75PS92/2cw2brb/7/5zlI7MdJAvBB7nz3vx
kkWqD/umK7v+u4F/L+XSx7jXpCPlUGIvFgd/3fIzjzDZGnwigPLBELNAfvb93SHQ
Tgri3ckmOZvamhl5F/oBfXJFUq/hiy8HQRwInHYXIWlXCjYkD7mM64uuKyiwQqX7
zg5glPL+okSXhzS6afh4Eb3aG/ZWew==
=o5t4
-----END PGP SIGNATURE-----

--Sig_/wKSUvSh6GRuIdKDk0BS3huY--
