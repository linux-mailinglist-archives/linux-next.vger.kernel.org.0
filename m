Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B6072CBE1A
	for <lists+linux-next@lfdr.de>; Wed,  2 Dec 2020 14:21:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727234AbgLBNUk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 2 Dec 2020 08:20:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725973AbgLBNUk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 2 Dec 2020 08:20:40 -0500
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41F69C0613CF;
        Wed,  2 Dec 2020 05:20:00 -0800 (PST)
Received: by mail-pj1-x1042.google.com with SMTP id iq13so1000537pjb.3;
        Wed, 02 Dec 2020 05:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=taPUUzmWyx71JJ+EyPrlnb1liqlHwH94GdsdOoFOyjs=;
        b=I9Q3qQbO7ZZ0jhafpTImuGaDyAR388ReHqJDt7wJth2miuZcjcrpUthnmNQTphpQ1g
         WJNJ78oPCRm9oHImWLxvCq2bWQPZKH3puLQ69x+pHbxrfiECpcdvwUzv3WunGi+S22om
         oHNMUsTCC4qSwixXo5jQXZvjVKofL+WIuaZ1DslUA8eEwl6AaTuYBwn2Kb+Vbd67tAlT
         nrqPtm9RdDBFWJLLZ+jOhzU+E7LEfRHlcHkmjSyPKI8GTAXp1F+/XmUg4ssL1tzT92iA
         2QgYKN8ZIONt8RTOt8x2Fl79c7T0geroX9uHCSvJhEerz1umGa6K9fPv3Rrz/n8GrjDn
         hLPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=taPUUzmWyx71JJ+EyPrlnb1liqlHwH94GdsdOoFOyjs=;
        b=O4WH6bcMnJSvNX/0WAsk/vEBwr6QW5tXyq5eYLjSI5nnpX7Wy37+l8C3fP/WGx6jq4
         vbKZABxhvhJ5g4KeWoVH0OvMhGR6heCTcmc5QQ5jzMwIN1g+2Ib7x29VXKJfmutmcsYt
         y4GVQGvadNSilgqZ9ZavZG1lKYI5iO8TRe5TJ3gZnHhLoiV9S6p0pVdTW+Bs2i1PXg25
         6W8PPa+SVCShLssJz2YNwGSH6abrHszHQmeIXvzCASWgaNXZuqbO5U5D5s4UCc8V1YnD
         tXPUFJlRNaa4wDyD/Pn5lJIrRCtYV/hqYBuJMbRUHp4ZkAQO2xLpZo2RjCmQDEauBwCK
         RYsw==
X-Gm-Message-State: AOAM532R23fABS3xxfBTtv8FhTtfC+p1gSovHxHx07h8B2pT0TXIaJZh
        gV+wKG43ZG7vEkLdmWWpnfQ=
X-Google-Smtp-Source: ABdhPJwU5kOQ5WeBcuxnv2+Y2qYmI4Cuqt40VPsuoq9e0crbwLJa6Py/3qzM75nTtoM5H4lVfXH5QQ==
X-Received: by 2002:a17:902:d90d:b029:da:5114:7275 with SMTP id c13-20020a170902d90db02900da51147275mr2637399plz.64.1606915199889;
        Wed, 02 Dec 2020 05:19:59 -0800 (PST)
Received: from localhost.localdomain ([223.228.6.132])
        by smtp.gmail.com with ESMTPSA id gp14sm1978287pjb.6.2020.12.02.05.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 05:19:59 -0800 (PST)
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
Date:   Wed,  2 Dec 2020 18:49:35 +0530
Message-Id: <20201202131935.307372-1-divya.bharathi@dell.com>
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
index ea773d8e8d3a..75aedbb733be 100644
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
+		memmove(buf, (buf + 1), strlen(buf + 1) + 1);
+
 	return ret;
 }
 
-- 
2.25.1

