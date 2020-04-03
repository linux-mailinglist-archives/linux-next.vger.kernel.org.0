Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EE2419E163
	for <lists+linux-next@lfdr.de>; Sat,  4 Apr 2020 01:17:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727909AbgDCXRL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 3 Apr 2020 19:17:11 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:35201 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727829AbgDCXRL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 3 Apr 2020 19:17:11 -0400
Received: by mail-qt1-f193.google.com with SMTP id e14so7998555qts.2;
        Fri, 03 Apr 2020 16:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xM1oCYmkMlq3+sLKqObCJMQTJsuA5Jqv8BvDLuWnBOg=;
        b=A7dLnWa7+Z0q5FgV+Q6evVSpYkzGfVpKzTzZbXGRqgARtmMgKjzwPtED+trqBiKMLB
         h7UOEzChdnH3BEMWS9iNQ/dw7Nrkrh5CyozQwYHCL9GGb7VMQCrr9POlKWzZ3BZfw2TZ
         llr1mkUPPV9JUpk142NG4xHZidaEFqcz+MieSlXgdoo2wM8iLx+soMT+mBYKbKVmL8/U
         GPDoJ6X/GeioSbkVZeaAnk631LuydGeUKSBpECRAN4TCDH9mMvzpQtNuFhCukQPNk410
         M5pHUySiOuNxLmMqGRgLMIktjNdzgTKZyNJIla/hwnio3mPxMwzOSi0bOxIlSRMccb1M
         LIUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xM1oCYmkMlq3+sLKqObCJMQTJsuA5Jqv8BvDLuWnBOg=;
        b=CpYKuQxJTntZ2WRTvaXZcTFwk2SSxklBqSSBoFcejeuBaYIxGmuQBp2bfCC3KC/vYf
         Hs9M3iqErbIUwE/4uNlu5fFycVkBOjjPAIYP06yoaZ3i25pQkL4EtJmyVxUGd0oCE+WO
         1mDOLj0BITsf1Q74Grmsuht8eLn58++oWTTE+9m09Sc0Nh/F5e1gtihMJMReCSKRYUd7
         hpLu9q+rQIvFcTnb+ncuK/uf3OipkjEd+9p6pSXHHm9lEeQe/0fuAuwNud/WKOEN/ibB
         EzadSbkpIajYMYvJ3b1FX/N1yvN+cqTeuVhd+k+FqydFN+/AD+Zhxkb6oUywdDMJYL/N
         WvUQ==
X-Gm-Message-State: AGi0PuYxzQApLoZDUHS9/NKzZ5Lc61kit1rFSIQz9gIIQ87ICTTlZPZF
        tOsiB8X1SIVMbndpJmJS4fQp3DqkKl32OsjDigRY
X-Google-Smtp-Source: APiQypIJ9EeGhqEYBNuojfMk/NBEwbuhBIvBY3MiOzP9TQ7PRz4g8cTsBfCR7zo8LctPvaYJT0NFeLhGothNIvHov1k=
X-Received: by 2002:ac8:2668:: with SMTP id v37mr3486320qtv.143.1585955829985;
 Fri, 03 Apr 2020 16:17:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200404091916.6f00a24d@canb.auug.org.au>
In-Reply-To: <20200404091916.6f00a24d@canb.auug.org.au>
From:   Rob Herring <robherring2@gmail.com>
Date:   Fri, 3 Apr 2020 17:16:58 -0600
Message-ID: <CAL_JsqKd=3zw4uAbDthp-c=_+4XFup0XEdw8nHOmJDzxS2-qSA@mail.gmail.com>
Subject: Re: linux-next: build warnings in Linus' tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc:     Russell King <linux@armlinux.org.uk>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

+Nicolas

On Fri, Apr 3, 2020 at 4:19 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next build of Linus' tree (arm multi_v7_defconfig) produced
> these warnings:
>
> arch/arm/boot/dts/bcm2835-rpi.dtsi:18.4-15: Warning (dma_ranges_format): /soc/firmware:dma-ranges: empty "dma-ranges" property but its #address-cells (2) differs from /soc (1)
> arch/arm/boot/dts/bcm2835-rpi.dtsi:18.4-15: Warning (dma_ranges_format): /soc/firmware:dma-ranges: empty "dma-ranges" property but its #address-cells (2) differs from /soc (1)
> arch/arm/boot/dts/bcm2835-rpi.dtsi:18.4-15: Warning (dma_ranges_format): /soc/firmware:dma-ranges: empty "dma-ranges" property but its #address-cells (2) differs from /soc (1)
> arch/arm/boot/dts/bcm2835-rpi.dtsi:18.4-15: Warning (dma_ranges_format): /soc/firmware:dma-ranges: empty "dma-ranges" property but its #address-cells (2) differs from /soc (1)
> arch/arm/boot/dts/bcm2835-rpi.dtsi:18.4-15: Warning (dma_ranges_format): /soc/firmware:dma-ranges: empty "dma-ranges" property but its #address-cells (2) differs from /soc (1)
> arch/arm/boot/dts/bcm2835-rpi.dtsi:18.4-15: Warning (dma_ranges_format): /soc/firmware:dma-ranges: empty "dma-ranges" property but its #address-cells (2) differs from /soc (1)
> arch/arm/boot/dts/bcm2835-rpi.dtsi:18.4-15: Warning (dma_ranges_format): /soc/firmware:dma-ranges: empty "dma-ranges" property but its #address-cells (2) differs from /soc (1)
> arch/arm/boot/dts/bcm2835-rpi.dtsi:18.4-15: Warning (dma_ranges_format): /soc/firmware:dma-ranges: empty "dma-ranges" property but its #address-cells (2) differs from /soc (1)
> arch/arm/boot/dts/bcm2835-rpi.dtsi:18.4-15: Warning (dma_ranges_format): /soc/firmware:dma-ranges: empty "dma-ranges" property but its #address-cells (2) differs from /soc (1)
> arch/arm/boot/dts/bcm2835-rpi.dtsi:18.4-15: Warning (dma_ranges_format): /soc/firmware:dma-ranges: empty "dma-ranges" property but its #address-cells (2) differs from /soc (1)
> arch/arm/boot/dts/bcm2835-rpi.dtsi:18.4-15: Warning (dma_ranges_format): /soc/firmware:dma-ranges: empty "dma-ranges" property but its #address-cells (2) differs from /soc (1)
> arch/arm/boot/dts/bcm2835-rpi.dtsi:18.4-15: Warning (dma_ranges_format): /soc/firmware:dma-ranges: empty "dma-ranges" property but its #address-cells (2) differs from /soc (1)
> arch/arm/boot/dts/bcm2835-rpi.dtsi:18.4-15: Warning (dma_ranges_format): /soc/firmware:dma-ranges: empty "dma-ranges" property but its #address-cells (2) differs from /soc (1)
> arch/arm/boot/dts/bcm2835-rpi.dtsi:18.4-15: Warning (dma_ranges_format): /soc/firmware:dma-ranges: empty "dma-ranges" property but its #address-cells (2) differs from /soc (1)
>
> I have no idea what caused this :-(

A dtc update combined with changes that landed in the above file after
I tested and fixed the new warnings.

Rob
