Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BFD77C622C
	for <lists+linux-next@lfdr.de>; Thu, 12 Oct 2023 03:22:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233901AbjJLBWQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Oct 2023 21:22:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235257AbjJLBWP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 11 Oct 2023 21:22:15 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9920D8;
        Wed, 11 Oct 2023 18:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1697073730;
        bh=/Xdp/mcMFK/p27v1jBmv4d5E1BUbkj0LWPAOYQzOMTw=;
        h=Date:From:To:Cc:Subject:From;
        b=pOqEfya98+RMdL6w1l5NRxhVvr/7mw2x6T6yMjSpnjy19aY6D4SN2emE/eusUyFIf
         rgAZAj2rI1CAtwR/SDa3Tod1PDxmIoZgsDanTeWutDvGBCqxzierK0ibvAQmmLH7dG
         JSwzJiebvJsQsV7qCj/WfH3nto3p1vTkh2QVccXWD1OYwgYch9aBvl06C2j+PPYExp
         oQnVyuFATwSyHQKQZ5vmtWe7NKo5zfi5ee4rGKISlGldcHLVCz64UJZixmp0eVTkCo
         nKUfhAKzcuR1RMlopyODd1P0PF4JWZIEWx/JLhJziZuXHTQbSrdvmKQyl0PmkLlixZ
         +G9rs5XPE5cEA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4S5X1G2szKz4xWK;
        Thu, 12 Oct 2023 12:22:10 +1100 (AEDT)
Date:   Thu, 12 Oct 2023 12:22:09 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        RD Babiera <rdbabiera@google.com>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20231012122209.6f2768df@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zL4gDIsgV1lNGZPCnNo47sl";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/zL4gDIsgV1lNGZPCnNo47sl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/usb/typec/altmodes/displayport.c: In function 'dp_altmode_vdm':
drivers/usb/typec/altmodes/displayport.c:309:33: error: too few arguments t=
o function 'drm_connector_oob_hotplug_event'
  309 |                                 drm_connector_oob_hotplug_event(dp-=
>connector_fwnode);
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from drivers/usb/typec/altmodes/displayport.c:17:
include/drm/drm_connector.h:1984:6: note: declared here
 1984 | void drm_connector_oob_hotplug_event(struct fwnode_handle *connecto=
r_fwnode,
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  fc93835bb0d7 ("drm: Add HPD state to drm_connector_oob_hotplug_event()")

interacting with commit

  89434b069e46 ("usb: typec: altmodes/displayport: Signal hpd low when exit=
ing mode")

from the usb.current tree.

I have applied the following merge fix patch.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 12 Oct 2023 12:17:31 +1100
Subject: [PATCH] fix up for "drm: Add HPD state to
 drm_connector_oob_hotplug_event()"

interacting with commit

  89434b069e46 ("usb: typec: altmodes/displayport: Signal hpd low when exit=
ing mode")

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/usb/typec/altmodes/displayport.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/a=
ltmodes/displayport.c
index ddfb5b6ace4f..eb0bf08fc97a 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -306,7 +306,8 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
 			dp->data.status =3D 0;
 			dp->data.conf =3D 0;
 			if (dp->hpd) {
-				drm_connector_oob_hotplug_event(dp->connector_fwnode);
+				drm_connector_oob_hotplug_event(dp->connector_fwnode
+								connector_status_disconnected);
 				dp->hpd =3D false;
 				sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
 			}
--=20
2.40.1

--=20
Cheers,
Stephen Rothwell

--Sig_/zL4gDIsgV1lNGZPCnNo47sl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmUnSkEACgkQAVBC80lX
0GyYnwf/emlMX6Pe4P9hEcUAAWkRpNlIu6fo7ACfB8FbraViqoC0GorhPEspn10N
N2C+DWuzuPnxHwv8+/7CR+HkMT4VAbjB8mZu/BAxsM82N7s1MuKlXvhu+v/G7UPv
JLKTPZsN9LgM1QR+DfcgqbWS6+6itrgxSDuWxRWTcGcSjqjaM3zSuuAUAVXZzWRZ
I4+Y9kgBXE5vOQAqRe7TUJF0mA1jx+7wSUaAmskcA/e+Vc8sd5u7z74TNBFYfpJd
yDFT57TrhF2HNKSUR6z40c1vs6b8+Pw0sTG4qAmTY6obew0QmfCmiZM03jO1m244
TwdutW64UCgwYl9dWbcBJraCdwXgpQ==
=VqaS
-----END PGP SIGNATURE-----

--Sig_/zL4gDIsgV1lNGZPCnNo47sl--
