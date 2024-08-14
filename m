Return-Path: <linux-next+bounces-3320-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C80AF95265F
	for <lists+linux-next@lfdr.de>; Thu, 15 Aug 2024 01:57:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FAFF283262
	for <lists+linux-next@lfdr.de>; Wed, 14 Aug 2024 23:57:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2B1914D433;
	Wed, 14 Aug 2024 23:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="IFfEBRrv"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFD214900E;
	Wed, 14 Aug 2024 23:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723679861; cv=none; b=M7x1uYMLt1f4hl1QxopQUkZnmpwQsvTsVU5yuqypF2Fbc0x48rpVB47C9Ajn9ET3HoeVLzW+WM4xOHgwWxhwHIlST+nNqNU5GXJ+q/8dp6GeVEtIvXfDOkOotEwgD0f27Kj6eltarm9cJhJaba8Ba/NVSizefFYJ4NjESgSm1H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723679861; c=relaxed/simple;
	bh=zZdagAj/nB+c749l2/BsbKxGaPOeBu9jRl+QnpTr6Ew=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rh3eXPmVISQiZS2/R7BPSybWtd9Im8eky3yVaUQXL0IsSq+FW8HqCG75wAkyg1N4XzjsvpQ0q9tEfrhfO879IiXTpTZx6SyIm0w5xFbbvuRfOF6AXweXFScNtP1vx+Gwz6uj4tXTvrVjc3qC/iwNCGlkCSxf3116POOiW5f+drY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=IFfEBRrv; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1723679855;
	bh=Z3ayeBSbWvFEAMa6x9onBIH7T1ibHShFjN1i9QJQoEE=;
	h=Date:From:To:Cc:Subject:From;
	b=IFfEBRrvZaTkEnweYQGh6HHP8MYZIbBJOL9/QSEqhafYndOQp1y0tqefOysfEpDzM
	 wbXgADyB8sg5UUFE3UN1vMvfWoA8MkRHWmDHJDOKU9sDtlaO7HFw7B2obwpoSoF4ta
	 XDytS1RJUUN3eo0f4A7fm82tREOk+a8PQKpLNJTno3UejVQmhrkaIxtsk7pa75RWLv
	 lysuV5uNThrAoKqO2uDQCC4+DGUjAB1YTOurhxCE1Tjwzv2vUuO2Tc6GoL9EuMcu/5
	 xeJ/uEM1+1MnS6xSy+alLm6PGK+NjKni0Apk5orXomRfkzFDPTIebm3Dw2ge4jYOuE
	 6N1TfzstcxT/Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WklYW05rTz4w2N;
	Thu, 15 Aug 2024 09:57:34 +1000 (AEST)
Date: Thu, 15 Aug 2024 09:57:34 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jani Nikula <jani.nikula@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the mm tree
Message-ID: <20240815095734.751c6ec5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/R1lQ63et=S47eRji8nY6/TR";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/R1lQ63et=S47eRji8nY6/TR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

drivers/nvme/host/fault_inject.c: In function 'nvme_fault_inject_init':
drivers/nvme/host/fault_inject.c:29:18: error: implicit declaration of func=
tion 'debugfs_create_dir'; did you mean 'kernfs_create_dir'? [-Werror=3Dimp=
licit-function-declaration]
   29 |         parent =3D debugfs_create_dir(dev_name, NULL);
      |                  ^~~~~~~~~~~~~~~~~~
      |                  kernfs_create_dir
drivers/nvme/host/fault_inject.c:29:16: error: assignment to 'struct dentry=
 *' from 'int' makes pointer from integer without a cast [-Werror=3Dint-con=
version]
   29 |         parent =3D debugfs_create_dir(dev_name, NULL);
      |                ^
drivers/nvme/host/fault_inject.c:39:17: error: implicit declaration of func=
tion 'debugfs_remove_recursive' [-Werror=3Dimplicit-function-declaration]
   39 |                 debugfs_remove_recursive(parent);
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~
drivers/nvme/host/fault_inject.c:47:9: error: implicit declaration of funct=
ion 'debugfs_create_x16' [-Werror=3Dimplicit-function-declaration]
   47 |         debugfs_create_x16("status", 0600, dir, &fault_inj->status);
      |         ^~~~~~~~~~~~~~~~~~
drivers/nvme/host/fault_inject.c:48:9: error: implicit declaration of funct=
ion 'debugfs_create_bool'; did you mean 'kernfs_create_root'? [-Werror=3Dim=
plicit-function-declaration]
   48 |         debugfs_create_bool("dont_retry", 0600, dir, &fault_inj->do=
nt_retry);
      |         ^~~~~~~~~~~~~~~~~~~
      |         kernfs_create_root
