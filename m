Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DE6722E57E
	for <lists+linux-next@lfdr.de>; Mon, 27 Jul 2020 07:41:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726263AbgG0FlQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 27 Jul 2020 01:41:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbgG0FlP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 27 Jul 2020 01:41:15 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BA37C0619D2;
        Sun, 26 Jul 2020 22:41:15 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BFTF208nPz9sRN;
        Mon, 27 Jul 2020 15:41:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1595828471;
        bh=s4p3erzGFevm01Gdj7aMpRRftqxYAvNyjMZiFMfJ3MY=;
        h=Date:From:To:Cc:Subject:From;
        b=oSkkXWJivqVG3Rg0QPOY79tJtAhWjTAEVgO/ikQSuS0mHpCYzAxQ/zrVz/CCGLsy5
         DGhnYD6VEsVyvV0dRSzV8Ng+o8aY9ImWLdRU5gQcjonRXPqnZZDIUl5ONZ6VThXJMw
         ixwV+Ov76H9QjPGS2fi6/8d6vMA+Z080hZ2MFAExBS4HxO5LwSl8im6+XaSkDLbaqF
         e5WxRhS69MGDpCWTDTCMn4EQQPFOcTQhUlpaTbx3FEjBr3Y63dwPHJn/GcIA98nntf
         JBsHRzTtMWJNvHExcsw49gnAkr0ENqgyqQkxKBcUWVV25dtldxzNYbuY2G1ygcXDQ5
         P3UxhwCzchq6A==
Date:   Mon, 27 Jul 2020 15:41:09 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bernard Zhao <bernard@vivo.com>
Subject: linux-next: manual merge of the tip tree with the drm-msm tree
Message-ID: <20200727154109.0db13631@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pIyWRT1psHhoFprNsVI=MQ_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/pIyWRT1psHhoFprNsVI=MQ_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  drivers/gpu/drm/msm/msm_drv.c

between commit:

  00be2abf1413 ("drm/msm: use kthread_create_worker instead of kthread_run")

from the drm-msm tree and commits:

  64419ca67622 ("sched,msm: Convert to sched_set_fifo*()")
  8b700983de82 ("sched: Remove sched_set_*() return value")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/msm/msm_drv.c
index 36d98d4116ca,556cca38487c..000000000000
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@@ -524,11 -508,8 +517,7 @@@ static int msm_drm_init(struct device *
  			goto err_msm_uninit;
  		}
 =20
- 		ret =3D sched_setscheduler(priv->event_thread[i].worker->task,
- 					 SCHED_FIFO, &param);
- 		if (ret)
- 			dev_warn(dev, "event_thread set priority failed:%d\n",
- 				 ret);
 -		sched_set_fifo(priv->event_thread[i].thread);
++		sched_set_fifo(priv->event_thread[i].worker->task);
  	}
 =20
  	ret =3D drm_vblank_init(ddev, priv->num_crtcs);

--Sig_/pIyWRT1psHhoFprNsVI=MQ_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8eaPUACgkQAVBC80lX
0GxG1Qf/esI5cOOANlGu1MdPbJ6BzrS7aBgGyj7tJciBlJxb9g4A0iKKQbYX1SZX
J3atlskoxzhWK0jxrpTzHUyYtM20nHkFeQYbCmZosXCBFg1NBLaddy90BV1mOgrG
k/pWR++R3Xlpx6yTnBYXeHVvzn532xIRCfvV9GMO9qnm8VpumPiHYzqCa+24jKT7
pjDA2rrj0y4ICcw1p8kKuSm2x8S7pWzP1oOc7JiZl76a03Ivm8/JOa9aXdMSirzh
W3LCOrHKnZZ5wuEry98ONXflhRTUdsQFpZUyTxACamzrYkqcEjPNyi7YWAnyDWc2
Pobn5swG3fhuxsOciogQZBIdi8Iatg==
=qIEa
-----END PGP SIGNATURE-----

--Sig_/pIyWRT1psHhoFprNsVI=MQ_--
