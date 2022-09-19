Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08CBF5BC414
	for <lists+linux-next@lfdr.de>; Mon, 19 Sep 2022 10:13:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229682AbiISINI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 19 Sep 2022 04:13:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229852AbiISINH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 19 Sep 2022 04:13:07 -0400
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 047ED1F611
        for <linux-next@vger.kernel.org>; Mon, 19 Sep 2022 01:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1663575186; x=1695111186;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=QOSBZSc9dzIuGWpOOaX6YfZf7Xdxte9azBq14tzI/IQ=;
  b=oG0TPqneZfRVWtzvEwfTQwBRrqC8Y7L4LDWob1S+FmNuCuN+LmLyR0g4
   Gtsw0mzT+15uDMIyDUumTWIi7eiO+ZF+lrBi9aYeq3aK2dJkAdpl15d1e
   pDhi3RXOgMvBLS2u5wXMe/72U/k5snEU4bpnjL+seW13G6xKRdudUasbx
   H1TAFSuUCLdRUvXro16kv1KafVZ1byWy0plDjtcyp6MAIECOgTGRWCzKQ
   JrhMn0h3oc9kJXZFDkF3KopvBMTlii5TPDbN0SKNB0FzgBq5u+LzDkNT3
   vRqrusBSe0O0k0mUJ6U8ksOkR76/GVyCpt7KhXHeBMDWacUU0IdYs6k1u
   w==;
X-IronPort-AV: E=Sophos;i="5.93,327,1654531200"; 
   d="scan'208";a="210081627"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 19 Sep 2022 16:13:05 +0800
IronPort-SDR: Gzh0uZ5MCkszwOR5fwOPJBjCmS32Z53jMdo27k3CjyP9/+OvZC88jEDkFibLXCRc6pjpNl/wtq
 034weyEWKAhVvBGtB8MLEiW4SaMQCxAqKtXa4jjHb/97WVQneAT9jJw4b3vDmvkyzG28GDT/rS
 O6yXvbCeMMxnW2TsAQHwhl7JhobUcuhqkWO1kGVp46lFOjzq8qcLxn1eIA6hxvO+QS7pPA1SSd
 +cXPGLSUOQqROgrVuQ0OMDBXsujkLOK61XidcD2+Wlcis8OudzQp5UOQ4ZDsrQlprw/9gIaL6D
 87w7wMOVtf07PKush7lV8lAu
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Sep 2022 00:27:43 -0700
IronPort-SDR: VEvUFetF8sM/9JGnP9NITnIfBIpt1OmxzqmBjWEu/rwgIupqro8408a6JZtaFdkN2JEEa3Atg0
 MElPN6SXhxrLGyXbII6YSnGgoRH8LyjM06ogry63MtjC87O9oBuuCMK8gHrywjFBqae1iaDPYi
 0OWoqBbbfem+ZiddRMtlDAmHGTTraKEFFwdUeHU+KQb4FLnCfiRWwTocv5p3LcuixphRgh6O/o
 LO5fcby4TnAY1FOl4Fa71CwUPNM5KsmmySIyWATEQJ6/2Z/W8RH4mn6fuqiFX/LXrPFYN4ZEwm
 llU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Sep 2022 01:13:06 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MWHFL2HGxz1RvTr
        for <linux-next@vger.kernel.org>; Mon, 19 Sep 2022 01:01:42 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:content-language:references:to
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1663574502; x=1666166503; bh=QOSBZSc9dzIuGWpOOaX6YfZf7Xdxte9azBq
        14tzI/IQ=; b=N/oqFP8VCXIWVhCpfik9OSZiScAQ4M+81VAmFu77/3LgC95P9Ln
        KyPoIaSUS5qQISB+hfvD7YC2QVLdPZnYKRHH/MlzEwAKojwKo7PPqhga3gGwKGg5
        MAbgEP1wzQkS9MZoLfL+zpBiJRVGrdNurOM8OPme4Y3VHA2jhKGNpmGvxmSftOfM
        bT01e+Fm8+jFnX/OscAetT5TfPFrMSlSNono93kQnHudqZsbukFM8thjnbtRIN7Z
        ODOC6d8mLHCtYiC5oW4ovY/2TiBYT+M8Y0mq62gY1OU2NsIglQ8VDEog0K3IOw3k
        RADZ2Jtfa/XV+dS1TTdPcOhjR7WhlWDOx+g==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id ofHCRtzIuFfc for <linux-next@vger.kernel.org>;
        Mon, 19 Sep 2022 01:01:42 -0700 (PDT)
Received: from [10.225.163.80] (unknown [10.225.163.80])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MWHFJ4Rp8z1RvLy;
        Mon, 19 Sep 2022 01:01:40 -0700 (PDT)
Message-ID: <e58c02dc-1560-84db-d9cc-a16f47426b7d@opensource.wdc.com>
Date:   Mon, 19 Sep 2022 17:01:38 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: linux-next: build warning after merge of the libata tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20220919124034.58670a27@canb.auug.org.au>
Content-Language: en-US
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220919124034.58670a27@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 9/19/22 11:40, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the libata tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
> 
> drivers/ata/ahci_st.c: In function 'st_ahci_probe':
> drivers/ata/ahci_st.c:147:24: warning: unused variable 'dev' [-Wunused-variable]
>   147 |         struct device *dev = &pdev->dev;
>       |                        ^~~
> 
> Introduced by commit
> 
>   3f74cd046fbe ("ata: libahci_platform: Parse ports-implemented property in resources getter")
> 

Serge,

Can you send an incremental fix for this ? If not possible, I will do it.

-- 
Damien Le Moal
Western Digital Research

