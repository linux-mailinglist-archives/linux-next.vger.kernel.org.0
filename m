Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D9643E2A43
	for <lists+linux-next@lfdr.de>; Fri,  6 Aug 2021 14:04:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343526AbhHFMEu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 6 Aug 2021 08:04:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:37752 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243577AbhHFMEu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 6 Aug 2021 08:04:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 55456610C7;
        Fri,  6 Aug 2021 12:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628251474;
        bh=oh8vZSeti7z+6lrd4yUmtleREOw9yY5uVacEw5hK/vQ=;
        h=From:To:Cc:Subject:Date:From;
        b=lifmlj4XGvcur7tIkGK+Ce8W2qo43OU0/tcG8LQPusmrl8qU4/MlLXVK+MYxpy0ui
         c1TLt1vPWp0Z2k4/fgETE+kfprVlFu+1r3jozehlZfk9gAiM1//XBtMpFMSjU59U+i
         T8VyaR8NKQMP8A2GgJed3K4VuIXb4ZSAdD7Ln3gnypke5R3KN3xf8K5v2Fk+/X5Dv1
         I9WuRNfh5OUwl11frgk8SWx23iDQHIX7PpetdKznB7knOakpZownxcAHiGDP/Yv+7f
         RW2BL7te/0yeakCdAitzE1y3f4RnA9Ncm0D5aWeJtgH0BhRd8L+rrh13JgaGZ0opyZ
         xutbYT/yZfNjw==
From:   Mark Brown <broonie@kernel.org>
To:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Chengming Gui <Jack.Gui@amd.com>, Tao Zhou <tao.zhou1@amd.com>
Subject: linux-next: manual merge of the drm tree with the drm-fixes tree
Date:   Fri,  6 Aug 2021 13:04:17 +0100
Message-Id: <20210806120417.49878-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c

between commit:

  e00f543d3596 ("drm/amdgpu: add DID for beige goby")

from the drm-fixes tree and commit:

  a8f706966b92 ("drm/amdgpu: add pci device id for cyan_skillfish")

from the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.


diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 5ed8381ae0f5,d637b0536f84..000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@@ -1213,13 -1212,9 +1212,16 @@@ static const struct pci_device_id pciid
  	{0x1002, 0x740F, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_ALDEBARAN|AMD_EXP_HW_SUPPORT},
  	{0x1002, 0x7410, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_ALDEBARAN|AMD_EXP_HW_SUPPORT},
  
 +	/* BEIGE_GOBY */
 +	{0x1002, 0x7420, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_BEIGE_GOBY},
 +	{0x1002, 0x7421, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_BEIGE_GOBY},
 +	{0x1002, 0x7422, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_BEIGE_GOBY},
 +	{0x1002, 0x7423, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_BEIGE_GOBY},
 +	{0x1002, 0x743F, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_BEIGE_GOBY},
 +
+ 	/* CYAN_SKILLFISH */
+ 	{0x1002, 0x13FE, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_CYAN_SKILLFISH|AMD_IS_APU},
+ 
  	{0, 0, 0}
  };
  
