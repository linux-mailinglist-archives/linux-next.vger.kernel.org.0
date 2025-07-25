Return-Path: <linux-next+bounces-7724-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 09955B12612
	for <lists+linux-next@lfdr.de>; Fri, 25 Jul 2025 23:12:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00974188FD8F
	for <lists+linux-next@lfdr.de>; Fri, 25 Jul 2025 21:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C50525D536;
	Fri, 25 Jul 2025 21:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="VBuEiJTW"
X-Original-To: linux-next@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E06CDDA9;
	Fri, 25 Jul 2025 21:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753477977; cv=none; b=Ii80LoOzX6ewnNjlIuHqUR+xnU1x3a16AETbaziLldspvdtP82ZvObj8OWG0o9MyswIVdbULGIEhYjDJAH96dqT1baxFkZmpxFLZV5kq5zsNTOjmi/Kmm+DTYmTKXj2duL94QnbH1Qm2utFpLewTTEwUbzGA77YNl9msVygt3yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753477977; c=relaxed/simple;
	bh=vbL+HbP+4YaLPyRV7WLoA2cPjJ+7WNluyxp4IXrjLDg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QMz7qaMvjy+9cws3SYEtNd3cZKOo04EeJSHCpMs26QrOkooWnOv9Wk7wtH2ayQ8g7bQLIgoWTkfhEjnsBTuatKDerfQ6GOFdN+kTrra0lYrhfbOzMbVHx4QHZ9fQhz2eUO40dUp3krsRyfcsRYynPsllDgflEGbLo7bGM5gr3YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=VBuEiJTW; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=t6PQlTi/al6jK8DK8azc4vIg+nja1nQodGRzg5cDH9o=; b=VBuEiJTW5vNg9VdoaB9vhHN9+n
	p6C9Jhsg/pKWx1szw/63FWfgMvGxsT/yPfUHDDYoy9WUJZcBVKlBNi+vdUdt6zPLx198tyLUwk4MO
	GUA4xumlYkdwUi20xlKHTqowCMYI96sxjVqUHKHwKaqnY6FDaSSYlzWONbTisMkOUqlimS8yC3WVA
	XU+oQxt/Iy435GvXcPDSszDGJO+EQFShDiDdYf7B/YD0mErBBjdLX5MiR8OzI8tpjvU3doKxHSUtM
	HlE6Hj3I1uzcXyVbzFyea3KDRlLvYJFAQaF18UpVj7awCCh/SnLl9pJJcMBQZSBhtn5iqfFCuwPUq
	vA2hrnSA==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufPio-0000000AiB7-2WsO;
	Fri, 25 Jul 2025 21:12:54 +0000
Message-ID: <1c4a5faf-7c1f-4d84-9a9f-ec88b3e6c860@infradead.org>
Date: Fri, 25 Jul 2025 14:12:53 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Jul 25 (nfc/nfrmrvl/ and nfc/s3fwrn5/)
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, netdev@vger.kernel.org
References: <20250725124835.53f998d0@canb.auug.org.au>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250725124835.53f998d0@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 7/24/25 7:48 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20250724:
> 

on ARCH=um SUBARCH=x86_64, when
# CONFIG_GPIOLIB is not set

