Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 506415BD883
	for <lists+linux-next@lfdr.de>; Tue, 20 Sep 2022 01:57:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbiISX5A (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 19 Sep 2022 19:57:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229668AbiISX47 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 19 Sep 2022 19:56:59 -0400
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CD8E50058
        for <linux-next@vger.kernel.org>; Mon, 19 Sep 2022 16:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1663631818; x=1695167818;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=b0T0vZZkQKS2ASzkRyQjA/Ex8HApxh/6xQcC/blyp/g=;
  b=JshR9KMJ7T3uSmtjl0AaICh1XKjl2ufFK7Gn85YqnzragVdv9P9hL/KE
   uvnA8IwvfT+JClDKMAbXjOFXQ6QYYusj3ISNppRkv1IJ3AOc5nvHu4sGX
   qjQBxrIbEddaW2A6+gLjO9xWjDGyT3lrUYPzQ9AY03HsNSEINOzNKUoA0
   U97Wn4Wt1JhMjNkfANTuuEsTkQMZKHaLOLL9zpK8XehNUJdgzypN2ECrE
   mC2HZqzJtZLF8BszX+pNy7sa9R2JYBLxjfFPwkVA4Q5men8XYKAlyGUOC
   Fq37VG0luXRObyL+N2ySQ4GZBpbhHjP/wgrG6C3BC/2Fl+5kC6V0SX+Z8
   A==;
X-IronPort-AV: E=Sophos;i="5.93,329,1654531200"; 
   d="scan'208";a="316037879"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 20 Sep 2022 07:56:57 +0800
IronPort-SDR: YjUmNhSP0Y4m+o1l+RaL6HcBuOUZ6nkUFm+mfTmVkPJ/UEh/2TpThmdeYf7tW4b+BGSm9YxIXf
 CbvYB6l55ahD+bS1scE02EAeVBlsoOGZSP0FYcbj/w326mwGylBshn2QQJ9jQgA5YX6cDO0nK0
 trdhRUmCPg8KZl2CY8jybbMU8GpbEiK6i3RjFOKVKoK221Sv3GGJidxXVJT0SO1MjU4MyJZDyN
 uYz2UQ1I8xfWFHRwxlZXhNk1scK/GfYLv4XB9pTdeZSjTdzzQSPNHNOVMXw5fI8L6LuuaewOny
 x96Eu7bhbnoZJYvg8bhxZWhG
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Sep 2022 16:11:34 -0700
IronPort-SDR: H5yyOLfZ7S032EFjMzI6ugwbg93/hGEWL8vQHJiJrSiJLqtfq+pibwmAan9Sj7kTXlF2aiYgRC
 MFNIzI5BPQM9oOj/T+IB/mf8eNLXW/opu2E4QKAn2cr6Drl+1kLbP28obwl65bkWku3r8I3P1M
 B8w8prF+xnFxZRghJqiqPFXSjeZ5qwGHrsyItpOjQcQ3bgow7rWoACByue9aVv3M7+pMZfkAQX
 wECjoFMpPjNylNj1Y6KuloKDIBFDdd2Hp5ghA7K/rDZ6cBeWMasOyN6ntP+VKw8BspjshSQl3o
 jFY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Sep 2022 16:56:58 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MWhRY2yxSz1Rwrq
        for <linux-next@vger.kernel.org>; Mon, 19 Sep 2022 16:56:57 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1663631817; x=1666223818; bh=b0T0vZZkQKS2ASzkRyQjA/Ex8HApxh/6xQc
        C/blyp/g=; b=YiT/VI9112XRTtC4zWjamLi9iuNQdFZlNouAAj3eioDJCrJk3sn
        0bFG6npMEXjmiMnhBISE4/3jwGQW+SENMKkBWmsyjRxB0NGCZuYgU7jqMyBnZ2Fp
        RDFK3pXkVxAb7CD6+9Eqp6ryQeMUKl0nA9joUY0pP+YjZaZJ/Wyb+BviA2fVf4e+
        2OUvKqktLvIr+PehVmIbX1pz9oHkayfiO468j49/a1dmxrQpmyJdiKDIJlPmLfOQ
        6VeIQPobaw4Uyo7oQm20Ne1XlDVnTAC9POzxB9lIL/2reBOrm9Uy3PdUAkQgW7cF
        ZFlEW0h2V6Jt80la2jJiBOMmgt/ny27bqag==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 9peMRBwqoni6 for <linux-next@vger.kernel.org>;
        Mon, 19 Sep 2022 16:56:57 -0700 (PDT)
Received: from [10.225.163.81] (unknown [10.225.163.81])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MWhRW5Cjbz1RvLy;
        Mon, 19 Sep 2022 16:56:55 -0700 (PDT)
Message-ID: <6f9b5fd7-8a8a-619e-f758-216cadd8ea08@opensource.wdc.com>
Date:   Tue, 20 Sep 2022 08:56:53 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: linux-next: build warning after merge of the libata tree
Content-Language: en-US
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20220919124034.58670a27@canb.auug.org.au>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220919124034.58670a27@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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

I pushed a fix for this. I also added a dependency on COMPILE_TEST for
this driver to avoid a repeat in the future.

Thanks.

-- 
Damien Le Moal
Western Digital Research

