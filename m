Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3DCC436C73
	for <lists+linux-next@lfdr.de>; Thu, 21 Oct 2021 23:10:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232186AbhJUVMr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 Oct 2021 17:12:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232173AbhJUVMr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 21 Oct 2021 17:12:47 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCA9EC061764
        for <linux-next@vger.kernel.org>; Thu, 21 Oct 2021 14:10:30 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 9578B97D;
        Thu, 21 Oct 2021 21:10:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 9578B97D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1634850629; bh=/5PqWLE4FcBhImTJA9XMH2rm/C/TLG5+zjc1qYZQyFg=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=lPVFQP7lLogTE0no1qOXHEdfSoBuq2YKavzjGD4P+t0Sp7YFZJlY4iyAIA2q+40AC
         Lt9mih0Ta4F82gBMnS1hRNUZT/od3nkl7L92gpIuxwMSRRL/IPt+UwtV3GCSqTHGRn
         SP9oy4QDk4LjiNPqVeNEPPZdxeMmiX6HrhFN5SOGxerGiXiQ5bBBU4DLyLK1uIDVmN
         lGZTI2x+rfyjk5DcbM2nnOnj9urzUD8h4YFhtZ28DodZY2IODRUHgaZApI93Dh9ilC
         vr0H/DTzzOpk+Q47k+QjzKlvevt9jH/IGLP2huS8a8F/5WZVfLMDqYgsPHsiMMk8Pq
         hcvE0tILiobTw==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Vadim Pasternak <vadimp@nvidia.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: linux-next: build warnings after merge of the drivers-x86 tree
In-Reply-To: <20211022070452.28924855@canb.auug.org.au>
References: <20211021184735.794b22a7@canb.auug.org.au>
 <BN9PR12MB53814D3DCD5BD5E9441DE3F3AFBF9@BN9PR12MB5381.namprd12.prod.outlook.com>
 <20211022070452.28924855@canb.auug.org.au>
Date:   Thu, 21 Oct 2021 15:10:28 -0600
Message-ID: <87lf2mjd8b.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

[CC += Mauro]

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> On Thu, 21 Oct 2021 09:07:03 +0000 Vadim Pasternak <vadimp@nvidia.com> wrote:
>>
>> What is wrong with the syntax at line 230 and where blank line is expected?
>> 
>> What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/bios_active_image
>> What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/bios_auth_fail
>> What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/bios_upgrade_fail
>> Date:		October 2021	<--- this is line 230
>> KernelVersion:	5.16
>
> I am sorry, I don't know.  Added Jon to cc for advice.

The problem isn't that line at all, it's the use of a bulleted list a
few lines further down; that doesn't work in ABI files.

Mauro, this ABI stuff is fragile, and this kind of problem occurs fairly
often.  How hard would it be to (1) make it a bit more robust, (2) make
it issue useful warnings where it can't be robust, and (3) properly
document the restrictions for ABI files?

Meanwhile, the attached patch fixes it; feel free to use it or to just
fold the change into your work.

Thanks,

jon

-----------------------------
From 97371e6afda75eef71b7d5d1794645e5cfaf1811 Mon Sep 17 00:00:00 2001
From: Jonathan Corbet <corbet@lwn.net>
Date: Thu, 21 Oct 2021 15:02:43 -0600
Subject: [PATCH] docs: ABI: fix documentation warning in sysfs-driver-mlxreg-io

The use of a Sphinx list within this ABI file caused the following warning:

  Documentation/ABI/stable/sysfs-driver-mlxreg-io:230: WARNING: Unexpected indentation.
  Documentation/ABI/stable/sysfs-driver-mlxreg-io:230: WARNING: Block quote ends without a blank line; unexpected unindent.

Remove the bullets to make the warning go away and get proper formatting.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 .../ABI/stable/sysfs-driver-mlxreg-io         | 23 +++++++++++--------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/Documentation/ABI/stable/sysfs-driver-mlxreg-io b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
index c84795ccecad..12c3f895cd2f 100644
--- a/Documentation/ABI/stable/sysfs-driver-mlxreg-io
+++ b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
@@ -231,16 +231,19 @@ Date:		October 2021
 KernelVersion:	5.16
 Contact:	Vadim Pasternak <vadimp@nvidia.com>
 Description:	The files represent BIOS statuses:
-		- bios_active_image: location of current active BIOS image:
-		  0: Top, 1: Bottom.
-		  The reported value should correspond to value expected by OS
-		  in case of BIOS safe mode is 0. This bit is related to Intel
-		  top-swap feature of DualBios on the same flash.
-		- bios_auth_fail: BIOS upgrade is failed because provided BIOS
-		  image is not signed correctly.
-		- bios_upgrade_fail: BIOS upgrade is failed by some other
-		  reason not because authentication. For example due to
-		  physical SPI flash problem.
+
+		bios_active_image: location of current active BIOS image:
+		0: Top, 1: Bottom.
+		The reported value should correspond to value expected by OS
+		in case of BIOS safe mode is 0. This bit is related to Intel
+		top-swap feature of DualBios on the same flash.
+
+		bios_auth_fail: BIOS upgrade is failed because provided BIOS
+		image is not signed correctly.
+
+		bios_upgrade_fail: BIOS upgrade is failed by some other
+		reason not because authentication. For example due to
+		physical SPI flash problem.
 
 		The files are read only.
 
-- 
2.31.1

