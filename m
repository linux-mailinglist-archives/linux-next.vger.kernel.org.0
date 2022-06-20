Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E788551370
	for <lists+linux-next@lfdr.de>; Mon, 20 Jun 2022 10:54:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240323AbiFTIyB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Jun 2022 04:54:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240286AbiFTIx7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 20 Jun 2022 04:53:59 -0400
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17ADD2AEB
        for <linux-next@vger.kernel.org>; Mon, 20 Jun 2022 01:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1655715224; x=1687251224;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=boAJivS9bfjMA4zBe2zDcEocKVmxQESEuc3ZXCRCRlA=;
  b=GbcGJZA08Emr9DEN1764goZZNPhpEP7D5ykmCazuP48bytoXk0I48Alk
   ijTWDeqAj6GKhujkZ/VgyC5S3eVdRbQaYwgl01LRlQWYi1yCarhm36OTH
   SEnmfB9XemdEteHW1Y5LD5lw/Ao4wG30Rk0PjszGjiJqkmE2KFkHetKm3
   IWBClQ0fJBOlU/dqC06FC7TDnWhy/mnFGQU1jtbw58pidseLE78sRVVVW
   fnGQnrtm7+EVemAZi2XHAEun9RkysMdnksGR/sI/6WdAPQHy/kUSivuma
   SkDjC1KbI1duJGOJxNnEiEBzvN1coFNAbde0oQzz0xtxMHLxNUZfzdiIv
   g==;
X-IronPort-AV: E=Sophos;i="5.92,306,1650902400"; 
   d="scan'208";a="208469251"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 20 Jun 2022 16:53:41 +0800
IronPort-SDR: TGzP+VF+tyvlrZjvlOt3v2iwd9XyyUhZNNIX72YCtFuw1S0588esU+E/QI7NHTle9cbcF4UCGi
 ldH4qrw1DW/tzVsJx3rCOjaumulFG4+Rhoc4w8Jr5aWcicK8sM45ZHllb8rdnexWIkLBQHgz9R
 g+sl9rElKUtr0iYMm6Rw0LBMgXDhFDpkFvI03ricGAehsaXUt0jHKLhe7gfInbRDY6vs8EoHja
 zZUK7O5UFD6P7LNPGkS/xlYrHHAbxk9RP35Pcv1r/rufYrRWlcyYnSe9Rt8shTcmbP1iUxAsin
 evyO/DH8CWe2fC6duvrbRkK/
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Jun 2022 01:11:50 -0700
IronPort-SDR: WDuDmTywbeFjpGetdawTtP72OoQx7WYqk7ox5r66xZT9TAOlBZPaMtV578XYbP2iZQhf9hhAaq
 3Q2gXJS/8xXJCNxxwaBtiChg3m+X9Ea9/q5p5OvcNPQPWEX5zOpQemmgodnuvG65+dZUHGUHsH
 HgO98BG7hm7/jqAjWOvpvokz6OKst4cGTOyl4+Owi7jvWqMogxY63rvuTd5Oy68TFsglQX+ztA
 BbpBmVr/NMoB1XwfZ54JxgD3d/zJ4DCL9KCTzwNXVMrROew14yRvwwKXWZ8LKM2U0kWBxvrAl/
 ka4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Jun 2022 01:53:42 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LRNjK3zFJz1SVnx
        for <linux-next@vger.kernel.org>; Mon, 20 Jun 2022 01:53:41 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1655715221; x=1658307222; bh=boAJivS9bfjMA4zBe2zDcEocKVmxQESEuc3
        ZXCRCRlA=; b=SQ82m+DGQuSNjoWWHL3Lv6MOaGaR9RkST3iW8+0WErZcPDfJTfH
        RjNwsAFZbheyuVoSLZmmv2iN8O3Zh37KNhnwXG0G+23e8jdHQVtme18wPzXo5y5l
        3KmCxiNQOIj2TxDZ7r9GxLCOkqP/vBigo0qvytWLmJBs15wZG85a4jrJyVmZrXec
        F2qs4QcpFSGoRszNPeUYytUJQexkwUmw7RbeMSAMHAV0b6Xt6dgI3s0LSAYWve3H
        /xxXfkstA7ZXqzE4X8ep9O22wClQfuq3mtnouybrHDBmZ+qGopMptIx76VX5aFib
        URk/kcaW58dW6/4tcBio/WrQz44I2CV5HaQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 7AedsQ15g0il for <linux-next@vger.kernel.org>;
        Mon, 20 Jun 2022 01:53:41 -0700 (PDT)
Received: from [10.225.163.87] (unknown [10.225.163.87])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LRNjJ317Tz1Rvlc;
        Mon, 20 Jun 2022 01:53:40 -0700 (PDT)
Message-ID: <387885f0-999f-3746-0238-77052f10b25c@opensource.wdc.com>
Date:   Mon, 20 Jun 2022 17:53:39 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: linux-next: build warning after merge of the libata tree
Content-Language: en-US
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Sergey Shtylyov <s.shtylyov@omp.ru>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20220620103400.6b03f8d9@canb.auug.org.au>
 <20220620182108.5efb3107@canb.auug.org.au>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220620182108.5efb3107@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 6/20/22 17:21, Stephen Rothwell wrote:
> Hi all,
> 
> On Mon, 20 Jun 2022 10:34:00 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> Hi all,
>>
>> After merging the libata tree, today's linux-next build (powercp
>> ppc64_defconfig) produced this warning:
>>
>> In file included from include/linux/device.h:15,
>>                  from arch/powerpc/include/asm/io.h:27,
>>                  from include/linux/io.h:13,
>>                  from include/linux/irq.h:20,
>>                  from arch/powerpc/include/asm/hardirq.h:6,
>>                  from include/linux/hardirq.h:11,
>>                  from include/linux/highmem.h:11,
>>                  from include/linux/bvec.h:10,
>>                  from include/linux/blk_types.h:10,
>>                  from include/linux/blkdev.h:9,
>>                  from drivers/ata/pata_macio.c:18:
>> drivers/ata/pata_macio.c: In function 'pmac_macio_calc_timing_masks':
>> drivers/ata/pata_macio.c:1031:28: warning: format '%lx' expects argument of type 'long unsigned int', but argument 4 has type 'unsigned int' [-Wformat=]
>>  1031 |         dev_dbg(priv->dev, "Supported masks: PIO=%lx, MWDMA=%lx, UDMA=%lx\n",
> 
> 	.
> 	.
> 	.
> 
>> Introduced by commit
>>
>>   f0a6d77b351c ("ata: make transfer mode masks *unsigned int*")
> 
> This turned into a build failure in my powerpc allyesconfig build, so I
> reverted the above commit for today.

I pushed the fix already. It is in ata for-next branch.

-- 
Damien Le Moal
Western Digital Research
