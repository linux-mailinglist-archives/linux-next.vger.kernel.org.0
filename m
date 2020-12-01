Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65D852C97A5
	for <lists+linux-next@lfdr.de>; Tue,  1 Dec 2020 07:47:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727042AbgLAGqt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Dec 2020 01:46:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726713AbgLAGqt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 1 Dec 2020 01:46:49 -0500
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18163C0613D2;
        Mon, 30 Nov 2020 22:46:09 -0800 (PST)
Received: by mail-oi1-x22b.google.com with SMTP id x16so735631oic.3;
        Mon, 30 Nov 2020 22:46:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xdSnvPB3o6PHRPv5Rvjq3Vf/ke1AgtrK1lfTC597ecQ=;
        b=BNcDeGVMH/wr4qmIgDi9TPmi5wKW/TpLs6Y7n8bFEPTg5daaUWkJy31pEQxegGvvrJ
         4MvQHb01SHKO22bIhu3BBOwVd86subqfOniXBzxgz7IZxcC/wHRacGoWI6b2OUIMcrLQ
         oVnNJ+AMqSf6vwXadEUyYuvzvqVLbMOWg7rmcIe7GBSYEH0rYhfSl97ikwb31OefMd9Q
         M6OABqZEkDrsIkkGRQiPwuKOh0pzMJQvVQETeyNSQ+TITk5awnnlEfuqlGxHGrcBQMwU
         v4WEZ8Mhl0EqswKL6uBXjWy8x6Yw6lTkIJI6zb+HKUV6aT8IY9OowlEmE7xNAfAeZcTH
         KhYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xdSnvPB3o6PHRPv5Rvjq3Vf/ke1AgtrK1lfTC597ecQ=;
        b=dlkYy/bE3G+7DmhcdEiJ42SKALxaBlLoeL20I7BxgsKvuPEwnhHJjKeSBL6cEm5aKy
         7NSGXrRHVcw60EGwe7h3eFrBFzd7+J30fytG0n6qe3JyAsOyvzzjHx98tpnYaRqPCqfO
         QywkqJaPcA3DXlS+z+IKkmugtDGEi+iudSba2JMCtXWsY04Ir3i8VQCJnXASzW7twbjU
         t+JTZ8v23UBmEF6cREtuXZzq8on7EZLW7f/Y6B71NlECzx7U4Aia0vzeSModaWg+8Atj
         2DSOBy+yvZ8t5dU7yLsI8Yn4n2GZWXs8dkm5jNZ0L333bWJsVv1F++xLefQ9AZ51MtZn
         y52w==
X-Gm-Message-State: AOAM533EnEv8EOaieKYmvQZ0GVRRw0s+B2LOSL7ArIn3BYIYHF4I+jyS
        Wp89XLvosv5YmvOin2sPJluGMLcEeWxU3WNsLzt90iJId7s=
X-Google-Smtp-Source: ABdhPJzItbgWBbNRg/cEN+COmsRQlBZMGNe0VT0YbWAc3XQj7I5ceCnjGmrINNJdnQgtbaBy2l/LaL16JzrIsmXZ6RY=
X-Received: by 2002:aca:5a86:: with SMTP id o128mr405749oib.23.1606805168447;
 Mon, 30 Nov 2020 22:46:08 -0800 (PST)
MIME-Version: 1.0
References: <20201201170731.4c93b812@canb.auug.org.au>
In-Reply-To: <20201201170731.4c93b812@canb.auug.org.au>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Tue, 1 Dec 2020 07:45:57 +0100
Message-ID: <CAMhs-H83LKBgSQ6qGxFFtM2zm4d1KCXzGHrZ8J7w=JGGx=Q3wQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the phy-next tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On Tue, Dec 1, 2020 at 7:07 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the phy-next tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/phy/ralink/phy-mt7621-pci.c:17:10: fatal error: mt7621.h: No such file or directory
>    17 | #include <mt7621.h>
>       |          ^~~~~~~~~~
>
> Caused by commit
>
>   d87da32372a0 ("phy: ralink: Add PHY driver for MT7621 PCIe PHY")

This driver has two includes which are in
"arch/mips/include/asm/mach-ralink" and are directly included in the
driver:
* mt7621.h
* ralink_regs.h

This is because this path is directly included in
arch/mips/ralink/Platform for "ralink":

#
# Ralink SoC common stuff
#
cflags-$(CONFIG_RALINK)     += -I$(srctree)/arch/mips/include/asm/mach-ralink

and this driver directly depends on RALINK or COMPILE_TEST (which
might be the problem here):


and this driver directly depends
on RALINK or COMPILE_TEST:

config PHY_MT7621_PCI
    tristate "MediaTek MT7621 PCI PHY Driver"
    depends on (RALINK || COMPILE_TEST) && OF
    select GENERIC_PHY
    select REGMAP_MMIO
    help
      Say 'Y' here to add support for MediaTek MT7621 PCI PHY driver

>
> I have reverted that commit for today.

What is the correct way of fixing this? Include complete path for both
of them like this?

index db79088d5362..cebd53f5a797 100644
--- a/drivers/phy/ralink/phy-mt7621-pci.c
+++ b/drivers/phy/ralink/phy-mt7621-pci.c
@@ -14,8 +14,8 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/sys_soc.h>
-#include <mt7621.h>
-#include <ralink_regs.h>
+#include <asm/mach-ralink/mt7621.h>
+#include <asm/mach-ralink/ralink_regs.h>

Vinod, please let me know if you want me to send anything for fixing this.

>
> --
> Cheers,
> Stephen Rothwell

Best regards,
    Sergio Paracuellos
