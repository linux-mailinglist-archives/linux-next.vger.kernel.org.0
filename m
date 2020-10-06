Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77500284B4B
	for <lists+linux-next@lfdr.de>; Tue,  6 Oct 2020 14:05:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbgJFMFZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 6 Oct 2020 08:05:25 -0400
Received: from ozlabs.org ([203.11.71.1]:43043 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726248AbgJFMFZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 6 Oct 2020 08:05:25 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C5GPZ4Fz5z9sTK;
        Tue,  6 Oct 2020 23:05:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601985922;
        bh=V7t/KbI24qB0mFMuwivDsNixxT/ei5wb0/EpytKcEcg=;
        h=Date:From:To:Cc:Subject:From;
        b=F4NPPTfuBK9fkp+5BVY/ZtLKY4tkb/2vjl1z4hto0Z2MtxL7KzD2sNwL41CTuQ6N8
         6VEILByjwUxNO03R7t1GlzCa+vZaEqGNoHM9fcwRUDU7sF6ybanFn7IMHWJGPZYvKN
         W9kYXroIfddDYbbIKumCy1zkxuDEQ049jrf/fGK8t+/FTrALpcP37wFYsbZLWYRbrf
         3mqSjc+lWAkYIrNseLhhrqmQ/9rCtSQ3BH2dpIgKBihoUT9z0Plkh44LJWx3N4MIOK
         yKMH4hDjiTTTgR3Bt2WPf+xs3H/2Z5xga7dcmRHvy5iLekPZzqA7TDN9kL/mXgU+Ki
         BH671miJJTVDA==
Date:   Tue, 6 Oct 2020 23:05:16 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Peter Xu <peterx@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the akpm-current tree
Message-ID: <20201006230516.64f7b17f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VdaJs1DRKyd.OsHkFmrYWuN";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/VdaJs1DRKyd.OsHkFmrYWuN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm-current tree, today's linux-next build (sparc
defconfig) produced this warning:

mm/memory.c: In function 'copy_present_page':
mm/memory.c:800:20: warning: unused variable 'dst_mm' [-Wunused-variable]
  struct mm_struct *dst_mm =3D dst_vma->vm_mm;
                    ^~~~~~
mm/memory.c: In function 'copy_present_pte':
mm/memory.c:889:20: warning: unused variable 'dst_mm' [-Wunused-variable]
  struct mm_struct *dst_mm =3D dst_vma->vm_mm;
                    ^~~~~~

Maybe introduced by commit

  7e6cdccef3df ("mm-remove-src-dst-mm-parameter-in-copy_page_range-v2")

--=20
Cheers,
Stephen Rothwell

--Sig_/VdaJs1DRKyd.OsHkFmrYWuN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl98XXwACgkQAVBC80lX
0GxgdQf+LMC6YH2RSBoXYKVSZ0lOZ6kQ1c3TBGXk5ylUwoDGqRCwIYTr3uYe8OS7
YFVRJugZxVRQbXj/Q6Ew1lOoGsQWXIygpRQdziHpxfaQBQ2hpTe4czZfHGtv+m2b
FRaqa15wCCbOAL1WrqkDaZIAgU7LMfsv15DF52+rTHi9gl57W7ywVoLGpGSzxn5K
Ewpuqsfx6LaEa3gbzB2mxLTbRwdraJPaJXJSF7Kwhb8DhqMy3gC/xtTIQaqGfOKx
/yX5RPW7GAu/IBLm9k1c++iqjTA+NPCVNx7NRHFVaJ++jO9TaGDlm3bfsAC5Qwas
9NsYcUXbZveBRD8aZqqYHrXetlXhbg==
=/xoz
-----END PGP SIGNATURE-----

--Sig_/VdaJs1DRKyd.OsHkFmrYWuN--
