Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9AC53FB255
	for <lists+linux-next@lfdr.de>; Mon, 30 Aug 2021 10:18:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234166AbhH3ITm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Aug 2021 04:19:42 -0400
Received: from mout.gmx.net ([212.227.15.19]:37297 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233318AbhH3ITm (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 30 Aug 2021 04:19:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1630311518;
        bh=Xp1OJEHV+WZa1v1ObG+jmrRjA+bQ8meQdy/52KVciko=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=E8Da9OeHcdQTEcThIxAVsa1/lR37O8OG/ifbR+Z5wOxFrzzond03WCDOgxvFQHrjV
         UKLuHhuRqincfxjJnN0dKbfXD9WxMcSnd8OYDNsaWtafO0YQvn8zCrYRkflskTay9D
         YlY0VTJF8vsqc4g3kqAg6bJAXmKqWNV0fFZtZ9Kw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.146.54]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MIdeR-1mFPRL2H01-00EajI; Mon, 30
 Aug 2021 10:18:38 +0200
Subject: Re: linux-next: manual merge of the tty tree with the parisc-hd tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Greg KH <greg@kroah.com>,
        Parisc List <linux-parisc@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Jiri Slaby <jslaby@suse.cz>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210830154605.2abe717e@canb.auug.org.au>
 <17384403-c428-70a9-4930-390869a45405@gmx.de>
 <20210830173309.630f47c0@canb.auug.org.au>
From:   Helge Deller <deller@gmx.de>
Message-ID: <eae99b8e-530e-d777-d323-ff4cb8a1ee94@gmx.de>
Date:   Mon, 30 Aug 2021 10:17:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210830173309.630f47c0@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:heGvdh3xUjQXzaFBuSJY11MAMDOI2tBHhIv2NCal1ZeAnNX51aW
 USpKjzmptXdb7bHuEzf7roLbVg2CRl9IbIQzqjKDGpOafYT9XHA4d7b7ZRT/hvH2tu4XIRu
 CTSxkfKbR+rNUojyCEHJjofddXRCQOKylbGs0ZpesNvRI5WxUJx4ZA/qXobABCGTBftX4tI
 13tfPIPB+VLyMk5nSNiEA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:L5k49yeVlL0=:bODBQSFDQGH3oj2h9VKPgD
 EHfCVwkTq5LoTnZ31767Oq0MbU75zi7fMuznMEOK6524Ge8IGEU6PChegxj2ICeWXNxEQiPdA
 J6+yb793FRHEri6ZQ3CrkPmLfQP9wVJgLLA/I8aS+xw6iBc29fn2/XxUPZ+bJNGZ74YLS46gQ
 O0KDta+rdhGRmsB395X4vcoblKCDD9tTR6Ev9B3iVrKwqk6dyh5u2Ji4MfgWsr/3oHy8hiTcZ
 poB8FAIAUQW/oR6oPXgg1yFMvSokYC49y6FoQN/c1Ul1ADmrDphw4eeXCEgRtsc5EcebGcjnH
 OPTGYVecm5HruxXAvO8YwOGE5wQmIFANwCJEfzOnhiCcC+4ahnlfCrdvxB310A2+pGclStVi3
 J0M5pi7DQE8crrWS9yjgLZPhPZCXGqlPZM3T52tg07CCnVy+IyIwd+zEt+WCk2MPoQgF9R/Wp
 7exiJ2ds42QwTy4MeRBQTwAuv13ieENBxVpPM4kaxLJkk3Z/tL1o++gGHD51PTriaUPnGJwVF
 GiD3gVe7xs6U0ei6v2w+u1TbREYjwDjk2aCl4HjkuYOittcmyTpUaqjFOOkzcsPV/0/IRci3N
 EaV4W7PtW3lvpz0x0DPbuwqpBuQknsYVXXhIRqkzX7yV0xem58/33L+YpIznNp5SUqoHVDxe6
 TvQ0lZ1peslHqexksxzIgZDZkfRU72m3ZJDMUqx/khIMg++cElwar8vJ15Rhr/WPuYq86PW3T
 fdgad/zyboVEU436F8HUS0gzIWDaGhhG9MA+ioo7xS6PMZbCf2Fh04d/31nd7+bppxgbHA4vW
 Os5xxIG0sJa6ZsAHzUMRyhREhMHVCxaf+yV3tAY4B7YlYlGxwh7Ho74S/ULShpYJZiU+MrtOt
 dpHlaqAw4Ce1ZFI/CiViQoAmsw0iZqiOU2ZsCiryG6B7GG0OVBMHgPEpvomXCityW9xzY/nCm
 /ykrFfJ1D+eBhy/wFW+6wj2MfATK3bq3flQoWnnkQeAIn7rFGJ37jeYqVSVHavnSh78qdmjts
 m5AWBJQMg0Sy/spCQ6ssIaOz8OZbF5SnvjyZ9TKMaL/pNivloHtNJ+4783EBgZINvSc0F7eg0
 kEtaK/HdnPnCfVGUDjSAHUhyPeTuBgk5wyy
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 8/30/21 9:33 AM, Stephen Rothwell wrote:
> Hi Helge,
>
> On Mon, 30 Aug 2021 09:14:33 +0200 Helge Deller <deller@gmx.de> wrote:
>>
>> On 8/30/21 7:46 AM, Stephen Rothwell wrote:
>>> Today's linux-next merge of the tty tree got a conflict in:
>>>
>>>     arch/parisc/kernel/pdc_cons.c
>>>
>>> between commit:
>>>
>>>     9613b0cb3eb4 ("tty: pdc_cons, free tty_driver upon failure")
>>>
>>> from the parisc-hd tree and commits:
>>>
>>>     0524513afe45 ("tty: don't store semi-state into tty drivers")
>>>     72fdb403008c ("tty: pdc_cons, free tty_driver upon failure")
>>>
>>> from the tty tree.
>>>
>>> I fixed it up (I just used the latter version) ...
>>
>> The latter version triggers build errors.
>> Jiri's patch needs fixing. Instead of:
>> +               tty_driver_kref_put(driver);
>> it needs to be:
>> +               tty_driver_kref_put(pdc_console_tty_driver);
>>
>> Jiri, maybe you can fix it in your tree?
>> I'm happy to drop the patch from my tree.
>
> The tty tree commits first create a "driver" variable that is used
> until it is clear everything works and then it is assigned to
> pdc_console_tty_driver.

Ah, right. I didn't checked. Looks good and compiles cleanly.
I'll drop the patch from my tree, so everything is OK now.

Helge
