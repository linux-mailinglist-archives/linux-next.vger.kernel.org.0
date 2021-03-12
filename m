Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68FF4338486
	for <lists+linux-next@lfdr.de>; Fri, 12 Mar 2021 05:01:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231245AbhCLEBL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 11 Mar 2021 23:01:11 -0500
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:53077 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbhCLEAw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 11 Mar 2021 23:00:52 -0500
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id AE56C891AE;
        Fri, 12 Mar 2021 17:00:45 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1615521645;
        bh=yI8trAd3ao13rNl6rIVpq9FqvKLYFctX8QAW3Enc2Iw=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=0W3SCRdw4Xtd8ZFFXiMbRxXpdwMD+QuOVklR0LRHHKm9T75GK+CI4NjDFcr33zvja
         vWrOplG+CfEElhmue4gv0O91UG7xN5lCSsvnJ0hUG7KjyK2yDbxoGtbuvXG17NAZCN
         M4s4laGVxmLTuu8qvi12RNzKS9PEsmY2yILcsMzcza73/XN8xuxzH9LP0467fs0h7f
         goF5BKj6DVfw7LwrBmG5HZAPGaiHe3XlvHzZXhOkf6IzLCzh7JFvbDmCk2bDWMEHhM
         LnWSOHaJ1Y7qEqd+xPpe3UmjGnAbPVwQ6D2bkL1vZe/ldxszYZgLSLdONvabBbK2/s
         aCNN8vLYFi6Ng==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B604ae76d0001>; Fri, 12 Mar 2021 17:00:45 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 12 Mar 2021 17:00:45 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.012; Fri, 12 Mar 2021 17:00:45 +1300
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Guenter Roeck <linux@roeck-us.net>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Linux Next Mailing List" <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the hwmon-staging tree
Thread-Topic: linux-next: build warning after merge of the hwmon-staging tree
Thread-Index: AQHXFvLd66CCjVo1ME+BB5ECZG7ZJKp+4LkA
Date:   Fri, 12 Mar 2021 04:00:45 +0000
Message-ID: <27340bd8-2009-683d-ac44-b6bb51f4347e@alliedtelesis.co.nz>
References: <20210312145031.5df91293@canb.auug.org.au>
In-Reply-To: <20210312145031.5df91293@canb.auug.org.au>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <0FA5FCA01A1D5F429D614660C238EEAD@atlnz.lc>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=GfppYjfL c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10 a=N659UExz7-8A:10 a=dESyimp9J3IA:10 a=HfXy9D3km2D_YShY56gA:9 a=pILNOxqGKmIA:10
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


On 12/03/21 4:50 pm, Stephen Rothwell wrote:
> Hi all,
>
> After merging the hwmon-staging tree, today's linux-next build (htmldocs)
> produced this warning:
>
> Documentation/hwmon/ir36021.rst:34: WARNING: Malformed table.
> No bottom table border found.
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> curr1_label             "iin"
> curr1_input             Measured input current
> curr1_alarm             Input fault alarm
>
> curr2_label             "iout1"
> curr2_input             Measured output current
> curr2_alarm             Output over-current alarm
>
> in1_label               "vin"
> in1_input               Measured input voltage
> in1_alarm               Input under-voltage alarm
>
> in2_label               "vout1"
> in2_input               Measured output voltage
> in2_alarm               Output over-voltage alarm
>
> power1_label            "pin"
> power1_input            Measured input power
> power1_alarm            Input under-voltage alarm
>
> power2_label            "pout1"
> power2_input            Measured output power
>
> temp1_input             Measured temperature
> temp1_alarm             Temperature alarm
>
> temp2_input             Measured other loop temperature
> temp2_alarm             Temperature alarm
>
> Caused by commit
>
>    0be9fee30ff9 ("hwmon: (pmbus) Add driver for Infineon IR36021")
>
Easy enough to fix. Who should I send the patch to?=
