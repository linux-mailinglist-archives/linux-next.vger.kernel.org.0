Return-Path: <linux-next+bounces-6223-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A650A881DF
	for <lists+linux-next@lfdr.de>; Mon, 14 Apr 2025 15:27:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EF9317AA72D
	for <lists+linux-next@lfdr.de>; Mon, 14 Apr 2025 13:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB471279914;
	Mon, 14 Apr 2025 13:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mFCriNJ/"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0277279902;
	Mon, 14 Apr 2025 13:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744637093; cv=none; b=oGKKBmRhqfazlWYlMfEr5TsAIwkBDCPj4CBvBUX7xq9xxFuNxlU4sXq15FPi1XZh67IAGTuOI+graFz18ruyRG03uUWVzPimXDQvJ91Cyl9pervz6up3fSSDBAqg5RdwsbjD88FxGGCa2FJCUMBbeAH2jX2DAzsza1z0X6X4Q8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744637093; c=relaxed/simple;
	bh=ACVA+TUPNfROGQIvsomtPiAhn/6FzmipLP5nblzK3RQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dVBxzYXujQpDNEoHzZ7562PXkwTZu0tLNXtjAyMPFpzoBvA4zY2m4lFh+zJ5Lewo2eIwZjpl9ga50p0190ilTcqGg8Lyp0m0gnQQb/YDMZdzPdKe23BaYHFAm0Y7FUkCayRyMvNN3rqZS+lzd3bB0EDcf5m/qtok0iuCKcWOWTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mFCriNJ/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C34AAC4CEE9;
	Mon, 14 Apr 2025 13:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744637092;
	bh=ACVA+TUPNfROGQIvsomtPiAhn/6FzmipLP5nblzK3RQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mFCriNJ/U1LCcnmlXrR970arCWU9JWeP+uI+fcxAR5yOUjKwMJ7GxXN59c+X3goy0
	 07s/lNrbDjbZmoBaXjF6qtZBxkNNSQjsjNEgt6ApUkfVoAGbymm/XAjp5j8tUTRiZk
	 Utp3jE4wb2aLafNZzeIdIad+EysD5lBiewrGWN02LrdKnvQP44eLmn0s0XJh/6VI/X
	 /BIkUKjP20aclzs0MDDj/M26Jiuiv2z2EgLBVuASTgEoAfcRxk58sjYkYiQRFOfiSa
	 sngEyQxHdn+OCagW8EhlZlh5JdHs/Yk99+2zCLD+IT1HbDrdfiEnoVqvZzto1zXcJH
	 17DklS5/4qxMw==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	sfr@canb.auug.org.au
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	linux-next@vger.kernel.org,
	srosek@chromium.org
Subject: [PATCH 2/2] platform/chrome: cros_kbd_led_backlight: Fix build dependencies
Date: Mon, 14 Apr 2025 21:24:27 +0800
Message-ID: <20250414132427.204078-3-tzungbi@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250414132427.204078-1-tzungbi@kernel.org>
References: <20250414132427.204078-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ccf395bde6ae ("platform/chrome: cros_ec_proto: Allow to build as module")
allows CROS_EC_PROTO to be a module.

The config is possible to be:
- CONFIG_ACPI=y
- CONFIG_CROS_EC=m
- CONFIG_MFD_CROS_EC_DEV=m
- CONFIG_CROS_EC_PROTO=m
- CONFIG_CROS_KBD_LED_BACKLIGHT=y

As a result:
ld: vmlinux.o: in function `keyboard_led_set_brightness_ec_pwm':
cros_kbd_led_backlight.c:(.text+0x3554e4c): undefined reference to `cros_ec_cmd_xfer_status'
ld: vmlinux.o: in function `keyboard_led_get_brightness_ec_pwm':
cros_kbd_led_backlight.c:(.text+0x3554f41): undefined reference to `cros_ec_cmd_xfer_status'

The built-in code in CROS_KBD_LED_BACKLIGHT can't find symbols defined in
the module CROS_EC_PROTO.

Let A=ACPI (bool), M=MFD_CROS_EC_DEV (tristate), and
K=CROS_KBD_LED_BACKLIGHT (tristate).  The possible values are:

| A | M | choice for K |
------------------------
| y | y | y/m/n        |
| y | m | m/n          |
| y | n | y/m/n        |
| n | y | y/m/n        |
| n | m | m/n          |
| n | n | n            |

Fix the dependencies in the Kconfig.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/chrome-platform/ed8adc69-c505-4108-bf63-92911b0395c7@infradead.org/T/#u
Fixes: ccf395bde6ae ("platform/chrome: cros_ec_proto: Allow to build as module")
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/platform/chrome/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/Kconfig b/drivers/platform/chrome/Kconfig
index 1614b9d3c5c2..10941ac37305 100644
--- a/drivers/platform/chrome/Kconfig
+++ b/drivers/platform/chrome/Kconfig
@@ -161,7 +161,8 @@ config CROS_EC_PROTO
 
 config CROS_KBD_LED_BACKLIGHT
 	tristate "Backlight LED support for Chrome OS keyboards"
-	depends on LEDS_CLASS && (ACPI || MFD_CROS_EC_DEV)
+	depends on LEDS_CLASS
+	depends on MFD_CROS_EC_DEV || (MFD_CROS_EC_DEV=n && ACPI)
 	help
 	  This option enables support for the keyboard backlight LEDs on
 	  select Chrome OS systems.
-- 
2.43.0


