Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAC3C26D515
	for <lists+linux-next@lfdr.de>; Thu, 17 Sep 2020 09:49:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726244AbgIQHtH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Sep 2020 03:49:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726196AbgIQHtG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 17 Sep 2020 03:49:06 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4992C061756
        for <linux-next@vger.kernel.org>; Thu, 17 Sep 2020 00:49:06 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id q63so1341297qkf.3
        for <linux-next@vger.kernel.org>; Thu, 17 Sep 2020 00:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZKJHKk7vG3da0ptMNHqr0ZH7librM+LR8T0+DdZdF4M=;
        b=ZXzXz46o2tHEdoZfj427WwyXF5XwFye1GOfw+mLenLLXV0ueZgYC1pcYj3lYMxGu3O
         u9Z21GE3b8lgMynuSLz0WpjzT2x6MzjDI8WCfQY7wND/MbNP3i14vroVqXAybUvtYC/I
         UiWcKbmcFNN664FeX5JQQHlbVfgav9HJTyuL8eExMXb8sbL5kr+E3JIuHlgaf9zt3NBN
         7rafP5yu1KT2YGTZUje00lgvuSRI5Em3InKyKKekVuUT2fIV0rcf6qvqNL+xKpB4nCgJ
         BBNAbkX1UEYNRCZgPH8TWGvArylDH4vm9B0sFqABcHnnDkI8EKlxiXyS1yIJpp+1BpV2
         q/Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZKJHKk7vG3da0ptMNHqr0ZH7librM+LR8T0+DdZdF4M=;
        b=G/iRYRgHhrBhn/EVGyIolcXtFtm3IWF0Tn+AwIj+nTNSx1Ic+25tDohXTVKbUuRa0U
         2TX/aaOYh9nGDLE5vCs8ncb85P+TCLQ8TSbDIGfNfBfLMdxGuWub/O5YRH8wBJQ3j9/4
         hQtjey3OiCP841dnFk9fm7cC3aEb+lQ2MTSTiZMjMUEX3K5MHOVQVH9+zI0eDiYfvyXe
         pbzTgdDlYyRbihas0NrJBtpXWS/5xtGgdULYHpe19Rew1ErZLAQluRr72Qxh8BELF4BL
         nP9HTQHgNMjsEOcxZWQabP0HK5xjS+xpzoPBrSoOwiUILCl/LZtGKdmnod1WMTaw5s9F
         38yw==
X-Gm-Message-State: AOAM530h72trC0vQTF7Je+oaiTp1gDJRx7/rxkQrDOsmMeuWtGwFrPHa
        aa/j+iy9itEO3qYWSk6pFmmRag==
X-Google-Smtp-Source: ABdhPJzWJyaQQuiN+8cGiMTVoympH5kdMvCkREdE+9MOy1CGXfAhEUdzcOTU3OzLOUd2seVHXv5nBQ==
X-Received: by 2002:a37:9d84:: with SMTP id g126mr27322880qke.473.1600328945938;
        Thu, 17 Sep 2020 00:49:05 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-657-1-17-60.w109-210.abo.wanadoo.fr. [109.210.64.60])
        by smtp.gmail.com with ESMTPSA id q19sm3153736qtk.74.2020.09.17.00.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 00:49:05 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Anders Roxell <anders.roxell@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-next@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH next v2] gpiolib: check for parent device in devprop_gpiochip_set_names()
Date:   Thu, 17 Sep 2020 09:48:57 +0200
Message-Id: <20200917074857.6716-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

It's possible for a GPIO chip to not have a parent device (whose
properties we inspect for 'gpio-line-names'). In this case we should
simply return from devprop_gpiochip_set_names(). Add an appropriate
check for this use-case.

Fixes: 7cba1a4d5e16 ("gpiolib: generalize devprop_gpiochip_set_names() for device properties")
Reported-by: Anders Roxell <anders.roxell@linaro.org>
Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Tested-by: Anders Roxell <anders.roxell@linaro.org>
---
v1 -> v2:
- added a comment as requested by Andy

 drivers/gpio/gpiolib.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index b7b608ef9e6b..dfcff5d24b18 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -375,6 +375,10 @@ static int devprop_gpiochip_set_names(struct gpio_chip *chip)
 	int ret, i;
 	int count;
 
+	/* GPIO chip may not have a parent device whose properties we inspect. */
+	if (!dev)
+		return 0;
+
 	count = device_property_string_array_count(dev, "gpio-line-names");
 	if (count < 0)
 		return 0;
-- 
2.26.1

