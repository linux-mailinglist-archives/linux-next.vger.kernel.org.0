Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AB4436A44B
	for <lists+linux-next@lfdr.de>; Sun, 25 Apr 2021 05:01:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbhDYDB6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 24 Apr 2021 23:01:58 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:60587 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229514AbhDYDB5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 24 Apr 2021 23:01:57 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FSXpy4T0Rz9sT6;
        Sun, 25 Apr 2021 13:01:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1619319677;
        bh=ziUauJwpgby+Ofvr57dpZoib6PJ1pOgHQSmGg/BBf18=;
        h=Date:From:To:Cc:Subject:From;
        b=UUgGf38GunoRu8HlVtfyFZi4kOVLgLhjjiMJzQMSYkJTMNC9CiFNd8NWlFwU6ni0S
         IiwoyRCD1LlLPWPHTS4CgYymkiM5Hsdx1/CUA46IM2keNcM0QFzT0iOYpYjtFHPp9w
         EjKnFOVt1D/GsouWACLNqBQJp96Xb5tXeIJt7KSv3BDjKSb92ijl2WwfRpGR0J3kJM
         qll4jzpBP/4MZVqflAoCtHevFpmn6rgOicPXftZxGUZ/DuVlViPmsmgb/o0sE4hBQB
         fAO1nUzm1BQb8xu3BZked6Ij0cN8fU/tV93qQcHUACDVX+JWek5eJAS7ZBxIuSrDBj
         FCBdwN0lMzkBA==
Date:   Sun, 25 Apr 2021 13:01:13 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the risc-v tree
Message-ID: <20210425130113.7bfe5cad@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hRS/hBA+OBWpE75XCOJ_Ylb";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/hRS/hBA+OBWpE75XCOJ_Ylb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  97db849866cf ("riscv: vdso: fix and clean-up Makefile")
  ab541f55291b ("riscv: Set ARCH_HAS_STRICT_MODULE_RWX if MMU")
  c79a9a16f7e7 ("riscv: module: Create module allocations without exec perm=
issions")
  b170834bcc98 ("riscv: Mark some global variables __ro_after_init")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/hRS/hBA+OBWpE75XCOJ_Ylb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCE23kACgkQAVBC80lX
0GykPwgAkakp9NL5X4Upx9TdSU1Y7KLU8vK9An1BxRWKf02goRBfyS4a2zNUj/PU
UWORT/Bwi2+1kqlWOAynUcpv7Ka9dFs2BIg5KYHjT14U3naSV6thyrHN7K6VZJjz
2OrMAZiVJF7lZYcYZasYl9NtXhOYZx0cPe8iEGhb+PWUkvfg4hOO9syDlV4wG1ts
YE1704qo60vQw7XlifRepCLc51rUU+nPZXztFe2DTnesjZzvqzVgrk4HSFqNgBIU
hfxzTZpCbRHVjCB+vsJ9+XsnYsyHSfyyj/8dg9dxyoKZnpey3GExTe+AX+sDYygk
TgJYsIteOgzSvNZcJXgANPuwRpgpQA==
=Khyr
-----END PGP SIGNATURE-----

--Sig_/hRS/hBA+OBWpE75XCOJ_Ylb--