../drivers/nfc/nfcmrvl/main.c: In function ‘nfcmrvl_nci_register_dev’:
../drivers/nfc/nfcmrvl/main.c:115:13: error: implicit declaration of function ‘gpio_is_valid’; did you mean ‘uuid_is_valid’? [-Wimplicit-function-declaration]
  115 |         if (gpio_is_valid(priv->config.reset_n_io)) {
      |             ^~~~~~~~~~~~~
      |             uuid_is_valid
../drivers/nfc/nfcmrvl/main.c:116:22: error: implicit declaration of function ‘gpio_request_one’ [-Wimplicit-function-declaration]
  116 |                 rc = gpio_request_one(priv->config.reset_n_io,
      |                      ^~~~~~~~~~~~~~~~
../drivers/nfc/nfcmrvl/main.c:117:39: error: ‘GPIOF_OUT_INIT_LOW’ undeclared (first use in this function)
  117 |                                       GPIOF_OUT_INIT_LOW,
      |                                       ^~~~~~~~~~~~~~~~~~
../drivers/nfc/nfcmrvl/main.c:117:39: note: each undeclared identifier is reported only once for each function it appears in
../drivers/nfc/nfcmrvl/main.c:176:17: error: implicit declaration of function ‘gpio_free’; did you mean ‘kfifo_free’? [-Wimplicit-function-declaration]
  176 |                 gpio_free(priv->config.reset_n_io);
      |                 ^~~~~~~~~
      |                 kfifo_free
../drivers/nfc/nfcmrvl/main.c: In function ‘nfcmrvl_chip_reset’:
../drivers/nfc/nfcmrvl/main.c:238:17: error: implicit declaration of function ‘gpio_set_value’; did you mean ‘pte_set_val’? [-Wimplicit-function-declaration]
  238 |                 gpio_set_value(priv->config.reset_n_io, 0);
      |                 ^~~~~~~~~~~~~~
      |                 pte_set_val
../drivers/nfc/s3fwrn5/phy_common.c: In function ‘s3fwrn5_phy_set_wake’:
../drivers/nfc/s3fwrn5/phy_common.c:22:9: error: implicit declaration of function ‘gpio_set_value’; did you mean ‘pte_set_val’? [-Wimplicit-function-declaration]
   22 |         gpio_set_value(phy->gpio_fw_wake, wake);
      |         ^~~~~~~~~~~~~~
      |         pte_set_val
../drivers/nfc/s3fwrn5/i2c.c: In function ‘s3fwrn5_i2c_parse_dt’:
../drivers/nfc/s3fwrn5/i2c.c:158:14: error: implicit declaration of function ‘gpio_is_valid’; did you mean ‘uuid_is_valid’? [-Wimplicit-function-declaration]
  158 |         if (!gpio_is_valid(phy->common.gpio_en)) {
      |              ^~~~~~~~~~~~~
      |              uuid_is_valid
../drivers/nfc/s3fwrn5/i2c.c: In function ‘s3fwrn5_i2c_probe’:
../drivers/nfc/s3fwrn5/i2c.c:200:15: error: implicit declaration of function ‘devm_gpio_request_one’ [-Wimplicit-function-declaration]
  200 |         ret = devm_gpio_request_one(&phy->i2c_dev->dev, phy->common.gpio_en,
      |               ^~~~~~~~~~~~~~~~~~~~~
../drivers/nfc/s3fwrn5/i2c.c:201:37: error: ‘GPIOF_OUT_INIT_HIGH’ undeclared (first use in this function)
  201 |                                     GPIOF_OUT_INIT_HIGH, "s3fwrn5_en");
      |                                     ^~~~~~~~~~~~~~~~~~~
../drivers/nfc/s3fwrn5/i2c.c:201:37: note: each undeclared identifier is reported only once for each function it appears in
../drivers/nfc/s3fwrn5/i2c.c:207:37: error: ‘GPIOF_OUT_INIT_LOW’ undeclared (first use in this function)
  207 |                                     GPIOF_OUT_INIT_LOW, "s3fwrn5_fw_wake");
      |                                     ^~~~~~~~~~~~~~~~~~
../drivers/nfc/s3fwrn5/uart.c: In function ‘s3fwrn82_uart_parse_dt’:
../drivers/nfc/s3fwrn5/uart.c:100:14: error: implicit declaration of function ‘gpio_is_valid’; did you mean ‘uuid_is_valid’? [-Wimplicit-function-declaration]
  100 |         if (!gpio_is_valid(phy->common.gpio_en))
      |              ^~~~~~~~~~~~~
      |              uuid_is_valid
../drivers/nfc/s3fwrn5/uart.c: In function ‘s3fwrn82_uart_probe’:
../drivers/nfc/s3fwrn5/uart.c:147:15: error: implicit declaration of function ‘devm_gpio_request_one’ [-Wimplicit-function-declaration]
  147 |         ret = devm_gpio_request_one(&phy->ser_dev->dev, phy->common.gpio_en,
      |               ^~~~~~~~~~~~~~~~~~~~~
../drivers/nfc/s3fwrn5/uart.c:148:37: error: ‘GPIOF_OUT_INIT_HIGH’ undeclared (first use in this function)
  148 |                                     GPIOF_OUT_INIT_HIGH, "s3fwrn82_en");
      |                                     ^~~~~~~~~~~~~~~~~~~
../drivers/nfc/s3fwrn5/uart.c:148:37: note: each undeclared identifier is reported only once for each function it appears in
../drivers/nfc/s3fwrn5/uart.c:154:37: error: ‘GPIOF_OUT_INIT_LOW’ undeclared (first use in this function)
  154 |                                     GPIOF_OUT_INIT_LOW, "s3fwrn82_fw_wake");
      |    


Possibly this:
---
 drivers/nfc/nfcmrvl/Kconfig |    3 +++
 drivers/nfc/s3fwrn5/Kconfig |    3 +++
 2 files changed, 6 insertions(+)

--- linux-next-20250725.orig/drivers/nfc/nfcmrvl/Kconfig
+++ linux-next-20250725/drivers/nfc/nfcmrvl/Kconfig
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config NFC_MRVL
 	tristate
+	depends on GPIOLIB
 	help
 	  The core driver to support Marvell NFC devices.
 
@@ -10,6 +11,7 @@ config NFC_MRVL
 config NFC_MRVL_USB
 	tristate "Marvell NFC-over-USB driver"
 	depends on NFC_NCI && USB
+	depends on GPIOLIB
 	select NFC_MRVL
 	help
 	  Marvell NFC-over-USB driver.
@@ -23,6 +25,7 @@ config NFC_MRVL_USB
 config NFC_MRVL_UART
 	tristate "Marvell NFC-over-UART driver"
 	depends on NFC_NCI && NFC_NCI_UART
+	depends on GPIOLIB
 	select NFC_MRVL
 	help
 	  Marvell NFC-over-UART driver.
--- linux-next-20250725.orig/drivers/nfc/s3fwrn5/Kconfig
+++ linux-next-20250725/drivers/nfc/s3fwrn5/Kconfig
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config NFC_S3FWRN5
 	tristate
+	depends on GPIOLIB
 	select CRYPTO
 	select CRYPTO_HASH
 	help
@@ -11,6 +12,7 @@ config NFC_S3FWRN5
 config NFC_S3FWRN5_I2C
 	tristate "Samsung S3FWRN5 I2C support"
 	depends on NFC_NCI && I2C
+	depends on GPIOLIB
 	select NFC_S3FWRN5
 	default n
 	help
@@ -24,6 +26,7 @@ config NFC_S3FWRN5_I2C
 config NFC_S3FWRN82_UART
         tristate "Samsung S3FWRN82 UART support"
         depends on NFC_NCI && SERIAL_DEV_BUS
+	depends on GPIOLIB
         select NFC_S3FWRN5
         help
           This module adds support for a UART interface to the S3FWRN82 chip.



-- 
~Randy


