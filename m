Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D1EDFBEA2
	for <lists+linux-next@lfdr.de>; Thu, 14 Nov 2019 05:38:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbfKNEiN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 13 Nov 2019 23:38:13 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:45805 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726489AbfKNEiN (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 13 Nov 2019 23:38:13 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47D7yW21Qbz9s7T;
        Thu, 14 Nov 2019 15:38:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1573706291;
        bh=P/mByLN+ETEbE7SL3y/9lgK4nCMiQUGm3IeNA1f59No=;
        h=Date:From:To:Cc:Subject:From;
        b=TGcBdSMI5oIHykg4FuwaNn9fzgPtmUgLod0dsDYZnQ15h0Tz3Nx7ltrddEOWfIN4o
         PKEjGveukKn7dd9jY/yuQCuWotcXnZVTnoDs8FBwIrLVRdrT36/8hV1d6yt+F1AhOU
         x1aBjIh38PNNEyOxdybYlGF8vCCP8ZOetqKshW+/vtFnNDTSsbN7HY+e9vtLpCtNYb
         tf+iYFsYKQSFBoE4o7eqSNhyNw2WbKId3lz+Do1fZcmTKlyaqjzE6SsETvTb1N9lM8
         f1Ev63YjgiiYkZVlyfYbk8OLRQK20sKzmJPX7tmSoHoJqlW+gGBXx32KSDi/RUk8Uf
         qSCWff+dj28LQ==
Date:   Thu, 14 Nov 2019 15:38:10 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build failure after merge of the y2038 tree
Message-ID: <20191114153810.55d937af@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sa_0ylOl5Uo6eotfCQP0FM=";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/sa_0ylOl5Uo6eotfCQP0FM=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the y2038 tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

arch/powerpc/kernel/time.c: In function 'update_vsyscall':
arch/powerpc/kernel/time.c:960:33: error: 'struct timespec64' has no member=
 named 'sec'
  960 |  vdso_data->stamp_xtime_sec =3D xt.sec;
      |                                 ^
arch/powerpc/kernel/time.c:961:34: error: 'struct timespec64' has no member=
 named 'nsec'
  961 |  vdso_data->stamp_xtime_nsec =3D xt.nsec;
      |                                  ^

Caused by commit

  009a81339beb ("y2038: vdso: powerpc: avoid timespec references")

I have added the following patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 14 Nov 2019 15:28:13 +1100
Subject: [PATCH] fix up for "y2038: vdso: powerpc: avoid timespec reference=
s"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/kernel/time.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index ee9ba3a48c76..2d13cea13954 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -957,8 +957,8 @@ void update_vsyscall(struct timekeeper *tk)
 	vdso_data->tb_to_xs =3D new_tb_to_xs;
 	vdso_data->wtom_clock_sec =3D tk->wall_to_monotonic.tv_sec;
 	vdso_data->wtom_clock_nsec =3D tk->wall_to_monotonic.tv_nsec;
-	vdso_data->stamp_xtime_sec =3D xt.sec;
-	vdso_data->stamp_xtime_nsec =3D xt.nsec;
+	vdso_data->stamp_xtime_sec =3D xt.tv_sec;
+	vdso_data->stamp_xtime_nsec =3D xt.tv_nsec;
 	vdso_data->stamp_sec_fraction =3D frac_sec;
 	smp_wmb();
 	++(vdso_data->tb_update_count);
--=20
2.23.0

--=20
Cheers,
Stephen Rothwell

--Sig_/sa_0ylOl5Uo6eotfCQP0FM=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3M2jIACgkQAVBC80lX
0GzfOAf+PNWcEK0gdZ6HwcziPONofH/oVDlk664B5iRpnNOep3BD14wGWwnJxsIr
qEFOb8jEOkaHHpnaBaU6yRKn2BTjAtfMKIKS/qLNjpXikovHny74obUzUvCUao8w
+6HeCvtvXzI28Sgg4iP3NgVfqhLzK+PRJqDBsb3hjHAeiB8z00wjKSkUoYvmMaom
Y+OzsZv1azQLx9cLm79O5wmAcYYF9O6n+j8tSGGLgfa7Bw3K88MswVdZSHDWdsxx
Q29hvZdwVGquzy5gV0gt5t3O/x+As+2o9Fck8tLgfkendlkWPUZZvOE4soUrkCA/
HCE4yia9Trc58tUbaLQiPsN7akum3A==
=bjkQ
-----END PGP SIGNATURE-----

--Sig_/sa_0ylOl5Uo6eotfCQP0FM=--
