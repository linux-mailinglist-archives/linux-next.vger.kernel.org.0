Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B716836A225
	for <lists+linux-next@lfdr.de>; Sat, 24 Apr 2021 18:35:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232051AbhDXQgI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 24 Apr 2021 12:36:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230230AbhDXQgE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 24 Apr 2021 12:36:04 -0400
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E1AEC061574;
        Sat, 24 Apr 2021 09:35:22 -0700 (PDT)
Received: by mail-qt1-x830.google.com with SMTP id d12so554638qtr.4;
        Sat, 24 Apr 2021 09:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H1swjB5sBEumjmikoD+cnpIqh/2nhu2m7ej0LcgcroI=;
        b=ch408zOGXb7MfNr1+7bq4qa7UnlJd4QUmjEBVQQEjEqmUKrWfBbszqQTKfvO7AmATa
         GXpPInX2r3Syeo5QvnE7yaZJcb6v8TgRp/wgvPZenMpnHe+mn0VVd24g8c6X1Bu+qdvP
         oK9hc8sZLVc9Cw7nmVoNiV/QvzoDsRP9RmmuXQYd7HltKPrUCXj9J6oRsMaxCKav4rZ8
         D9hYWxs6oaIpA6ehkECZ1qEkp8muzIDri1IXmjN9vgFzMepWonTzrls7Ltb/sgC3+w3R
         /cxm5w0ogVcdc31xcGXiD7p2Gs2C3I4+GGA39sxigftLmpfOy0uUIUHqtPbyz+ieqRgC
         oawA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H1swjB5sBEumjmikoD+cnpIqh/2nhu2m7ej0LcgcroI=;
        b=IxLnBRowQiu2xLsxzqdRdcG+97ZsFXjNOPIXc5VcTZ9Hf7R2PlIUuKQu6JHBX9pFW9
         P/5iutmzziZU5Tp1RWbIJLz8atON6N+XUvI9dFV00GVWIBesEj+mXQFXyZqWf2GgwFxF
         HCPxq+HydasrDloZkhK0PlihpdNCL6xw/LXisM0r/5t8ib1JGigLOl5KTdQtufHftSgx
         sxdu9DqNuV6oaRFoXU5e039FKDoahXfZvT761LLfXuVA5Ju+416L0knKm5Eio2PqZyBy
         0UUwnWtNb67h9QwLk2ZUlYothULQcYJQ0n1+QYWBxo8ky2tVZNPdoc1q4r9CFHA0Gpl3
         beOA==
X-Gm-Message-State: AOAM532JSlyziIWIB+bhq9a/Gh0ogyySJROUwbRHjCWEHTIESt6Vs5AG
        5XDATFUJH3n3needB7yx06kFEwYazjg=
X-Google-Smtp-Source: ABdhPJwjD0Cw2XQ3dJxf/mDVsJ6VMuOYoIexbKs4c0+jDSfdXQt6BbHXmoPnzLvYhNrERXhAANcUWA==
X-Received: by 2002:a05:622a:1208:: with SMTP id y8mr8918046qtx.215.1619282120643;
        Sat, 24 Apr 2021 09:35:20 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:d77f:e204:dc3c:c8fa:5d17:d49e])
        by smtp.gmail.com with ESMTPSA id w5sm6718639qkc.85.2021.04.24.09.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 09:35:19 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     gregkh@linuxfoundation.org
Cc:     chunfeng.yun@mediatek.com, sfr@canb.auug.org.au,
        stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
        linux-next@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2] usb: Restore the reference to ch9.h
Date:   Sat, 24 Apr 2021 13:34:30 -0300
Message-Id: <20210424163430.2494316-1-festevam@gmail.com>
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
Changes since v1:
- Incorporate Alan's feedback.

 Documentation/driver-api/usb/usb.rst | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/Documentation/driver-api/usb/usb.rst b/Documentation/driver-api/usb/usb.rst
index 543e70434da2..2773cc3998fd 100644
--- a/Documentation/driver-api/usb/usb.rst
+++ b/Documentation/driver-api/usb/usb.rst
@@ -109,16 +109,19 @@ well as to make sure they aren't relying on some HCD-specific behavior.
 USB-Standard Types
 ==================
 
-In ``drivers/usb/common/common.c`` and ``drivers/usb/common/debug.c`` you
-will find the USB data types defined in chapter 9 of the USB specification.
-These data types are used throughout USB, and in APIs including this host
-side API, gadget APIs, usb character devices and debugfs interfaces.
+In ``<linux/usb/ch9.h>`` you will find the USB data types defined in
+chapter 9 of the USB specification. These data types are used throughout
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

