Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB80D280842
	for <lists+linux-next@lfdr.de>; Thu,  1 Oct 2020 22:13:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730008AbgJAUNB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 1 Oct 2020 16:13:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726606AbgJAUNB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 1 Oct 2020 16:13:01 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BD37C0613D0;
        Thu,  1 Oct 2020 13:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=wARecjB956+ZxxOybHVoSp1V90Wk6TWcZNLZvl0XKV0=; b=s20Lnrhne0qAxzh22PvIC5Pzw+
        /IaZUvu+qUPaosWxAqAqpFagq8hRzawytGh59H2u0z/X7qsuQN3hYtrCY2VCbMbBECbfyu0hUj6tu
        wgkEQjAeRpmop4fe2dKtewWtOuKxxOOi74o3rNXXAQrpEJUklRuxU+yHho32GwKDDGTNvgFGJ1UvI
        ehleSjh5ctyNvUCbERr9OMj+Zy17Y9hmqJCpnC99MCYROJCVwadvJdFTOgKlkZCtUpLrAyP7axLQB
        DVnVdFcy+QSNIW8bX6wI9pcQ+G1HWfB5Nz1ZX3G3b9nLz6qgl3iKhX8rsd+iaPqO0Azyf0Egc+A++
        EuxzbRcA==;
Received: from [2601:1c0:6280:3f0::863]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kO4wk-0007bv-Qt; Thu, 01 Oct 2020 20:12:59 +0000
Subject: Re: linux-next: Tree for Oct 1 (drivers/mfd/simple-mfd-i2c.o)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>
References: <20201001213929.241c1006@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <0dca758e-1b61-a4cd-db12-2e2060f7cf60@infradead.org>
Date:   Thu, 1 Oct 2020 13:12:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201001213929.241c1006@canb.auug.org.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10/1/20 4:39 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20200930:
> 

on x86_64:

ld: drivers/mfd/simple-mfd-i2c.o: in function `simple_mfd_i2c_probe':
simple-mfd-i2c.c:(.text+0x48): undefined reference to `__devm_regmap_init_i2c'
ld: drivers/mfd/simple-mfd-i2c.o: in function `simple_mfd_i2c_driver_init':
simple-mfd-i2c.c:(.init.text+0x14): undefined reference to `i2c_register_driver'
ld: drivers/mfd/simple-mfd-i2c.o: in function `simple_mfd_i2c_driver_exit':
simple-mfd-i2c.c:(.exit.text+0xd): undefined reference to `i2c_del_driver'


CONFIG_I2C=m
CONFIG_MFD_SIMPLE_MFD_I2C=y
CONFIG_MFD_SL28CPLD=y


Is linux-next missing the source code for CONFIG_MFD_SL28CPLD?


The build error is caused by:

config MFD_SL28CPLD
	tristate "Kontron sl28cpld Board Management Controller"
	select MFD_SIMPLE_MFD_I2C

that "select" when "depends on I2C" is absent/missing.


-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
