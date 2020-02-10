Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F07215855B
	for <lists+linux-next@lfdr.de>; Mon, 10 Feb 2020 23:17:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727385AbgBJWRb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 10 Feb 2020 17:17:31 -0500
Received: from mail-qt1-f193.google.com ([209.85.160.193]:33552 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727254AbgBJWRb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 10 Feb 2020 17:17:31 -0500
Received: by mail-qt1-f193.google.com with SMTP id d5so6487314qto.0;
        Mon, 10 Feb 2020 14:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CmgTcu/fFYYpKXFvht5dzhta71UBVw1looUG6zt0U94=;
        b=CctA2H86sxtdH5v71aEu72PhwH5x799/qgYDMZvGJm7uXmFZ6qj/TS1HUWUNimSD2y
         E3Ag4BVr1WAQBQ+nuCO2smXtObNXAcJp2DBOdPxBAONUWFB7mIYNQeexIWuuT3VKjvKj
         P2fC6YeCaBbrGMSeSaMP1kv9k4uuiqf6NoV6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CmgTcu/fFYYpKXFvht5dzhta71UBVw1looUG6zt0U94=;
        b=Pmpmya47vQAK+ytFh6lb0on2yC6PKlMtlPfxKo8gIKZ+ybmmyZ0oBrUcnBx6omKuyi
         0DW6+O5bJPRAPlNeiJs6HP8sRl3o2cLryO9yTY6KrL+XWN2RIcaUTUZp3InfWDL/IxvN
         xJKld5k1edObPAhDb0viJ+hxTeXs37Fx3WiXCluuWOkahySbY7ls7fsIVWbJIpVVATdb
         w9r4CaUgrAy5UZjjzycRJ1oi2ms5YVR/XXDFD0DjtP9DFqg5W/QdOHldRN+M6LXj/j83
         x3+QmyvC0fIP15M8JH41isSpg3na6YTZ0lkxfurv2jEVzVwTEXIMv9QDfKxM314SiuW5
         7ffQ==
X-Gm-Message-State: APjAAAUaoo8x3wGKGywshLM5n9pOWplxdXUWHoHa1RqKhm70fhFbK1Xc
        S5EnH8IZolQPzC4RdyXSDfXrQ+C2L1ge17YCsAg=
X-Google-Smtp-Source: APXvYqwAamyYSCO/Ahy9S/Rvqx/QRtw1yIry5sXT7elT4A0TQg+lKr5YxXdxvWSa3i+hpLqMsuINRcG5rxi8riHqit4=
X-Received: by 2002:ac8:73c7:: with SMTP id v7mr7782393qtp.269.1581373050285;
 Mon, 10 Feb 2020 14:17:30 -0800 (PST)
MIME-Version: 1.0
References: <20200211084449.05e3b3cb@canb.auug.org.au>
In-Reply-To: <20200211084449.05e3b3cb@canb.auug.org.au>
From:   Joel Stanley <joel@jms.id.au>
Date:   Mon, 10 Feb 2020 22:17:18 +0000
Message-ID: <CACPK8XfGKox38H1XQaGKUDe5y2hV06+WSmtJDNz4zLtE7k9ZjA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the aspeed tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Eddie James <eajames@linux.ibm.com>,
        Vijay Khemka <vijaykhemka@fb.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 10 Feb 2020 at 21:45, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the aspeed tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>
> arch/arm/boot/dts/aspeed-g6.dtsi:322.35-327.7: ERROR (duplicate_node_names): /ahb/apb/syscon@1e6e2000/interrupt-controller: Duplicate node name
> ERROR: Input tree has errors, aborting (use -f to force output)

Thanks for the report Stephen. I've dropped the offending commit and
re-pushed. We should be good for tomorrow's next.

Cheers,

Joel

>
> Caused by commit
>
>   091ff5206ef3 ("ARM: dts: aspeed: ast2600: Fix SCU IRQ controller node addresses")
>
> Also these warnings:
>
> arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:435.11-439.4: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10: I2C bus unit address format error, expected "40000010"
> arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:437.3-30: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10:reg: I2C address must be less than 10-bits, got "0x40000010"
> arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:521.11-525.4: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10: I2C bus unit address format error, expected "40000010"
> arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:523.3-30: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10:reg: I2C address must be less than 10-bits, got "0x40000010"
>
> Caused by commit
>
>   a59b1792adf1 ("ARM: dts: aspeed: tiogapass: Add IPMB device")
>
> I have used the aspeed tree from next-20200210 for today.
>
> --
> Cheers,
> Stephen Rothwell
