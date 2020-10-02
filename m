Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42CC2280DA3
	for <lists+linux-next@lfdr.de>; Fri,  2 Oct 2020 08:49:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725991AbgJBGtw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 2 Oct 2020 02:49:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725948AbgJBGtw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 2 Oct 2020 02:49:52 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7C5FC0613D0
        for <linux-next@vger.kernel.org>; Thu,  1 Oct 2020 23:49:51 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id j2so491632wrx.7
        for <linux-next@vger.kernel.org>; Thu, 01 Oct 2020 23:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=UoynpyD6AhgXUB6wR1FXtYWnjMZi4vEwFI3CCNbPh/Q=;
        b=tWXguv2ZF0F5qwrOvcenJ2zOdlhvSJCtiTfazpgPgCUff7y5mZjhcy91c4+YFMJQFs
         r30J/sQBFQQGHuHftJQldSaD1Up2mzT5VYE143b1Ny7JTtZJUGmGRtB0eeFhZFsWSSdU
         VFXK+kxDZyob7WTGnDZTD4K08nvWYRegljwj0VAAt0sO3RX03Eq4TXbnh3B97nhZ2GFf
         zS6u77rCgEG6WPXLkmco018F6NTrS+yeUvgX+DEoEUnSpTy0y9rIJojPpxm4Z9GIcm9s
         tTOGdi/sEB0xMeuLFLtonRmCGZQjCDvx3uQvR8AN2QBfh2cZjeNQ87gbgOcuO3tdeYkY
         g/YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=UoynpyD6AhgXUB6wR1FXtYWnjMZi4vEwFI3CCNbPh/Q=;
        b=g3J1RIZhlTI/VCy6a2HpshWMA/Hn4mcDharflmc671J66Iri1PlGyWMtrdsOBx3pvH
         c8Thy47IYv/3FyN1DKvTyFpHGnoLAJOgOfkJX0XVaK58CE956nYGM/8/oy6s18/2Bt0O
         JkmunrJfpS9BSYoP3yWLRGoXkNRfxjV/Ua5qG3LgzeBPmra4zN95Nzd3llqBdJIy6rjf
         kzLFo0J9Bo3EIpvRlS3y4TYZIUtFO9HxoUfGSte0kYYukxdbn30v05Ky0MsOV3rYy5D6
         jlweIWCANvqEls/5BiufrO0JCdi0YMPr/Q87lxG5LDqVctW9eIRCe6ijkWSPjCiNKWKU
         favg==
X-Gm-Message-State: AOAM530AZG1q/0Qe8mVd8laWPodrthFYj8gatcm/6Oi0Vn4xxHWVWh9x
        1xvjopjTNif7HbHoEJEu960m0g==
X-Google-Smtp-Source: ABdhPJwXKvamwY1YeQU9ErKMKhnd33q+LPxo4LI6im24/u+dR6YSHPEn41d7IqdD7pAJjfPLnHbrvQ==
X-Received: by 2002:adf:fe42:: with SMTP id m2mr1161269wrs.367.1601621390382;
        Thu, 01 Oct 2020 23:49:50 -0700 (PDT)
Received: from dell ([91.110.221.236])
        by smtp.gmail.com with ESMTPSA id v204sm660429wmg.20.2020.10.01.23.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 23:49:49 -0700 (PDT)
Date:   Fri, 2 Oct 2020 07:49:48 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Oct 1 (drivers/mfd/simple-mfd-i2c.o)
Message-ID: <20201002064948.GQ6148@dell>
References: <20201001213929.241c1006@canb.auug.org.au>
 <0dca758e-1b61-a4cd-db12-2e2060f7cf60@infradead.org>
 <20201002063203.GP6148@dell>
 <5974d448-a704-fd74-704c-b902b0ac9a8f@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5974d448-a704-fd74-704c-b902b0ac9a8f@infradead.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 01 Oct 2020, Randy Dunlap wrote:

> On 10/1/20 11:32 PM, Lee Jones wrote:
> > On Thu, 01 Oct 2020, Randy Dunlap wrote:
> > 
> >> On 10/1/20 4:39 AM, Stephen Rothwell wrote:
> >>> Hi all,
> >>>
> >>> Changes since 20200930:
> >>>
> >>
> >> on x86_64:
> >>
> >> ld: drivers/mfd/simple-mfd-i2c.o: in function `simple_mfd_i2c_probe':
> >> simple-mfd-i2c.c:(.text+0x48): undefined reference to `__devm_regmap_init_i2c'
> >> ld: drivers/mfd/simple-mfd-i2c.o: in function `simple_mfd_i2c_driver_init':
> >> simple-mfd-i2c.c:(.init.text+0x14): undefined reference to `i2c_register_driver'
> >> ld: drivers/mfd/simple-mfd-i2c.o: in function `simple_mfd_i2c_driver_exit':
> >> simple-mfd-i2c.c:(.exit.text+0xd): undefined reference to `i2c_del_driver'
> >>
> >>
> >> CONFIG_I2C=m
> >> CONFIG_MFD_SIMPLE_MFD_I2C=y
> >> CONFIG_MFD_SL28CPLD=y
> >>
> >>
> >> Is linux-next missing the source code for CONFIG_MFD_SL28CPLD?
> > 
> > There isn't any associated source code.  It's a virtual symbol.
> > 
> >> The build error is caused by:
> >>
> >> config MFD_SL28CPLD
> >> 	tristate "Kontron sl28cpld Board Management Controller"
> >> 	select MFD_SIMPLE_MFD_I2C
> >>
> >> that "select" when "depends on I2C" is absent/missing.
> > 
> > Okay, so CONFIG_MFD_SIMPLE_MFD_I2C needs to depend on I2C too?  I made
> > the assumption that 'select REGMAP_I2C' would do the right thing.
> 
> "select" never follows any dependency chains, so Yes, the other symbol
> needs to depend on I2C also.

Makes sense.  Will fix, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