cc1: all warnings being treated as errors
drivers/iommu/iommufd/selftest.c: In function 'iommufd_test_init':
drivers/iommu/iommufd/selftest.c:1562:9: error: implicit declaration of fun=
ction 'debugfs_remove_recursive' [-Werror=3Dimplicit-function-declaration]
 1562 |         debugfs_remove_recursive(dbgfs_root);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
kernel/futex/core.c: In function 'fail_futex_debugfs':
kernel/futex/core.c:98:9: error: implicit declaration of function 'debugfs_=
create_bool'; did you mean 'kernfs_create_root'? [-Werror=3Dimplicit-functi=
on-declaration]
   98 |         debugfs_create_bool("ignore-private", mode, dir,
      |         ^~~~~~~~~~~~~~~~~~~
      |         kernfs_create_root
cc1: all warnings being treated as errors
mm/fail_page_alloc.c: In function 'fail_page_alloc_debugfs':
mm/fail_page_alloc.c:57:9: error: implicit declaration of function 'debugfs=
_create_bool'; did you mean 'kernfs_create_root'? [-Werror=3Dimplicit-funct=
ion-declaration]
   57 |         debugfs_create_bool("ignore-gfp-wait", mode, dir,
      |         ^~~~~~~~~~~~~~~~~~~
      |         kernfs_create_root
mm/fail_page_alloc.c:61:9: error: implicit declaration of function 'debugfs=
_create_u32' [-Werror=3Dimplicit-function-declaration]
   61 |         debugfs_create_u32("min-order", mode, dir, &fail_page_alloc=
.min_order);
      |         ^~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
mm/failslab.c: In function 'failslab_debugfs_init':
mm/failslab.c:65:9: error: implicit declaration of function 'debugfs_create=
_bool'; did you mean 'kernfs_create_root'? [-Werror=3Dimplicit-function-dec=
laration]
   65 |         debugfs_create_bool("ignore-gfp-wait", mode, dir,
      |         ^~~~~~~~~~~~~~~~~~~
      |         kernfs_create_root
cc1: all warnings being treated as errors
lib/fault-inject.c: In function 'debugfs_create_ul':
lib/fault-inject.c:186:9: error: implicit declaration of function 'debugfs_=
create_file'; did you mean 'debugfs_create_ul'? [-Werror=3Dimplicit-functio=
n-declaration]
  186 |         debugfs_create_file(name, mode, parent, value, &fops_ul);
      |         ^~~~~~~~~~~~~~~~~~~
      |         debugfs_create_ul
lib/fault-inject.c: In function 'fault_create_debugfs_attr':
lib/fault-inject.c:217:15: error: implicit declaration of function 'debugfs=
_create_dir'; did you mean 'debugfs_create_ul'? [-Werror=3Dimplicit-functio=
n-declaration]
  217 |         dir =3D debugfs_create_dir(name, parent);
      |               ^~~~~~~~~~~~~~~~~~
      |               debugfs_create_ul
lib/fault-inject.c:217:13: error: assignment to 'struct dentry *' from 'int=
' makes pointer from integer without a cast [-Werror=3Dint-conversion]
  217 |         dir =3D debugfs_create_dir(name, parent);
      |             ^
lib/fault-inject.c:223:9: error: implicit declaration of function 'debugfs_=
create_atomic_t'; did you mean 'debugfs_create_ul'? [-Werror=3Dimplicit-fun=
ction-declaration]
  223 |         debugfs_create_atomic_t("times", mode, dir, &attr->times);
      |         ^~~~~~~~~~~~~~~~~~~~~~~
      |         debugfs_create_ul
lib/fault-inject.c:226:9: error: implicit declaration of function 'debugfs_=
create_u32'; did you mean 'debugfs_create_ul'? [-Werror=3Dimplicit-function=
-declaration]
  226 |         debugfs_create_u32("verbose_ratelimit_interval_ms", mode, d=
ir,
      |         ^~~~~~~~~~~~~~~~~~
      |         debugfs_create_ul
lib/fault-inject.c:230:9: error: implicit declaration of function 'debugfs_=
create_bool'; did you mean 'debugfs_create_ul'? [-Werror=3Dimplicit-functio=
n-declaration]
  230 |         debugfs_create_bool("task-filter", mode, dir, &attr->task_f=
ilter);
      |         ^~~~~~~~~~~~~~~~~~~
      |         debugfs_create_ul
lib/fault-inject.c:235:9: error: implicit declaration of function 'debugfs_=
create_xul'; did you mean 'debugfs_create_ul'? [-Werror=3Dimplicit-function=
-declaration]
  235 |         debugfs_create_xul("require-start", mode, dir, &attr->requi=
re_start);
      |         ^~~~~~~~~~~~~~~~~~
      |         debugfs_create_ul
