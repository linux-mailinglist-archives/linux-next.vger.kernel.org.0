Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2A593AFC3B
	for <lists+linux-next@lfdr.de>; Tue, 22 Jun 2021 06:52:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229752AbhFVEyO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 22 Jun 2021 00:54:14 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:43747 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229690AbhFVEyN (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 22 Jun 2021 00:54:13 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G8DWw74Ywz9sXk;
        Tue, 22 Jun 2021 14:51:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1624337517;
        bh=rV8QLhjSOaEogg9fjv+rAIzchKJfJPcvAhPDI8rjKBo=;
        h=Date:From:To:Cc:Subject:From;
        b=S1Q113gAvcBK3LnB/hfnBIeiUH0+MBgT9+kPnv0A+3xm7xQYmSE5oBi+cMpRksZjC
         HhZfNPlEd6u43b1AcdriPwcMbdaUnWzbyHvxPLdAz1PctWFUU1IQy9spuNyosJZTQM
         V96cf377RSdz1IhGK0mS4pne9Px9JMw1auobrUmfNLJygUnA1fYDaFb1mLDeKsFtnb
         gAEuxb5RANMC5LJsrtNa0eaAdl5NuAAbtlArO/ozHqAJBu2wwQcYUXIgMYO5qC1U4m
         GcoCOJCMTwwRD5qeZENG4PpTCHD8o+/UhY9Pv0EgfQFayVvdplEw9OiJutgQjKQBA0
         BN8M4/ofocx9A==
Date:   Tue, 22 Jun 2021 14:51:56 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Paul E. McKenney" <paulmck@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Frederic Weisbecker <frederic@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the rcu tree with the tip tree
Message-ID: <20210622145156.41731463@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.hGvO.u=hbF2UtPECojG_bC";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/.hGvO.u=hbF2UtPECojG_bC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rcu tree got a conflict in:

  kernel/rcu/tree_plugin.h

between commit:

  b03fbd4ff24c ("sched: Introduce task_is_running()")

from the tip tree and commit:

  9f460390aac1 ("rcu/nocb: Start moving nocb code to its own plugin file")

from the rcu tree.

I fixed it up (I added the following merge fix patch) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 22 Jun 2021 14:49:27 +1000
Subject: [PATCH] fix for code movement to kernel/rcu/tree_nocb.h

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 kernel/rcu/tree_nocb.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/rcu/tree_nocb.h b/kernel/rcu/tree_nocb.h
index bf2690ca5d2b..8fdf44f8523f 100644
--- a/kernel/rcu/tree_nocb.h
+++ b/kernel/rcu/tree_nocb.h
@@ -1311,7 +1311,7 @@ EXPORT_SYMBOL_GPL(rcu_bind_current_to_nocb);
 #ifdef CONFIG_SMP
 static char *show_rcu_should_be_on_cpu(struct task_struct *tsp)
 {
-	return tsp && tsp->state =3D=3D TASK_RUNNING && !tsp->on_cpu ? "!" : "";
+	return tsp && task_is_running(tsp) && !tsp->on_cpu ? "!" : "";
 }
 #else // #ifdef CONFIG_SMP
 static char *show_rcu_should_be_on_cpu(struct task_struct *tsp)
--=20
2.30.2

--=20
Cheers,
Stephen Rothwell

--Sig_/.hGvO.u=hbF2UtPECojG_bC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDRbGwACgkQAVBC80lX
0GwYawgAmv2WZxSYoMa0hA5ljaiKQLMCWlG50aT++2oi9UStbBrnH8XU8Qk9X9fp
TU6MFLfUilgG/lebEp0MqJuV6oXRoFTDTMkDgitapNxxi2RSPJ6Y0XiDvfEfxvuC
dVJchNHekLqMPo6p3FEu1OGTnDGM4F6HWUNrPFqd/q2TDrXre09TPBP8zKJp/qxw
dHUvlBoRIKmwVLtb7soVGegftawWvV/sb2KNWvq0fZvcsAHnzciOtIpu8F9s0jKh
NFYx7NwCQ4zC/x2vYmbnWikBn99zXFomtg3mT0inl0YOZyEn/XLJu3K8iN6trVYs
eiFg2qyUsZ937qeKF5OWeqB6m2S8hQ==
=JBbD
-----END PGP SIGNATURE-----

--Sig_/.hGvO.u=hbF2UtPECojG_bC--
