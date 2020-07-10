Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 475C021AE24
	for <lists+linux-next@lfdr.de>; Fri, 10 Jul 2020 06:43:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725995AbgGJEn5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 10 Jul 2020 00:43:57 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:47681 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725966AbgGJEn5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 10 Jul 2020 00:43:57 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B30mm0JJ9z9sRN;
        Fri, 10 Jul 2020 14:43:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594356234;
        bh=POJ600ZaL0vR6HFdOG+eyDix9lK7DSBclDi3v+T0T5I=;
        h=Date:From:To:Cc:Subject:From;
        b=CFMG762AlX2r72WFWIk+QPH/sFqbcP+aM1EoydHkr5/sdhIKrveq0WrPp3vP+pv8Q
         XcAbOwTs5s9la3txT7R20p8BkPTjznZ96hXEToad0IGofcO6/oZy+hciu2hm7YAFxj
         jvnywcCibQMuqqIjOeFlnZ1Gh29W4u+sOsT+NZwKDQsdSVyE/Rj/LT3qIqrmvgsaNj
         OWc9K3Dp8lHPWPRDW1c7bjl1MuxfwJ7VJT02ljz4m3ixRQubpkU29zgDMUhLYXzN/+
         n+G1GGc3Vxyp9ku9eikA993hd1VTXJ+cy80KXaVisBEIldED4joV24NbAHQncozQ6h
         677aBOO/pt5kw==
Date:   Fri, 10 Jul 2020 14:43:49 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Mark Brown <broonie@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: linux-next: manual merge of the tip tree with the spi tree
Message-ID: <20200710144349.516fdeca@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yTtRCGx=CJcYTAFCwfz7yY+";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/yTtRCGx=CJcYTAFCwfz7yY+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  drivers/spi/spi.c

between commit:

  60a883d119ab ("spi: use kthread_create_worker() helper")

from the spi tree and commit:

  3070da33400c ("sched,spi: Convert to sched_set_fifo*()")

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

diff --cc drivers/spi/spi.c
index 1d7bba434225,5a4f0bfce474..000000000000
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@@ -1614,11 -1592,9 +1614,9 @@@ EXPORT_SYMBOL_GPL(spi_take_timestamp_po
   */
  static void spi_set_thread_rt(struct spi_controller *ctlr)
  {
- 	struct sched_param param =3D { .sched_priority =3D MAX_RT_PRIO / 2 };
-=20
  	dev_info(&ctlr->dev,
  		"will run message pump with realtime priority\n");
- 	sched_setscheduler(ctlr->kworker->task, SCHED_FIFO, &param);
 -	sched_set_fifo(ctlr->kworker_task);
++	sched_set_fifo(ctlr->kworker->task);
  }
 =20
  static int spi_init_queue(struct spi_controller *ctlr)

--Sig_/yTtRCGx=CJcYTAFCwfz7yY+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8H8gUACgkQAVBC80lX
0GwkiAgAgGdyaleocCsJP/PXIFVmxv/3Tb+hfYulC2Ldx2ys6S91TGjTXqn9ITiD
n74S9ztQ9HCcNnReZ5zuqhNjTHmo46kUBIpCtrAavxnbpWXTZVGFBvzcJWK429Fy
d7xwaud80AyrT6AFZSyIYKHSdovziEs6sJF4Raz5UwXcElAsxCikwOLl9SX1IrzO
yibjWSEbe2swleUm+y0yBkDqwoQBsHc91d6yEP+ypRWad+vEV8QtImvjSRRokO4+
E1SaXffHXgzOGJeHFepceAT00MTsXsCfkKfrNINXlSPXXc9JKnlwgclzN+9OmGVV
Uzd65w6fdK6Iw5sTd/wsEZOnTuZ5tQ==
=2sl+
-----END PGP SIGNATURE-----

--Sig_/yTtRCGx=CJcYTAFCwfz7yY+--
