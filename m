Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18C3E36A123
	for <lists+linux-next@lfdr.de>; Sat, 24 Apr 2021 14:34:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232556AbhDXMfP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 24 Apr 2021 08:35:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232148AbhDXMfP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 24 Apr 2021 08:35:15 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 859C8C061574;
        Sat, 24 Apr 2021 05:34:34 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id e7so42089352wrs.11;
        Sat, 24 Apr 2021 05:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gCfMH117/J+4Kg92DpRYmxtj74JPbXMtKKiZaH3pB+k=;
        b=LVDzrlID9/D9QNzUP5h/JneLwFpS/A4gbRUWxDdITrsMayWltmDUqN8PSuXtLz0AkZ
         8zuw2Ay1yztoloLcBs1GcqP7XmkBtW6gL4bP+kKzZlWvBoTcU8e2yFM9kMHpqDrVOGT9
         tsUonCf318cgZrIDs6fzOkY5vxArmz9F7hap6aLD+aAsZqZo9Hk/27kg9/yQLQSUtbfr
         YBXx9r1HGX/ftyAPC+qvJIqhawR93Av8ZzgX4x1pkVRDW0tWzbmelkrcSBk7anmQOyBO
         FDigixDu8cmjF5PVYI+/pKf7ahQnJoOrTvNB+m5K8XqPFUJtylUJHiKNiay/jsqdyGDR
         1vAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gCfMH117/J+4Kg92DpRYmxtj74JPbXMtKKiZaH3pB+k=;
        b=QdconMV03wLXkFqJaxmf/YDatBWVff+rMZN7XoSNWYtv5YsRb1P0Som48M1ODn7toc
         FR9fuml3ONnlFA+dKnD+kwIe9VF9hDwmfS8B73roaojN9TsMb6InBNZgcgwNv13cDuJq
         e2TNAyDttJLWRtiOEgDHGgvKeQXRk5Bjq2gX/XQaT7+ScO1KdZN46itlukSBDjbaRXkz
         cv46Y6gnOqRlQXVP7HcfdZB9Dc4f7vurKJofvcsrJdwb9O81Gbj1ZTMvlIXQtAp9jMj9
         STgHmie501pr9DojmuK+0oei8krqDy3Z5lYeCXip1kzCCcmCmJzWH1UsePIDzW+rNvdr
         oAeQ==
X-Gm-Message-State: AOAM533xUdHu39ujqIfgz1FtlLQIc+AGFOs+faxTcTUEeQMiQkW/MIK+
        KtCLl/YtlfNbQ5HM7BxVySO+izPnoJUX53axZJoi73JJEsI=
X-Google-Smtp-Source: ABdhPJw/su0UDqxCwBvojDgQEMQZhdSp3H1EC/hAcJmteJMBCdLc+/apCe4qbmJ1ruxxnKsi4nDkTh07NrH5OUb49Og=
X-Received: by 2002:a05:6512:1050:: with SMTP id c16mr6382783lfb.295.1619267352144;
 Sat, 24 Apr 2021 05:29:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210424104715.2793760-1-gregkh@linuxfoundation.org>
 <YIP8c3Bgfz9YfH6A@kroah.com> <CAOMZO5ByYV=g_29vWNPXr6zi6=xQsFVDak2keUPPq01cKg-7_Q@mail.gmail.com>
In-Reply-To: <CAOMZO5ByYV=g_29vWNPXr6zi6=xQsFVDak2keUPPq01cKg-7_Q@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Sat, 24 Apr 2021 09:29:00 -0300
Message-ID: <CAOMZO5Bgx1KLP9v0ycHCbeJxE9w9XK5=FJ_08LrjDyXov-O7wQ@mail.gmail.com>
Subject: Re: [PATCH] USB: fix up movement of USB core kerneldoc location
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     USB list <linux-usb@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sat, Apr 24, 2021 at 8:25 AM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Greg,
>
> On Sat, Apr 24, 2021 at 8:10 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
>
> > Wait, no, now I see the warning:
> >         ./drivers/usb/common/common.c:1: warning: no structured comments found
> > instead.
> >
> > Is that expected?  It doesn't feel right to me, what should we be doing
> > instead?
>
> I think we should do like this instead:

Actually I think the fix should be like this:

diff --git a/Documentation/driver-api/usb/usb.rst
b/Documentation/driver-api/usb/usb.rst
index 078e981e2b16..cbc76fb51aa9 100644
--- a/Documentation/driver-api/usb/usb.rst
+++ b/Documentation/driver-api/usb/usb.rst
@@ -109,15 +109,13 @@ well as to make sure they aren't relying on some
HCD-specific behavior.
 USB-Standard Types
 ==================

-In ``<linux/usb/ch9.h>`` you will find the USB data types defined in
-chapter 9 of the USB specification. These data types are used throughout
+In ``drivers/usb/common/common.c`` you will find the USB data types defined
+in chapter 9 of the USB specification. These data types are used throughout
 USB, and in APIs including this host side API, gadget APIs, usb character
 devices and debugfs interfaces.

-.. kernel-doc:: include/linux/usb/ch9.h
-   :internal:
-
-.. _usb_header:
+.. kernel-doc:: drivers/usb/common/common.c
+   :export:

 Host-Side Data Types and Macros
 ===============================

Does this look good?

Thanks
