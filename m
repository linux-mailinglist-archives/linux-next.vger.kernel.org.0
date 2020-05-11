Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D13E71CDEBE
	for <lists+linux-next@lfdr.de>; Mon, 11 May 2020 17:19:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726687AbgEKPT2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 May 2020 11:19:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:42326 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726410AbgEKPT2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 11 May 2020 11:19:28 -0400
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1B0C72075E;
        Mon, 11 May 2020 15:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589210367;
        bh=Vx5tkaJ5+8qSlz4jqAEeatoBE0vml0nOKjm6vTJ0MDM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=R7mBUh8Prm22Nhxty7oPgq/yAadEyCJ+jvXK+rB4iaUkO6e6XuJ7OFc/Mw+G2nd0s
         H7tRz0LcSfkW5yAI9wdReePSJoV7lXVPerCJ9e4R0hdNC+p7PCjR0Hww+nkGd/Q7Ik
         089zxavkwS69EdGpPK0szggvk+O2gv/2+0zJce+E=
Received: by mail-oi1-f172.google.com with SMTP id c12so14392704oic.1;
        Mon, 11 May 2020 08:19:27 -0700 (PDT)
X-Gm-Message-State: AGi0PuZlitsliAnW9zTGDys3SKOssmXVg+LJURujaTWg5qkGHmCov94T
        2kQPJDFOXze+rRK7ik6RSr8MV7m8YWWUUiPaLA==
X-Google-Smtp-Source: APiQypL/w118jK2PRogqhnLIcl/CwJVNIQVD7H1pp1UoYu9VNY0MM/zShEvMXFbngIgCJJEHL12/+7+35Kjv/vt5OnA=
X-Received: by 2002:aca:51c3:: with SMTP id f186mr7715173oib.147.1589210366395;
 Mon, 11 May 2020 08:19:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200507091008.1bd38185@canb.auug.org.au> <CACPK8XfOJqj=E4JwQsZWvAsp7cv=bjqj2twZk0=MR+ZJQP1nqQ@mail.gmail.com>
 <CACPK8XcUydETZvJEkWPvLnLXatAg3D-MfA1yeDzE0epc-hisJQ@mail.gmail.com>
In-Reply-To: <CACPK8XcUydETZvJEkWPvLnLXatAg3D-MfA1yeDzE0epc-hisJQ@mail.gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 11 May 2020 10:19:15 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJWXH4JMZgRQa9r_aPLW6Muz6BRtf_NmeqJv21Aefji1A@mail.gmail.com>
Message-ID: <CAL_JsqJWXH4JMZgRQa9r_aPLW6Muz6BRtf_NmeqJv21Aefji1A@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the aspeed tree
To:     Joel Stanley <joel@jms.id.au>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        devicetree <devicetree@vger.kernel.org>,
        Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>,
        Andrew Jeffery <andrew@aj.id.au>, Vijay Khemka <vkhemka@fb.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, May 8, 2020 at 1:40 AM Joel Stanley <joel@jms.id.au> wrote:
>
> On Wed, 6 May 2020 at 23:13, Joel Stanley <joel@jms.id.au> wrote:
> >
> > Hi Rob,
> >
> > On Wed, 6 May 2020 at 23:10, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > Hi all,
> > >
> > > After merging the aspeed tree, today's linux-next build (arm
> > > multi_v7_defconfig) produced this warning:
> >
> > Thanks Stephen.
> >
> > > arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts:126.11-130.4: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@80/ipmb1@10: I2C bus unit address format error, expected "40000010"
> > > arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts:128.3-30: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@80/ipmb1@10:reg: I2C address must be less than 10-bits, got "0x40000010"
> > > arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts:137.11-141.4: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@100/ipmb3@10: I2C bus unit address format error, expected "40000010"
> > > arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts:139.3-30: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@100/ipmb3@10:reg: I2C address must be less than 10-bits, got "0x40000010"
> > > arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts:148.11-152.4: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@180/ipmb5@10: I2C bus unit address format error, expected "40000010"
> > > arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts:150.3-30: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@180/ipmb5@10:reg: I2C address must be less than 10-bits, got "0x40000010"
> > > arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts:159.11-163.4: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@300/ipmb7@10: I2C bus unit address format error, expected "40000010"
> > > arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts:161.3-30: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@300/ipmb7@10:reg: I2C address must be less than 10-bits, got "0x40000010"
> >
> > These are IPMB nodes with the SLAVE_ADDRESS bit set:
> >
> > +&i2c5 {
> > +       //Host3 IPMB bus
> > +       status = "okay";
> > +       multi-master;
> > +       ipmb5@10 {
> > +               compatible = "ipmb-dev";
> > +               reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
> > +               i2c-protocol;
> > +       };
> >
> > This is a correct entry, so dtc should not warn about it.
>
> I sent a patch for dtc here:
> https://lore.kernel.org/lkml/20200508063904.60162-1-joel@jms.id.au/

Patches for dtc need to be against upstream dtc. There's already a
similar patch posted for it which I commented on and never saw a
respin.

Rob
