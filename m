Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71DF4550E22
	for <lists+linux-next@lfdr.de>; Mon, 20 Jun 2022 02:49:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238062AbiFTAoM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 19 Jun 2022 20:44:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238337AbiFTAnq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 19 Jun 2022 20:43:46 -0400
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DC30B7C3
        for <linux-next@vger.kernel.org>; Sun, 19 Jun 2022 17:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1655685808; x=1687221808;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=7Rf8r+wOe+lnuGLzZHW/Ni/+bYgqxanadnJOT5BTb0E=;
  b=EarJKZifOeOqst7BpArWkNi5/fb5EADUrAfMAON5BlUH4ZGkh9/9/mlR
   DQC+IeUQ+X8T/49vNIkTX5M7pu8JBOED1PV3xpDIHzX2XQJ2p55jCTmTC
   S9ZzjLWnE9mmke7px22NxVl3E2JX1n4rEwmu0WntSsXiMD1iaJxm1NGli
   p4EYLY9XMZM/DxRHXIC2kqDUJ7EsaotGj/pqebAr0xuu0HXWTWqS+0rPJ
   lTdpnfT+ec7E/R0dasDaXu1NUHx3781NeM0aqWq7fP19dL97BJYRprdob
   U99tysdXovXjqAGJrY7LWngHdTeHkn1yAxWsmuNyW29vQVU4ph9s4jDMy
   A==;
X-IronPort-AV: E=Sophos;i="5.92,306,1650902400"; 
   d="scan'208";a="203578462"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 20 Jun 2022 08:43:14 +0800
IronPort-SDR: nf6khClBzYLznjb8m7PEUbsFoxqYE5bBUFv+2/EryPT+unlds4cVPNUMdirxhraV+Cm2K+fzh7
 dv1Bv8XkHwNIBvBXb3K2LhOp2X6PoPonX58EA9yfyyKP9i9hzzfEpwhtTtS3M/OANwtnAOihtO
 8qYrkltfjtnfgzxUvjrj5MIXatjYrLCaZCanmBrCb+pEaPbXX57Q++HIrjcQzqD8iq96l33LZ5
 76jcYEQEbIXtBPYjzRjyvxkxYRfVbvk5oeUWpMrEzxsSjBiovJF92Ok9H/KMmNmgD6yiFCh8RL
 rE5LxCrK5Fsy/jqB0Sm3Ge6/
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Jun 2022 17:01:25 -0700
IronPort-SDR: 99thr6aQwLgrV10fq7HVSXI9+uqVVL+bn75+/RfZPJFfDb/HWPA79h+4R1XK2aLbJrxNzzkCL+
 x0yBcbnHY44Kk0GtNUOomiimGTxJ0LgNLPa09xYZS20RpupjMJcefAQsCLEQ/WxVfS02jj3eQE
 cC0fA65LjsnWm8AiCqQgC+AbFTzINqt7B4Y4ZYhZLuDjYtzCY3EyuxcMpFklWIqww0D1nDzY7n
 Y/17vuQN/qBA3OntN6oFt692E4OYOUzpnS5pdVMhb+2FvfEAChcfsCqJHLxT6BlIC7KFqKjF1x
 k0s=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Jun 2022 17:43:16 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LR9qS0j9dz1SHwl
        for <linux-next@vger.kernel.org>; Sun, 19 Jun 2022 17:43:16 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1655685795; x=1658277796; bh=7Rf8r+wOe+lnuGLzZHW/Ni/+bYgqxanadnJ
        OT5BTb0E=; b=nLeYGftoA+8e//qc1CBj9bzCTRVSpykThdf+Z7x8/8sAXpEzjzr
        EGCIETeNPd2JecLtwhhf9madlIFStuMhcAy2i6PhzuaNCkwi1OcxfJPrtum3TpS7
        GkRwjWgePRSX+MH3q/79eRB+qv/fEYE7rcZWvSdbQaPXrP3HHCpJq0iMD5F8rfLL
        H20EgePk/vCsALroMi57rUVN1FiBG1/BEFyArtEBbQmYUYFn1vvx8bmsoiZ2+z7I
        7Yz89EcyVir3jg163F1kPbwZarLXRrFqfK7RSZBj3Y+4emkQ2OorXbG9dgsXLFCz
        iHc0YIbDi1flEBaRQFuXI/g+4Qo9HOmfEPg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 3Y8JR6fGQ9lP for <linux-next@vger.kernel.org>;
        Sun, 19 Jun 2022 17:43:15 -0700 (PDT)
Received: from [10.225.163.87] (unknown [10.225.163.87])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LR9qQ2ntLz1Rvlc;
        Sun, 19 Jun 2022 17:43:14 -0700 (PDT)
Message-ID: <0e293be4-ba99-379e-75dc-0ba5cf7793b7@opensource.wdc.com>
Date:   Mon, 20 Jun 2022 09:43:13 +0900
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
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220620103400.6b03f8d9@canb.auug.org.au>
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

On 6/20/22 09:34, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the libata tree, today's linux-next build (powercp
> ppc64_defconfig) produced this warning:

Will fix that.

