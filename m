Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0A181F7155
	for <lists+linux-next@lfdr.de>; Fri, 12 Jun 2020 02:25:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726294AbgFLAZ6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 11 Jun 2020 20:25:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726285AbgFLAZ6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 11 Jun 2020 20:25:58 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1605CC03E96F;
        Thu, 11 Jun 2020 17:25:58 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49jhN164F1z9sRh;
        Fri, 12 Jun 2020 10:25:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1591921554;
        bh=L8tCWPltN/xAI7QDpTH/Fy/OEUyVfxLAB5DzPFh4fHI=;
        h=Date:From:To:Cc:Subject:From;
        b=fu7kbwSRnoxqE+KziPWAoBtEFQ6QfwiRCmXT1oOnCFpiSr2Wf0irOcrkcP1YcUt2T
         vlUeEXZvaLqddhGQtOgWPpfRYBnMII8Tqp5lw5ycnlq9I6fKXRSH/yPFkECpv2kcmb
         yZ8o1FzXpHOFLcw4Q8HGO1pZO2qquvSq95ZrD/ARCGkb/hownQODRp3/3B5UzMQCQa
         ldd0uswVWvHepSCTDWfCSVyvWcxJRLOmgKVyR2N8DWJ7QUYAKf2wlTv5z3WOjK8nqy
         N7XXrIy8jRxLLphyrJvYf+r7KrNSGmgTuNOFeL8hCzvk/+8RWCxOkYnH9uKeK9wt/U
         BaW7VzSIgWRYg==
Date:   Fri, 12 Jun 2020 10:25:52 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mukul Joshi <mukul.joshi@amd.com>,
        Christoph Hellwig <hch@lst.de>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: linux-next: build failure after merge of the amdgpu tree
Message-ID: <20200612102552.2d573ebb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//YDjZ=x5XDQyQjqly7tOMoX";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_//YDjZ=x5XDQyQjqly7tOMoX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c: In function 'kfd_sdma_a=
ctivity_worker':
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:118:2: error: implicit d=
eclaration of function 'use_mm' [-Werror=3Dimplicit-function-declaration]
  118 |  use_mm(mm);
      |  ^~~~~~
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:145:2: error: implicit d=
eclaration of function 'unuse_mm' [-Werror=3Dimplicit-function-declaration]
  145 |  unuse_mm(mm);
      |  ^~~~~~~~

Caused by commit

  32cb59f31362 ("drm/amdkfd: Track SDMA utilization per process")

interacting with commit

  f5678e7f2ac3 ("kernel: better document the use_mm/unuse_mm API contract")

from Linus' tree.

I have applied the following merge fix for today (that was previously
part of the akpm tree).

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 28 May 2020 20:15:34 +1000
Subject: [PATCH] drm/amdkfd: fix up for {un}use_mm() rename

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/amd/amdkfd/kfd_process.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd=
/amdkfd/kfd_process.c
index db010c5da144..25636789f3d3 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -114,7 +114,7 @@ static void kfd_sdma_activity_worker(struct work_struct=
 *work)
 		return;
 	}
=20
-	use_mm(mm);
+	kthread_use_mm(mm);
=20
 	dqm_lock(dqm);
=20
@@ -141,7 +141,7 @@ static void kfd_sdma_activity_worker(struct work_struct=
 *work)
 	}
=20
 	dqm_unlock(dqm);
-	unuse_mm(mm);
+	kthread_unuse_mm(mm);
 	mmput(mm);
 }
=20
--=20
2.26.2

--=20
Cheers,
Stephen Rothwell

--Sig_//YDjZ=x5XDQyQjqly7tOMoX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7iy5AACgkQAVBC80lX
0GzHIAf+JkqjD5UqHEsR69FRf4puIQM1C1GuCLFncHR8C+BrCu3ZYEe0PXJN1kN7
0lsr4hRXtX4SrS3M5nPnguvR0jp/e1NENO9CmgV0PIhOAjfeiVPfLAJFMbKwtCmS
BPLobh84TIic/1w/g5pRQZrcSk023FDsvlvX0MDqCoAYrwYzIgYzwQ+E85sK1gKp
uW4+xeyxo4HjssYQ7CVXQm8nyhTf2Rlrbtp0DPEwxiguFgmIz2WcYNV+jXBNGejj
DVGOeXiI7SdqcVaonY1EVb/WM7QTPjE+3XhUyNWEOuqv7XhkOEb93bYmAJ4siWyo
MwLOD6sVOiCDPNucdpRgbFPUs4MXMQ==
=VZgp
-----END PGP SIGNATURE-----

--Sig_//YDjZ=x5XDQyQjqly7tOMoX--
