Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F8A61E5CFD
	for <lists+linux-next@lfdr.de>; Thu, 28 May 2020 12:19:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387739AbgE1KTq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 May 2020 06:19:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387717AbgE1KTo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 28 May 2020 06:19:44 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B8E0C05BD1E;
        Thu, 28 May 2020 03:19:44 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49XkG56Yryz9sRY;
        Thu, 28 May 2020 20:19:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1590661182;
        bh=IszKvvDOxq/C0cwGvrIkv686ESl0u0/FYLJoye6b6ms=;
        h=Date:From:To:Cc:Subject:From;
        b=Cc6qe0AgGyw/1T9j6tw1VLeCUEz8VoG+BB9WE0GVKrJJr8O+hIrtzBOHe13ZSLWdA
         Udpwv5VGrabc/aaFEJUGGymSJEn3mqF68IwuDL44MdN3Unr+Hbk5sviNoaA/imOCiE
         bR3zgxOliDCcgv/jn5YRARl57+19Ke/ZYA5pH0oqpsMOO6XKDspmJLatkZ1R7VfasF
         Ta8BqcUw56dVuSRvA+A42fyXcxpOaxVZ61zA99ibkxD6u/63fMDYM4mItQA18SHnLm
         M6heLhKXy25nzFheP+ujFz/L21sgUyvpxldkNRTJJPbLC+ilwR7LED3nUWZzZyO4Hd
         IsFOTHAnPdtUg==
Date:   Thu, 28 May 2020 20:19:40 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Alex Deucher <alexdeucher@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mukul Joshi <mukul.joshi@amd.com>,
        Christoph Hellwig <hch@lst.de>
Subject: linux-next: build failure after merge of the akpm tree
Message-ID: <20200528201940.759c58ff@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ynU0manH9YL0PYqxaSew.4t";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ynU0manH9YL0PYqxaSew.4t
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c: In function 'kfd_sdma_a=
ctivity_worker':
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:117:2: error: implicit d=
eclaration of function 'use_mm' [-Werror=3Dimplicit-function-declaration]
  117 |  use_mm(mm);
      |  ^~~~~~
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:144:2: error: implicit d=
eclaration of function 'unuse_mm' [-Werror=3Dimplicit-function-declaration]
  144 |  unuse_mm(mm);
      |  ^~~~~~~~

Caused by commit

  d21760f76006 ("kernel: better document the use_mm/unuse_mm API contract")

interacting with commit

  522b89c63370 ("drm/amdkfd: Track SDMA utilization per process")

from the amdgpu tree.

I have added the following patch for today:

rom: Stephen Rothwell <sfr@canb.auug.org.au>
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

--Sig_/ynU0manH9YL0PYqxaSew.4t
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7PkDwACgkQAVBC80lX
0GwLZgf/f8fma9ON/CWmYBr8ou68R7zXknO8hP7vQ6YvYsPWNCjr+5dW63cj/hWk
SsdMxblbC3J4JKJ0w3meyNjR75ipV+W292mVfVk8gErGbNv1FRaQqbWzpxqvXTcn
G/LSMvbQpY4Cu/oHB2hFx0cFMl5dd2cb9DcojXq7CQUsMpqHVDZsTZRQs8FSHPoc
1j1DeFheCcA6o7Kd0/KqwHzv8ityNWd96PRAapuFbUYQfjDiN0MWb78Ng8j7JEy/
xovei7zkz7D/PJW88TljauzhPCeTtUErjXBNNsneWmUfurNE2/9shT4Zq99DkXSZ
R3s6ZYgnGFG+j+y13xxtaZYRr93STg==
=ABD0
-----END PGP SIGNATURE-----

--Sig_/ynU0manH9YL0PYqxaSew.4t--
