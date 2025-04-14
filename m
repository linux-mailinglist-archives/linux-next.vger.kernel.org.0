Return-Path: <linux-next+bounces-6222-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 62071A8843D
	for <lists+linux-next@lfdr.de>; Mon, 14 Apr 2025 16:15:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D12FE1696CA
	for <lists+linux-next@lfdr.de>; Mon, 14 Apr 2025 14:09:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33EC0279901;
	Mon, 14 Apr 2025 13:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X/YfjOMU"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC7A2798FA;
	Mon, 14 Apr 2025 13:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744637091; cv=none; b=vFzGYOq9IgO9fNZ1rdQPOGUCizjFObMt+o09W3Fvlmyl62QBA/BJtsFyemN1wJBHrRNfkmmcd96EAtt9X9WyUIKSmUHXmm0TYe8/z8qaSB39pES67XBASbXZCERRbnCS4CuhRn/UJgJrZcmmfeGcH03v9szMiYVa/5yeYSiClKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744637091; c=relaxed/simple;
	bh=+i0qPgmoaShI5slWyUhRUAcggAJFMIW0AifbMX4u8rs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eGCBxlDzEAFkp5xjKQuR0znnz5jVwNGPJEL2AirhNT3r8GOKFfC1xRALh2F6nUrX7+Ek6LggqEVr3HJPIvCzel5QEEMH+wvbru3w1S43xIpHPUOEPsgqpTn7z0R+2WcXinPD976JFbKETO21o82VYlTJcPxOF3wmTOyXn9IxT1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X/YfjOMU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19985C4CEF1;
	Mon, 14 Apr 2025 13:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744637090;
	bh=+i0qPgmoaShI5slWyUhRUAcggAJFMIW0AifbMX4u8rs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X/YfjOMUx974TllR/qERNRs/eEu4GDVftdgRqdLNnOIjPHET457RcR/nWp6b+wIUc
	 pp6Ba1o0BKnTkkWsj2hx9bDWAOi/qEpXAqeYoXtSUKPtHRMPx+zSpRZ/x1Vw6dgH9q
	 l2Y1KRW+1CeDJfQ3r4hl1jDjnTaNd8r9sCGhlVxLENqTr8AfagvrlqyMblYgK5b/b6
	 qR9MhWxd8rdi7edeq/sLMJH3O+klMp2j7fJUp9OE8cyBth+ODcwDR4cKiyWrG3HV4e
	 bj24vv0kqRUkDzGlj6aiKAcfUvA6S54e+J5RLb0J1kpw23EJa34XsDtxVzZFCzBExt
	 gGb+Q+mOmymLw==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	sfr@canb.auug.org.au
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	linux-next@vger.kernel.org,
	srosek@chromium.org
Subject: [PATCH 1/2] platform/chrome: cros_kbd_led_backlight: Remove CROS_EC dependency
Date: Mon, 14 Apr 2025 21:24:26 +0800
Message-ID: <20250414132427.204078-2-tzungbi@kernel.org>
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

After applying 3a1d61dc3202 ("platform/chrome: cros_kbd_led_backlight:
Remove OF match"), cros_kbd_led_backlight no longer depends on CROS_EC
directly.

Remove the redundant dependency.

Fixes: 3a1d61dc3202 ("platform/chrome: cros_kbd_led_backlight: Remove OF match")
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/platform/chrome/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/Kconfig b/drivers/platform/chrome/Kconfig
index f523ae3d3be0..1614b9d3c5c2 100644
--- a/drivers/platform/chrome/Kconfig
+++ b/drivers/platform/chrome/Kconfig
@@ -161,7 +161,7 @@ config CROS_EC_PROTO
 
 config CROS_KBD_LED_BACKLIGHT
 	tristate "Backlight LED support for Chrome OS keyboards"
-	depends on LEDS_CLASS && (ACPI || CROS_EC || MFD_CROS_EC_DEV)
+	depends on LEDS_CLASS && (ACPI || MFD_CROS_EC_DEV)
 	help
 	  This option enables support for the keyboard backlight LEDs on
 	  select Chrome OS systems.
-- 
2.43.0


