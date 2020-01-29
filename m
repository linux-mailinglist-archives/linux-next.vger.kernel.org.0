Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C21414D348
	for <lists+linux-next@lfdr.de>; Wed, 29 Jan 2020 23:54:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726768AbgA2WyV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Jan 2020 17:54:21 -0500
Received: from sonic312-27.consmr.mail.bf2.yahoo.com ([74.6.128.89]:42751 "EHLO
        sonic312-27.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726820AbgA2WyO (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 29 Jan 2020 17:54:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1580338452; bh=3wknnWUBj6qFIGuljZKDjmuGgec62eX9+MWDo24faJc=; h=Subject:To:Cc:References:From:Date:In-Reply-To:From:Subject; b=UxmaH9oPQll6no4+a1Wma5URYyPY2vcHwqxPq22aWrQ5l5uKFPB08JFu3Pwdh9BLBnbgMsm0ArETKm5YUXeVHJHkDWwdwOH52FB/aysEgNhxEroILwZj9odS9+d9Oiv6+2Fbdm2B0rXIiRXP9fDOKoW5xXmRWeXfbCYMyP2kuF+0GyLk0wmIwQMKkEgYcD9DExQOCN5IY6IR4tDN1NzUJGoWdUxB+K5YHB2fybQIMBNu4tSVLbCfxZ4PkFe5NzSWtYzmTBsWWrd1j5B6408GYCe983Slip6FeF7UjlapYcr0JaySA/Xl3x8h1bOQ3gvOXbmD6tlWgxqXdsFfPmP8aQ==
X-YMail-OSG: prhkVm8VM1mAz.U9DQtdpC.HTfw81S58m61UkzokY4ixMaGHbns6NmcpQr4a2OO
 gDSoVjk2gUs9frIiaIW_9yNvSV92eLzx.TmnyS.hPWN0ZxpBs7uUFzLxSIGIgXqOAVWrgGBtxTqx
 WoQ.vP6CK.ZkOV2M2nj9hjdwL8jXtJdVMUwJjvE8tmS6STcKJx7yEsx8S1_w.v.EPhkL5YaMmawM
 SsokPF3oSgWss4YWMjXvnIadQMkhYXtfuJ8fAeJMYoQPgY137x.o2jr2ufOWVDkvJqLvLDZFY8x8
 MS1V7yaAcRSQiQ8RKjP4ZnsQEHUVkpO3vnTY4DuZ5zxsP2aSCHt5zX.M7zXE2xpDV5QFBuKuw7uf
 48cP9.qJSrdRfuL6hriJJoBLQCjegOb0tsdcEVnONrdCIjV9QW6YYG6XITZjiKquePGoVKPfOorw
 hXv7LTA5LWn1GB72wvwvnZoOBToGRovajlx9o9Tt_P5epk9WqmvT3cDoKgFwwDcritMbm8wslgQf
 9Gg6yC_QTMZJF_.IeHKOxcLbXwWoNm.hckZMKGqm4WYnNgJu8f0nbailjDr6Gr70CEQeC9vNLGoi
 kG0eueAktZ3QXfNDrRsONHfqCRL7nmIGHlFAYMR4NEQLbjg2eHwBI2v_7mt09SMtKX0bMw1FHOMr
 5B40nfH5RsvLgaS2U10FGM7NUhWRHqIVrVRk.6KjtBexHrTt4QuLeUDX5gO_Q.RIzGzS_1PZZex_
 Ve7Q7Ni_OTvS5ciShhrcX9jwve6MWGqGYG4CPdZejLi5dPh1gJmB2q1OMhfAJPP9CmWqTR2mXynJ
 6gb82DlCdtnvtrvzSvptY3tH7rb2H397mqC6oKXJcNfrOsAteS3HapQC7XR2vR3XeDM8_UDuOtOh
 x2v8oAss6eCp2.5iD3_O_891oRYQYwJdBXgXTa3fV_eXzbFr5IurCxnYMV3GC1Wp8cufeOHUpLU.
 MvlhB_V4RaswCQ9efFsk_kfzAsf4J..8Z2f9kO8xXQnpgDd6t0MRZRABW1udV4r95xCo4TEh205G
 UBusO8CpxR42gbba2BvWqk7oB7sp3hD_EcfrHoTf0.WVLsTCFfjlWG92yPLbLroo3vJJxU8I51Sx
 UQ4VsSEq1Y.jJOBcwzeakrVsBFkpTrmqOrYl1lzfp8ALmChxNoT7G_Xj85ze5VsSnMshIQVY2JBa
 gMD5OlJQu8y.wTiaOA7zRio28h8K1P1rtahTTlWgA8aY2l7smNpfxXPr4Ev5El4jH2pxssCAtWaL
 XvokjrL4yrF2xv8VH7kNgtsIvcEGUByqT.PY5HociFPa8EHfl8T_0U.3RbbK_IEJ0.kOMmWgTLKE
 CYurqEPhFBHXWtscEjSQ5MmTta5JQPg1ulYlYVEq3C6DLhrGFroh9tcS1H7sHntIpZdSurYo41b4
 wLoflNzqQTwrJAFSaO7IykDjDEmjE
Received: from sonic.gate.mail.ne1.yahoo.com by sonic312.consmr.mail.bf2.yahoo.com with HTTP; Wed, 29 Jan 2020 22:54:12 +0000
Received: by smtp417.mail.ne1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID d9bd0d7869ff9b44bd25a04729356b77;
          Wed, 29 Jan 2020 22:54:10 +0000 (UTC)
Subject: Re: linux-next: Tree for Jan 29 (security/smack/)
To:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        David Howells <dhowells@redhat.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-security-module <linux-security-module@vger.kernel.org>,
        Casey Schaufler <casey@schaufler-ca.com>
References: <20200129155431.76bd7f25@canb.auug.org.au>
 <e66a563e-b612-c5b6-7bdd-b55113a9b822@infradead.org>
From:   Casey Schaufler <casey@schaufler-ca.com>
Autocrypt: addr=casey@schaufler-ca.com; keydata=
 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
 abzjfg==
Message-ID: <3ac1c817-b310-c8f8-6990-1602db540106@schaufler-ca.com>
Date:   Wed, 29 Jan 2020 14:54:09 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <e66a563e-b612-c5b6-7bdd-b55113a9b822@infradead.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Mailer: WebService/1.1.15116 hermes Apache-HttpAsyncClient/4.1.4 (Java/1.8.0_181)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 1/29/2020 2:18 PM, Randy Dunlap wrote:
> On 1/28/20 8:54 PM, Stephen Rothwell wrote:
>> Hi all,
>>
>> Please do not add any v5.7 material to your linux-next included
>> branches until after v5.6-rc1 has been released.
>>
>> Changes since 20200128:
>>
This keeps coming up. It's in David Howells' watch queue changes.
David, could you please fix this?

> ../security/smack/smack_lsm.c: In function �smack_post_notification�:
> ../security/smack/smack_lsm.c:4383:7: error: dereferencing pointer to incomplete type �struct watch_notification�
>   if (n->type == WATCH_TYPE_META)
>        ^~
>   CC      kernel/time/hrtimer.o
> ../security/smack/smack_lsm.c:4383:17: error: �WATCH_TYPE_META� undeclared (first use in this function); did you mean �TCA_PIE_BETA�?
>   if (n->type == WATCH_TYPE_META)
>                  ^~~~~~~~~~~~~~~
>                  TCA_PIE_BETA
>
>
> Probably just missing
> #include <linux/watch_queue.h>
>
>
