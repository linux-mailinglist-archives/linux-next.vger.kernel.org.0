Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAB5C34F219
	for <lists+linux-next@lfdr.de>; Tue, 30 Mar 2021 22:26:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231701AbhC3UZ5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 30 Mar 2021 16:25:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbhC3UZv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 30 Mar 2021 16:25:51 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF1E6C061574
        for <linux-next@vger.kernel.org>; Tue, 30 Mar 2021 13:25:49 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 7DF2A891AE;
        Wed, 31 Mar 2021 09:25:44 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1617135944;
        bh=4m8v9HvBECLx0AVTds4tNkir9Omth8wMQSEKITaxJI8=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=x25ZpYF/vY7Q1EefdXxnCCspSHSIoL4Y+pRluosHYljIoSvz9X8w1RO2btWaeyvMb
         nc0mwf0uHnNkvRzyRAWvcaiIUK18Fjro9qmR9A1CXT3+hX/3bn84HydAItpO1b5rUK
         3Ro8bJG56sJf5fuls4eUtZJkLzYD+8dA8uPCSGPcEnZBLV46BbbU1tqPo8Uzq3VSmr
         RT8Bc1oxDfI+Zxt9BAmCgm5NMh6icciY28lXwtdrUptfFAaU889tdN84qQPR7KZHT6
         vePYelDvTmZCjmZ4EwdgE4GrLJliKqbLkAiCoGOrvt4IZUEC/0RTKDlBqr3h0gyIya
         Y8bRj3mB2E0Uw==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B606389480001>; Wed, 31 Mar 2021 09:25:44 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 31 Mar 2021 09:25:44 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.012; Wed, 31 Mar 2021 09:25:44 +1300
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Guenter Roeck <linux@roeck-us.net>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Linux Next Mailing List" <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the hwmon-staging tree
Thread-Topic: linux-next: build warning after merge of the hwmon-staging tree
Thread-Index: AQHXJTY5EZ1T8N+JOU2TKO1JFMK5WaqcIVyA
Date:   Tue, 30 Mar 2021 20:25:43 +0000
Message-ID: <b11339e2-cfc4-2f23-7161-3fae7750f4d3@alliedtelesis.co.nz>
References: <20210330182758.3a28068f@canb.auug.org.au>
In-Reply-To: <20210330182758.3a28068f@canb.auug.org.au>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <940F1469B40E3D4FA0C7C78336F03735@atlnz.lc>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=GfppYjfL c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10 a=N659UExz7-8A:10 a=dESyimp9J3IA:10 a=e9JJBxLuodXSJ980m6cA:9 a=pILNOxqGKmIA:10
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

My bad. I'll send a patch shortly

On 30/03/21 8:27 pm, Stephen Rothwell wrote:
> Hi all,
>
> After merging the hwmon-staging tree, today's linux-next build (htmldocs)
> produced this warning:
>
> Documentation/hwmon/bpa-rs600.rst: WARNING: document isn't included in an=
y toctree
>
> Introduced by commit
>
>    9a8210575cde ("hwmon: (pmbus) Add driver for BluTek BPA-RS600")
>=
