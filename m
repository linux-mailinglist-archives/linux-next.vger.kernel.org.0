Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA0682F994E
	for <lists+linux-next@lfdr.de>; Mon, 18 Jan 2021 06:32:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730765AbhARFch (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 Jan 2021 00:32:37 -0500
Received: from ozlabs.org ([203.11.71.1]:38467 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728799AbhARFce (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 18 Jan 2021 00:32:34 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DK0lX59slz9sW0;
        Mon, 18 Jan 2021 16:31:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1610947912;
        bh=osLJnhdzX2YnBHGZutqyA5xJYVYwvgU5wbQkPK/tEWA=;
        h=Date:From:To:Cc:Subject:From;
        b=QJ7EOWby1C+T1dZGzBHYCOV3ZA4RwbdxqxJbZMqX0pq2kZk4F2id3FPwNMNqBIl+d
         9Hb75wIhHGGLErHu5LCuAGXk6lH7lHovGzr1f+1RsWbZ/QKqpxUtxHw6QdG9HmVOMx
         rXNJdhHLdPktbRyh4sqtB036m2uLzUihKXdNizxGHrA/LYjXPUgswvQ6LF/Goys3C5
         mwaBHpCdZpujMX/2IEVHK61bwbM8wyG23D6eon8ulW5IJqKBgj8QjOvvtnu8LAA9Vd
         F3a3w83Wqy4ZDoquvtKO4l/Ucx3ZwlWUt1QeRN/WGX+NVS2F6egSd/pM/crHnv/XGM
         Lc63JTeb/dXhQ==
Date:   Mon, 18 Jan 2021 16:31:51 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the oprofile-removal tree
Message-ID: <20210118163151.0d46ecc8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yq7ueKHtD/uvnPlM3chl6OS";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/yq7ueKHtD/uvnPlM3chl6OS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the oprofile-removal tree, today's linux-next build
(powerpc allyesconfig) failed like this:

make[4]: *** No rule to make target 'arch/powerpc/platforms/cell/spu_notify=
.o', needed by 'arch/powerpc/platforms/cell/built-in.a'.

Caused by commit

  43d297a9e028 ("arch: powerpc: Stop building and using oprofile")

I have applied the following patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 18 Jan 2021 16:19:34 +1100
Subject: [PATCH] arch: powercp: update cell Makefile for the removal of
 spu_notify.c

Fixes: 43d297a9e028 ("arch: powerpc: Stop building and using oprofile")
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/platforms/cell/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/platforms/cell/Makefile b/arch/powerpc/platforms/=
cell/Makefile
index 10064a33ca96..7ea6692f67e2 100644
--- a/arch/powerpc/platforms/cell/Makefile
+++ b/arch/powerpc/platforms/cell/Makefile
@@ -19,7 +19,6 @@ spu-priv1-$(CONFIG_PPC_CELL_COMMON)	+=3D spu_priv1_mmio.o
 spu-manage-$(CONFIG_PPC_CELL_COMMON)	+=3D spu_manage.o
=20
 obj-$(CONFIG_SPU_BASE)			+=3D spu_callbacks.o spu_base.o \
-					   spu_notify.o \
 					   spu_syscalls.o \
 					   $(spu-priv1-y) \
 					   $(spu-manage-y) \
--=20
2.29.2

--=20
Cheers,
Stephen Rothwell

--Sig_/yq7ueKHtD/uvnPlM3chl6OS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAFHUcACgkQAVBC80lX
0GyQ6gf/Y9y8JB5OCKJj7MKaBkOxEbq8de340P/o274fMSl1VHfVYS2DCLS81T0r
Nk0pdDnNfY3Wxp4vvIIW/nRPobEkuwgULnbkYFBFRBulQq8M8kyPlcUU24JO1SQD
6mDJMbOVALFwUlN/kE7N1qdBniPERUMPJ1jKpCokZRAYbCG2c8B33dYm/Ve9URG1
qqAiZHV3WSmn9RanytaSPC/9N9WE2fC5k2+brT01HjhLwIrpA56m4AIKgKXK+lza
wWsnFN3n/mZFZ0BoMHfKtseGqCJySKT7aiMlsXRDqVipy8RqjU/HLlipPi5AyNon
NYOfvQf2LsKsq0OzRCpXfmxpa2+E0A==
=ltT7
-----END PGP SIGNATURE-----

--Sig_/yq7ueKHtD/uvnPlM3chl6OS--