cc1: all warnings being treated as errors

Caused by commit

  2771559a5531 ("fault-inject: improve build for CONFIG_FAULT_INJECTION=3Dn=
")

This is just whack-a-mole ... :-(

I have applied the following patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 15 Aug 2024 09:47:30 +1000
Subject: [PATCH] fix up for "fault-inject: improve build for CONFIG_FAULT_I=
NJECTION=3Dn"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/iommu/iommufd/selftest.c | 1 +
 drivers/nvme/host/fault_inject.c | 1 +
 kernel/futex/core.c              | 1 +
 lib/fault-inject.c               | 1 +
 mm/fail_page_alloc.c             | 1 +
 mm/failslab.c                    | 1 +
 6 files changed, 6 insertions(+)

diff --git a/drivers/iommu/iommufd/selftest.c b/drivers/iommu/iommufd/selft=
est.c
index f95e32e29133..d9024c00c6c3 100644
--- a/drivers/iommu/iommufd/selftest.c
+++ b/drivers/iommu/iommufd/selftest.c
@@ -8,6 +8,7 @@
 #include <linux/xarray.h>
 #include <linux/file.h>
 #include <linux/anon_inodes.h>
+#include <linux/debugfs.h>
 #include <linux/fault-inject.h>
 #include <linux/platform_device.h>
 #include <uapi/linux/iommufd.h>
diff --git a/drivers/nvme/host/fault_inject.c b/drivers/nvme/host/fault_inj=
ect.c
index 1d1b6441a339..105d6cb41c72 100644
--- a/drivers/nvme/host/fault_inject.c
+++ b/drivers/nvme/host/fault_inject.c
@@ -6,6 +6,7 @@
  */
=20
 #include <linux/moduleparam.h>
+#include <linux/debugfs.h>
 #include "nvme.h"
=20
 static DECLARE_FAULT_ATTR(fail_default_attr);
diff --git a/kernel/futex/core.c b/kernel/futex/core.c
index 06a1f091be81..f7cddf321593 100644
--- a/kernel/futex/core.c
+++ b/kernel/futex/core.c
@@ -36,6 +36,7 @@
 #include <linux/pagemap.h>
 #include <linux/plist.h>
 #include <linux/memblock.h>
+#include <linux/debugfs.h>
 #include <linux/fault-inject.h>
 #include <linux/slab.h>
=20
diff --git a/lib/fault-inject.c b/lib/fault-inject.c
index d608f9b48c10..d5853defe77a 100644
--- a/lib/fault-inject.c
+++ b/lib/fault-inject.c
@@ -9,6 +9,7 @@
 #include <linux/export.h>
 #include <linux/interrupt.h>
 #include <linux/stacktrace.h>
+#include <linux/debugfs.h>
 #include <linux/fault-inject.h>
=20
 /*
diff --git a/mm/fail_page_alloc.c b/mm/fail_page_alloc.c
index 532851ce5132..4c7aa18450c9 100644
--- a/mm/fail_page_alloc.c
+++ b/mm/fail_page_alloc.c
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
+#include <linux/debugfs.h>
 #include <linux/fault-inject.h>
 #include <linux/error-injection.h>
 #include <linux/mm.h>
diff --git a/mm/failslab.c b/mm/failslab.c
index af16c2ed578f..4b02bc8b420e 100644
--- a/mm/failslab.c
+++ b/mm/failslab.c
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
+#include <linux/debugfs.h>
 #include <linux/fault-inject.h>
 #include <linux/error-injection.h>
 #include <linux/slab.h>
--=20
2.43.0

--=20
Cheers,
Stephen Rothwell

--Sig_/R1lQ63et=S47eRji8nY6/TR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAma9RG4ACgkQAVBC80lX
0GzzZQf6A+QLrnr+VsvIqUT8wxk5FAAIva4isj6t6XKkJrkyNLgwb210OShHoBhx
eN1cOI4gH00UcB7wymOW4XbsDQYWbypL753TyyJM4KWShbsOt32Kf3AKJ6CpGhMU
UtJspgAAdIG2tnjnwTk2voNyWLV9mDPozjSCnyDqDhs7V/eAGpmK1dx/kiwlxmtA
H5Vgki6DvsYioYNNVQxXcbmHIADU3VhDJkYCBE8ZkCo3JpCSXw2u1/uKdT21c1EJ
luSIodsgUePaxBcrH4rFGqJ5fK6qP0qEie1ygu92VkBjbT9qbZQjPYjQLvlchAHn
HPVCDOPAW6DTEUTPfs0Bil9+JNARbw==
=2k5C
-----END PGP SIGNATURE-----

--Sig_/R1lQ63et=S47eRji8nY6/TR--

