Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76FA13DDBFA
	for <lists+linux-next@lfdr.de>; Mon,  2 Aug 2021 17:11:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234570AbhHBPLR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Aug 2021 11:11:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:33202 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234281AbhHBPLQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 2 Aug 2021 11:11:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A3DB260FC2;
        Mon,  2 Aug 2021 15:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627917067;
        bh=JDCjzmLT2HjGoFDJf537mDjwXxmSMj9NpQZNF5qAUXE=;
        h=From:To:Cc:Subject:Date:From;
        b=mtghh3JP8TJH/reV6Eao3Tl9Ev6FKh6G9npwd2TLjzuaWwE0CqIskbYRGCQILxTxw
         gyMMKjIvV5NZ2rMb/5B+ryiv/d3NNBgj33DlHKd34xOQgL/1vh4tUdaTE8gJVL4UBp
         oFWF79pEiyWFOXpiGBRc4off2aFi1fLidnHCfKoFfvYbuKrwbKn1ASvL9fgFnqyvnC
         aG1sc04O+N/ycmhDrLCdnq/MPLcG8x4UWzioI3qI4HKi7bVa+8Uv1e0iok0n1ry2wc
         zQke15/MNa+QysO0Dp47MDKA/KcCntmo+bxO8gJLfhDwkc3U5+GPLLBMDqODteb1dk
         nWIooE9TdUg9w==
From:   Mark Brown <broonie@kernel.org>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Eric Huang <JinhuiEric.Huang@amd.com>
Subject: linux-next: manual merge of the amdgpu tree with Linus' tree
Date:   Mon,  2 Aug 2021 16:10:53 +0100
Message-Id: <20210802151053.14982-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  drivers/gpu/drm/amd/amdkfd/kfd_chardev.c

between commits:

  f5cc09acece4 ("Revert "drm/amdkfd: Add memory sync before TLB flush on unmap"")
  c37387c354c8 ("Revert "drm/amdkfd: Make TLB flush conditional on mapping"")
  5adcd7458a78 ("Revert "drm/amdkfd: Add heavy-weight TLB flush after unmapping"")

from Linus' tree and commits:

  b928ecfbe369 ("Revert "Revert "drm/amdkfd: Add memory sync before TLB flush on unmap""")
  b0228fa4868b ("drm/amdkfd: Only apply heavy-weight TLB flush on Aldebaran")

from the amdgpu tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index e48acdd03c1a,86afd37b098d..000000000000
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@@ -1565,10 -1568,29 +1565,33 @@@ static int kfd_ioctl_unmap_memory_from_
  		}
  		args->n_success = i+1;
  	}
++
+ 	mutex_unlock(&p->mutex);
+ 
+ 	if (dev->device_info->asic_family == CHIP_ALDEBARAN) {
+ 		err = amdgpu_amdkfd_gpuvm_sync_memory(dev->kgd,
+ 				(struct kgd_mem *) mem, true);
+ 		if (err) {
+ 			pr_debug("Sync memory failed, wait interrupted by user signal\n");
+ 			goto sync_memory_failed;
+ 		}
+ 
+ 		/* Flush TLBs after waiting for the page table updates to complete */
+ 		for (i = 0; i < args->n_devices; i++) {
+ 			peer = kfd_device_by_id(devices_arr[i]);
+ 			if (WARN_ON_ONCE(!peer))
+ 				continue;
+ 			peer_pdd = kfd_get_process_device_data(peer, p);
+ 			if (WARN_ON_ONCE(!peer_pdd))
+ 				continue;
+ 			kfd_flush_tlb(peer_pdd, TLB_FLUSH_HEAVYWEIGHT);
+ 		}
+ 	}
++
  	kfree(devices_arr);
  
 +	mutex_unlock(&p->mutex);
 +
  	return 0;
  
  bind_process_to_device_failed:
