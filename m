Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61782131FB4
	for <lists+linux-next@lfdr.de>; Tue,  7 Jan 2020 07:06:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725914AbgAGGGL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 7 Jan 2020 01:06:11 -0500
Received: from mga01.intel.com ([192.55.52.88]:58926 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725267AbgAGGGL (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 7 Jan 2020 01:06:11 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Jan 2020 22:06:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,404,1571727600"; 
   d="scan'208";a="211024777"
Received: from sgsxdev004.isng.intel.com (HELO localhost) ([10.226.88.13])
  by orsmga007.jf.intel.com with ESMTP; 06 Jan 2020 22:06:08 -0800
From:   "Ramuthevar,Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
To:     sfr@canb.auug.org.au, kishon@ti.com
Cc:     linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
        andriy.shevchenko@intel.com,
        Ramuthevar Vadivel Murugan 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Subject: [PATCH v1] phy: intel-lgm-emmc: Fix warning by adding missing MODULE_LICENSE
Date:   Tue,  7 Jan 2020 14:06:06 +0800
Message-Id: <20200107060606.28028-1-vadivel.muruganx.ramuthevar@linux.intel.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>

Fix below build warning

   WARNING: modpost: missing MODULE_LICENSE() in
   drivers/phy/intel/phy-intel-emmc.o

Introduced by commit

   95f1061f715e ("phy: intel-lgm-emmc: Add support for eMMC PHY")

by adding missing MODULE_LICENSE.

Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/phy/intel/phy-intel-emmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/intel/phy-intel-emmc.c b/drivers/phy/intel/phy-intel-emmc.c
index 1a358e7fd236..703aeb122541 100644
--- a/drivers/phy/intel/phy-intel-emmc.c
+++ b/drivers/phy/intel/phy-intel-emmc.c
@@ -281,3 +281,4 @@ module_platform_driver(intel_emmc_driver);
 
 MODULE_AUTHOR("Peter Harliman Liem <peter.harliman.liem@intel.com>");
 MODULE_DESCRIPTION("Intel eMMC PHY driver");
+MODULE_LICENSE("GPL v2");
-- 
2.11.0

