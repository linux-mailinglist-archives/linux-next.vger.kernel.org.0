Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A49936A7FC
	for <lists+linux-next@lfdr.de>; Sun, 25 Apr 2021 17:33:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230293AbhDYPd4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 25 Apr 2021 11:33:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230194AbhDYPd4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 25 Apr 2021 11:33:56 -0400
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6E33C061574;
        Sun, 25 Apr 2021 08:33:16 -0700 (PDT)
Received: by mail-qt1-x82e.google.com with SMTP id 18so26490175qtz.6;
        Sun, 25 Apr 2021 08:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5SEkh3V8UTdGxPqKtFX/PHinkzBiDrVR4wcPwD4guKs=;
        b=iQUB4QYb1jG3h4d1HGWir0snJt7FsXzQnRogUZWB3emBqxFsWQWPbWpaKcVkPgHPkU
         TETp0JUuFgP5N2SrBOsTH/Un8HF5El/8yvV4NwmN3fOJQxaVmM5LPrGC1b9iV6UeWobW
         CZencODd7mSVQZFb7nGhW1XBMz641LQhVZMdh/tdUWiC3F6FWRQ/qXa+6/helUPf7weX
         /zpimix2oftwOGvEbYEQV0I+Stq0BbhBAYDaTtDLj6n24fpXue0DQM/Z74HtUmiYAozO
         Z/K6XArLvrPE2hes9waJosYPyelYslQPuCfUdkAz651ac6OqQ3YWhiriGaemHSEQ7pzQ
         lScA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5SEkh3V8UTdGxPqKtFX/PHinkzBiDrVR4wcPwD4guKs=;
        b=Ihida9ldPJ20KM8EvlW30gqadKia/224AUUbIWELzy/rqi5+j0zsjtWCpyqERzosbZ
         8UqoPSN9kpNdZJLisBfF0LzwfS6uiUV/uoAmVhDj/EODXnKxAe5AqvaNeaHtJw+PY2Fn
         /wJWB6iXYQlEcmqVCLLDj1SYzy+a2ZfnedMzfpRfutPLaVsmnadoRKBd6LoAW1J0n9AB
         bE6CqDkfhsqc19w5896Ep6GN+U3NmpN1VzYNyoXvrln9fsd7WMGkIYjjp8SGuL+FGjdb
         Sl2WQM+0NDz6z0ZBK8bgo1KU08saO072nQroDaOMMHvBToLb//Ivf81V/HBZiKyH5vI+
         aBjA==
X-Gm-Message-State: AOAM531CH4dAU9WqOil4ReBImIhgatay9Hkkb0VxfmhFjnylYrfoa9yy
        NKITIh/Nb5/sZ/gZ9Psh6qU=
X-Google-Smtp-Source: ABdhPJw5ROxgrXE7aY6qxw+o2OS+RuinWnrpIB837wn41/p+JB9cxYoemxwyN5AkAfQGK+mpT9wX/Q==
X-Received: by 2002:ac8:7547:: with SMTP id b7mr13286662qtr.176.1619364795731;
        Sun, 25 Apr 2021 08:33:15 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:919:dc3c:c8fa:5d17:d49e])
        by smtp.gmail.com with ESMTPSA id a22sm8583740qth.41.2021.04.25.08.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Apr 2021 08:33:15 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     gregkh@linuxfoundation.org
Cc:     chunfeng.yun@mediatek.com, sfr@canb.auug.org.au,
        stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
        linux-next@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v4] usb: Restore the reference to ch9.h
Date:   Sun, 25 Apr 2021 12:32:53 -0300
Message-Id: <20210425153253.2542816-1-festevam@gmail.com>
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
Acked-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v3:
- Use ``include/linux/usb/ch9.h`` for consistency (Alan)
- Add Alan's Acked-by

 Documentation/driver-api/usb/usb.rst | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/Documentation/driver-api/usb/usb.rst b/Documentation/driver-api/usb/usb.rst
index 543e70434da2..820e867af45a 100644
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
+``include/linux/usb/ch9.h``, which also contains declarations of a few
+utility routines for manipulating these data types; the implementations
+are in ``drivers/usb/common/common.c``.
 
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

