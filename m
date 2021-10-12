Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56E9442A10A
	for <lists+linux-next@lfdr.de>; Tue, 12 Oct 2021 11:29:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235607AbhJLJbQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 Oct 2021 05:31:16 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:58539 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232657AbhJLJbQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 12 Oct 2021 05:31:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1634030954; x=1665566954;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=f3zZcvsgAiAmDQe4g9mSaMYXTlCLVZMEuAwXlFHxwYU=;
  b=2ss94vVkTdkGMLnVpsdLierAWA4fwUynFOI9E08azf3mHIN3vBnD98Ch
   Lv4g22uDKTTkJn2cuhewlsORjzRaKXOobM1KrqF4f8RxGpQyc9jc/tgkt
   pmF2iCIVrkZrpIDVlgQabMjSv5Qb9lKgnD4IEr0+aig6A/q3UCYN8j2bF
   krCDszX2P+dzXXyT6p+SpBNPLeo4B9QJ2El0QhwPQ/YgtWLictApHRmgM
   Iz1J4YVcpmVU14yZd3dyTaDnM9Inms/MlioZGQwmTlOl0jV2QMT04Iwh5
   Ag/xmqaMThitSgD4iOltcLTKZFOslzIsEFqe8OmxWb90No42kEliack9H
   g==;
IronPort-SDR: y87y+K9Hh6Mb34RNV4RLDg1P1CZg9BjmWlrrkj20sLlK+WnHeIdMJUhE0fx+bu++F63I5NqA1j
 ARsNUVvJ83mEMboIgRNHJ/TZmFXEGd+c+s6cKubypHAS28l49/0+Eir33DTFMFh89fuL4Ltabz
 WZrgpA/TYy1y56h7w6bz9KEVoMYfNdcujXNMtAKw6oP0fpmBxNULYogaIFxgq8CVLciWEYnLya
 kA8GPCmBFWg7KR+UVsu4bLm9auP7pcG95c78AHqX3kmOu5sITPv20CXsLELyWMpx0wQx00FbR2
 kAl5IDcHJoc8zJaWSYaylyb0
X-IronPort-AV: E=Sophos;i="5.85,367,1624345200"; 
   d="scan'208";a="72636433"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Oct 2021 02:29:14 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 12 Oct 2021 02:29:13 -0700
Received: from [10.159.245.112] (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Tue, 12 Oct 2021 02:29:12 -0700
Subject: Re: linux-next: build failure after merge of the arm-soc tree
To:     Arnd Bergmann <arnd@arndb.de>
CC:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Olof Johansson <olof@lixom.net>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20211012110309.17d51c3e@canb.auug.org.au>
 <97e578a3-b12e-1975-717d-a0cf663673f0@microchip.com>
 <CAK8P3a0G9VoB71aBWGrtdxe2bNbv7apaAQqQXSf==TGwcKQvaw@mail.gmail.com>
From:   Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
Message-ID: <a8a4b2ef-4f7c-d44e-6f39-516944378ac6@microchip.com>
Date:   Tue, 12 Oct 2021 11:29:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a0G9VoB71aBWGrtdxe2bNbv7apaAQqQXSf==TGwcKQvaw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 12/10/2021 at 09:56, Arnd Bergmann wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Tue, Oct 12, 2021 at 9:35 AM Nicolas Ferre
> <nicolas.ferre@microchip.com> wrote:
>> On 12/10/2021 at 02:03, Stephen Rothwell wrote:
>>>
>>> After merging the arm-soc tree, today's linux-next build (arm
>>> multi_v7_defconfig) failed like this:
>>>
>>> Error: arch/arm/boot/dts/sama7g5.dtsi:167.3-7 syntax error
>>> FATAL ERROR: Unable to parse input tree
>>>
>>> Caused by commit
>>>
>>>     9be4be3ed1ec ("Merge branch 'arm/dt' into for-next")
> 
> Thank you for the report!
> 
> I had verified the arm/dt branch by itself, but didn't recheck it after I
> merged it into the for-next branch. At least that one is easy to fix
> up as I don't send the combined branch to Linus, and the arm/dt
> branch does not have the problem.
> 
>> I had following patch to have the nodes in alphabetical order:
>>
> ...
>>
>> Sorry for not having mentioned this conflict in the pull-request.
> 
> No worries,
> 
> I had assumed you had them sorted by unit-address, so I had them
>   in the wrong order as well. Fixing up both issues in for-next
> now by redoing the merge.

OMG, you're right, it's by unit-address: I'm removing my at91-next for 
now to not cause more confusion and merge conflicts.

Not a big deal if you already re-did the merge.

Best regards,
   Nicolas


-- 
Nicolas Ferre
