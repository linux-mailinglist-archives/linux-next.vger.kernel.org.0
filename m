Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E66671CA244
	for <lists+linux-next@lfdr.de>; Fri,  8 May 2020 06:29:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725681AbgEHE3f (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 8 May 2020 00:29:35 -0400
Received: from ozlabs.org ([203.11.71.1]:51841 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725550AbgEHE3e (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 8 May 2020 00:29:34 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49JHRG3tDvz9sRf;
        Fri,  8 May 2020 14:29:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1588912173;
        bh=RQXB8rPuh7y1lmH6XmNpcRx9cxb29ebZDhSL2BWaWGE=;
        h=Date:From:To:Cc:Subject:From;
        b=Kmk0Qc6jV47rfbR4JJMZVgjQ0mq8aZLc+0V/3bzayxQw46n4OF8x+wPXXoFt+UykK
         GFhfSGWGUi66BNnBaQ77CYF+xshVShMAK6ds6KrUj/1H8At4lcNLBxEBs8XiDxUrK3
         Yhm5/X+WUN9QQALZ88Z6fcTpR6w8+FFeHUuln1NgN3wSeLUsxtDaXgk9QPtXo5Gxfe
         FGgzA8DQLNnnZCQNgnaDQNtdOOJuIvaCRYNH9AODgfuRrg4semAkauxpwjBLeHYmoA
         nUopS9xE0Hcnru08X0/1qnCZ/TKtEPyGhi2861++jyBU0+OcBxchMHW0KBnFK6KFbz
         TsNspZ5zs69lg==
Date:   Fri, 8 May 2020 14:29:28 +1000
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
        Chris Wilson <chris@chris-wilson.co.uk>
Subject: linux-next: build failure after merge of the drm tree
Message-ID: <20200508142928.05cde878@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/e.nyMLmvHLl8O.HE3RkDMhs";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/e.nyMLmvHLl8O.HE3RkDMhs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

In file included from include/asm-generic/bug.h:19,
                 from arch/x86/include/asm/bug.h:83,
                 from include/linux/bug.h:5,
                 from include/linux/seq_file.h:7,
                 from include/drm/drm_print.h:31,
                 from drivers/gpu/drm/i915/gt/intel_engine_cs.c:25:
drivers/gpu/drm/i915/gt/intel_engine_cs.c: In function 'intel_engine_print_=
registers':
drivers/gpu/drm/i915/gt/intel_engine_cs.c:1428:31: error: 'struct intel_con=
text' has no member named 'lrc_desc'
 1428 |      upper_32_bits(rq->context->lrc_desc));
      |                               ^~
drivers/gpu/drm/i915/gt/intel_engine_cs.c:1440:31: error: 'struct intel_con=
text' has no member named 'lrc_desc'
 1440 |      upper_32_bits(rq->context->lrc_desc));
      |                               ^~
In file included from include/linux/interrupt.h:6,
                 from drivers/gpu/drm/i915/gt/intel_lrc.c:134:
drivers/gpu/drm/i915/gt/intel_lrc.c: In function 'active_context':
drivers/gpu/drm/i915/gt/intel_lrc.c:2850:32: error: 'struct intel_context' =
has no member named 'lrc_desc'
 2850 |   if (upper_32_bits(rq->context->lrc_desc) =3D=3D ccid) {
      |                                ^~
drivers/gpu/drm/i915/gt/intel_lrc.c:2859:32: error: 'struct intel_context' =
has no member named 'lrc_desc'
 2859 |   if (upper_32_bits(rq->context->lrc_desc) =3D=3D ccid) {
      |                                ^~

Caused by commit

  53b2622e7746 ("drm/i915/execlists: Avoid reusing the same logical CCID")

from the drm-intel-fixes tree interacting with commits

  606727842d8b ("drm/i915/gt: Include the execlists CCID of each port in th=
e engine dump")
  4c977837ba29 ("drm/i915/execlists: Peek at the next submission for error =
interrupts")

from the drm tree.

I have added teh following merge fix patch.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 8 May 2020 14:21:40 +1000
Subject: [PATCH] drm/i915/execlists: fix up for "Avoid reusing the same log=
ical CCID"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c | 4 ++--
 drivers/gpu/drm/i915/gt/intel_lrc.c       | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i9=
15/gt/intel_engine_cs.c
index b1f8527f02c8..7c3cb5aedfdf 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -1425,7 +1425,7 @@ static void intel_engine_print_registers(struct intel=
_engine_cs *engine,
 			len =3D scnprintf(hdr, sizeof(hdr),
 					"\t\tActive[%d]:  ccid:%08x, ",
 					(int)(port - execlists->active),
-					upper_32_bits(rq->context->lrc_desc));
+					rq->context->lrc.ccid);
 			len +=3D print_ring(hdr + len, sizeof(hdr) - len, rq);
 			scnprintf(hdr + len, sizeof(hdr) - len, "rq: ");
 			print_request(m, rq, hdr);
@@ -1437,7 +1437,7 @@ static void intel_engine_print_registers(struct intel=
_engine_cs *engine,
 			len =3D scnprintf(hdr, sizeof(hdr),
 					"\t\tPending[%d]: ccid:%08x, ",
 					(int)(port - execlists->pending),
-					upper_32_bits(rq->context->lrc_desc));
+					rq->context->lrc.ccid);
 			len +=3D print_ring(hdr + len, sizeof(hdr) - len, rq);
 			scnprintf(hdr + len, sizeof(hdr) - len, "rq: ");
 			print_request(m, rq, hdr);
diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/=
intel_lrc.c
index 233f815c3c86..456d286c17dd 100644
--- a/drivers/gpu/drm/i915/gt/intel_lrc.c
+++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
@@ -2847,7 +2847,7 @@ active_context(struct intel_engine_cs *engine, u32 cc=
id)
 	 */
=20
 	for (port =3D el->active; (rq =3D *port); port++) {
-		if (upper_32_bits(rq->context->lrc_desc) =3D=3D ccid) {
+		if (rq->context->lrc.ccid =3D=3D ccid) {
 			ENGINE_TRACE(engine,
 				     "ccid found at active:%zd\n",
 				     port - el->active);
@@ -2856,7 +2856,7 @@ active_context(struct intel_engine_cs *engine, u32 cc=
id)
 	}
=20
 	for (port =3D el->pending; (rq =3D *port); port++) {
-		if (upper_32_bits(rq->context->lrc_desc) =3D=3D ccid) {
+		if (rq->context->lrc.ccid =3D=3D ccid) {
 			ENGINE_TRACE(engine,
 				     "ccid found at pending:%zd\n",
 				     port - el->pending);
--=20
2.26.2

--=20
Cheers,
Stephen Rothwell

--Sig_/e.nyMLmvHLl8O.HE3RkDMhs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl604CgACgkQAVBC80lX
0GyuCQf/bCPaY923Ltga+uVnvu2+bMet/ju0S6gT8ZEkVZm7RQm541Baslq8hB6d
dlUv3F3qRXJ9M5OJlP9HvmOJMSP3gygYHtFYDhuILvlOyjH2VCDwrccfaFRNGi3U
52ZeDWVsGlEUyVrMLEphJ9Rad6IAEEHUactBa/K1flYyjNa6ZAax3CQjnwSgKbm5
ANN5tbW3Fjs1HFkGjGTw6ja9RAqFo0/b+TU3AXZQdvDdpzeD8BeBOQwiQCd7yP6h
CXdz1lha86iNUyvuBgFAwJRQXlT+S3rx6xXTrCMuUSaHu0+Vsr54q1hFe1wyEEuR
JK30f87thgOzc23PGy4P+XNRX5BmNw==
=JUUx
-----END PGP SIGNATURE-----

--Sig_/e.nyMLmvHLl8O.HE3RkDMhs--
