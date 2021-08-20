Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B477A3F257C
	for <lists+linux-next@lfdr.de>; Fri, 20 Aug 2021 06:02:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbhHTEDP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 20 Aug 2021 00:03:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbhHTEDO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 20 Aug 2021 00:03:14 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EB0CC061575;
        Thu, 19 Aug 2021 21:02:37 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GrSdh2N8wz9sW5;
        Fri, 20 Aug 2021 14:02:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1629432153;
        bh=khty1iOuxfdbUew6B45NEseXJ9ZzENIZKm/tQ1oniWI=;
        h=Date:From:To:Cc:Subject:From;
        b=GfDBpt2eFhuuqwsBsMzYzsS3bvWBPQbgalVSLUQ3YwSm8M4fBvUB9kYe1rcOtukdJ
         bMwyV0aVIHUH3JskR+u1CYLqYMreVbW8HaE7gnRBfp8w9MQHbhDrqOSYL5pan91jxT
         OeXsbMxSFeiGrpefHJzEOudbUIx473gv9zG6nGSmCc7bKGKSfrjvjhIshC5xyG94og
         s088GMCoGZ6CWDIYTv60kpGDKnpdW/Un6mA0WZ+xy8qrkWmJPpE7Cie+1KXfPNovQD
         +02AuIWXYurkTDtYh3DcPM9Cacil2NWYNlmd9gdMP7qEYz9bkuwm1oWsyjILOybceh
         xNoPgHf7RvK0Q==
Date:   Fri, 20 Aug 2021 14:02:30 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steven Rostedt <rostedt@goodmis.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Hu Haowen <src.res@email.cn>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the ftrace tree with the jc_docs tree
Message-ID: <20210820140230.42f20261@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5KojakVG3fe88U8zvbuo2K7";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/5KojakVG3fe88U8zvbuo2K7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ftrace tree got a conflict in:

  MAINTAINERS

between commit:

  0c3b533cfdd5 ("MAINTAINERS: add entry for traditional Chinese documentati=
on")

from the jc_docs tree and commit:

  db396be6ddc4 ("MAINTAINERS: Add an entry for os noise/latency")

from the ftrace tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc MAINTAINERS
index 34cbc59bbea0,4268644cf86a..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -18921,14 -18798,20 +18921,28 @@@ F:	arch/x86/mm/testmmiotrace.
  F:	include/linux/mmiotrace.h
  F:	kernel/trace/trace_mmiotrace.c
 =20
+ TRACING OS NOISE / LATENCY TRACERS
+ M:	Steven Rostedt <rostedt@goodmis.org>
+ M:	Daniel Bristot de Oliveira <bristot@kernel.org>
+ S:	Maintained
+ F:	kernel/trace/trace_osnoise.c
+ F:	include/trace/events/osnoise.h
+ F:	kernel/trace/trace_hwlat.c
+ F:	kernel/trace/trace_irqsoff.c
+ F:	kernel/trace/trace_sched_wakeup.c
+ F:	Documentation/trace/osnoise-tracer.rst
+ F:	Documentation/trace/timerlat-tracer.rst
+ F:	Documentation/trace/hwlat_detector.rst
+ F:	arch/*/kernel/trace.c
+=20
 +TRADITIONAL CHINESE DOCUMENTATION
 +M:	Hu Haowen <src.res@email.cn>
 +L:	linux-doc-tw-discuss@lists.sourceforge.net
 +S:	Maintained
 +W:	https://github.com/srcres258/linux-doc
 +T:	git git://github.com/srcres258/linux-doc.git doc-zh-tw
 +F:	Documentation/translations/zh_TW/
 +
  TRIVIAL PATCHES
  M:	Jiri Kosina <trivial@kernel.org>
  S:	Maintained

--Sig_/5KojakVG3fe88U8zvbuo2K7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEfKVYACgkQAVBC80lX
0Gz7Cgf+MdoutnKGt3CRYmocgMbHkJz95eYIESOiqZpeNxbx2QrRtQW8AvT58Y2/
xP+Z55//koc7PuIYXZ7c9z72lnZcMb/gfvIGsoXqGHIWS0ByKGyqBNxvvmZTABZi
jwzEohoiEfa66wf5j4wST5PYjY/79qAqvh5MqViWb574ctAWW5oTC9OdQ1Lyd3dS
Dcbhn4xVh3mvR7+X+46G5BxWRBdyx/+jG8Kks98vtwFiarABLsLRZZbdYY6sISV1
HXWurqvTrDQb3cmx6Rq0MbY3o/mZ9QgkVHqU1R8GyUsgrJtvxR44YhvN/o0Phq2H
qbwtANked+MJFb3ESdmLEfUsgevnZw==
=dMVz
-----END PGP SIGNATURE-----

--Sig_/5KojakVG3fe88U8zvbuo2K7--
