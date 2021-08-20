Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 685393F26B7
	for <lists+linux-next@lfdr.de>; Fri, 20 Aug 2021 08:14:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238170AbhHTGP1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 20 Aug 2021 02:15:27 -0400
Received: from ozlabs.org ([203.11.71.1]:54367 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232732AbhHTGP1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 20 Aug 2021 02:15:27 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GrWZH5VLnz9sWd;
        Fri, 20 Aug 2021 16:14:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1629440088;
        bh=kroY2SxltUzZNq48k2nx9z2Bimo2DPHva9IOqY7qNeo=;
        h=Date:From:To:Cc:Subject:From;
        b=nG546bZttayIFDopl8ITCSeFYrpJ4ZVjg0HLN9vbcZJFLoGfWXsoV/Ko3oF8RWDrb
         Q8osmTbMzNqtjqrl/q+tVIesF9QfVmhiQ75WbJ57QQij7HUko57mYROFxajOdtE2eJ
         Thb3PfKbrtu6zpZ6WTDpXgmNz+ZHWddp5nWyt/ebXVtty/pP9sgnQlAJKC0fpY+u6P
         u+CO36XZ1tafmNeJwZ7cXLHXo8TYK8B/JAjK9N6scnLu2kjNHIsFXSvaZXJl+9FNBP
         cft1kEKZdghi/dyURKKVMmwQaR3mn6pxAn8bctGtxlM9/yd33F2v7iHh7LU4kAYwGJ
         JMHJelxnEsGjg==
Date:   Fri, 20 Aug 2021 16:14:45 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the scsi tree
Message-ID: <20210820161445.6eadab0c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5i0xmhu1y.qgWK4eyjH/CY0";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/5i0xmhu1y.qgWK4eyjH/CY0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the scsi tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

drivers/scsi/Makefile:197: FORCE prerequisite is missing

Exposed by commit

  0fc7db58e2a6 ("kbuild: warn if FORCE is missing for if_changed(_dep,_rule=
) and filechk")

I don't know why this warning only appeared after the merge of the scsi
tree, since the offending line has been in this Makefile since 2017

--=20
Cheers,
Stephen Rothwell

--Sig_/5i0xmhu1y.qgWK4eyjH/CY0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEfSFUACgkQAVBC80lX
0GwG0gf/ezRJc8wXjFxP2tDXtSw1UYYp6e7gTcQAh2oNUz7oE7F3qelfa2g4OAPD
VfRfCgOrvrCj9ELM+VO/vOsk8uQsGRLaCQljoGLv3L57E8Zs8BtDOT5P142UVkWD
ICG0JntG+wpvf06yaLEtprbWLtnFRiw6VUXP4krnfXQIb9iKSW2wgLzyNGiuzgGp
7ctkjmnCRqDtqarCERNoNanSoTzaN3BQKG/U1skXPqe7zff5cfUTSSszOPhHcn/G
wo+cVxYdSbHPybl4Twb6YIbfMIypvX6GHcKifLaEe0TXdnZhrDYU57sJIiXIoCb6
e4feueByIJiiByM6bQc7vjIRTRmRHg==
=BH5P
-----END PGP SIGNATURE-----

--Sig_/5i0xmhu1y.qgWK4eyjH/CY0--
