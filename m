Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B11B117D49
	for <lists+linux-next@lfdr.de>; Tue, 10 Dec 2019 02:40:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726589AbfLJBkx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 9 Dec 2019 20:40:53 -0500
Received: from ozlabs.org ([203.11.71.1]:45923 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726538AbfLJBkx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 9 Dec 2019 20:40:53 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47X2nt15tyz9sP6;
        Tue, 10 Dec 2019 12:40:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1575942050;
        bh=hgjHvy4Ae3ms7mEPzhcFq4Rw2OI7SLTCUs/b1A0iVXA=;
        h=Date:From:To:Cc:Subject:From;
        b=Rg4oy4ov/5mgR1sNgZ5hmnrslrSFHRf5Mw366DI+m72/231L5rAK8euVeXp/0/FQb
         2VjFu7n6lK4XUevWfYIo5YB8bckrQRHa/Q0gg2s2DKW3Jwt62IGDiYENiNTEIHJI/n
         XWtHgUSzdFughXoHDz6Ndpgml6L45hcMZiB7h7FI4eLDK2gtO4lV9G8SMkcMPY4Jhm
         j4oPYwcwmJNUt5SlMYopR9Rk2b1Lq19a8HOn8X96oasX2eaXt8LITSBPRkPqtIOFYN
         3WrX9PLOw822l5n9/W7shTXXAzY+mXRX0o+4oSuFHJIpF4J8fwfgO7k8v6w8/JHwPy
         PCxRm3p16wLDw==
Date:   Tue, 10 Dec 2019 12:40:47 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Paul Moore <paul@paul-moore.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        James Morris <jamorris@linux.microsoft.com>
Subject: linux-next: build failure after merge of the selinux tree
Message-ID: <20191210124047.40852ade@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4KdyygbuAPY_UD+vZ/0ZA04";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/4KdyygbuAPY_UD+vZ/0ZA04
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the selinux tree, today's linux-next build (powerpc
pseries_le_defconfig) failed like this:

ld: security/lsm_audit.o:(.toc+0x0): undefined reference to `lockdown_reaso=
ns'

Caused by commit

  59438b46471a ("security,lockdown,selinux: implement SELinux lockdown")

CONFIG_SECURITY is not set for this build, but CONFIG_AUDIT is set.

I applied the following hack for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 10 Dec 2019 12:28:16 +1100
Subject: [PATCH] security,lockdown,selinux: hack for !CONFIG_SECURITY

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 security/lsm_audit.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/security/lsm_audit.c b/security/lsm_audit.c
index 2d2bf49016f4..f97a3337f307 100644
--- a/security/lsm_audit.c
+++ b/security/lsm_audit.c
@@ -427,8 +427,10 @@ static void dump_common_audit_data(struct audit_buffer=
 *ab,
 				 a->u.ibendport->port);
 		break;
 	case LSM_AUDIT_DATA_LOCKDOWN:
+#ifdef CONFIG_SECURITY
 		audit_log_format(ab, " lockdown_reason=3D");
 		audit_log_string(ab, lockdown_reasons[a->u.reason]);
+#endif
 		break;
 	} /* switch (a->type) */
 }
--=20
2.24.0

--=20
Cheers,
Stephen Rothwell

--Sig_/4KdyygbuAPY_UD+vZ/0ZA04
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3u958ACgkQAVBC80lX
0GyE4Af+P2Eq+f2xOuGBi79YrS0wlV079AWuAL4gGHOX2Vpd4tRL0lq7Gwrm2VkE
Jcsl8Z+79kbeO9gm2dDbxNkR5OtxsSsb8vZz0qQqHSL8ixfAFXX8p7p/hph6tZSg
KmJDkOvwDN3M3vsDG8q706VW4/Bn7qqAeJ+s9nOfIgNDapML26cGR5lm+LhggApP
jUH4N56BsVMMyM9yOZQ+gmIVgD9JEMy56VRBb7CblQ43JOPG3ibUEvvVhwORGL/B
3T2liP16we5KbZjIZJ6BWABs+qdxseNU/hFK3mNd5kZC3Bv2mMFbiuv77QlzrqqE
Z7jSonEO2++cE+VFCXGr7HN/x8zIyw==
=Ivuw
-----END PGP SIGNATURE-----

--Sig_/4KdyygbuAPY_UD+vZ/0ZA04--
