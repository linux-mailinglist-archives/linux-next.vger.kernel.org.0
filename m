Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5B1D2DA947
	for <lists+linux-next@lfdr.de>; Tue, 15 Dec 2020 09:37:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727093AbgLOIgV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Dec 2020 03:36:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726985AbgLOIgU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 15 Dec 2020 03:36:20 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9344AC0617A6
        for <linux-next@vger.kernel.org>; Tue, 15 Dec 2020 00:35:39 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id e25so17636193wme.0
        for <linux-next@vger.kernel.org>; Tue, 15 Dec 2020 00:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WvPKKN96Ccg1VL09cf4I7WxZ2qrcDyYIpB/dBxWbKho=;
        b=bg7lpsy+arnhoFT5o3fVrzhi1dBcLS9Z7KUjhsDMhtXxs9KANFmHs3JjB9i+rDm5DN
         YtmAfwtA4q4ke9zoZwm97l2iH0DoZlEeVi0RRGtqL95E6fgS1G4rY5z0BJldBesAQM/a
         X//R/gMqXNhGFXPmpvpz4osZFDW0HCD6PzztXeun0dNzWbHRv0G/SkKjuXLIBBGCrXsd
         t4etzAEQmukujrvRKZ9Bf4FslpulTVOzsUHj8y2y0vQH1pMT8BYxM9tfL9bsf5ZmbIJC
         O/HfDeyM1xw6uR/dBJhIOMBLJQ/8QV/KGoc9utEL2kOpD5h4odjr5q8M+iK+wvERUiMx
         +MkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WvPKKN96Ccg1VL09cf4I7WxZ2qrcDyYIpB/dBxWbKho=;
        b=HZ7NIWkhN0WGCQiCE/k6pXpimQG1yKGID9Kvk0PKdINvlLuNMwnXevjZZysOGWjYPs
         OguC52ObQnMUCs46cnqfr/ZDVhfWejjTYS1dv43vLBmK9AkXRS9z212tM7aNaV3W5Ks5
         NQZ5D2TMSFuIfFdzn2fVHUcQOJClM/afcau5QLqLMNv7uaEfKlgP2JZGKz3cHXExZ98n
         GtIot5VxQvvQ4Byh7o4dE67GBaf10pjctcoIhL5O9dPEolEHPCRZRXxmzG41V8xjyZvh
         mD0tU9Q76J6tQlkcw9fMxBO/N8+PhpaqbQwuOEUL2zg4fPT66Mg3mGr2+Mva31I8iFH5
         aN5Q==
X-Gm-Message-State: AOAM532FrnTvsvJaHeGyLeOJQnXl7cZoLts4V+7Zi4mLKui2CkT3wG9o
        e092mBRdr/CP6OL76etjnXHkjw==
X-Google-Smtp-Source: ABdhPJzsSkohaz1ioGJS6qcY8m24+xFpkgROSZxyI2LPJ5+mID0W/NhoA6/iDJm6HpGyTsRYPXk1vw==
X-Received: by 2002:a1c:9609:: with SMTP id y9mr16593639wmd.75.1608021338071;
        Tue, 15 Dec 2020 00:35:38 -0800 (PST)
Received: from mai.imgcgcw.net ([2a01:e34:ed2f:f020:e842:4086:6f24:55a6])
        by smtp.gmail.com with ESMTPSA id 64sm36577980wmd.12.2020.12.15.00.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 00:35:37 -0800 (PST)
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com
Cc:     sfr@canb.auug.org.au, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org
Subject: [PATCH] thermal/drivers/devfreq: Fix missing dependency with the energy model
Date:   Tue, 15 Dec 2020 09:35:20 +0100
Message-Id: <20201215083520.601988-1-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201215125806.31495950@canb.auug.org.au>
References: <20201215125806.31495950@canb.auug.org.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

The devfreq cooling device has been converted to use the energy model.

Add the dependency on the ENERGY_MODEL option to reflect this change
and prevent build failure if the option is not set.

Fixes: 615510fe13bd2 ("thermal: devfreq_cooling: remove old power model and use EM")
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/thermal/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig
index 7edc8dc6bbab..ee62d51ef351 100644
--- a/drivers/thermal/Kconfig
+++ b/drivers/thermal/Kconfig
@@ -193,6 +193,7 @@ config DEVFREQ_THERMAL
 	bool "Generic device cooling support"
 	depends on PM_DEVFREQ
 	depends on PM_OPP
+	depends on ENERGY_MODEL
 	help
 	  This implements the generic devfreq cooling mechanism through
 	  frequency reduction for devices using devfreq.
-- 
2.25.1

