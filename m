Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 961DB34AE89
	for <lists+linux-next@lfdr.de>; Fri, 26 Mar 2021 19:27:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230114AbhCZS1U (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 26 Mar 2021 14:27:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230159AbhCZS1Q (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 26 Mar 2021 14:27:16 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7969EC0613AA;
        Fri, 26 Mar 2021 11:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=8Ae93rKXbABJtGx3FxazTivwVoSUyF1RzcrMzGIW5rU=; b=hcB5eQg1sEj8cqW4B5F0SkSx/s
        4FcNeIJ5qmCIdR8Eng4rrfZkEqe3WieOm2J8eiJHoBkyzcWQqxv53bnhy+WODXeHywsdHgExYClu3
        FoXQTCiyCwzgjidzh01BDNm5cZVkEsghV9GQVUZBNAK0pXbRJfCa/khYPISN5LpElcoVF9FUUjT5D
        pc3Nzb0oFPE48N2JbyC6kfyVxSPDsVo/HmQgwrKIrv2iqmCEf06fpbqgEo/AWHeQO31o336IdJ0sU
        Gu+qbyvq4ZLcFlmxeszP6eO6SKysLKnXxxPFjicgNiDbQG241O51epr9fEk9HgFv5p7jkStY0V0Zp
        OkGYssRA==;
Received: from [2601:1c0:6280:3f0::4557]
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lPrAP-00FGpt-L2; Fri, 26 Mar 2021 18:26:47 +0000
Subject: Re: linux-next: Tree for Mar 26 (drivers/mfd/lpc_sch.c)
From:   Randy Dunlap <rdunlap@infradead.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Denis Turischev <denis@compulab.co.il>,
        Lee Jones <lee.jones@linaro.org>
References: <20210326193457.7887e09e@canb.auug.org.au>
 <39a89498-6b81-4d4c-503f-c87805ca620a@infradead.org>
Message-ID: <1833e29a-3d16-7041-dd75-784ae4e07faf@infradead.org>
Date:   Fri, 26 Mar 2021 11:26:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <39a89498-6b81-4d4c-503f-c87805ca620a@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 3/26/21 11:20 AM, Randy Dunlap wrote:
> On 3/26/21 1:34 AM, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20210325:
>>
> 
> on i386 or x86_64:
> aha:
> # CONFIG_PCI is not set
> 
> 
> ../drivers/mfd/lpc_sch.c:204:1: warning: data definition has no type or storage class
>  module_pci_driver(lpc_sch_driver);
>  ^~~~~~~~~~~~~~~~~
> ../drivers/mfd/lpc_sch.c:204:1: error: type defaults to ‘int’ in declaration of ‘module_pci_driver’ [-Werror=implicit-int]
> ../drivers/mfd/lpc_sch.c:204:1: warning: parameter names (without types) in function declaration
> ../drivers/mfd/lpc_sch.c:197:26: warning: ‘lpc_sch_driver’ defined but not used [-Wunused-variable]
>  static struct pci_driver lpc_sch_driver = {
>                           ^~~~~~~~~~~~~~
> 
> 
> Full x86_64 randconfig file is attached.

This is the root of the problem I think:

WARNING: unmet direct dependencies detected for LPC_SCH
  Depends on [n]: HAS_IOMEM [=y] && PCI [=n]
  Selected by [m]:
  - GPIO_SCH [=m] && GPIOLIB [=y] && X86 [=y] && (X86 [=y] || COMPILE_TEST [=y]) && ACPI [=y]


Denis, that still looks like it's your territory.

thanks.
-- 
~Randy

