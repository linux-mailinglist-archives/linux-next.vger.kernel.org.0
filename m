Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE7C8203127
	for <lists+linux-next@lfdr.de>; Mon, 22 Jun 2020 09:59:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727062AbgFVH7G (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 22 Jun 2020 03:59:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726005AbgFVH7G (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 22 Jun 2020 03:59:06 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5993C061795
        for <linux-next@vger.kernel.org>; Mon, 22 Jun 2020 00:59:05 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id o4so9037990lfi.7
        for <linux-next@vger.kernel.org>; Mon, 22 Jun 2020 00:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=elastisys.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+72HVS79yQlhaAUpl1BQ92pBtKAe/k4uQc7WSaUvr00=;
        b=jCqge3D6KoP/sIdIThN/DHv8XTHSxY/xJDbvFROYkEp5HxGRHew4puiSQD3ry7G87b
         UBY2DmEKrJ4dMkhtTOw0UHjZPbvGmjtxO+QYkUgo4vfw2gKXanYztqq5J6XcoNbgvj5+
         dy/jhBx9k1/RltLhcE02EVQJfMZiSdKukXWio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+72HVS79yQlhaAUpl1BQ92pBtKAe/k4uQc7WSaUvr00=;
        b=jWH3lvLoYZjK5yKDLcaXGRdDMsJKVaKd5En2INazNqsLDK2WQPdqG9JmQfc3ESbLh1
         jrzgZR0nE/AKJ25OIfxom6/cbRLdZgdly2zNNi92jK4h6etjkAexb7guWsNzzyby7xfy
         7GsZalEJZz/UfpVn1OENrAy/JQpcJhZFgvvD+ficZmp6iKW4xu2QZWxMxZweeIyDuo8l
         ioRFYn5WGmaRldE1hYpew1YWVI3nzRpd9exG45Hqm9GSagDTAuKUc2NKyrWdPdUu6raq
         RtxJYh8ESe6yo31b0czidBThW7DhR1l+GMFLadgOlValtCgiF3sLCFlSKbrY8jud0uyh
         09DA==
X-Gm-Message-State: AOAM532pUFRG1nQGteYCBz3ifmXBHq5yT/KHP3IzePQk76QcbP64mPPt
        9Ex5D3jJuUJeMNyuKUIslTSIMw==
X-Google-Smtp-Source: ABdhPJzIyS6pITV9AXVhsR6vURj//yrc+F7c8fH4PfDJ/YlnbkX/r3We1eWExkMnSuxvybu5Nsx6gw==
X-Received: by 2002:ac2:5e6c:: with SMTP id a12mr9124696lfr.35.1592812744344;
        Mon, 22 Jun 2020 00:59:04 -0700 (PDT)
Received: from minitrue (90-224-48-115-no56.tbcn.telia.com. [90.224.48.115])
        by smtp.gmail.com with ESMTPSA id v23sm2568173ljg.122.2020.06.22.00.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 00:59:03 -0700 (PDT)
Date:   Mon, 22 Jun 2020 09:59:02 +0200
From:   Cristian Klein <cristian.klein@elastisys.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the hid tree
Message-ID: <20200622075902.GA24615@minitrue>
References: <20200621075124.206aeeea@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="K8nIJk4ghYZn606h"
Content-Disposition: inline
In-Reply-To: <20200621075124.206aeeea@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--K8nIJk4ghYZn606h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jun 21, 2020 at 07:51:24AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   470376737e88 ("HID: allow building hid.ko as an external module")
> 
> is missing a Signed-off-by from its author.
> 
> -- 
> Cheers,
> Stephen Rothwell

Hi,

My bad. Please find attached the corrected patch.

Cheers,
Cristian

--K8nIJk4ghYZn606h
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="0001-Allow-building-hid.ko-as-an-external-module.patch"

From 8005724373d8cecb241c013d16b2242c7c1fb39e Mon Sep 17 00:00:00 2001
From: Cristian Klein <cristian.klein@elastisys.com>
Date: Mon, 22 Jun 2020 08:47:58 +0200
Subject: [PATCH] Allow building hid.ko as an "external" module

For quickly testing USB HID quirks with a larger community, it is useful
to be able to build hid.ko as an external module, e.g., against the
source code of the running kernel.

Before this patch this failed as follows:
```
$ make -C /lib/modules/$(uname -r)/build M=$PWD/drivers/hid
make: Entering directory '/usr/src/linux-headers-5.3.0-51-generic'
  CC [M]  /home/cklein/linux/drivers/hid/i2c-hid/i2c-hid-core.o
  CC [M]  /home/cklein/linux/drivers/hid/i2c-hid/i2c-hid-dmi-quirks.o
  LD [M]  /home/cklein/linux/drivers/hid/i2c-hid/i2c-hid.o
  CC [M]  /home/cklein/linux/drivers/hid/intel-ish-hid/ishtp/init.o
  CC [M]  /home/cklein/linux/drivers/hid/intel-ish-hid/ishtp/hbm.o
  CC [M]  /home/cklein/linux/drivers/hid/intel-ish-hid/ishtp/client.o
  CC [M]  /home/cklein/linux/drivers/hid/intel-ish-hid/ishtp/bus.o
  CC [M]  /home/cklein/linux/drivers/hid/intel-ish-hid/ishtp/dma-if.o
  CC [M]  /home/cklein/linux/drivers/hid/intel-ish-hid/ishtp/client-buffers.o
  LD [M]  /home/cklein/linux/drivers/hid/intel-ish-hid/intel-ishtp.o
  CC [M]  /home/cklein/linux/drivers/hid/intel-ish-hid/ipc/ipc.o
/home/cklein/linux/drivers/hid/intel-ish-hid/ipc/ipc.c:12:10: fatal error: client.h: No such file or directory
   12 | #include "client.h"
      |          ^~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.build:290: /home/cklein/linux/drivers/hid/intel-ish-hid/ipc/ipc.o] Error 1
make[1]: *** [scripts/Makefile.build:519: /home/cklein/linux/drivers/hid/intel-ish-hid] Error 2
make: *** [Makefile:1656: _module_/home/cklein/linux/drivers/hid] Error 2
make: Leaving directory '/usr/src/linux-headers-5.3.0-51-generic'
```

Signed-off-by: Cristian Klein <cristian.klein@elastisys.com>
---
 drivers/hid/intel-ish-hid/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/intel-ish-hid/Makefile b/drivers/hid/intel-ish-hid/Makefile
index f0a82b1c7..db4974c43 100644
--- a/drivers/hid/intel-ish-hid/Makefile
+++ b/drivers/hid/intel-ish-hid/Makefile
@@ -23,4 +23,4 @@ intel-ishtp-hid-objs += ishtp-hid-client.o
 obj-$(CONFIG_INTEL_ISH_FIRMWARE_DOWNLOADER) += intel-ishtp-loader.o
 intel-ishtp-loader-objs += ishtp-fw-loader.o
 
-ccflags-y += -I $(srctree)/$(src)/ishtp
+ccflags-y += -I $(src)/ishtp
-- 
2.20.1


--K8nIJk4ghYZn606h--