> 
> In file included from include/linux/device.h:15,
>                  from arch/powerpc/include/asm/io.h:27,
>                  from include/linux/io.h:13,
>                  from include/linux/irq.h:20,
>                  from arch/powerpc/include/asm/hardirq.h:6,
>                  from include/linux/hardirq.h:11,
>                  from include/linux/highmem.h:11,
>                  from include/linux/bvec.h:10,
>                  from include/linux/blk_types.h:10,
>                  from include/linux/blkdev.h:9,
>                  from drivers/ata/pata_macio.c:18:
> drivers/ata/pata_macio.c: In function 'pmac_macio_calc_timing_masks':
> drivers/ata/pata_macio.c:1031:28: warning: format '%lx' expects argument of type 'long unsigned int', but argument 4 has type 'unsigned int' [-Wformat=]
>  1031 |         dev_dbg(priv->dev, "Supported masks: PIO=%lx, MWDMA=%lx, UDMA=%lx\n",
>       |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/linux/dev_printk.h:129:41: note: in definition of macro 'dev_printk'
>   129 |                 _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
>       |                                         ^~~
> include/linux/dev_printk.h:163:45: note: in expansion of macro 'dev_fmt'
>   163 |                 dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
>       |                                             ^~~~~~~
> drivers/ata/pata_macio.c:1031:9: note: in expansion of macro 'dev_dbg'
>  1031 |         dev_dbg(priv->dev, "Supported masks: PIO=%lx, MWDMA=%lx, UDMA=%lx\n",
>       |         ^~~~~~~
> drivers/ata/pata_macio.c:1031:52: note: format string is defined here
>  1031 |         dev_dbg(priv->dev, "Supported masks: PIO=%lx, MWDMA=%lx, UDMA=%lx\n",
>       |                                                  ~~^
>       |                                                    |
>       |                                                    long unsigned int
>       |                                                  %x
> In file included from include/linux/device.h:15,
>                  from arch/powerpc/include/asm/io.h:27,
>                  from include/linux/io.h:13,
>                  from include/linux/irq.h:20,
>                  from arch/powerpc/include/asm/hardirq.h:6,
>                  from include/linux/hardirq.h:11,
>                  from include/linux/highmem.h:11,
>                  from include/linux/bvec.h:10,
>                  from include/linux/blk_types.h:10,
>                  from include/linux/blkdev.h:9,
>                  from drivers/ata/pata_macio.c:18:
> drivers/ata/pata_macio.c:1031:28: warning: format '%lx' expects argument of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wformat=]
>  1031 |         dev_dbg(priv->dev, "Supported masks: PIO=%lx, MWDMA=%lx, UDMA=%lx\n",
>       |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/linux/dev_printk.h:129:41: note: in definition of macro 'dev_printk'
>   129 |                 _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
>       |                                         ^~~
> include/linux/dev_printk.h:163:45: note: in expansion of macro 'dev_fmt'
>   163 |                 dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
>       |                                             ^~~~~~~
> drivers/ata/pata_macio.c:1031:9: note: in expansion of macro 'dev_dbg'
>  1031 |         dev_dbg(priv->dev, "Supported masks: PIO=%lx, MWDMA=%lx, UDMA=%lx\n",
>       |         ^~~~~~~
> drivers/ata/pata_macio.c:1031:63: note: format string is defined here
>  1031 |         dev_dbg(priv->dev, "Supported masks: PIO=%lx, MWDMA=%lx, UDMA=%lx\n",
>       |                                                             ~~^
>       |                                                               |
>       |                                                               long unsigned int
>       |                                                             %x
> In file included from include/linux/device.h:15,
>                  from arch/powerpc/include/asm/io.h:27,
>                  from include/linux/io.h:13,
>                  from include/linux/irq.h:20,
>                  from arch/powerpc/include/asm/hardirq.h:6,
>                  from include/linux/hardirq.h:11,
>                  from include/linux/highmem.h:11,
>                  from include/linux/bvec.h:10,
>                  from include/linux/blk_types.h:10,
>                  from include/linux/blkdev.h:9,
>                  from drivers/ata/pata_macio.c:18:
> drivers/ata/pata_macio.c:1031:28: warning: format '%lx' expects argument of type 'long unsigned int', but argument 6 has type 'unsigned int' [-Wformat=]
>  1031 |         dev_dbg(priv->dev, "Supported masks: PIO=%lx, MWDMA=%lx, UDMA=%lx\n",
>       |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/linux/dev_printk.h:129:41: note: in definition of macro 'dev_printk'
>   129 |                 _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
>       |                                         ^~~
> include/linux/dev_printk.h:163:45: note: in expansion of macro 'dev_fmt'
>   163 |                 dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
>       |                                             ^~~~~~~
> drivers/ata/pata_macio.c:1031:9: note: in expansion of macro 'dev_dbg'
>  1031 |         dev_dbg(priv->dev, "Supported masks: PIO=%lx, MWDMA=%lx, UDMA=%lx\n",
>       |         ^~~~~~~
> drivers/ata/pata_macio.c:1031:73: note: format string is defined here
>  1031 |         dev_dbg(priv->dev, "Supported masks: PIO=%lx, MWDMA=%lx, UDMA=%lx\n",
>       |                                                                       ~~^
>       |                                                                         |
>       |                                                                         long unsigned int
>       |                                                                       %x
> 
> Introduced by commit
> 
>   f0a6d77b351c ("ata: make transfer mode masks *unsigned int*")
> 


-- 
Damien Le Moal
Western Digital Research
