Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB54355169B
	for <lists+linux-next@lfdr.de>; Mon, 20 Jun 2022 13:07:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240318AbiFTLHa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Jun 2022 07:07:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241013AbiFTLH2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 20 Jun 2022 07:07:28 -0400
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68FFD1572B
        for <linux-next@vger.kernel.org>; Mon, 20 Jun 2022 04:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1655723247; x=1687259247;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=DI/6yxqzgLJ7+71SzU2YZCO8XokVBsshUTTTNfGswXM=;
  b=QTYsAt1GMr7lFMELffruLtgAKDie8xDwBc3Zyt+7lnDJDYfyGiXUBj8M
   /WdRCKEgLO49ZLq18G1zJ9aKmmm3iFEt35waCsN6rPvRJGsBfEAhtmomu
   zDGuy113QbdxbpWqoMWArZ7qeOImFM2uscdZGFo+4CT2lB5jYDCjz6iJK
   nvOJXbfvqPS3NF0AxFTLowTi0F3KOOaHtVfTOsThKxEXZB1G6oYSOuImh
   s8T5Ea+aeXAgKKVB7xDesiih1ooKxXvoqidDpnyxyoBfBCufyV+edhRcY
   kgnBcmCfWostHMJYLe3uDu5HA3g44mKqtOyvoE9T8u3zPP7xFWCmqDIOP
   w==;
X-IronPort-AV: E=Sophos;i="5.92,306,1650902400"; 
   d="scan'208";a="307934420"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 20 Jun 2022 19:07:26 +0800
IronPort-SDR: Wtr2L/y8bUpurrU5SMjdRAMoPsTCVcKCXryBbtrPHkgkqlrlClLfYLOeruCU6gEgxozyCxHMeK
 aJaiqKTRUPJ7ooBW345zclhBIXc2igprdk2fXXKbdBcH8YYhuUyajOAFYCDpkdAHO5StVGkf9C
 UQKcxcwKKL0tEJ6ni8q1xnzGeB0yXe8EX0edBSnjvRB3UafkPxGV+IUHnqWwzHvDnKE2M9PJey
 JLbjoDNlyP+Ttlo7EpA0AHmCtKDCuoZ77FpaQ90wR/jfNuftkS/cCRK6YfgYtnWjal959pEdGr
 FSd6p+6T6JYJkrmqWsJodcl+
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Jun 2022 03:29:58 -0700
IronPort-SDR: 3S/qTJuNaK6K9rYdOALzmqfcdumXDoiWfr+TYZJDwuD8/fdPTFxjYEhAeTUNYmw83x2/Kejo/E
 meCzSoyElSzKYH+OoT8Xdj0JCFLkxwGCCQvcZQ89tIMeGpOYuMZU4q3C8SoEPvJmpyllgOJR7n
 mxxXQgcBoFgv4QGEXL24KQptzHLdX32+fT5WHmnOeJ8VtSjB2olPDLD68xZBx6KtOdu8bo+kzr
 SI+ZoUOdCrzFWDqfMW4VDG7wx4rOUZHSL7tUIvOt/TsRWfxiLXrX9a1uzz3hbtWVw9UvuIlYht
 OQo=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Jun 2022 04:07:27 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LRRgf1xBtz1Rvlx
        for <linux-next@vger.kernel.org>; Mon, 20 Jun 2022 04:07:26 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1655723245; x=1658315246; bh=DI/6yxqzgLJ7+71SzU2YZCO8XokVBsshUTT
        TNfGswXM=; b=CxTzptCxPOgl9XzZOKveMRZha9TMjozFp8IO5vF7ozke/w6qXg1
        81BhZJpwRuzDNVa9/1abe9ewVJzj+HsuiZQOoJ7jseQSdfILfUbVMzibvdd1lZk8
        Whjy8KXjjre3VqcI3peaZJO8T515Q2EyiZwx5W2dV6/zFoEH79B8jrwmF8sMTLIM
        x+VIM4Ts+cvJtt7sjClbJZPgjnLocODBwB7waw25616u7wLk1Br9i5CQr+zRqzFA
        UbQqa/JfzvH/nmKknXtEdVcRWNhdoY+1j+ASKgAzOL8Z+9wB6ACh7AYqpMYOcvdq
        CDPVRjMC/KBqbhjH7khOigvjXBk7bNMMWwA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id Igg6f7lH8NJ9 for <linux-next@vger.kernel.org>;
        Mon, 20 Jun 2022 04:07:25 -0700 (PDT)
Received: from [10.225.163.87] (unknown [10.225.163.87])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LRRgd1lLyz1Rvlc;
        Mon, 20 Jun 2022 04:07:25 -0700 (PDT)
Message-ID: <71cca7ed-6409-3066-8878-cdc647b17057@opensource.wdc.com>
Date:   Mon, 20 Jun 2022 20:07:23 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: linux-next: build warning after merge of the libata tree
Content-Language: en-US
To:     Sergey Shtylyov <s.shtylyov@omp.ru>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20220620103400.6b03f8d9@canb.auug.org.au>
 <20220620182108.5efb3107@canb.auug.org.au>
 <387885f0-999f-3746-0238-77052f10b25c@opensource.wdc.com>
 <8e0717c2-d3c0-c81c-3a33-afdc045d123c@omp.ru>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <8e0717c2-d3c0-c81c-3a33-afdc045d123c@omp.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 6/20/22 19:57, Sergey Shtylyov wrote:
> Hello!
> 
> On 6/20/22 11:53 AM, Damien Le Moal wrote:
> 
> [...]
>>>> After merging the libata tree, today's linux-next build (powercp
>>>> ppc64_defconfig) produced this warning:
>>>>
>>>> In file included from include/linux/device.h:15,
>>>>                  from arch/powerpc/include/asm/io.h:27,
>>>>                  from include/linux/io.h:13,
>>>>                  from include/linux/irq.h:20,
>>>>                  from arch/powerpc/include/asm/hardirq.h:6,
>>>>                  from include/linux/hardirq.h:11,
>>>>                  from include/linux/highmem.h:11,
>>>>                  from include/linux/bvec.h:10,
>>>>                  from include/linux/blk_types.h:10,
>>>>                  from include/linux/blkdev.h:9,
>>>>                  from drivers/ata/pata_macio.c:18:
>>>> drivers/ata/pata_macio.c: In function 'pmac_macio_calc_timing_masks':
>>>> drivers/ata/pata_macio.c:1031:28: warning: format '%lx' expects argument of type 'long unsigned int', but argument 4 has type 'unsigned int' [-Wformat=]
>>>>  1031 |         dev_dbg(priv->dev, "Supported masks: PIO=%lx, MWDMA=%lx, UDMA=%lx\n",
>>>
>>> 	.
>>> 	.
>>> 	.
>>>
>>>> Introduced by commit
>>>>
>>>>   f0a6d77b351c ("ata: make transfer mode masks *unsigned int*")
> 
>    Oops, sorry about that!>
>>> This turned into a build failure in my powerpc allyesconfig build, so I
>>> reverted the above commit for today.
>>
>> I pushed the fix already. It is in ata for-next branch.
> 
>    Thank you!
>    Note that your Fixes: tag doesn't look right -- the asterisks are missing
> in the summary...

Fixed. Copy-paste from the mailer (build failure report email), the
asterisks are gone and "unsigned int" shown with bold font. Please stop
with the markdown style emphasis. That creates problems.

> 
> MBR, Sergey


-- 
Damien Le Moal
Western Digital Research
