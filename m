Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 256F33CF56C
	for <lists+linux-next@lfdr.de>; Tue, 20 Jul 2021 09:43:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229916AbhGTHC0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 20 Jul 2021 03:02:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229474AbhGTHC0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 20 Jul 2021 03:02:26 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9358EC061574;
        Tue, 20 Jul 2021 00:43:03 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GTW0P26vKz9sWc;
        Tue, 20 Jul 2021 17:43:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1626766981;
        bh=RARWhf4ZSC9Ozj2pfaOCwQxkKa6Ef3tlMfhU3u45YXI=;
        h=Date:From:To:Cc:Subject:From;
        b=ajccTfbj270wN/LvDm9nOoxhx/BiVC+W/VrXu8k3clJ4LFSf9x7fIh2WW8dfzWK3o
         um598G2IydAgACKlis0daF1Cqp8yOGgY+cfgW2iowOqaeQbb/Xv/QQY2mJYBjjSVid
         xzb+DSLJ6ZkMN9DP8o3leYOBr+mJjs/H6DVYdVSwGo92peAgM4cHqWsc5kWfN5YBVY
         vaNaZGV5FWd9AGTf2RdVEis1VUJLFZPqlehIFDw3zfv5JF2MXnd5rsB4zoTBh9PNv6
         yVagvIMnLnmu9foVDMDVqOYf6SY7xcky6WlhwnDSFbJHNTqnHCebvJm9Ocg/StCZoP
         vs59ny/Xpu5bA==
Date:   Tue, 20 Jul 2021 17:43:00 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Petr Mladek <pmladek@suse.com>
Cc:     Chris Down <chris@chrisdown.name>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the printk tree
Message-ID: <20210720174300.018cc765@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Q9NH0PMKN_+ylwuh.IrZz_/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Q9NH0PMKN_+ylwuh.IrZz_/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the printk tree, today's linux-next build (mips allnoconfig)
failed like this:

arch/mips/kernel/genex.o: In function `handle_mcheck_int':
(.text+0x190c): undefined reference to `printk'
arch/mips/kernel/genex.o: In function `handle_reserved_int':
(.text+0x1c8c): undefined reference to `printk'

Caused by commit

  337015573718 ("printk: Userspace format indexing support")

--=20
Cheers,
Stephen Rothwell

--Sig_/Q9NH0PMKN_+ylwuh.IrZz_/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmD2foQACgkQAVBC80lX
0GxZtwf/ZkCzAnHskULSEWdY6zbqljC9E2zDFGGLhLxbLbkYS7hOwLqvZBSQlqdy
AkZpj2uKHYJd411rROEXc6MnCj8xh0uTvj4Vmkr9NY1lijByi2mZ1U4SXXlnljUz
HOb71p8nKKCU6jY2mhsaPecj/GF8ybvzuPq/5TtH3j3V+plqL580uwME38cAzC99
Q2zo/T7eGdBk4qwy4YPORJRBrH0ieEHDrtjyuHnusy4KXu5vXPDzGZdIl9XeL0qa
GkOAapMj8ZLx1p1is9iCRYnZ8TJhqdGuFswM6tU9neLPVveXg6E/BG4BvhYlU7BA
A/o4LS2+0NTLFguJSJREpQJ1k8FyPQ==
=QZ9x
-----END PGP SIGNATURE-----

--Sig_/Q9NH0PMKN_+ylwuh.IrZz_/--
