Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20D7C18C49B
	for <lists+linux-next@lfdr.de>; Fri, 20 Mar 2020 02:28:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727240AbgCTB2z (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 19 Mar 2020 21:28:55 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:12103 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727235AbgCTB2z (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 19 Mar 2020 21:28:55 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 8FDBE9DD9CCE3F553607;
        Fri, 20 Mar 2020 09:28:51 +0800 (CST)
Received: from ubuntu.huawei.com (10.175.104.215) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.487.0; Fri, 20 Mar 2020 09:28:41 +0800
From:   Chen Huang <chenhuang5@huawei.com>
To:     Santosh Shilimkar <ssantosh@kernel.org>
CC:     Dave Gerlach <d-gerlach@ti.com>, Arnd Bergmann <arnd@arndb.de>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-next@vger.kernel.org>, Chen Huang <chenhuang5@huawei.com>
Subject: [PATCH -next] soc: ti: pm33xx: Add a judgement for variable 'ret'
Date:   Fri, 20 Mar 2020 07:11:50 +0800
Message-ID: <20200319231150.28106-1-chenhuang5@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.215]
X-CFilter-Loop: Reflected
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Variable 'ret' is the result whether sram has prepared to translate
to low power state. 0 represents preparation is successful, others
represent error code. If preparation failed, then return 'ret' to end
the function.

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/soc/ti/pm33xx.c: In function am33xx_do_sram_idle:
drivers/soc/ti/pm33xx.c:135:6: warning: variable ret set but not used [-Wunused-but-set-variable]

Fixes: commit 6afaff1c6624f ("soc: ti: pm33xx: Add base cpuidle support")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Chen Huang <chenhuang5@huawei.com>
---
 drivers/soc/ti/pm33xx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/ti/pm33xx.c b/drivers/soc/ti/pm33xx.c
index de0123ec8ad6..a51ba770f1e3 100644
--- a/drivers/soc/ti/pm33xx.c
+++ b/drivers/soc/ti/pm33xx.c
@@ -139,6 +139,8 @@ static int am33xx_do_sram_idle(u32 wfi_flags)
 
 	if (wfi_flags & WFI_FLAG_WAKE_M3)
 		ret = m3_ipc->ops->prepare_low_power(m3_ipc, WKUP_M3_IDLE);
+	if (ret)
+		return ret;
 
 	return pm_ops->cpu_suspend(am33xx_do_wfi_sram, wfi_flags);
 }
-- 
2.17.1

