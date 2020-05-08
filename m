Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B31BE1CA44B
	for <lists+linux-next@lfdr.de>; Fri,  8 May 2020 08:41:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726049AbgEHGkq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 8 May 2020 02:40:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726690AbgEHGkp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 8 May 2020 02:40:45 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6251C05BD43;
        Thu,  7 May 2020 23:40:44 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id e2so419050eje.13;
        Thu, 07 May 2020 23:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jrb5SpxBpfxnJarYhbVR8JuF3xmhz+iatL9rlTHsEyY=;
        b=Foo79FwS3ejJHJvHDvjZDXSJfa/QxQXrU0lzOnmBQ9WcsEwGV0ll49OPXx0ySElUd/
         Vjc3F0YYJ7a4sgcg2y/Ny/Mz+A81AMCIpV5kcql4HDcGNqFVf8hJg7DQpuz8DrMN/5JF
         jAlfdNkr4BgDV/HIDfkeoBKHpBGf607JsE6hA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jrb5SpxBpfxnJarYhbVR8JuF3xmhz+iatL9rlTHsEyY=;
        b=hErDwZims/K/XVVj9G+cSw85+3fIhr2nypu9lT8GBtuVZbxFYFkPjRPVMU8TuGSJcg
         XjcswU5UqsMRFC5p/jZDsI/bJIyPRPAq4f3cGb1JrL5D++nBYuZ7WlaXrPD8A7h/pufj
         LcDu9Lx7kI9XNC98UBvdtCtAVWuW14C1vkGopkf5riyCfDt0ohTvDpA8tuFIZ44x0wea
         RP/oZXliauHjcebWB8WPLIaYgHdgDmE1aP3HwHxw4DS+7dIs9KPjG2l1p+nKG9ec6Fp9
         a5PNwQABe3G2DLvTRhT3ANndHoLK8LVvKXoRVHsnlNT0sMH/CNArXSA+ekAwW2NbCdpx
         Fidg==
X-Gm-Message-State: AGi0PuaPx//kyAwdy/ciLPYkhYUN1inDiwlxxrNIAeNBWeHV/9ai8icP
        toGqTphF1B0rqWLWziXgeDZongxfCUiTyTqf84k=
X-Google-Smtp-Source: APiQypLH/Ux5BoAFAL9pL/NG4/QCY9jLTfLa7OlOxytAbk1YdAAUjg0TOkQxMjPfoWcCNuOSNknN+TbzIjFSumduBz4=
X-Received: by 2002:a17:906:4c8e:: with SMTP id q14mr658681eju.208.1588920043365;
 Thu, 07 May 2020 23:40:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200507091008.1bd38185@canb.auug.org.au> <CACPK8XfOJqj=E4JwQsZWvAsp7cv=bjqj2twZk0=MR+ZJQP1nqQ@mail.gmail.com>
In-Reply-To: <CACPK8XfOJqj=E4JwQsZWvAsp7cv=bjqj2twZk0=MR+ZJQP1nqQ@mail.gmail.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Fri, 8 May 2020 06:40:31 +0000
Message-ID: <CACPK8XcUydETZvJEkWPvLnLXatAg3D-MfA1yeDzE0epc-hisJQ@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the aspeed tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        devicetree-compiler@vger.kernel.org
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>,
        Andrew Jeffery <andrew@aj.id.au>, Vijay Khemka <vkhemka@fb.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 6 May 2020 at 23:13, Joel Stanley <joel@jms.id.au> wrote:
>
> Hi Rob,
>
> On Wed, 6 May 2020 at 23:10, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> >
> > After merging the aspeed tree, today's linux-next build (arm
> > multi_v7_defconfig) produced this warning:
>
> Thanks Stephen.
>
> > arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts:126.11-130.4: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@80/ipmb1@10: I2C bus unit address format error, expected "40000010"
> > arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts:128.3-30: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@80/ipmb1@10:reg: I2C address must be less than 10-bits, got "0x40000010"
> > arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts:137.11-141.4: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@100/ipmb3@10: I2C bus unit address format error, expected "40000010"
> > arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts:139.3-30: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@100/ipmb3@10:reg: I2C address must be less than 10-bits, got "0x40000010"
> > arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts:148.11-152.4: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@180/ipmb5@10: I2C bus unit address format error, expected "40000010"
> > arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts:150.3-30: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@180/ipmb5@10:reg: I2C address must be less than 10-bits, got "0x40000010"
> > arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts:159.11-163.4: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@300/ipmb7@10: I2C bus unit address format error, expected "40000010"
> > arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts:161.3-30: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@300/ipmb7@10:reg: I2C address must be less than 10-bits, got "0x40000010"
>
> These are IPMB nodes with the SLAVE_ADDRESS bit set:
>
> +&i2c5 {
> +       //Host3 IPMB bus
> +       status = "okay";
> +       multi-master;
> +       ipmb5@10 {
> +               compatible = "ipmb-dev";
> +               reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
> +               i2c-protocol;
> +       };
>
> This is a correct entry, so dtc should not warn about it.

I sent a patch for dtc here:
https://lore.kernel.org/lkml/20200508063904.60162-1-joel@jms.id.au/

Cheers,

Joel
