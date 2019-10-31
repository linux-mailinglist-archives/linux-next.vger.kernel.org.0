Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 297B8EA841
	for <lists+linux-next@lfdr.de>; Thu, 31 Oct 2019 01:33:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727080AbfJaAdY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 30 Oct 2019 20:33:24 -0400
Received: from ozlabs.org ([203.11.71.1]:51647 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726713AbfJaAdY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 30 Oct 2019 20:33:24 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 473RBP0fDjz9sPn;
        Thu, 31 Oct 2019 11:33:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1572481998;
        bh=7XKqZHnloBwk2IBLtvDjt9PATonWlXhD8i+mH9h8ki4=;
        h=Date:From:To:Cc:Subject:From;
        b=QO/HGZ/JR7M0dLAkQjlU2V8OQSfKpRMEyP7fINchZe1oRYJPYjPQFeSZFu8tJLAzS
         MOCJ7JX0eTopvA0yO6w3Iq4VfkdWuqtGS+z8GD6351oN/DfxxEfep5QD+lcrjyrXVC
         h2sX8H7Kj+9Wvx7/F6QMHY2H79UP7MdFJvfsWYCjhGY5AcXCEVOxoim4IMwPSz/xPg
         HOEN6v0iLfuAOKWmxjxcrlIwOzlkX+IWN+4nBJowZdGBanGjOC0HMPd1kjlAu3i+2U
         2GxDGhQolVVzgmD+TMTU38s+F6jbWYeYZgj/I9d9DB/5gJtxWovgeVZVzx06/dmDUH
         7Mwk2tOPsZkoA==
Date:   Thu, 31 Oct 2019 11:33:15 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: linux-next: manual merge of the drm tree with the drm-intel-fixes
 tree
Message-ID: <20191031113315.4183cc7a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BtWu1.KVQ8+eonL8skrO/=1";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/BtWu1.KVQ8+eonL8skrO/=1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/i915/i915_drv.h

between commit:

  59cd826fb5e7 ("drm/i915: Fix PCH reference clock for FDI on HSW/BDW")

from the drm-intel-fixes tree and commit:

  7d423af9bfb1 ("drm/i915: Implement a better i945gm vblank irq vs. C-state=
s workaround")

from the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/i915/i915_drv.h
index 953e1d12c23c,8882c0908c3b..000000000000
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@@ -1704,34 -1339,17 +1339,19 @@@ struct drm_i915_private=20
  	struct {
  		struct notifier_block pm_notifier;
 =20
- 		/**
- 		 * We leave the user IRQ off as much as possible,
- 		 * but this means that requests will finish and never
- 		 * be retired once the system goes idle. Set a timer to
- 		 * fire periodically while the ring is running. When it
- 		 * fires, go retire requests.
- 		 */
- 		struct delayed_work retire_work;
-=20
- 		/**
- 		 * When we detect an idle GPU, we want to turn on
- 		 * powersaving features. So once we see that there
- 		 * are no more requests outstanding and no more
- 		 * arrive within a small period of time, we fire
- 		 * off the idle_work.
- 		 */
- 		struct work_struct idle_work;
+ 		struct i915_gem_contexts {
+ 			spinlock_t lock; /* locks list */
+ 			struct list_head list;
+=20
+ 			struct llist_head free_list;
+ 			struct work_struct free_work;
+ 		} contexts;
  	} gem;
 =20
 +	u8 pch_ssc_use;
 +
- 	/* For i945gm vblank irq vs. C3 workaround */
- 	struct {
- 		struct work_struct work;
- 		struct pm_qos_request pm_qos;
- 		u8 c3_disable_latency;
- 		u8 enabled;
- 	} i945gm_vblank;
+ 	/* For i915gm/i945gm vblank irq workaround */
+ 	u8 vblank_enabled;
 =20
  	/* perform PHY state sanity checks? */
  	bool chv_phy_assert[2];

--Sig_/BtWu1.KVQ8+eonL8skrO/=1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl26K8sACgkQAVBC80lX
0GxUEwgAiDEmYOtenUVKBbWMrzG1aiD02DfLijRCRAcO4iGSyNppuavCHiYQZSby
uzhK0MPlJ9Ge/0YpTW4GypSZb2m5XEzXb1+CcJ/NosWtEDnhoE8kgDBaXj7gB3iO
TFBq02QFOFI4PBFzesNGOcFaomWl5LjmSeDsahcXKRQW2Gqr/7QP0DQz3m4TgOCa
Ktqll1tnVzFx2TAD9/gl7NXrodcz1OjYn5iBb4A9hSONWLgqqY1ESVhEVwgqaCTF
d5FABgxepuQJlqkAhwSV8dgOHsVdR6Tzx4lQEKisuW6r7J1CUZUPLvBARmauTPwV
8WrXwdTFygDYxHaT40rp/icxc/bPZw==
=RKfl
-----END PGP SIGNATURE-----

--Sig_/BtWu1.KVQ8+eonL8skrO/=1--
