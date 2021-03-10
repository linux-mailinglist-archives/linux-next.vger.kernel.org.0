Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 160CF333401
	for <lists+linux-next@lfdr.de>; Wed, 10 Mar 2021 04:56:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231749AbhCJDzh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 9 Mar 2021 22:55:37 -0500
Received: from ozlabs.org ([203.11.71.1]:33605 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230198AbhCJDzS (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 9 Mar 2021 22:55:18 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DwJBX3QZdz9sS8;
        Wed, 10 Mar 2021 14:55:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1615348516;
        bh=zakbNknFIYHQMnNYG/AvbkGPJr+9qudfsH1E2Asq/Jo=;
        h=Date:From:To:Cc:Subject:From;
        b=AQBHURfjEbKx9y+OT+D0YI3oiH8tZHjACFmTGsOpB5ncUF2mGEAoeLlEIxY1k67jI
         Hrh74Wm4AWg7jYuIFJxGk2UVa7Q4pGtUibtENcmnb6rApcZE2bpLTlu5ZvvaGuWHSV
         5/VA2HuiI2UmMb2CM0foZYn+Pe9DBKI/8vJtGta8D0GXf9BzdxwiE+bLYOH7VQk1pD
         xPTknZrpvXU0jFqB1e+IqTnfnafYUVVplvXdmpGgkg5d6r5GLv+VD+4/lqnIBD8D3C
         TMsOwT6tYL1NdLP5Rx6atGz1ZdEpk96hP+LpvwyChC3+y8P2e4laLX0IBOFqJyWb+w
         8k5JuYYyNzOwg==
Date:   Wed, 10 Mar 2021 14:55:14 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Muchun Song <songmuchun@bytedance.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the akpm-current tree
Message-ID: <20210310145514.3f3743fe@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/aB+SV+Ej78fYNqsARToCj6N";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/aB+SV+Ej78fYNqsARToCj6N
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm-current tree, today's linux-next build (sparc64
defconfig) failed like this:

arch/sparc/mm/init_64.c:2495:4: error: implicit declaration of function 're=
gister_page_bootmem_info_node'; did you mean 'register_page_bootmem_info'? =
[-Werror=3Dimplicit-function-declaration]
    register_page_bootmem_info_node(NODE_DATA(i));
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    register_page_bootmem_info

Caused by commit

  cd28b1a6791d ("mm: memory_hotplug: factor out bootmem core functions to b=
ootmem_info.c")

grep is your friend ...

I have applied the following patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 10 Mar 2021 14:46:27 +1100
Subject: [PATCH] fix for "mm: memory_hotplug: factor out bootmem core
 functions to bootmem_info.c"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/sparc/mm/init_64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
index 182bb7bdaa0a..c709b72e81bf 100644
--- a/arch/sparc/mm/init_64.c
+++ b/arch/sparc/mm/init_64.c
@@ -27,6 +27,7 @@
 #include <linux/percpu.h>
 #include <linux/mmzone.h>
 #include <linux/gfp.h>
+#include <linux/bootmem_info.h>
=20
 #include <asm/head.h>
 #include <asm/page.h>
--=20
2.30.0

--=20
Cheers,
Stephen Rothwell

--Sig_/aB+SV+Ej78fYNqsARToCj6N
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBIQyIACgkQAVBC80lX
0GyH5wf+Jq2n5QO2uTmKb85sE+HTwp9Wk5NUI8f0bX1B7uabf6c1JdxZ96fV+NLV
vaUT3uikDRkqLmc9AN4D3IXJ360zgXpkfA3col+5v2xexmATGC9lkme0al9TzLPn
tpnLwOe+3o/9A8ThG7DXczbISRbSGxXE0GQ+4KJewqy26DXfH+4WVyyY6460hO+Z
kXo39PFvhSbNq9RUvKEpbrfCbBS1GO/9WdzRGWfkj+zkNT39fjeIcOkYaWfRBqyS
6ldiNtnq0MZHSZZiEmY8YorTxkVoQC8MSdhmqQavZYfp3E0PqWW1i6P/0SN6C+xl
D0bzTvUYkCUEhb2EAW2SdWQ3Pzg8nA==
=mu6D
-----END PGP SIGNATURE-----

--Sig_/aB+SV+Ej78fYNqsARToCj6N--
