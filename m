Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A8CE36A0DF
	for <lists+linux-next@lfdr.de>; Sat, 24 Apr 2021 13:26:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229630AbhDXL0o (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 24 Apr 2021 07:26:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230013AbhDXL0o (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 24 Apr 2021 07:26:44 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D30D5C061574;
        Sat, 24 Apr 2021 04:26:05 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 4so21393644lfp.11;
        Sat, 24 Apr 2021 04:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T9zxnm+IVqSB2MPVJRAPGn4FvLTHvVMK9Ij5EjvIx1w=;
        b=TeCdozCL0cRQJUqzjYM3CYgMEgnjl+/XLcAFDIaJWFlx5KDRzZdd+h6zbf3yxLl3wV
         zCe56aZ8+i/cf1tIKt/qiWLAQ+Bmrm7QoNA5/FtbKz5wGLpr1BYe1bPysp+k2562Plpl
         /HX6vDL8PzPTMC2/J9e56b9ewEo+/3wiTqpP+vNffpuvopBOqMPIhMUhMqJCT3xGpPDb
         ebSB2rPpBFwSEW1JuU0m8TG4tj7/ZbfXsXqgwpzOcVbxjtY09eVBB3fMJHCGfBYP5gu5
         0Ok9rSOEhrMCyvtnEZnJiMzkkGUzgsmbGssdkBx1/5i6ezoJjOFEo8lp/DBih6hxLJyk
         4F9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T9zxnm+IVqSB2MPVJRAPGn4FvLTHvVMK9Ij5EjvIx1w=;
        b=TjfIgxIeWkAPbRqMbctIQYqrmYoXKJzIY8jXNvfpGZ9pmbuQ8a52hqZUAYhNLG6Pt6
         BbzftCJAljpiGcP5v/eclx8/FrjDW/swSaD71jxtttMawgNHDfThsR+pG6ggFd8esG2y
         oluWYttasfxulVjZ2TSRUQWD9YiiAKwnd3zoLlX3UtQm6W+OEVXWZN+TiGgaS3fsBTzg
         ncsR4i0WJp/Tk+1MdpKOsEUqaP8ilxmwzv8QUtKke+TnEBFkXaqH6byjLZrRFoIvb/h0
         TXyvEzZi4xYp3sKnYG7tZILxc0lst2OVp3KA4cz0HbqDBckCjM4jjJu038Od1uNYh/E/
         7NhQ==
X-Gm-Message-State: AOAM531vqy2RsluTMdDF3zd/TQLPLG4egvdnOxSTpDJ0N6Ewus9NKHMV
        rH6fJHy2QW6Ezxb5KVBSW7DNuPBV6/ZBtXAHgFo=
X-Google-Smtp-Source: ABdhPJxk4niYieWcsett0xplUe7Dzzi5BEsZ8FDCl0hmyn1sOOo18DjEmB/vSiQzkq68kf5Lh9jFaPbVqF6CP/T5ciQ=
X-Received: by 2002:ac2:5fc3:: with SMTP id q3mr528032lfg.500.1619263564365;
 Sat, 24 Apr 2021 04:26:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210424104715.2793760-1-gregkh@linuxfoundation.org> <YIP8c3Bgfz9YfH6A@kroah.com>
In-Reply-To: <YIP8c3Bgfz9YfH6A@kroah.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Sat, 24 Apr 2021 08:25:54 -0300
Message-ID: <CAOMZO5ByYV=g_29vWNPXr6zi6=xQsFVDak2keUPPq01cKg-7_Q@mail.gmail.com>
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

Hi Greg,

On Sat, Apr 24, 2021 at 8:10 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:

> Wait, no, now I see the warning:
>         ./drivers/usb/common/common.c:1: warning: no structured comments found
> instead.
>
> Is that expected?  It doesn't feel right to me, what should we be doing
> instead?

I think we should do like this instead:

--- a/Documentation/driver-api/usb/usb.rst
+++ b/Documentation/driver-api/usb/usb.rst
@@ -114,9 +114,6 @@ chapter 9 of the USB specification. These data
types are used throughout
 USB, and in APIs including this host side API, gadget APIs, usb character
 devices and debugfs interfaces.

-.. kernel-doc:: include/linux/usb/ch9.h
-   :internal:
-
 .. _usb_header:

Since ch9.h does not contain any structure/inline functions, it does
not contain any comment, so it should be just removed from the
kernel-doc section.

A similar issue has been fixed here:
https://patchwork.kernel.org/project/dri-devel/patch/20190920193558.89815-2-sean@poorly.run/

Regards,

Fabio Estevam
