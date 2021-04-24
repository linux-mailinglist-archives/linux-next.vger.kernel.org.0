Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92D7D36A16B
	for <lists+linux-next@lfdr.de>; Sat, 24 Apr 2021 15:51:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233302AbhDXNv5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 24 Apr 2021 09:51:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233135AbhDXNv4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 24 Apr 2021 09:51:56 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5199C061574;
        Sat, 24 Apr 2021 06:51:16 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id 66so12794949qkf.2;
        Sat, 24 Apr 2021 06:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GU1PSQiRBnMzyBGiswgLuvLHbgQI5GYppVPc0QT3+Oo=;
        b=iBxwak8H4Q+LJE0w73KRAan6E9eMv64AwDmZJ2ZI78jy58qU7j0OGNw8ZhCzT+T70h
         ivP0Plbl3nvysQiaKyudGM596vZSMgEX8K5NFJAINPv+WNqlmdnh/uPaP2RwYI0ePOEA
         pfwRE/T1YswMfM2soJ05qGuKrLrgzelx2OuINAEIVNgPYCgTBf8dStAmiJ/bPi9Nqmv6
         oyLp3uG3Gs5+HAQF5A1+1PdEN3p430Oep3P1tm+/5Qd8IZdj5g/gFZFMxUWzxB0hUt0v
         PKKoL2r887xCGCkweTkSN3P/JiX1iYd2qgD6BOgLyfokFNeCTTCZYbQtLzhLgVjRYURf
         NEtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GU1PSQiRBnMzyBGiswgLuvLHbgQI5GYppVPc0QT3+Oo=;
        b=aPwe2GzcgQTbgvPqvD0JWeTzzxa+iwk1l8j/wR0TorfzIUZdQDjxfG0n7uj7LMNYXU
         Ws0HMPbVskJ3PmwKS+HLDyJs3h90xkOZzbIwzXJ0xeDk8fO0grHnsXvSkgm+Vx0fL9Hg
         67kXqstd+6fOayylj+R2Yibt68dDhvbu6RlJwunt+z3/2UT6VX4gWll4s4koREEt/O5i
         hEL2rF7sl1Nh0+D4pk2SIDk9ZOMZ+HrpZwox7YUx0UewPXD0D4HkmNEBM9gNOyGKZ3AP
         FWGPbeJ4ixE2gyxEamnPbJqAnf27kYsVhaVMrBUoQaF/tSWQPlfPPHPByLzYVanZXKjl
         CQlQ==
X-Gm-Message-State: AOAM531C4KjJhbR6+wXQyYoQhw0jsjlzMTHGpooGGOJMiGfDDqQMj0ao
        5o1lNS4w8THfrrzzMeS0HPQ=
X-Google-Smtp-Source: ABdhPJzvrIrLa9H+NSGWc13NeYSnD6BaRekfb1hJo7u1Lnovae4GTWrQFJnicIhpnEBPhD1VX4Wv/A==
X-Received: by 2002:a05:620a:242:: with SMTP id q2mr8574791qkn.206.1619272275982;
        Sat, 24 Apr 2021 06:51:15 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:d77f:e204:dc3c:c8fa:5d17:d49e])
        by smtp.gmail.com with ESMTPSA id n18sm6304570qtv.87.2021.04.24.06.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 06:51:15 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     gregkh@linuxfoundation.org
Cc:     chunfeng.yun@mediatek.com, sfr@canb.auug.org.au,
        stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
        linux-next@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] usb: Fix up movement of USB core kerneldoc location
Date:   Sat, 24 Apr 2021 10:51:03 -0300
Message-Id: <20210424135103.2476670-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Commit 855b35ea96c4 ("usb: common: move function's kerneldoc next to its
definition") moved the USB common function documentation out of the
linux/usb/ch9.h header file into drivers/usb/common/common.c and
drivers/usb/common/debug.c, which causes the following 'make htmldocs'
build warning:

include/linux/usb/ch9.h:1: warning: no structured comments found

Fix that up by pointing the documentation at the correct location.

Fixes: 855b35ea96c4 ("usb: common: move function's kerneldoc next to its definition")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Hi,

I compared the generated HTML and now the following functions are
also documented after this patch:

usb_decode_interval()
of_usb_get_dr_mode_by_phy()
of_usb_host_tpl_support()
of_usb_update_otg_caps()
usb_of_get_companion_dev()

They were not documented prior to 855b35ea96c4.

Please let me know if this is OK or not.

 Documentation/driver-api/usb/usb.rst | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/Documentation/driver-api/usb/usb.rst b/Documentation/driver-api/usb/usb.rst
index 078e981e2b16..543e70434da2 100644
--- a/Documentation/driver-api/usb/usb.rst
+++ b/Documentation/driver-api/usb/usb.rst
@@ -109,15 +109,16 @@ well as to make sure they aren't relying on some HCD-specific behavior.
 USB-Standard Types
 ==================
 
-In ``<linux/usb/ch9.h>`` you will find the USB data types defined in
-chapter 9 of the USB specification. These data types are used throughout
-USB, and in APIs including this host side API, gadget APIs, usb character
-devices and debugfs interfaces.
+In ``drivers/usb/common/common.c`` and ``drivers/usb/common/debug.c`` you
+will find the USB data types defined in chapter 9 of the USB specification.
+These data types are used throughout USB, and in APIs including this host
+side API, gadget APIs, usb character devices and debugfs interfaces.
 
-.. kernel-doc:: include/linux/usb/ch9.h
-   :internal:
+.. kernel-doc:: drivers/usb/common/common.c
+   :export:
 
-.. _usb_header:
+.. kernel-doc:: drivers/usb/common/debug.c
+   :export:
 
 Host-Side Data Types and Macros
 ===============================
-- 
2.25.1

