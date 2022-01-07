Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8B1D486FB7
	for <lists+linux-next@lfdr.de>; Fri,  7 Jan 2022 02:28:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345183AbiAGB2K (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 6 Jan 2022 20:28:10 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:37091 "EHLO
        esa6.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345180AbiAGB2J (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 6 Jan 2022 20:28:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1641518890; x=1673054890;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=m5qGOjfnzof4Y6TpNL2jLQKWt9ZeFrabSWhvFUyaKjg=;
  b=knTR3Tm+0klJ3YvkWecpWZ+IZRrrumOJf74YSLw9LMx9pJDwsHpEYRtb
   MGobJ9qBgvkj3u+6KfcepXCoC/2qvaIWLE1QbYVW+AuNoLlUxPM6ufpu8
   wHOwTTxjFGdBYkMUIwZVRW7R2/VIuv76RmJ5BqztxpsNaJ862E6j6Nbpa
   8eVyir+Lq0TxmDw6A/er0ZuKsyNj1QxQeC01nxqB4B0N14iRzvm1Zs3K6
   h1qvqF71T3w0Xofi+Z+dDuBE5U4ZobewIEddcR4snlMWWakop/yaETIYO
   uJR+FV+vDHhVBgqewoDgd+XqAAsDh4zewEUfmKdEkZa00rT+/0PdzYfZ7
   w==;
X-IronPort-AV: E=Sophos;i="5.88,268,1635177600"; 
   d="scan'208";a="190907052"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 07 Jan 2022 09:28:10 +0800
IronPort-SDR: 8VQpjQhtjWX6wfAGjdOSeDzwQo3BB9ib8egVVCnCzLKLFYPGuBf7KO+4XdSyh7NtKHUUDBvOD2
 itLzPBfIWz8Um6sAn7BQMySDqqid8e7dDkOCK7wKjgVEMPMI14iP6FfcW0825JS0xEDSamKuUv
 OI41QWXutvPcEamAzthy9VSbbgbngQkTg/BiSXIomTMbCJ0D7Mmm8c2+YdmIbEc71SE7lVG7u+
 pkG47WZ0F7GYvibRcS5iYW6uBq6O/RlM0ziNOE2TC9wI6wkjo73v/ANb3Tpm4Vm4MZIpDtyvmT
 UiD7xpAyNjZt/aaJ7t1tvHpU
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2022 17:00:37 -0800
IronPort-SDR: +WGcZujvU2bQFG6VaCxTDupp7pVT/YnkNPMctOejDw26t2adRC4XAl1+ADc8OR3RVV82DqCGIk
 0+vD9k4pLN0qZJs9jHJEx/l2X/0UMUx0e4lF0EVYlr0YoICT0TqP7eBQaZk3tFJcBrodTyZsvY
 rRLDNnvsquCb3agi3iUbq5WuEnzpkXnHzXQzxlc5aRvHp+tFqAq4FKYt7WfGvQIOoNZqrcqI+6
 cyLSfk+jI9yGfgSrlZzuSufWyFno9RUQ17j1CfRCJ2ybfLaAL6uqmR5zZB2tTsWEHLlz/i2SDD
 XSk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2022 17:28:09 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JVQZw4v0hz1VSkX
        for <linux-next@vger.kernel.org>; Thu,  6 Jan 2022 17:28:08 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1641518887; x=1644110888; bh=m5qGOjfnzof4Y6TpNL2jLQKWt9ZeFrabSWh
        vFUyaKjg=; b=NkU4TbTpeinPId0HkqH9NuMJI8IFl3ULChKAhfoEWUS/o3c4e7j
        QrECZlOeHRcz8IOMm4ToqMF9M5si9VQVgPbZ4wOpTDI7EM9XJFuCX5r0rdgr61Zg
        l3nw3WI7iBhEFG5SvzSQQwLKQ+xs9mwsUNNTCYRbc2K8kAOMgt/XCgS8lxwq/CvK
        MFeGJI9DyPXsGMiqkkHFZPCjzTnzeHiU0JaVF+7srlyjGt4Q2DMtpRxRzevp24gz
        L6ioh06GJpX+kWMg2vVc6tctc+iqa8QWqHNU5bnw50k2FQOo1InoQVaDq0RwIZex
        YtlQ/vfxSlw9MqSPpffNVluz4eNRz4zKEXw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id drum_vlsavhV for <linux-next@vger.kernel.org>;
        Thu,  6 Jan 2022 17:28:07 -0800 (PST)
Received: from [10.225.54.48] (unknown [10.225.54.48])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JVQZv2Fm4z1VSkV;
        Thu,  6 Jan 2022 17:28:07 -0800 (PST)
Message-ID: <40b072ce-70cc-8d20-26a4-2b8e55c952e0@opensource.wdc.com>
Date:   Fri, 7 Jan 2022 10:28:05 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: linux-next: build failure after merge of the libata tree
Content-Language: en-US
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Hannes Reinecke <hare@suse.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20220107010832.42c93c30@canb.auug.org.au>
 <92b2ca94-6a72-7ec5-6a0f-d45f776f7a74@opensource.wdc.com>
 <20220107111759.57d0d377@canb.auug.org.au>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital
In-Reply-To: <20220107111759.57d0d377@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2022/01/07 9:17, Stephen Rothwell wrote:
> Hi Damien,
> 
> On Fri, 7 Jan 2022 08:58:48 +0900 Damien Le Moal <damien.lemoal@opensource.wdc.com> wrote:
>>
>> I fixed that yesterday afternoon my time (Japan), so before your morning in the
>> US (assuming you are based there).
> 
> No, Australia (so +1100) at the moment (see my email headers :-)).

Indeed. So you are only two hour ahead of me :)

> 
> I do fetch trees regularly during the day, but I merged your tree at
> about 13:28 yesterday (11:28 your time), but the build failure did not
> happen until I did the powerpc allyesconfig build at about 1am this
> morning.

OK. My update went in later in the day. I tested only on my x86_64 host native
compile. I did not setup cross compile for all arch.

> 
> Thanks for fixing this, it will be in today's release.

Great ! Thanks !


-- 
Damien Le Moal
Western Digital Research
