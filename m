Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A41C11FC5B
	for <lists+linux-next@lfdr.de>; Mon, 16 Dec 2019 01:51:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726437AbfLPAvs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 15 Dec 2019 19:51:48 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:40257 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726299AbfLPAvs (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 15 Dec 2019 19:51:48 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47bjQT4Mwwz9sNH;
        Mon, 16 Dec 2019 11:51:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1576457505;
        bh=barIgZhfjdNaSR9zBtj2KFrVq4xY0e5qWMY9AxtpYqY=;
        h=Date:From:To:Cc:Subject:From;
        b=MpW1QRXKX9RFkxvglPSI06kUY0h7nF2FWLtfVi+zJRuT59YycQjQMDeDVqRqirLxx
         bM3mlmsh7UzanCbbuptc6EW+cth9WbS1NvNVYtQkfrbhaAjL1RE4qveSiuFqEQnhMe
         rLbs5byUaRmdIgJWpHOnsdtryYahmNIYoAR5LMnT3bttY/PTqdxHybnXrdsQDSz7QN
         06wER/JDj8sthx2goX1f3vg6UXxmz100jNT26hfQkTEW6VJtfEGGllEjk5xvhkJaR+
         NDd31o4Qcj1flI/zZOtwtI2akvvKb7dChFVPCJkl30VJAWkUAE1prO5xc4agnenNZg
         QLF/ZT8KKtTcQ==
Date:   Mon, 16 Dec 2019 11:51:45 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sean Paul <seanpaul@chromium.org>,
        Lyude Paul <lyude@redhat.com>
Subject: linux-next: manual merge of the drm-misc tree with Linus' tree
Message-ID: <20191216115145.4f5cc123@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/frIcPPG8WbhjeYa/mWDsggn";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/frIcPPG8WbhjeYa/mWDsggn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  include/drm/drm_dp_mst_helper.h

between commit:

  14692a3637d4 ("drm/dp_mst: Add probe_lock")

from the Linus' tree and commit:

  f79489074c59 ("drm/dp_mst: Clear all payload id tables downstream when in=
itializing")

from the drm-misc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/drm/drm_dp_mst_helper.h
index d5fc90b30487,a448d701dc7e..000000000000
--- a/include/drm/drm_dp_mst_helper.h
+++ b/include/drm/drm_dp_mst_helper.h
@@@ -565,18 -495,18 +566,25 @@@ struct drm_dp_mst_topology_mgr=20
  	 */
  	struct mutex lock;
 =20
 +	/**
 +	 * @probe_lock: Prevents @work and @up_req_work, the only writers of
 +	 * &drm_dp_mst_port.mstb and &drm_dp_mst_branch.ports, from racing
 +	 * while they update the topology.
 +	 */
 +	struct mutex probe_lock;
 +
  	/**
- 	 * @mst_state: If this manager is enabled for an MST capable port. False
- 	 * if no MST sink/branch devices is connected.
+ 	 * @mst_state: If this manager is enabled for an MST capable port.
+ 	 * False if no MST sink/branch devices is connected.
  	 */
- 	bool mst_state;
+ 	bool mst_state : 1;
+=20
+ 	/**
+ 	 * @payload_id_table_cleared: Whether or not we've cleared the payload
+ 	 * ID table for @mst_primary. Protected by @lock.
+ 	 */
+ 	bool payload_id_table_cleared : 1;
+=20
  	/**
  	 * @mst_primary: Pointer to the primary/first branch device.
  	 */

--Sig_/frIcPPG8WbhjeYa/mWDsggn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl321SEACgkQAVBC80lX
0GxkGggAlbCXpG7jCrvVDB2pJnRYmmHYGa9snqllJr3avUva39HJgOEHVcZKjNou
zbOWU2JW9iWxm7n5ar3bFomH+r3/tE1T1/KmxTKF+PmFSKAzptMyeJ4MM8D+iZb7
cyu3+jG0bOouRrwNrdGV5UD4WHig9KR67geBY6a6iIheMk9J3j+ngR0obs9D89iZ
9A08yTnaYEdqjwnBgQLF85N3PCdygZ01FGjXypM98yxGtDQhCbVV78ybJBJGJR97
eZB3CNimqXjU5ExSnd6/sEifeF+6jxnzv5B+S2nChf6nUdMSvSegXGFhktIKg18W
TC4XZ+bFPFiCQj+tEgpqk/WsqCybOA==
=3+Ni
-----END PGP SIGNATURE-----

--Sig_/frIcPPG8WbhjeYa/mWDsggn--
