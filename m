Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9033A361E4D
	for <lists+linux-next@lfdr.de>; Fri, 16 Apr 2021 12:54:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242525AbhDPKzW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 16 Apr 2021 06:55:22 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:48584 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242497AbhDPKzV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 16 Apr 2021 06:55:21 -0400
Received: from guri.fritz.box (unknown [IPv6:2a02:810a:880:f54:c1fa:1310:49b:e88e])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E43DC1F43542;
        Fri, 16 Apr 2021 11:54:55 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     joro@8bytes.org, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc:     matthias.bgg@gmail.com, will@kernel.org, yong.wu@mediatek.com,
        dafna.hirschfeld@collabora.com, kernel@collabora.com,
        dafna3@gmail.com, enric.balletbo@collabora.com
Subject: [PATCH v2] iommu/mediatek: always enable the clk on resume
Date:   Fri, 16 Apr 2021 12:54:49 +0200
Message-Id: <20210416105449.4744-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

In mtk_iommu_runtime_resume always enable the clk, even
if m4u_dom is null. Otherwise the 'suspend' cb might
disable the clk which is already disabled causing the warning:

[    1.586104] infra_m4u already disabled
[    1.586133] WARNING: CPU: 0 PID: 121 at drivers/clk/clk.c:952 clk_core_disable+0xb0/0xb8
[    1.594391] mtk-iommu 10205000.iommu: bound 18001000.larb (ops mtk_smi_larb_component_ops)
[    1.598108] Modules linked in:
[    1.598114] CPU: 0 PID: 121 Comm: kworker/0:2 Not tainted 5.12.0-rc5 #69
[    1.609246] mtk-iommu 10205000.iommu: bound 14027000.larb (ops mtk_smi_larb_component_ops)
[    1.617487] Hardware name: Google Elm (DT)
[    1.617491] Workqueue: pm pm_runtime_work
[    1.620545] mtk-iommu 10205000.iommu: bound 19001000.larb (ops mtk_smi_larb_component_ops)

[    1.627229] pstate: 60000085 (nZCv daIf -PAN -UAO -TCO BTYPE=--)
[    1.659297] pc : clk_core_disable+0xb0/0xb8
[    1.663475] lr : clk_core_disable+0xb0/0xb8
[    1.667652] sp : ffff800011b9bbe0
[    1.670959] x29: ffff800011b9bbe0 x28: 0000000000000000
[    1.676267] x27: ffff800011448000 x26: ffff8000100cfd98
[    1.681574] x25: ffff800011b9bd48 x24: 0000000000000000
[    1.686882] x23: 0000000000000000 x22: ffff8000106fad90
[    1.692189] x21: 000000000000000a x20: ffff0000c0048500
[    1.697496] x19: ffff0000c0048500 x18: ffffffffffffffff
[    1.702804] x17: 0000000000000000 x16: 0000000000000000
[    1.708112] x15: ffff800011460300 x14: fffffffffffe0000
[    1.713420] x13: ffff8000114602d8 x12: 0720072007200720
[    1.718727] x11: 0720072007200720 x10: 0720072007200720
[    1.724035] x9 : ffff800011b9bbe0 x8 : ffff800011b9bbe0
[    1.729342] x7 : 0000000000000009 x6 : ffff8000114b8328
[    1.734649] x5 : 0000000000000000 x4 : 0000000000000000
[    1.739956] x3 : 00000000ffffffff x2 : ffff800011460298
[    1.745263] x1 : 1af1d7de276f4500 x0 : 0000000000000000
[    1.750572] Call trace:
[    1.753010]  clk_core_disable+0xb0/0xb8
[    1.756840]  clk_core_disable_lock+0x24/0x40
[    1.761105]  clk_disable+0x20/0x30
[    1.764501]  mtk_iommu_runtime_suspend+0x88/0xa8
[    1.769114]  pm_generic_runtime_suspend+0x2c/0x48
[    1.773815]  __rpm_callback+0xe0/0x178
[    1.777559]  rpm_callback+0x24/0x88
[    1.781041]  rpm_suspend+0xdc/0x470
[    1.784523]  rpm_idle+0x12c/0x170
[    1.787831]  pm_runtime_work+0xa8/0xc0
[    1.791573]  process_one_work+0x1e8/0x360
[    1.795580]  worker_thread+0x44/0x478
[    1.799237]  kthread+0x150/0x158
[    1.802460]  ret_from_fork+0x10/0x30
[    1.806034] ---[ end trace 82402920ef64573b ]---
[    1.810728] ------------[ cut here ]------------

In addition, we now don't need to enable the clock from the
function mtk_iommu_hw_init since it is already enabled by the resume.

Fixes: c0b57581b73b ("iommu/mediatek: Add power-domain operation")
Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Reviewed-by: Yong Wu <yong.wu@mediatek.com>
---
Chagnes since v1: remove the word 'commit' from 'Fixes' tag

 drivers/iommu/mtk_iommu.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 6ecc007f07cd..e168a682806a 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -688,13 +688,6 @@ static const struct iommu_ops mtk_iommu_ops = {
 static int mtk_iommu_hw_init(const struct mtk_iommu_data *data)
 {
 	u32 regval;
-	int ret;
-
-	ret = clk_prepare_enable(data->bclk);
-	if (ret) {
-		dev_err(data->dev, "Failed to enable iommu bclk(%d)\n", ret);
-		return ret;
-	}
 
 	if (data->plat_data->m4u_plat == M4U_MT8173) {
 		regval = F_MMU_PREFETCH_RT_REPLACE_MOD |
@@ -760,7 +753,6 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data)
 	if (devm_request_irq(data->dev, data->irq, mtk_iommu_isr, 0,
 			     dev_name(data->dev), (void *)data)) {
 		writel_relaxed(0, data->base + REG_MMU_PT_BASE_ADDR);
-		clk_disable_unprepare(data->bclk);
 		dev_err(data->dev, "Failed @ IRQ-%d Request\n", data->irq);
 		return -ENODEV;
 	}
@@ -977,14 +969,19 @@ static int __maybe_unused mtk_iommu_runtime_resume(struct device *dev)
 	void __iomem *base = data->base;
 	int ret;
 
-	/* Avoid first resume to affect the default value of registers below. */
-	if (!m4u_dom)
-		return 0;
 	ret = clk_prepare_enable(data->bclk);
 	if (ret) {
 		dev_err(data->dev, "Failed to enable clk(%d) in resume\n", ret);
 		return ret;
 	}
+
+	/*
+	 * Uppon first resume, only enable the clk and return, since the values of the
+	 * registers are not yet set.
+	 */
+	if (!m4u_dom)
+		return 0;
+
 	writel_relaxed(reg->wr_len_ctrl, base + REG_MMU_WR_LEN_CTRL);
 	writel_relaxed(reg->misc_ctrl, base + REG_MMU_MISC_CTRL);
 	writel_relaxed(reg->dcm_dis, base + REG_MMU_DCM_DIS);
-- 
2.17.1

