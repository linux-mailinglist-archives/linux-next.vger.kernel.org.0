Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67B432CB562
	for <lists+linux-next@lfdr.de>; Wed,  2 Dec 2020 07:59:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726760AbgLBG5o (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 2 Dec 2020 01:57:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726716AbgLBG5o (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 2 Dec 2020 01:57:44 -0500
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C8E4C0613CF;
        Tue,  1 Dec 2020 22:57:04 -0800 (PST)
Received: by mail-pl1-x641.google.com with SMTP id f1so133578plt.12;
        Tue, 01 Dec 2020 22:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ctf3PqzH4JYE7smVT3qWuHIG8ssCDFcRYb82JgR6/DI=;
        b=hTdB4ost8pgSz090r/WZyYXppOORWuqZBSi5r1t5qwbJyk+sYkZlF6i2B91VDiPQeh
         hUDa8eTjRk2GoaZJDrjKYgfHKnLtRZrW2w+Y1WPwFvVrSrxEsZyQLNo/1b34YsDGthzO
         olf6/fIS464ee43BF6BB2GYcGLM7rtxpoUU4oTmoRs8OLuCQEtChNWauzJ8bak3vBm0X
         gRNdKqP70dErvZEroH/cpdWLVEeeoYUb7whQs+E9eEOI4MOOZ8S3mKLuIOXTT+ehzMCZ
         73ulYfcYLvUk38ehnmEe/fRFFaB4bSH9e1F+bo6IsKaFAJGSPH1+QgvxZVEVzfy6/5ut
         3uyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ctf3PqzH4JYE7smVT3qWuHIG8ssCDFcRYb82JgR6/DI=;
        b=dPBI7Hrn+MrIn3k8rGx+w3YjWuRGTBZmWu9yOz+y0tWXjo0GJY9E0nxQaBGjQnN77L
         pyE8jK1WphGnMRK42NxgCXl8eM+GGFm2I7bXfxGXTkUqN8lMzEskBBKJihM9OmiOy8va
         N00soisHmnJuwqIlrdDymM98G+4islqUDSEpKXnHVxfWroyVDl4rk6+xf/UGmy9G6nbr
         YrSYm8WDtVypLr/ErMWAC3tfGvIcwoHy8Iy5qV6WzB4VnqmllfHtiexYtQ4JtIcz4Uyl
         tZA/tfFvEwFOmmB5CkBdBV/SA8+g9/LpbEg0WUMxKymWkhS9o/P+PZhKr+K7Mqn4Pf8R
         SbsA==
X-Gm-Message-State: AOAM5327rFrEz33+vx0BcCucNrvmsM2azBtG6gLCdIm+IfRw/v7dxoBT
        2yHI32rTYz01Tw8lbziyng8=
X-Google-Smtp-Source: ABdhPJx1jmwHslkjJ7AO5chpyFznc2kqiUeI/xlxtxzJuOsFHuEI3JvUNGw3c4lQ8fsAq9fZKbmRvQ==
X-Received: by 2002:a17:90a:e386:: with SMTP id b6mr1064739pjz.134.1606892223758;
        Tue, 01 Dec 2020 22:57:03 -0800 (PST)
Received: from localhost.localdomain ([2409:4071:e18:d4b7:e07e:88bd:adb:8fec])
        by smtp.gmail.com with ESMTPSA id i10sm1110941pfq.189.2020.12.01.22.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 22:57:03 -0800 (PST)
From:   Divya Bharathi <divya27392@gmail.com>
X-Google-Original-From: Divya Bharathi <divya.bharathi@dell.com>
To:     dvhart@infradead.org, Hans de Goede <hdegoede@redhat.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org,
        Divya Bharathi <divya.bharathi@dell.com>,
        Mario Limonciello <mario.limonciello@dell.com>,
        Prasanth KSR <prasanth.ksr@dell.com>
Subject: [PATCH] platform/x86: dell-wmi-sysman: work around for BIOS bug
Date:   Wed,  2 Dec 2020 12:26:36 +0530
Message-Id: <20201202065636.299000-1-divya.bharathi@dell.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

BIOS sets incorrect value (zero) when SET value passed for integer attribute
with + sign. Added workaround to remove + sign before passing input to BIOS

Co-developed-by: Mario Limonciello <mario.limonciello@dell.com>
Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
Co-developed-by: Prasanth KSR <prasanth.ksr@dell.com>
Signed-off-by: Prasanth KSR <prasanth.ksr@dell.com>
Signed-off-by: Divya Bharathi <divya.bharathi@dell.com>
---
 drivers/platform/x86/dell-wmi-sysman/int-attributes.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell-wmi-sysman/int-attributes.c b/drivers/platform/x86/dell-wmi-sysman/int-attributes.c
index ea773d8e8d3a..f30d155135c3 100644
--- a/drivers/platform/x86/dell-wmi-sysman/int-attributes.c
+++ b/drivers/platform/x86/dell-wmi-sysman/int-attributes.c
@@ -39,7 +39,7 @@ static ssize_t current_value_show(struct kobject *kobj, struct kobj_attribute *a
  * @instance_id: The instance on which input is validated
  * @buf: Input value
  */
-static int validate_integer_input(int instance_id, const char *buf)
+static int validate_integer_input(int instance_id, char *buf)
 {
 	int in_val;
 	int ret;
@@ -51,6 +51,12 @@ static int validate_integer_input(int instance_id, const char *buf)
 			in_val > wmi_priv.integer_data[instance_id].max_value)
 		return -EINVAL;
 
+	/* workaround for BIOS error.
+	 * validate input to avoid setting 0 when integer input passed with + sign
+	 */
+	if (*buf == '+')
+		memmove(buf, (buf + 1), strlen(buf));
+
 	return ret;
 }
 
-- 
2.25.1

