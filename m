Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 313B43E9BF3
	for <lists+linux-next@lfdr.de>; Thu, 12 Aug 2021 03:34:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233237AbhHLBfS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Aug 2021 21:35:18 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:34579 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233208AbhHLBfR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 11 Aug 2021 21:35:17 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GlTkz4Gxqz9t2b;
        Thu, 12 Aug 2021 11:34:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1628732091;
        bh=xr5k/YLNVe7r9l4XqhHijIcgp45wUsrM8Ru/LqcEgsA=;
        h=Date:From:To:Cc:Subject:From;
        b=CtJ7qoTKvkOl6pAk/YFvbAl/MJ+Ky2OSa7+y3XGLHsNu4lqwS1Vgl0Nbrpd1bMfaB
         /cWsFoIXui5fPIKTaU5W5hQf60y9PluV9GRfi0gm/iGt3U4CYh+ITJlzFmLjfMqoBs
         Bab0SNcs0VfAJslPlCB4fvwiZ/uJi8ShmGPyEmEEuUZd8a3UI7P5Z93KaYe8aL5/Mo
         5n+nLr/a5f7MyiFnbkGFdqtPO5uY6tAZMQCQDKBww1C+UdGLQh6udabKs+RUEliXkg
         xwKxooAoj6RI8Yjb1AarlMCoZFFY8k64ulaASvkfOw+0iVBYzLBsHCeVSgwMe8PP/J
         vgTupAcQTRRQA==
Date:   Thu, 12 Aug 2021 11:34:50 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>
Cc:     Kuogee Hsieh <khsieh@codeaurora.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Rob Clark <robdclark@chromium.org>
Subject: linux-next: manual merge of the drm-msm tree with Linus' tree
Message-ID: <20210812113450.3b351ac8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/k9If7l17ntdaySuXmfYGNM1";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/k9If7l17ntdaySuXmfYGNM1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-msm tree got a conflict in:

  drivers/gpu/drm/msm/dp/dp_display.c

between commit:

  afc9b8b6bab8 ("drm/msm/dp: signal audio plugged change at dp_pm_resume")

from Linus' tree and commit:

  26ae419cd9ec ("drm/msm/dp: add drm debug logs to dp_pm_resume/suspend")

from the drm-msm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/msm/dp/dp_display.c
index 867388a399ad,419fd4a14cbf..000000000000
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@@ -1312,10 -1314,10 +1315,14 @@@ static int dp_pm_resume(struct device *
  	else
  		dp->dp_display.is_connected =3D false;
 =20
 +	dp_display_handle_plugged_change(g_dp_display,
 +				dp->dp_display.is_connected);
 +
 +
+ 	DRM_DEBUG_DP("After, sink_count=3D%d is_connected=3D%d core_inited=3D%d =
power_on=3D%d\n",
+ 			dp->link->sink_count, dp->dp_display.is_connected,
+ 			dp->core_initialized, dp_display->power_on);
+=20
  	mutex_unlock(&dp->event_mutex);
 =20
  	return 0;

--Sig_/k9If7l17ntdaySuXmfYGNM1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEUeroACgkQAVBC80lX
0GwntQf+MmFIMZCYceqx0JKHgYKG7q2Hz++RJYwrcSnsVNx8FwsG8HdcziAjGEG4
bg3yMXJypGpooPvqTATeuSAkrmA2cPVkZ7mgYBD1aA3itBTC64L3Mi3bb5c0xl7a
ITOT0TymM6RBRPURsgvHhUGE8FL3QoTydjEZz71sIvJzqTE6c8+BpboewltzmIxe
Pe++TAIaiwrqYxxMUwQBLxt1mbhN8+f3IntzVkVV3OVjhUDXJ07xhxtw+HsGLURt
xPj31cZif29tPwe9HtlZIgW3eVafPslZUk+H+0yLoVmfLuYhS3vBXAwpnBg8F7FH
gGNukn80kEaVCjiRQnbuyyQdlbR18w==
=qVWV
-----END PGP SIGNATURE-----

--Sig_/k9If7l17ntdaySuXmfYGNM1--
