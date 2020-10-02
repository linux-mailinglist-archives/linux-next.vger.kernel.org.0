Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FB92280D7E
	for <lists+linux-next@lfdr.de>; Fri,  2 Oct 2020 08:32:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726060AbgJBGcJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 2 Oct 2020 02:32:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725968AbgJBGcJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 2 Oct 2020 02:32:09 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51253C0613D0
        for <linux-next@vger.kernel.org>; Thu,  1 Oct 2020 23:32:07 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id s12so435446wrw.11
        for <linux-next@vger.kernel.org>; Thu, 01 Oct 2020 23:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=nPkSNZ+pBwevxbb71PLvut2Zm5obbeYq8dEPZbv1fLQ=;
        b=JB6jeYf3TH4bCDvi2v7PJFfTEVQfeh95qnmxVETkcD4KyPxHiDEnDXfBz99mR84XOV
         Qg9WomisRVw2MgqWmJPHjZwawrNriV+xVCtovlfHoe882oURGv1t5j7rbpVMI9ZzTk4G
         G+JciiS5G0V/dB7YpzPxraJYClGZsf4CTZn06bVOfM9+XArukgFMWq9SFbnz4ONj0D6b
         RnnQl9XpRKRBispE+qDS30otK4huK9o7m2rzl7BGK0o0r/chAJ0wg7T+EfAYC5e4wXHX
         od0I+bsEiFXFGJXRW9daiRH7jyM7C+MzFYB3hCbf/Rl5bkWRr1FPLt5bZu/PA5eCGUVY
         ObRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=nPkSNZ+pBwevxbb71PLvut2Zm5obbeYq8dEPZbv1fLQ=;
        b=YwC74uxjaTgvVzENw/gXOVA2SlhfLVgEt3Mw2s6/jbuvq1dTRBO4wDEEdF8Aif7jNu
         ijFL8C7KxWGs4kVYnrLYkNXJ5Z574Q+ersSMRNLxLsNKTQcsvPYPwqisi/Q729pCphZD
         AaPDXy2RaV3u+kspdfr0rHSFyiBmPS2QT1n+2EbmzAjXPDRqPKdg1cr2ejU4xw6Ugcrx
         d7/ED7quPrcFX74NwySODxTEqZ8qC49BwerAjS9UTi7C/gTSHwFwX509l+XsxyYWRI80
         /Q4LG9cm94/Xvn4xpS4eVUx9GqBDZtt4Dschx31kUpOs891QEOYqCwhlvDESI1pxwm3Q
         EXvw==
X-Gm-Message-State: AOAM530O9aN9NcVhtYaq7Da6jyWeubunXM5hSOrUvWliNkQl0Z3h/kfS
        FhoiohsyHJGE4l3g3Enkp6k76w==
X-Google-Smtp-Source: ABdhPJyYYxY68GzP2ZjS+mHVPKam90OMrF1OAhz1d7NZatnrbA/X0LZohbLqsAl4QuGmAns/WDcvPA==
X-Received: by 2002:adf:c3cc:: with SMTP id d12mr1114335wrg.399.1601620325905;
        Thu, 01 Oct 2020 23:32:05 -0700 (PDT)
Received: from dell ([91.110.221.236])
        by smtp.gmail.com with ESMTPSA id z83sm611537wmb.4.2020.10.01.23.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 23:32:05 -0700 (PDT)
Date:   Fri, 2 Oct 2020 07:32:03 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Oct 1 (drivers/mfd/simple-mfd-i2c.o)
Message-ID: <20201002063203.GP6148@dell>
References: <20201001213929.241c1006@canb.auug.org.au>
 <0dca758e-1b61-a4cd-db12-2e2060f7cf60@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0dca758e-1b61-a4cd-db12-2e2060f7cf60@infradead.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 01 Oct 2020, Randy Dunlap wrote:

> On 10/1/20 4:39 AM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20200930:
> > 
> 
> on x86_64:
> 
> ld: drivers/mfd/simple-mfd-i2c.o: in function `simple_mfd_i2c_probe':
> simple-mfd-i2c.c:(.text+0x48): undefined reference to `__devm_regmap_init_i2c'
> ld: drivers/mfd/simple-mfd-i2c.o: in function `simple_mfd_i2c_driver_init':
> simple-mfd-i2c.c:(.init.text+0x14): undefined reference to `i2c_register_driver'
> ld: drivers/mfd/simple-mfd-i2c.o: in function `simple_mfd_i2c_driver_exit':
> simple-mfd-i2c.c:(.exit.text+0xd): undefined reference to `i2c_del_driver'
> 
> 
> CONFIG_I2C=m
> CONFIG_MFD_SIMPLE_MFD_I2C=y
> CONFIG_MFD_SL28CPLD=y
> 
> 
> Is linux-next missing the source code for CONFIG_MFD_SL28CPLD?

There isn't any associated source code.  It's a virtual symbol.

> The build error is caused by:
> 
> config MFD_SL28CPLD
> 	tristate "Kontron sl28cpld Board Management Controller"
> 	select MFD_SIMPLE_MFD_I2C
> 
> that "select" when "depends on I2C" is absent/missing.

Okay, so CONFIG_MFD_SIMPLE_MFD_I2C needs to depend on I2C too?  I made
the assumption that 'select REGMAP_I2C' would do the right thing.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
