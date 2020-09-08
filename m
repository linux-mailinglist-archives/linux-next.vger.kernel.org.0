Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E1A5260F4F
	for <lists+linux-next@lfdr.de>; Tue,  8 Sep 2020 12:10:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728828AbgIHKKA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Sep 2020 06:10:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728904AbgIHKJ6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Sep 2020 06:09:58 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79922C061573;
        Tue,  8 Sep 2020 03:09:58 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Bm19C57rzz9sSn;
        Tue,  8 Sep 2020 20:09:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1599559795;
        bh=lZRo1AJe7NLghAYxOdxi4cCYXbYQD+UNnbH2B1wnMj0=;
        h=Date:From:To:Cc:Subject:From;
        b=kvtUP+uoKjyjyJARJFVxeb0aD7q+MFWOU5DWMkgCceUDlPDvEfMysVBzqe/2GnT/z
         DhqwqIqhlMs87rWP1PC+upmkLhVKB00lkveXP/ze6H4DOeOO/PJPecZpVDh+mksOB4
         TjIvtYunH+2QZhpc5EJsfrYZkiJQhhOR93CxSndYNx9Sbcpu0LdbQGFxVJJzanto2s
         ZK0WJEXTVAMbInCFXJDxtoRathJV9Vlr6Fiz6st42hI4ZtP2p/YcrwP8E0yvHUYTXz
         mOMkVIdQlfdWl1nIheTSawvQ/mSeHQJljDzR4SRlQCHxye0Rx1arnsbxuzBmV/Rfrt
         YHINsBKoq8oMQ==
Date:   Tue, 8 Sep 2020 20:09:50 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Miklos Szeredi <miklos@szeredi.hu>
Cc:     Dan Williams <dan.j.williams@intel.com>,
        Juergen Gross <jgross@suse.com>,
        Roger Pau Monne <roger.pau@citrix.com>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
        Vivek Goyal <vgoyal@redhat.com>,
        Sebastien Boeuf <sebastien.boeuf@intel.com>,
        Liu Bo <bo.liu@linux.alibaba.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build failure after merge of the akpm-current tree
Message-ID: <20200908200950.1368e71b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/463AYpVOlzwrXrwSpvMOZun";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/463AYpVOlzwrXrwSpvMOZun
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm-current tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/xen/unpopulated-alloc.c: In function 'fill_list':
drivers/xen/unpopulated-alloc.c:30:9: error: 'struct dev_pagemap' has no me=
mber named 'res'; did you mean 'ref'?
   30 |  pgmap->res.name =3D "Xen scratch";
      |         ^~~
      |         ref
drivers/xen/unpopulated-alloc.c:31:9: error: 'struct dev_pagemap' has no me=
mber named 'res'; did you mean 'ref'?
   31 |  pgmap->res.flags =3D IORESOURCE_MEM | IORESOURCE_BUSY;
      |         ^~~
      |         ref
