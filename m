Return-Path: <linux-next+bounces-3322-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D6B95267F
	for <lists+linux-next@lfdr.de>; Thu, 15 Aug 2024 02:08:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CF9C1C21A8A
	for <lists+linux-next@lfdr.de>; Thu, 15 Aug 2024 00:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0905E2F30;
	Thu, 15 Aug 2024 00:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="PLaAz+eZ"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3AE2F29;
	Thu, 15 Aug 2024 00:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723680484; cv=none; b=lRzFCnXwvzkLD9QS4yDez7ToHtyGnESwwjoPgnfJRSVCC0iGj/p88CpZ5FYyBF5HwJtY7THcuL1X/+1jdIEeWmyADiV4LotdUv76iL2bA2P/JGGpl97Z4MXq/PB2jb0M5ICv3MbDPO8aPEHa+dMXaNY4EQD+zUs+eKv2aBTFXfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723680484; c=relaxed/simple;
	bh=9iQI+DwR8y27UrVWoyti8u92DcFAgeAvzuXJ/tF7swA=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=ULEKRqZXG82XGuWliFsyogxHvkYr0KrgPKyZaaU3j0IRKU+68UVcmxOTu+uO/la4xR8wmz7YD+sM9Lbq4HEYniUWgwVgVAUuaw4FQcmCbEC1Bgzwb1XkPKkcUMKMOaDXn2Q9QY6Bm4dDwPGwLyGgkjHlR8XsJ2Hi7txMpkms09Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=PLaAz+eZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E702C116B1;
	Thu, 15 Aug 2024 00:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1723680484;
	bh=9iQI+DwR8y27UrVWoyti8u92DcFAgeAvzuXJ/tF7swA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PLaAz+eZNf4sPfytGXSZhNhx2JY/2NG4+TczLnLC6fW5Y0KpTteYgXTbMhUY7LgET
	 wTDAJfMsSPQPkkjYSvrs7WxpoUek365aRNcZg3BbucwcnsAXsaXRkJVQis5P8z1JhB
	 qIAqxA1uTuuX7VSMepV3riPWnrde7d2+6oNLyOu4=
Date: Wed, 14 Aug 2024 17:08:03 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jani Nikula <jani.nikula@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mm tree
Message-Id: <20240814170803.d36253ee8657f9f1f19ae5bc@linux-foundation.org>
In-Reply-To: <20240815095734.751c6ec5@canb.auug.org.au>
References: <20240815095734.751c6ec5@canb.auug.org.au>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, 15 Aug 2024 09:57:34 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:

> Hi all,
>=20
> After merging the mm tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
>=20
> drivers/nvme/host/fault_inject.c: In function 'nvme_fault_inject_init':
> drivers/nvme/host/fault_inject.c:29:18: error: implicit declaration of fu=
nction 'debugfs_create_dir'; did you mean 'kernfs_create_dir'? [-Werror=3Di=
mplicit-function-declaration]
>    29 |         parent =3D debugfs_create_dir(dev_name, NULL);
>       |                  ^~~~~~~~~~~~~~~~~~
>       |                  kernfs_create_dir
>=20
> ...
>
> Caused by commit
>=20
>   2771559a5531 ("fault-inject: improve build for CONFIG_FAULT_INJECTION=
=3Dn")
>=20
> ...
>
>  drivers/iommu/iommufd/selftest.c | 1 +
>  drivers/nvme/host/fault_inject.c | 1 +
>  kernel/futex/core.c              | 1 +
>  lib/fault-inject.c               | 1 +
>  mm/fail_page_alloc.c             | 1 +
>  mm/failslab.c                    | 1 +
>  6 files changed, 6 insertions(+)

Oh.  I think I got all these with
fault-inject-improve-build-for-config_fault_injection=3Dn-fix.patch.=20
Maybe that escaped somehow.


From: Andrew Morton <akpm@linux-foundation.org>
Subject: fault-inject-improve-build-for-config_fault_injection=3Dn-fix
Date: Tue Aug 13 07:20:23 PM PDT 2024

repair fallout from no longer including debugfs.h into fault-inject.h

Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Akinobu Mita <akinobu.mita@gmail.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Thomas Hellstr=F6m <thomas.hellstrom@linux.intel.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 drivers/iommu/iommufd/selftest.c |    1 +
 drivers/nvme/host/fault_inject.c |    1 +
 kernel/futex/core.c              |    1 +
 lib/fault-inject.c               |    1 +
 mm/fail_page_alloc.c             |    1 +
 mm/failslab.c                    |    1 +
 6 files changed, 6 insertions(+)

--- a/drivers/iommu/iommufd/selftest.c~fault-inject-improve-build-for-confi=
g_fault_injection=3Dn-fix
+++ a/drivers/iommu/iommufd/selftest.c
@@ -7,6 +7,7 @@
 #include <linux/iommu.h>
 #include <linux/xarray.h>
 #include <linux/file.h>
+#include <linux/debugfs.h>
 #include <linux/anon_inodes.h>
 #include <linux/fault-inject.h>
 #include <linux/platform_device.h>
--- a/drivers/nvme/host/fault_inject.c~fault-inject-improve-build-for-confi=
g_fault_injection=3Dn-fix
+++ a/drivers/nvme/host/fault_inject.c
@@ -6,6 +6,7 @@
  */
=20
 #include <linux/moduleparam.h>
+#include <linux/debugfs.h>
 #include "nvme.h"
=20
 static DECLARE_FAULT_ATTR(fail_default_attr);
--- a/kernel/futex/core.c~fault-inject-improve-build-for-config_fault_injec=
tion=3Dn-fix
+++ a/kernel/futex/core.c
@@ -34,6 +34,7 @@
 #include <linux/compat.h>
 #include <linux/jhash.h>
 #include <linux/pagemap.h>
+#include <linux/debugfs.h>
 #include <linux/plist.h>
 #include <linux/memblock.h>
 #include <linux/fault-inject.h>
--- a/lib/fault-inject.c~fault-inject-improve-build-for-config_fault_inject=
ion=3Dn-fix
+++ a/lib/fault-inject.c
@@ -2,6 +2,7 @@
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/random.h>
+#include <linux/debugfs.h>
 #include <linux/sched.h>
 #include <linux/stat.h>
 #include <linux/types.h>
--- a/mm/fail_page_alloc.c~fault-inject-improve-build-for-config_fault_inje=
ction=3Dn-fix
+++ a/mm/fail_page_alloc.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <linux/fault-inject.h>
+#include <linux/debugfs.h>
 #include <linux/error-injection.h>
 #include <linux/mm.h>
=20
--- a/mm/failslab.c~fault-inject-improve-build-for-config_fault_injection=
=3Dn-fix
+++ a/mm/failslab.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <linux/fault-inject.h>
 #include <linux/error-injection.h>
+#include <linux/debugfs.h>
 #include <linux/slab.h>
 #include <linux/mm.h>
 #include "slab.h"
_


