Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9110A2EEA98
	for <lists+linux-next@lfdr.de>; Fri,  8 Jan 2021 01:56:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729507AbhAHA4E (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 7 Jan 2021 19:56:04 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:42729 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729503AbhAHA4D (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 7 Jan 2021 19:56:03 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DBl542wsnz9sVy;
        Fri,  8 Jan 2021 11:55:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1610067321;
        bh=8IYZjYy93oOeLB3jJByA/BG6a411ChBAgHWFfX0UnK4=;
        h=Date:From:To:Cc:Subject:From;
        b=eOOwPIbypN32yagVPErk634PG1KfH8jEhRvRZ9rWR8UI9+6QBmr/iK492iVJkmYxq
         srDg90TEFwxC+OgTJsyn5q8T9h6NYjzwKM6HxS3CvsJSWquJfZS9sy6VCo+T2O8+HJ
         /xpItjSiGJ6QCPhaDR5xXmRbR91eqtHVu4JS4ikWXY44BZUuECPrexU8NVBRWA5LGs
         vG5x2taNEI0jl0XTp2qrGWWrQkJkM/RAfEftcpoejNuZzR7qubuibiAYhVXJ77DoX6
         BKej1WPsaOEDBryX24FX/vt+jTAyhPNKafnGAHtgbucR2JbGbQPhKpOszV03+lqdro
         dvCBxo9ejeMxQ==
Date:   Fri, 8 Jan 2021 11:55:18 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm tree
Message-ID: <20210108115518.2b3fdf58@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hNb07TGy08xp_yj6p41Q8VV";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/hNb07TGy08xp_yj6p41Q8VV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

error: the following would cause module name conflict:
  drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.ko
  drivers/gpu/drm/panel/panel-dsi-cm.ko

Maybe caused by commit

  cf64148abcfd ("drm/panel: Move OMAP's DSI command mode panel driver")

I have used the drm tree from next-20210107 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/hNb07TGy08xp_yj6p41Q8VV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/3rXcACgkQAVBC80lX
0GwpnQf/cRDGdJtwX8a9ehF7kmUeSKv9+OCpPm4N76p5SWVzFTrE8V92sJEbmXt4
iPWEszmS5wrS1682aUEDWskK1w5MCgItCurX6R7xOkOn4BI940XNBWTeSGMXV1ba
8NRL8M76Co1FMxHwq8p+G84i/3ZBrU/d8K4eCIfB8ejz7nNG340LMfiDe3Er/E0S
XoucdETmiHi2AvMZpJhXGIbFQR+lCDnycZjXV2Zrr6iNnmGVnx4sPQIgKIIGCA+v
ds0gNkDuJtaQ60jpcw1uUguXKJX9jk09bVPALk5Av6XmSWq+sy8BMps02I7OBtkG
zRpMK2CKl8gCGHze+agGcTIxzYlm9g==
=+t14
-----END PGP SIGNATURE-----

--Sig_/hNb07TGy08xp_yj6p41Q8VV--