drivers/xen/unpopulated-alloc.c:33:51: error: 'struct dev_pagemap' has no m=
ember named 'res'; did you mean 'ref'?
   33 |  ret =3D allocate_resource(&iomem_resource, &pgmap->res,
      |                                                   ^~~
      |                                                   ref
In file included from include/asm-generic/memory_model.h:5,
                 from arch/x86/include/asm/page.h:76,
                 from arch/x86/include/asm/thread_info.h:12,
                 from include/linux/thread_info.h:38,
                 from arch/x86/include/asm/preempt.h:7,
                 from include/linux/preempt.h:78,
                 from include/linux/spinlock.h:51,
                 from include/linux/mmzone.h:8,
                 from include/linux/gfp.h:6,
                 from drivers/xen/unpopulated-alloc.c:3:
drivers/xen/unpopulated-alloc.c:53:35: error: 'struct dev_pagemap' has no m=
ember named 'res'; did you mean 'ref'?
   53 |   xen_pfn_t pfn =3D PFN_DOWN(pgmap->res.start);
      |                                   ^~~
include/linux/pfn.h:20:23: note: in definition of macro 'PFN_DOWN'
   20 | #define PFN_DOWN(x) ((x) >> PAGE_SHIFT)
      |                       ^
drivers/xen/unpopulated-alloc.c:58:30: error: 'struct dev_pagemap' has no m=
ember named 'res'; did you mean 'ref'?
   58 |     release_resource(&pgmap->res);
      |                              ^~~
      |                              ref
drivers/xen/unpopulated-alloc.c:69:28: error: 'struct dev_pagemap' has no m=
ember named 'res'; did you mean 'ref'?
   69 |   release_resource(&pgmap->res);
      |                            ^~~
      |                            ref
fs/fuse/virtio_fs.c: In function 'virtio_fs_setup_dax':
fs/fuse/virtio_fs.c:838:9: error: 'struct dev_pagemap' has no member named =
'res'; did you mean 'ref'?
  838 |  pgmap->res =3D (struct resource){
      |         ^~~
      |         ref

Caused by commit

  b3e022c5a68c ("mm/memremap_pages: convert to 'struct range'")

interacting with commit

  9e2369c06c8a ("xen: add helpers to allocate unpopulated memory")

from Linus' tree (in v5.9-rc4) and commit

  7e833303db20 ("virtiofs: set up virtio_fs dax_device")

from the fuse tree.

I have added the following patch which may require more work but at
least makes it all build.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 8 Sep 2020 20:00:20 +1000
Subject: [PATCH] merge fix up for "mm/memremap_pages: convert to 'struct
 range'"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/xen/unpopulated-alloc.c | 15 +++++++++------
 fs/fuse/virtio_fs.c             |  3 +--
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/xen/unpopulated-alloc.c b/drivers/xen/unpopulated-allo=
c.c
index 3b98dc921426..9fa7ce330628 100644
--- a/drivers/xen/unpopulated-alloc.c
+++ b/drivers/xen/unpopulated-alloc.c
@@ -18,6 +18,7 @@ static unsigned int list_count;
 static int fill_list(unsigned int nr_pages)
 {
 	struct dev_pagemap *pgmap;
+	struct resource res;
 	void *vaddr;
 	unsigned int i, alloc_pages =3D round_up(nr_pages, PAGES_PER_SECTION);
 	int ret;
@@ -27,10 +28,10 @@ static int fill_list(unsigned int nr_pages)
 		return -ENOMEM;
=20
 	pgmap->type =3D MEMORY_DEVICE_GENERIC;
-	pgmap->res.name =3D "Xen scratch";
-	pgmap->res.flags =3D IORESOURCE_MEM | IORESOURCE_BUSY;
+	res.name =3D "Xen scratch";
+	res.flags =3D IORESOURCE_MEM | IORESOURCE_BUSY;
=20
-	ret =3D allocate_resource(&iomem_resource, &pgmap->res,
+	ret =3D allocate_resource(&iomem_resource, &res,
 				alloc_pages * PAGE_SIZE, 0, -1,
 				PAGES_PER_SECTION * PAGE_SIZE, NULL, NULL);
 	if (ret < 0) {
@@ -38,6 +39,8 @@ static int fill_list(unsigned int nr_pages)
 		kfree(pgmap);
 		return ret;
 	}
+	pgmap->range.start =3D res.start;
+	pgmap->range.end =3D res.end;
=20
 #ifdef CONFIG_XEN_HAVE_PVMMU
         /*
@@ -50,12 +53,12 @@ static int fill_list(unsigned int nr_pages)
          * conflict with any devices.
          */
 	if (!xen_feature(XENFEAT_auto_translated_physmap)) {
-		xen_pfn_t pfn =3D PFN_DOWN(pgmap->res.start);
+		xen_pfn_t pfn =3D PFN_DOWN(res.start);
=20
 		for (i =3D 0; i < alloc_pages; i++) {
 			if (!set_phys_to_machine(pfn + i, INVALID_P2M_ENTRY)) {
 				pr_warn("set_phys_to_machine() failed, no memory added\n");
-				release_resource(&pgmap->res);
+				release_resource(&res);
 				kfree(pgmap);
 				return -ENOMEM;
 			}
@@ -66,7 +69,7 @@ static int fill_list(unsigned int nr_pages)
 	vaddr =3D memremap_pages(pgmap, NUMA_NO_NODE);
 	if (IS_ERR(vaddr)) {
 		pr_err("Cannot remap memory range\n");
-		release_resource(&pgmap->res);
+		release_resource(&res);
 		kfree(pgmap);
 		return PTR_ERR(vaddr);
 	}
diff --git a/fs/fuse/virtio_fs.c b/fs/fuse/virtio_fs.c
index da3ede268604..8f27478497fa 100644
--- a/fs/fuse/virtio_fs.c
+++ b/fs/fuse/virtio_fs.c
@@ -835,8 +835,7 @@ static int virtio_fs_setup_dax(struct virtio_device *vd=
ev, struct virtio_fs *fs)
 	 * initialize a struct resource from scratch (only the start
 	 * and end fields will be used).
 	 */
-	pgmap->res =3D (struct resource){
-		.name =3D "virtio-fs dax window",
+	pgmap->range =3D (struct range){
 		.start =3D (phys_addr_t) cache_reg.addr,
 		.end =3D (phys_addr_t) cache_reg.addr + cache_reg.len - 1,
 	};
--=20
2.28.0

--=20
Cheers,
Stephen Rothwell

--Sig_/463AYpVOlzwrXrwSpvMOZun
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9XWG4ACgkQAVBC80lX
0Gxhmwf+NLeJukOXVPVJpQjC16HWxFr2fVzBlL1BbTvwoJu2+SdA3yB8sSNMuaCN
qiQG4Kh85SCiy5yMOcUTr2Jz7L8Zifngm+D/dElX+h4Tofx1x3Ns5aE+JA6cH16T
KUIyJ1FbuEKAVloc8IGTDxrZUk7nr8dYFbix6riC4lbAtka6REz8uvZP1p0wgruu
D3cvcZJ1DlOBG7B6Lk02HxocnajBZIm6VO6ASy6h4oDq8coC456VaXc+7CEdw1CI
xkbO9T+d01AGKKSN5NjPvUbAZFFVKnL64TuUmRq4CLbfbusYWwbdKXHv4SIt4h5J
guVYTeALpDbTndVVOiPuJ/YtedtdZw==
=l7Y1
-----END PGP SIGNATURE-----

--Sig_/463AYpVOlzwrXrwSpvMOZun--
