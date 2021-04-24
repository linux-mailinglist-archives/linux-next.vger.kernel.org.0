Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FB8236A1C4
	for <lists+linux-next@lfdr.de>; Sat, 24 Apr 2021 17:28:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234047AbhDXP2x (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 24 Apr 2021 11:28:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231892AbhDXP2v (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 24 Apr 2021 11:28:51 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D158C061574;
        Sat, 24 Apr 2021 08:28:12 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id x20so51512928lfu.6;
        Sat, 24 Apr 2021 08:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c2Ip1/CKIAKUMVTHymK/TrVnxgD4DP/MMsdNf7Cay9s=;
        b=sk436ew9Z3Rb2MrUD+Y55U6cYnULexdqB/lJpKG764jygeKecyeE8qz8PZvWA9ji/x
         0HtDGqTeGdgZ2KRJeNf8XltBRTexIbjki68Db/Bg3eJutGtGPkk6xZ6ZzwNKM6xHLigb
         209wMICbIVPCCtNnQ2HOW/ZwMLfuXcgoBsosT5tHzaMReGC0jMzBluGi1IXLQZcAYLXi
         oXN8eh3E/L7BoWe3x6jGciXkARv/5isIBJMes2+kZwtmU3LvMtzssNyLrkx6twBlb5Ql
         MNLCj9if7WdiMvWCov96R+ncX4CpaIY852R3jVnlqqmvF5CSn20EWhEzKJEsfYQJJe2T
         G8jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c2Ip1/CKIAKUMVTHymK/TrVnxgD4DP/MMsdNf7Cay9s=;
        b=dDlm0TkdvLbGaka3NsftDMeJdr3jprCSEFrjqFGh9uT/kX7QGGGLpqEek6/k5n/IMs
         +deHzihkzjRMWmgBDlmI3H3TWPLpnVBjKMi2j06bhqXlq1d7HCj+TYhCutvkqrpI/TQp
         aEu7DkvdSRVm/u5oiJ0rlr2iGkSGFNfRgjgsqKuKJ/bwgRmnVr+v50MKTKMEKXd3dgX1
         4QEHAFFgmFHpGMeQd3c/I6AhkF4+LSK+JNWbeOJ89y1chGqJUDsl4kQHjhiRACz1W0D0
         jIB7C4/66HJVIRlVuwW3PmZKUgLzqDOb4DAut035ZgBnzmU/rgnOy/zkUn5SMq4qlBRR
         hvPQ==
X-Gm-Message-State: AOAM533kubh5VvW0Ija+cveGEdPrIz+Q98OlP2GoGW22tAZ94rZ1CeGE
        j81U8VIloPHT7qMuss4XkGJZocKiLGP1ZQELlWu884Rdvfw=
X-Google-Smtp-Source: ABdhPJwKA3p6dklK0SUfJUYZfAbqrqRzkGcseWpwt40csA0PHSS/6ZyRBeHsoXKbfIMCwhdsLJ1uYXhU4aH3vHxPKm0=
X-Received: by 2002:a05:6512:1050:: with SMTP id c16mr6808333lfb.295.1619278085705;
 Sat, 24 Apr 2021 08:28:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210424135103.2476670-1-festevam@gmail.com> <20210424151157.GA312740@rowland.harvard.edu>
In-Reply-To: <20210424151157.GA312740@rowland.harvard.edu>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Sat, 24 Apr 2021 12:27:54 -0300
Message-ID: <CAOMZO5BwaFJQPEGcYV=rzhBy1q2Yk88AfGN856KpX2rqCUbA0Q@mail.gmail.com>
Subject: Re: [PATCH] usb: Fix up movement of USB core kerneldoc location
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        USB list <linux-usb@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Alan,

On Sat, Apr 24, 2021 at 12:11 PM Alan Stern <stern@rowland.harvard.edu> wrote:

> This is quite wrong.
>
> The USB data types defined in chapter 9 of the USB specification can
> actually be found in include/uapi/linux/usb/ch9.h.  What
> drivers/usb/common/common.c contains is the definitions of the functions
> declared in include/linux/usb/ch9.h, which is a different file (although
> it does #include the file in include/uapi/linux/usb/).

It seems we can no longer refer include/linux/usb/ch9.h inside the
kerneldoc marker, as this file does not contain any comments anymore.

Would this change on top of this patch be OK?

Thanks

diff --git a/Documentation/driver-api/usb/usb.rst
b/Documentation/driver-api/usb/usb.rst
index 543e70434da2..251cab7cacd7 100644
--- a/Documentation/driver-api/usb/usb.rst
+++ b/Documentation/driver-api/usb/usb.rst
@@ -109,16 +109,10 @@ well as to make sure they aren't relying on some
HCD-specific behavior.
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
