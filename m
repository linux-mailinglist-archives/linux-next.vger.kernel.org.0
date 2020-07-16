Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA0A5221D6B
	for <lists+linux-next@lfdr.de>; Thu, 16 Jul 2020 09:29:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728041AbgGPH3X (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Jul 2020 03:29:23 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:7860 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727768AbgGPH3X (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 16 Jul 2020 03:29:23 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 554A03FAAE9145B17DAF;
        Thu, 16 Jul 2020 15:29:16 +0800 (CST)
Received: from huawei.com (10.174.28.241) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Thu, 16 Jul 2020
 15:29:09 +0800
From:   Bixuan Cui <cuibixuan@huawei.com>
To:     <linux-next@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <gustavoars@kernel.org>, <qiang.zhang@windriver.com>,
        <stern@rowland.harvard.edu>, <gregkh@linuxfoundation.org>,
        <cuibixuan@huawei.com>
Subject: [PATCH] usb: usbtest: reduce stack usage in test_queue
Date:   Thu, 16 Jul 2020 08:27:35 +0000
Message-ID: <20200716082735.66342-1-cuibixuan@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.28.241]
X-CFilter-Loop: Reflected
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Fix the warning: [-Werror=-Wframe-larger-than=]

drivers/usb/misc/usbtest.c: In function 'test_queue':
drivers/usb/misc/usbtest.c:2148:1:
warning: the frame size of 1232 bytes is larger than 1024 bytes

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Bixuan Cui <cuibixuan@huawei.com>
---
 drivers/usb/misc/usbtest.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/usbtest.c b/drivers/usb/misc/usbtest.c
index 8b220d56647b..a9b40953d6bc 100644
--- a/drivers/usb/misc/usbtest.c
+++ b/drivers/usb/misc/usbtest.c
@@ -2043,7 +2043,7 @@ test_queue(struct usbtest_dev *dev, struct usbtest_param_32 *param,
 	unsigned		i;
 	unsigned long		packets = 0;
 	int			status = 0;
-	struct urb		*urbs[MAX_SGLEN];
+	struct urb		**urbs;

 	if (!param->sglen || param->iterations > UINT_MAX / param->sglen)
 		return -EINVAL;
@@ -2051,6 +2051,10 @@ test_queue(struct usbtest_dev *dev, struct usbtest_param_32 *param,
 	if (param->sglen > MAX_SGLEN)
 		return -EINVAL;

+	urbs = kcalloc(MAX_SGLEN, sizeof(*urbs), GFP_KERNEL);
+	if (!urbs)
+		return -ENOMEM;
+
 	memset(&context, 0, sizeof(context));
 	context.count = param->iterations * param->sglen;
 	context.dev = dev;
@@ -2137,6 +2141,8 @@ test_queue(struct usbtest_dev *dev, struct usbtest_param_32 *param,
 	else if (context.errors >
 			(context.is_iso ? context.packet_count / 10 : 0))
 		status = -EIO;
+
+	kfree(urbs);
 	return status;

 fail:
@@ -2144,6 +2150,8 @@ test_queue(struct usbtest_dev *dev, struct usbtest_param_32 *param,
 		if (urbs[i])
 			simple_free_urb(urbs[i]);
 	}
+
+	kfree(urbs);
 	return status;
 }

--
2.17.1

