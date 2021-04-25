Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C5F236A76B
	for <lists+linux-next@lfdr.de>; Sun, 25 Apr 2021 15:13:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230159AbhDYNOh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 25 Apr 2021 09:14:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229903AbhDYNOh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 25 Apr 2021 09:14:37 -0400
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5CECC061574;
        Sun, 25 Apr 2021 06:13:56 -0700 (PDT)
Received: by mail-qv1-xf29.google.com with SMTP id d1so14436941qvy.11;
        Sun, 25 Apr 2021 06:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+EaLjSNyjahD5wX2gIfe8gijx1Qem8j9JtHUQldUMoM=;
        b=D75VwP+KXMHaoqPtVHhpSclFnuygGR8m5ECs7TSuo6cDmaHUg0XhX1j6CLGaNk4wYh
         1Fa/ndwUn/cSkpZHdlEZIDNchQqdVUK0IrFlgpri8P3gCAzyAXhRswbBm59bTgZ4g7YW
         1P/+8rDM7iZOxVNeWfHi5xgLI+fSeQ6Dn+O1mjp6feCCf3VpjNhQD+pubfMRdC0d4TC5
         b0ZHObs8b8b/KIU0GGqJV63JE6xxfejqGbocEFHiwSbNsv8/7fYCb1EFMfwaRX1UPOxg
         uhSj/U1M+rvIS2qGdkcdEuIMH1NetTyByDCsggDPH17Hk+ZEK77LdY5wriCQbwYx8bwx
         9hzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+EaLjSNyjahD5wX2gIfe8gijx1Qem8j9JtHUQldUMoM=;
        b=i97ricRJ2Zi+DkCiR1mMcMrAvUAq6qQ/IpoL1mYF0+65/TcHSE6Azcv6ZzRyHpLkUa
         klgkATDFqij9cLK+ewlxNB0A5lyrf4pExt5n8Jii5Qs40tQyRxulvNVoNnXiejWSZz2i
         haDbj8N5LjSNKPKc5UubCRXh2KxbZWDa8f8jVQtn3XCNoRb3tLwArhCH8ROwf1K7ISjf
         vhFKeBX+9QRrUHUjC+5mpWXvDwFoBtMNmT9aNDvI5L50HRuxJ/BsEc6lOuwmRiHJFvnH
         JARWmN40WClVBiOj2w609rwJHaITztFwVce5/Yqru/0NDt5MlQt8Brh8k2eArNMTw/zo
         KJUQ==
X-Gm-Message-State: AOAM533nGAWk3JyinJ3n4OU2GgojttWHCrSUmy2XJXLxAkc6Mn5E5E7L
        N3oRZtmFSBCPDkofq1S6qpI=
X-Google-Smtp-Source: ABdhPJxFMda/COFna99g0NHEQl/phnluwRu0A716Xd9KnrPJ/1KycN1y6ix9+urXFAomv5kajBxR6Q==
X-Received: by 2002:ad4:542c:: with SMTP id g12mr13151898qvt.38.1619356435906;
        Sun, 25 Apr 2021 06:13:55 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:919:dc3c:c8fa:5d17:d49e])
        by smtp.gmail.com with ESMTPSA id x20sm8233134qkf.42.2021.04.25.06.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Apr 2021 06:13:55 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     gregkh@linuxfoundation.org
Cc:     chunfeng.yun@mediatek.com, sfr@canb.auug.org.au,
        stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
        linux-next@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3] usb: Restore the reference to ch9.h
Date:   Sun, 25 Apr 2021 10:13:43 -0300
Message-Id: <20210425131343.2525419-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Keep the textual reference to ch9.h as it was prior to commit
caa93d9bd2d7 ("usb: Fix up movement of USB core kerneldoc location").

As linux/usb/ch9.h does not contain comments anymore, explain
that drivers/usb/common/common.c includes such header and provides
declarations of a few utilities routines for manipulating the data types
from ch9.h. Also mention that drivers/usb/common/debug.c contains
some functions for creating debug output.

Fixes: caa93d9bd2d7 ("usb: Fix up movement of USB core kerneldoc location")
Reported-by: Alan Stern <stern@rowland.harvard.edu>
Suggested-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v2:
- Refer to include/uapi/linux/usb/ch9.h initially (Alan)

 Documentation/driver-api/usb/usb.rst | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/Documentation/driver-api/usb/usb.rst b/Documentation/driver-api/usb/usb.rst
index 543e70434da2..e97a46461884 100644
--- a/Documentation/driver-api/usb/usb.rst
+++ b/Documentation/driver-api/usb/usb.rst
@@ -109,16 +109,19 @@ well as to make sure they aren't relying on some HCD-specific behavior.
 USB-Standard Types
 ==================
 
-In ``drivers/usb/common/common.c`` and ``drivers/usb/common/debug.c`` you
-will find the USB data types defined in chapter 9 of the USB specification.
-These data types are used throughout USB, and in APIs including this host
-side API, gadget APIs, usb character devices and debugfs interfaces.
+In ``include/uapi/linux/usb/ch9.h`` you will find the USB data types defined
+in chapter 9 of the USB specification. These data types are used throughout
+USB, and in APIs including this host side API, gadget APIs, usb character
+devices and debugfs interfaces. That file is itself included by
+``<linux/usb/ch9.h>``, which also contains declarations of a few utility
+routines for manipulating these data types; the implementations are
+in ``drivers/usb/common/common.c``.
 
 .. kernel-doc:: drivers/usb/common/common.c
    :export:
 
-.. kernel-doc:: drivers/usb/common/debug.c
-   :export:
+In addition, some functions useful for creating debugging output are
+defined in ``drivers/usb/common/debug.c``.
 
 Host-Side Data Types and Macros
 ===============================
-- 
2.25.1

