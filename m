Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E23202BA261
	for <lists+linux-next@lfdr.de>; Fri, 20 Nov 2020 07:36:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725942AbgKTGfh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 20 Nov 2020 01:35:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725824AbgKTGfh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 20 Nov 2020 01:35:37 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 314B5C0613CF
        for <linux-next@vger.kernel.org>; Thu, 19 Nov 2020 22:35:36 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id 10so6919371pfp.5
        for <linux-next@vger.kernel.org>; Thu, 19 Nov 2020 22:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UYeryhhLnBdm9RAE9YUBJfYBX7HwSsxcuui/BkbEdkg=;
        b=hrZ6UaN/7BT3yY4EPy4Kjnh32hbKPphJwy8ODAbK0rjE9fdlPAQMN/Rmx08R+qDWTh
         1Nv8cihXOVAQhIlSk5kG1xG402l0P6qtqH486eAyf84z5iUqZVq7qeaiotSU9SaZPDTq
         pmjaO9p/ZRnqgdfJFR/xKrRT5lYmfdF4ziEpg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UYeryhhLnBdm9RAE9YUBJfYBX7HwSsxcuui/BkbEdkg=;
        b=OoYwcqtOsgqAXSxve6JivG5XGmf+C29o/2qdqyngAmv/kyy2NiDuqYhrBp8uLNTGZP
         Ld0nTlE4uPRgxj5UScTPlZX28JEfNsWET0HPlOFdPUuhJhjJNRMI94C1UFYLWdJ3gZHS
         VGgn9moQ/TuNiGatVoXvHiR6m4vcWHr/wAmtfhOQ1OH5AzA3zL+HX4xubXmM/jqK2OP3
         sYJ7ITBMa5jOTUg85l4spNjNTn+hSJ9EbsTliSTJNLOM2tg/5EGiAmq7pVDOEJNSym7M
         cvSIlFak6sBrDyEA4vEU2PfV6ruaQa0ZJw7hZQtPyw+DfElaJHArin7/XorKULmTgcby
         49+g==
X-Gm-Message-State: AOAM530X/Wh79dtepgcbRZll6xc/YlDzdJXj+MPNCTMbPllW6cGySIK+
        6xbx6zzf7r6BZ66S5rlCShdc4g==
X-Google-Smtp-Source: ABdhPJxeYZSrhZzf4QcE/FoGldIyvdOZipOafH9bIW9lFXOjGUzixr0COtgUDsu0rO4YI5qPreqyIQ==
X-Received: by 2002:a17:90a:4483:: with SMTP id t3mr8169405pjg.116.1605854135701;
        Thu, 19 Nov 2020 22:35:35 -0800 (PST)
Received: from pmalani2.mtv.corp.google.com ([2620:15c:202:201:a28c:fdff:fef0:49dd])
        by smtp.gmail.com with ESMTPSA id s15sm2191962pfd.33.2020.11.19.22.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 22:35:35 -0800 (PST)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        heikki.krogerus@linux.intel.com
Cc:     linux-kernel@vger.kernel.org, sfr@canb.auug.org.au,
        linux-next@vger.kernel.org, Prashant Malani <pmalani@chromium.org>
Subject: [PATCH] usb: typec: Fix num_altmodes kernel-doc error
Date:   Thu, 19 Nov 2020 22:35:22 -0800
Message-Id: <20201120063523.4159877-1-pmalani@chromium.org>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

The commit to introduce the num_altmodes attribute for partner had an
error where one of the parameters was named differently in the comment
and the function signature. Fix the version in the comment to align with
what is in the function signature.

This fixes the following htmldocs warning:

drivers/usb/typec/class.c:632: warning: Excess function parameter
'num_alt_modes' description in 'typec_partner_set_num_altmodes'

Fixes: a0ccdc4a77a1 ("usb: typec: Add number of altmodes partner attr")
Signed-off-by: Prashant Malani <pmalani@chromium.org>
---
 drivers/usb/typec/class.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index e68798599ca8..cb1362187a7c 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -618,7 +618,7 @@ EXPORT_SYMBOL_GPL(typec_partner_set_identity);
 /**
  * typec_partner_set_num_altmodes - Set the number of available partner altmodes
  * @partner: The partner to be updated.
- * @num_alt_modes: The number of altmodes we want to specify as available.
+ * @num_altmodes: The number of altmodes we want to specify as available.
  *
  * This routine is used to report the number of alternate modes supported by the
  * partner. This value is *not* enforced in alternate mode registration routines.
-- 
2.29.2.454.gaff20da3a2-goog

