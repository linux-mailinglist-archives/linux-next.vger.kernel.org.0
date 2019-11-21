Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 873DD104975
	for <lists+linux-next@lfdr.de>; Thu, 21 Nov 2019 04:54:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726014AbfKUDyL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 Nov 2019 22:54:11 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:49761 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725842AbfKUDyL (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 20 Nov 2019 22:54:11 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47JQfM4Bydz9sPV;
        Thu, 21 Nov 2019 14:54:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1574308448;
        bh=HyzAF+NbAj3ZEvp+YZR2B5zi9YxVvmPTkJQX0jphq5s=;
        h=Date:From:To:Cc:Subject:From;
        b=PdGarOq1X9S3LCvhOzbRgw4pZV8U1Rne8yZeM3X8bDSig9VaQLgyRjCVEx4Lzx32x
         f3EkHRa8Vvi3pbOw733TjNNejt4q/+mfClUUTDWUotGLXRXBidEE0Sg6XDPNCfKQ/e
         NajES7mJySYSAggzVTBmyHuU+sKXtl3t5cHQE1bhausd7Xf2mC4vCdOYK7wl9RUIv0
         TB966IjUlvlEycr1zh+LS6Znh3+jLq5QWKGO06LbmnEjWkZW9YRaLGVi8a1j9ay9k5
         7LVlk67qbN2/8KaAe9WAWnYAd/aX39ZDmqkH/NhKQIH0wNb4VVn3hh+KAmeK8lp20O
         N0nP8d7mNwDog==
Date:   Thu, 21 Nov 2019 14:54:03 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kevin Wang <kevin1.wang@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>
Subject: linux-next: build failure after merge of the tip tree
Message-ID: <20191121145403.46789cb5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6nJncfZqw2XrrBb4gmo.xLN";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/6nJncfZqw2XrrBb4gmo.xLN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

In file included from include/trace/define_trace.h:102,
                 from drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h:502,
                 from drivers/gpu/drm/amd/amdgpu/amdgpu_trace_points.c:29:
include/trace/../../drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h:476:52: error=
: expected expression before ';' token
  476 |         __string(ring, sched_job->base.sched->name);
      |                                                    ^
include/trace/trace_events.h:435:2: note: in definition of macro 'DECLARE_E=
VENT_CLASS'
  435 |  tstruct        \
      |  ^~~~~~~
include/trace/trace_events.h:77:9: note: in expansion of macro 'PARAMS'
   77 |         PARAMS(tstruct),         \
      |         ^~~~~~
include/trace/../../drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h:472:1: note: =
in expansion of macro 'TRACE_EVENT'
  472 | TRACE_EVENT(amdgpu_ib_pipe_sync,
      | ^~~~~~~~~~~
include/trace/../../drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h:475:6: note: =
in expansion of macro 'TP_STRUCT__entry'
  475 |      TP_STRUCT__entry(
      |      ^~~~~~~~~~~~~~~~

Caused by commit

  2c2fdb8bca29 ("drm/amdgpu: fix amdgpu trace event print string format err=
or")

from the drm tree interacting with commit

  60fdad00827c ("ftrace: Rework event_create_dir()")

from the tip tree.

I have added the following merge fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 21 Nov 2019 14:46:00 +1100
Subject: [PATCH] merge fix for "ftrace: Rework event_create_dir()"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_trace.h
index f940526c5889..63e734a125fb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
@@ -473,7 +473,7 @@ TRACE_EVENT(amdgpu_ib_pipe_sync,
 	    TP_PROTO(struct amdgpu_job *sched_job, struct dma_fence *fence),
 	    TP_ARGS(sched_job, fence),
 	    TP_STRUCT__entry(
-			     __string(ring, sched_job->base.sched->name);
+			     __string(ring, sched_job->base.sched->name)
 			     __field(uint64_t, id)
 			     __field(struct dma_fence *, fence)
 			     __field(uint64_t, ctx)
--=20
2.23.0

--=20
Cheers,
Stephen Rothwell

--Sig_/6nJncfZqw2XrrBb4gmo.xLN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3WClsACgkQAVBC80lX
0Gy2OAf9EyXiwTJsRzceW1iTFyC+UI+w6fYgYlkNSasyj1fIqxj9flyI/tDEyI33
t2128Zxozu+9UTfHjSaTDSy2o5wnvEeYZO39pMV4YFezPcso7KLDtl9Ryr9LTodv
+XRy2/letnvyADGVu82b0vyulcQnjrVgfOOFBHbpNZc0M0NUYMafuj3ONl1g0If8
sesZL0RaM7s3MqyyoKQEB2lHUuwuzndfh9x1Bub4t5+LGeWxTd0ReT3as1za5Zct
GQk8aOH/9kNIxcNA6HUSUPd6bxDnITq7yyGVbOyfYN8fmeN7wO+8qEO5kQhHmKbJ
IZxtGfq7Or1OaGdsZoUYg/xtwlqdNQ==
=eF8H
-----END PGP SIGNATURE-----

--Sig_/6nJncfZqw2XrrBb4gmo.xLN--
