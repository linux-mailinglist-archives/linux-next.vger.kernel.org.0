Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D3E636A1D4
	for <lists+linux-next@lfdr.de>; Sat, 24 Apr 2021 17:48:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232663AbhDXPt2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 24 Apr 2021 11:49:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232434AbhDXPt2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 24 Apr 2021 11:49:28 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51A11C061574;
        Sat, 24 Apr 2021 08:48:48 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id x11so52518141qkp.11;
        Sat, 24 Apr 2021 08:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n6oaxNe0O7usSXuy78T0qiApMK5U0SOb3jy0M+P4mMI=;
        b=Z4qQQMIllCxgjUIhUZ/QrwRPNFtsjKIx0akEwMt6jLxUNK7vkbRbUPE+IJGOWG/pLw
         YSdC9JGu0bYLeqD5OqSJewP7iqjM/eCTyFftxA8eOt6aNeAWu1oNVLtjh/wqMZockeiA
         w5GMjsegiuti/cEBJ7vMO9bHYAMaPgeYqZsaqsPwt0vgocyYVqWhh0+ImIbUgdf6cqGf
         hsDps7cDWdFXBehgy6A/b/W+VR/QyjXxQ3cvBLOuVcvmPfl8QXOm9nJm5c2ice5U9kSQ
         Le9W7e9UQSLrsfAzRN+kUSlHYDWwu3yK6d6ybB7KnMIJRhY1ZuNSvnU98avFa+saaK2N
         W5aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n6oaxNe0O7usSXuy78T0qiApMK5U0SOb3jy0M+P4mMI=;
        b=r6TdnB8XcUePjzj5YbWjRxOc58LD1NGe/mxkL6t+blbSbNXgMU5sTOFUGjpWye7eym
         +6BRJN3HQn3nJhn6v/AWrXzMvdSHpqoxOOl/uLYK7YCB9zb7tiiivcdz1R/JJmxJBJS9
         7TD92j2YBC48Y+7cZgcJPGmsuZOCsVH2K5otte4Y2hAXtw0lm8VyaNr1zP2ZWwUsh13b
         MjCB96Aau+9QrnR3LjlTP0AI3uL3zgmqnQqkvgvk29CqM/OZcX4ovnzrT8uTzrucNjez
         ZuLcQEexpmFSemCTOLL0XIvaLJYmGHmIzMQUD8518Z3eg09921cOVIJJuNcM52VpzCut
         bcnA==
X-Gm-Message-State: AOAM533CnY4JQXG/AifKIVgC/0n8XZtmZnFhtiTy2IAyfc/tm/odHwnj
        erOkHXI1BRQEwpo1aCaLnqUVvvp15J8=
X-Google-Smtp-Source: ABdhPJxSMeJG3sHBuYsbAgp5K3h+HCtAaGRVHcaIu42lZc2VG2KtnqfFNUhgOC5Z6TXZm06w8utv/w==
X-Received: by 2002:a37:64d:: with SMTP id 74mr9288672qkg.6.1619279327346;
        Sat, 24 Apr 2021 08:48:47 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:d77f:e204:dc3c:c8fa:5d17:d49e])
        by smtp.gmail.com with ESMTPSA id q67sm6702448qkb.89.2021.04.24.08.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 08:48:46 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     gregkh@linuxfoundation.org
Cc:     chunfeng.yun@mediatek.com, sfr@canb.auug.org.au,
        stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
        linux-next@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] usb: Restore the reference to ch9.h
Date:   Sat, 24 Apr 2021 12:48:23 -0300
Message-Id: <20210424154823.2489144-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Keep the textual reference to ch9.h as it was prior to commit
caa93d9bd2d7 ("usb: Fix up movement of USB core kerneldoc location").

As ch9.h does not have any comments anymore, just remove the kernel-doc
entries entirely.

Fixes: caa93d9bd2d7 ("usb: Fix up movement of USB core kerneldoc location")
Reported-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
This one applies against usb-next.

 Documentation/driver-api/usb/usb.rst | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/Documentation/driver-api/usb/usb.rst b/Documentation/driver-api/usb/usb.rst
index 543e70434da2..251cab7cacd7 100644
--- a/Documentation/driver-api/usb/usb.rst
+++ b/Documentation/driver-api/usb/usb.rst
@@ -109,16 +109,10 @@ well as to make sure they aren't relying on some HCD-specific behavior.
 USB-Standard Types
 ==================
 
-In ``drivers/usb/common/common.c`` and ``drivers/usb/common/debug.c`` you
-will find the USB data types defined in chapter 9 of the USB specification.
-These data types are used throughout USB, and in APIs including this host
-side API, gadget APIs, usb character devices and debugfs interfaces.
-
-.. kernel-doc:: drivers/usb/common/common.c
-   :export:
-
-.. kernel-doc:: drivers/usb/common/debug.c
-   :export:
+In ``<linux/usb/ch9.h>`` you will find the USB data types defined in
+chapter 9 of the USB specification. These data types are used throughout
+USB, and in APIs including this host side API, gadget APIs, usb character
+devices and debugfs interfaces.
 
 Host-Side Data Types and Macros
 ===============================
-- 
2.25.1

