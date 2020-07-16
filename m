Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BE2B222439
	for <lists+linux-next@lfdr.de>; Thu, 16 Jul 2020 15:49:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726986AbgGPNrW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Jul 2020 09:47:22 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:46564 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726537AbgGPNrW (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 16 Jul 2020 09:47:22 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id C8AF06FE82A9CF1EF574;
        Thu, 16 Jul 2020 21:47:17 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.238) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Thu, 16 Jul 2020
 21:47:11 +0800
Subject: [PATCH -next v2] usb: usbtest: reduce stack usage in test_queue
To:     <linux-next@vger.kernel.org>, <gustavoars@kernel.org>,
        <stern@rowland.harvard.edu>, <gregkh@linuxfoundation.org>
CC:     <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <qiang.zhang@windriver.com>,
        "Wanghui (John)" <john.wanghui@huawei.com>
References: <20200716082735.66342-1-cuibixuan@huawei.com>
From:   Bixuan Cui <cuibixuan@huawei.com>
Message-ID: <42fe1a83-38a5-816b-9258-8a344008f398@huawei.com>
Date:   Thu, 16 Jul 2020 21:47:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200716082735.66342-1-cuibixuan@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.238]
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


.


