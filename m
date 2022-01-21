Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C34F495CA4
	for <lists+linux-next@lfdr.de>; Fri, 21 Jan 2022 10:17:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379701AbiAUJRX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 21 Jan 2022 04:17:23 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:9295 "EHLO
        esa2.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244436AbiAUJRU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 21 Jan 2022 04:17:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1642756640; x=1674292640;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=DDt33//J7HC81vPepGQWceRVhDsuFSNWZ9d7bVsT2sk=;
  b=h8AyyNEKa42rbppDiI39wKDNWzaF/+o5r4qOopN4WZcmQL40uxvozzzO
   u2kNWOhebzBygsQqBh8a3hTjRUKvoxzU1JMZgdQSJm2WsfjT1E3sXIrkG
   iFPuim9Zj0K6TeUG8lL21PIxAMWYa8MOvzzA+h5cl/HFbu0qOVcYVUFz9
   5HgXuWRpgKMsWHv+uCorFWvzg74xjtyYjLaFIiDZ+c2u8yAtJexbAWmkf
   56mOMjqZjZrd7C6KwCJvZae5iF/md9RwqxTSYHAwrYPqtOHYumVhlRkrA
   3yZXHpdKq1e+d8lfT2e2ztnYuaPLG/xUN7HV2BGQQS0du6fvGs+W4K0cT
   w==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; 
   d="scan'208";a="295096770"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 17:17:17 +0800
IronPort-SDR: QuumlCTrSWC+gVVfA3aDh9C0wHaP6ZTHqEFbki1lJdyjyRTkkrEwAcLvoQZngKq9CYJSDswb4M
 jPYGlfVSqIbXSVMUP2ZMsWKDlyX0OLbpxKsOQnS17jGi1bu9RHPJmJCIY5ytH1AliYq+TlglfT
 didsAfQBNgIW1fwJhOiEYR2u6GpojYDzzUvwwSzEvBCSiMA3FSWVdhrriLDU7oCy7BqhL0rhBk
 o6XcV29wNAax+U6S2v6NtsJy1jZL3U1ISiqmVWS8YJwB0sAbnf53Qu03O5PyP1tWUt42XfnkZ/
 atbZsrQacFt0PhPAPTTs73XK
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2022 00:49:28 -0800
IronPort-SDR: 44Sgahdowbm0uDau5JSgIA50H86h3GmSp7X76HtQICG6U9fhhfjXUknnZQhFMZiIVA5mOptakS
 pOxgMgJdux5eK73uDFPX/xU1ZStKHKAZdoV22Lvw2+MPTqWyqVtFdNHMcv1hX1EK3SSl11bJyC
 umVYoD8mf0boV35n2b5gpwRL8wjvTX5OUm5EBI3NiiIQ1TJ6fIQxp1HIAXEzZ4PipyOGxrJ5Pb
 iRFDAuLcBfTWwbrwZuHQCW/I0pdnCWojN7VLlnMFJuo3E+AWNY8qAIpwnvF4QJZ1ne4/qA5OPf
 +0Q=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2022 01:17:17 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JgDKm3gN1z1SVnx
        for <linux-next@vger.kernel.org>; Fri, 21 Jan 2022 01:17:16 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1642756635; x=1645348636; bh=DDt33//J7HC81vPepGQWceRVhDsuFSNWZ9d
        7bVsT2sk=; b=JJ1bWH54T0ozCRDNFOawIcDYYrXmiS6mLF3bufMWI8NIa+2kaQT
        gCBgwenjhfSIESElInLy4f7hnR7B/c8AlmdP0YJlB/yBcj4ZSDRucj/ARZ8iebTx
        fX4cav++QB5+nrjZ/xNlR7WsOefucQ/VKRddYsk1OsSGfjMxLK9ouF+vHs+ICHA7
        QaQ2sHdGGswVwNNN4/NAuldiTPB3O2e4rjI+PHGvCgubY6wPSEdLOP7NfwwXL43W
        0XkAgLTCQC9ZIavzM31zb7IlI4uGbI4OgvYnMIVfBXIQVP013Dxgw+JTtTEtRqj5
        CB028YmS/z+ll5kfBZyeWV7wOCiloVbazWA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id LMhwGxrPBT-X for <linux-next@vger.kernel.org>;
        Fri, 21 Jan 2022 01:17:15 -0800 (PST)
Received: from [10.225.54.48] (unknown [10.225.54.48])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JgDKk0DRvz1RvlN;
        Fri, 21 Jan 2022 01:17:13 -0800 (PST)
Message-ID: <350720e8-9b78-bd24-5c60-602076610bf4@opensource.wdc.com>
Date:   Fri, 21 Jan 2022 18:17:12 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [next] mips: cavium_octeon_defconfig: pata_octeon_cf.c:598:23:
 error: passing argument 1 of 'trace_ata_bmdma_stop' from incompatible pointer
 type
Content-Language: en-US
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     "open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)" 
        <linux-ide@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-mips@vger.kernel.org,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        regressions@lists.linux.dev, lkft-triage@lists.linaro.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Zeal Robot <zealci@zte.com.cn>,
        Minghao Chi <chi.minghao@zte.com.cn>,
        CGEL ZTE <cgel.zte@gmail.com>
References: <CA+G9fYtq0wzSeG8YG-a+=KrbdWqHJMXk1hvq0FKeAvj9sZAK2g@mail.gmail.com>
 <6249735f-e6b7-1331-eb2b-361bb17d6115@opensource.wdc.com>
 <CA+G9fYu__OOvk-ESXoOqbd-Lk+CmO8CSQ8chEFf3MyeTjKtp9g@mail.gmail.com>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital
In-Reply-To: <CA+G9fYu__OOvk-ESXoOqbd-Lk+CmO8CSQ8chEFf3MyeTjKtp9g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2022/01/21 17:58, Naresh Kamboju wrote:
>> I just posted a fix. As I do not have the environment to compile test
>> mips, could someone test please ? I will send the fix to Linus asap
>> after confirmation that it is OK.
> 
> Please share your patch / patch link. I will test it with tuxmake.

I posted on linux-ide and CC-ed linux-mips:

https://marc.info/?l=linux-ide&m=164275458614058&w=2

> 
> you may also give a try with these easy steps.
> 
> # To install tuxmake on your system globally:
> # sudo pip3 install -U tuxmake
> #
> # See https://docs.tuxmake.org/ for complete documentation.
> # Original tuxmake command with fragments listed below.
> 
>  tuxmake --runtime podman --target-arch mips --toolchain gcc-10
> --kconfig cavium_octeon_defconfig

I saw this in the compilation error report. Will try this.

> 
> - Naresh


-- 
Damien Le Moal
Western Digital Research
