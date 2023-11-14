Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F3F97EA782
	for <lists+linux-next@lfdr.de>; Tue, 14 Nov 2023 01:31:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbjKNAb1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 13 Nov 2023 19:31:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbjKNAbZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 13 Nov 2023 19:31:25 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C16FD48;
        Mon, 13 Nov 2023 16:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1699921876;
        bh=VyI7R1XJebV+RTSJaiiX2a3dm6cnIzCQjDXJv9HV42Q=;
        h=Date:From:To:Cc:Subject:From;
        b=KfjQUAm/j8b26226HhYFrqRDhEhRMFsiOfQlNa14l3DL2upMwkBJn+MP3XzrKmWJX
         077K+WpFGUd2ldtXrCGvEnzzpBbn/Ti7PQPhGCX91Bhf0y6VFafmqdZp49Ir1MhdQO
         xxMUbwFq/biTmwBJ92O0Zxx3Z4uad/hEb36yU9tSp3aCLOdKDlH8OuWhkai4Xmygmk
         By2g9PHF/xXSl9vAjNaY8fhMiy6qj1zfvHVJaoAWRyE/dHcggC+qTVFtGo7ev6/WQJ
         U8/0c0ctTd8TWd6HlNoYIFGW7X/Bc4ft+HEN/x5sxf+rMA8fygv3UXh8KJZM1DS8gp
         F9BBYsD1uxGbA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4STnKH6wJdz4xPf;
        Tue, 14 Nov 2023 11:31:15 +1100 (AEDT)
Date:   Tue, 14 Nov 2023 11:31:15 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Subject: linux-next: manual merge of the drm-misc tree with Linus' tree
Message-ID: <20231114113115.50d8897b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/eqWRtQTT.il/dL4kPz8ZHTr";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/eqWRtQTT.il/dL4kPz8ZHTr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/accel/ivpu/ivpu_ipc.c

between commit:

  b0873eead1d1 ("accel/ivpu: Do not use wait event interruptible")

from Linus' tree and commit:

  57c7e3e4800a ("accel/ivpu: Stop job_done_thread on suspend")

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

diff --cc drivers/accel/ivpu/ivpu_ipc.c
index a4ca40b184d4,618dbc17df80..000000000000
--- a/drivers/accel/ivpu/ivpu_ipc.c
+++ b/drivers/accel/ivpu/ivpu_ipc.c
@@@ -210,10 -227,9 +227,9 @@@ int ivpu_ipc_receive(struct ivpu_devic
  	struct ivpu_ipc_rx_msg *rx_msg;
  	int wait_ret, ret =3D 0;
 =20
 -	wait_ret =3D wait_event_interruptible_timeout(cons->rx_msg_wq,
 -						    ivpu_ipc_rx_need_wakeup(cons),
 -						    msecs_to_jiffies(timeout_ms));
 +	wait_ret =3D wait_event_timeout(cons->rx_msg_wq,
- 				      (IS_KTHREAD() && kthread_should_stop()) ||
- 				      !list_empty(&cons->rx_msg_list),
++				      ivpu_ipc_rx_need_wakeup(cons),
 +				      msecs_to_jiffies(timeout_ms));
 =20
  	if (IS_KTHREAD() && kthread_should_stop())
  		return -EINTR;

--Sig_/eqWRtQTT.il/dL4kPz8ZHTr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVSv9MACgkQAVBC80lX
0GwKGggAjViPYtwE+f7RJt8XxG/Pu7P7WKIVk4jMfxX2VcRQHijKD00gEXBYexuL
Bh0kQse6ZKryuWBIFtK1MfeSYN471aiERjaS2FyWy0Jq58UuDioHPrhrrtdh5G8T
qi88iOTYwdCKSWYelJS8cblkqjx6TdCle4wN0CcDkTahOJHQBrbaPtZDJQ8gZNdg
+t1Us9f1KCf4WTktL1znkBhOWphZBxV1Jtk03wQuzikTIV2iJemiwa2L4tCmmFNy
8ZERvUPQsJD0IlgJfBH1LKUzUsFkgoevADTOOYxZ62aQwlxuJpiaYE7+XaDqzpzt
Gbdk0zJo10LVpY5Im1BtH1cY7PoRww==
=DGv6
-----END PGP SIGNATURE-----

--Sig_/eqWRtQTT.il/dL4kPz8ZHTr--
