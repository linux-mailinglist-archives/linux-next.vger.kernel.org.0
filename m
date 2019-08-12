Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2789889687
	for <lists+linux-next@lfdr.de>; Mon, 12 Aug 2019 06:58:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725838AbfHLE61 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 12 Aug 2019 00:58:27 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:56737 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725822AbfHLE61 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 12 Aug 2019 00:58:27 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 466NsD2bwGz9s7T;
        Mon, 12 Aug 2019 14:58:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1565585904;
        bh=+XUql2QwatmOkcfblCGCbEXZU/3qsSW3+eNwYoAniSI=;
        h=Date:From:To:Cc:Subject:From;
        b=LbWJbdBDQ2eR3uXBKO8VGz0jd4039nyNGtt5f9z/n7T+bljBhg1f9YmQ6/tGUkwUG
         rE547yfCUBlAiLagDpDxMXOLPwgCQthrJy6Tt2mX4sW8uBKaCvji587VnVUktCfrQh
         2h9EvxAwZiMog2rglt+/KOkGMFbkHIvjRMQHcDLPHgh2zQGTpXtDl8pnkNt25mELTK
         r4wMBxLWoKonPuUrYqacz8mBKcfy6xRf/UMZRvByn2bkrk+zOxvhVjOAEIi4uJVkYO
         p/fTg12IZQGAeSh+9QNn6XV1rRrlITHDJRGw7c07G1uXswjG1ufgSJjn54vMzKNt7e
         34a4fpN5gzE4Q==
Date:   Mon, 12 Aug 2019 14:58:23 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     James Morris <jmorris@namei.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Matthew Garrett <mjg59@google.com>,
        Kees Cook <keescook@chromium.org>,
        Casey Schaufler <casey@schaufler-ca.com>
Subject: linux-next: build failure after merge of the security tree
Message-ID: <20190812145823.63d77573@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RfU=Qk4LgOsU_kXaWADIOuT";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/RfU=Qk4LgOsU_kXaWADIOuT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the security tree, today's linux-next build (arm
multi_v7_defconfig) failed like below.

Caused by commit

  45d29f9e9b8b ("security: Support early LSMs")

I have added the following fix for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 12 Aug 2019 14:54:20 +1000
Subject: [PATCH] early_security_init() needs a stub got !CONFIG_SECURITY

An arm multi_v7_defconfig fails like this:

init/main.c: In function 'start_kernel':
init/main.c:596:2: error: implicit declaration of function 'early_security_=
init'; did you mean 'security_init'? [-Werror=3Dimplicit-function-declarati=
on]
  early_security_init();
  ^~~~~~~~~~~~~~~~~~~
  security_init

Fixes: 45d29f9e9b8b ("security: Support early LSMs")
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/linux/security.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/security.h b/include/linux/security.h
index 807dc0d24982..23e1c3f17d48 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -473,6 +473,11 @@ static inline int security_init(void)
 	return 0;
 }
=20
+static inline int early_security_init(void)
+{
+	return 0;
+}
+
 static inline int security_binder_set_context_mgr(struct task_struct *mgr)
 {
 	return 0;
--=20
2.20.1

--=20
Cheers,
Stephen Rothwell

--Sig_/RfU=Qk4LgOsU_kXaWADIOuT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1Q8e8ACgkQAVBC80lX
0GzJ2Qf/VH0iQwwUX51/De5pNclfDGsUUFjGpIVppHxLw115/QW6A3n4aKsvEZem
rIfj6nNJbbFk5NWa/LnmoU9+iL/U3EAqS8dTRQ6gtsMKnzvFy4vxlhI7pDSvXOQ5
nXSMzJVPkzETaO4D5jfM6U8/ipJ/7OwJyeY8pz6Dpuvn3PEMRaXxorYnMu3vkTbX
FyeENRKmUj2Uij+N++SqVAP2TOQt8iUMP+SsamiIiCKynHjhLvyxDsLzpE3N/A4X
eQ8L+YfERAc7iLPKHZH8tVAut91+6AcgbTqQNij8n90ydnWdXdszHajfOMqxFgrG
9W3dDz0Sfv3CcmI2VfKQMopgXU7Gsg==
=IHKh
-----END PGP SIGNATURE-----

--Sig_/RfU=Qk4LgOsU_kXaWADIOuT--
