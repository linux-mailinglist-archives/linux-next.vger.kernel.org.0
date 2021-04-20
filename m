Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 178193653A0
	for <lists+linux-next@lfdr.de>; Tue, 20 Apr 2021 09:57:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229521AbhDTH5v (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 20 Apr 2021 03:57:51 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:53615 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229475AbhDTH5v (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 20 Apr 2021 03:57:51 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 13K7r9uB030781;
        Tue, 20 Apr 2021 09:57:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=RDsSAFlDSlw3VM/cV6rqcFU4t+Jyj+WBFIWRg8VlAeM=;
 b=MnCYw318dgatw1vaO0vMPdCb5PaHhYH17DARD7vr0xDJmxSCraaJB3PaV5aoCjtpUMRe
 YqJh3yELpGqVgvAQdgnCiPtTTzcEkEuXZOiX2vQ5C6ZmNqLKb4zgN5PCk4IvsfkzKsFT
 mj5L+qgdj1zK0yiZjDc3WVgGp5wWot4FAcCfCoBXI8UBL2+kjR6b7KuCNWZYvxl8FFUU
 PUKCAT26LVfqGdnkppCaxdkO/3v+s+/z/D4y/ih/PaedDxC/3799qXcsEP2N5YkYjhH1
 RkorLuj/e57O/nuNtSnO+Fwzj3VsQN95677NH/Fg7sQvh/TqAyWnV919DORe4UQMNP7B mg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 381nbc9kwb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 20 Apr 2021 09:57:02 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 532DF10002A;
        Tue, 20 Apr 2021 09:57:00 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DF1BE22B9C5;
        Tue, 20 Apr 2021 09:57:00 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 20 Apr
 2021 09:57:00 +0200
Subject: Re: linux-next: build warning after merge of the spi tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Mark Brown <broonie@kernel.org>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210420134834.57467d47@canb.auug.org.au>
From:   Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <01e58753-1e26-f9f1-0c26-d07f4689c63c@foss.st.com>
Date:   Tue, 20 Apr 2021 09:56:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210420134834.57467d47@canb.auug.org.au>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-04-20_02:2021-04-19,2021-04-20 signatures=0
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Mark

I will send a patch to fix this warning, sorry for that.

Patrice.

On 4/20/21 5:48 AM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the spi tree, today's linux-next build (x86_64 allmodconfig)
> produced this warning:
> 
> In file included from include/linux/printk.h:409,
>                  from include/linux/kernel.h:16,
>                  from include/linux/clk.h:13,
>                  from drivers/spi/spi-stm32-qspi.c:7:
> drivers/spi/spi-stm32-qspi.c: In function 'stm32_qspi_dirmap_read':
> drivers/spi/spi-stm32-qspi.c:481:21: warning: format '%x' expects argument of type 'unsigned int', but argument 5 has type 'size_t' {aka 'long unsigned int'} [-Wformat=]
>   481 |  dev_dbg(qspi->dev, "%s len = 0x%x offs = 0x%llx buf = 0x%p\n", __func__, len, offs, buf);
>       |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/linux/dynamic_debug.h:129:15: note: in definition of macro '__dynamic_func_call'
>   129 |   func(&id, ##__VA_ARGS__);  \
>       |               ^~~~~~~~~~~
> include/linux/dynamic_debug.h:161:2: note: in expansion of macro '_dynamic_func_call'
>   161 |  _dynamic_func_call(fmt,__dynamic_dev_dbg,   \
>       |  ^~~~~~~~~~~~~~~~~~
> include/linux/dev_printk.h:123:2: note: in expansion of macro 'dynamic_dev_dbg'
>   123 |  dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
>       |  ^~~~~~~~~~~~~~~
> include/linux/dev_printk.h:123:23: note: in expansion of macro 'dev_fmt'
>   123 |  dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
>       |                       ^~~~~~~
> drivers/spi/spi-stm32-qspi.c:481:2: note: in expansion of macro 'dev_dbg'
>   481 |  dev_dbg(qspi->dev, "%s len = 0x%x offs = 0x%llx buf = 0x%p\n", __func__, len, offs, buf);
>       |  ^~~~~~~
> drivers/spi/spi-stm32-qspi.c:481:34: note: format string is defined here
>   481 |  dev_dbg(qspi->dev, "%s len = 0x%x offs = 0x%llx buf = 0x%p\n", __func__, len, offs, buf);
>       |                                 ~^
>       |                                  |
>       |                                  unsigned int
>       |                                 %lx
> 
> Introduced by commit
> 
>   18674dee3cd6 ("spi: stm32-qspi: Add dirmap support")
> 
