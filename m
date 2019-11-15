Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A000AFDA22
	for <lists+linux-next@lfdr.de>; Fri, 15 Nov 2019 10:57:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727718AbfKOJ5M (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 15 Nov 2019 04:57:12 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:27766 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725829AbfKOJ5M (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 15 Nov 2019 04:57:12 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xAF9tphH018813;
        Fri, 15 Nov 2019 10:56:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=vsOzzj7KcsbaGrMUFeIecgvE+Yst1FI/T/g1/ei7AOQ=;
 b=ypB8By7B0rlCOBCpE08sE4NyyQmAuv5h94VrrPuyC7x9Vj0LPv9Z5NAIiuPgb9yZ9aKE
 jnScbgh6MLv8lc/CcGTxV7I+BfUTEG1zNzaIMWkZDZCDdgk1NutuHbNHJU3DxF6mbkBL
 bWxFgpkhdaJYHq1qGm+66vp57kbTb+9U09F7qMgv+aTQPCjILLV773qtUbOCb11vg/gS
 D7dOtl1eVKGi5ixf8xfw9xnQIeXwWNPu3TOw3zYc/CJ7QKYTvd42pxk04HcxPi2m5ach
 1zRnXv5wfabe9wnP2aOFacufwURCZvuBsYu0bcUMsSODgNaWd5RuFTu1V/FsSMERJo1f Uw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2w7psfkdc2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 15 Nov 2019 10:56:57 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 34ED3100039;
        Fri, 15 Nov 2019 10:56:56 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag5node2.st.com [10.75.127.14])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7B4FD2B1873;
        Fri, 15 Nov 2019 10:56:56 +0100 (CET)
Received: from SFHDAG3NODE3.st.com (10.75.127.9) by SFHDAG5NODE2.st.com
 (10.75.127.14) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 15 Nov
 2019 10:56:55 +0100
Received: from SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476]) by
 SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476%20]) with mapi id
 15.00.1347.000; Fri, 15 Nov 2019 10:56:56 +0100
From:   Benjamin GAIGNARD <benjamin.gaignard@st.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Rob Herring <robherring2@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Fabrice GASNIER <fabrice.gasnier@st.com>
Subject: Re: linux-next: manual merge of the pwm tree with the devicetree tree
Thread-Topic: linux-next: manual merge of the pwm tree with the devicetree
 tree
Thread-Index: AQHVm29z814knmbHG0Gwcu/8qn+uuqeL6iKAgAAEQYA=
Date:   Fri, 15 Nov 2019 09:56:56 +0000
Message-ID: <53a802bb-b462-6256-9d23-3181798cdefe@st.com>
References: <20191115154456.244c27e4@canb.auug.org.au>
 <20191115094141.GA825257@ulmo>
In-Reply-To: <20191115094141.GA825257@ulmo>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <626D1099C5258E4483D5C379DCA17158@st.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-15_02:2019-11-15,2019-11-15 signatures=0
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


On 11/15/19 10:41 AM, Thierry Reding wrote:
> On Fri, Nov 15, 2019 at 03:44:56PM +1100, Stephen Rothwell wrote:
>> Hi all,
>>
>> Today's linux-next merge of the pwm tree got a conflict in:
>>
>>    Documentation/devicetree/bindings/pwm/pwm-stm32.txt
>>
>> between commit:
>>
>>    56fb34d86e87 ("dt-bindings: mfd: Convert stm32 timers bindings to jso=
n-schema")
>>
>> from the devicetree tree and commit:
>>
>>    4205e356285e ("dt-bindings: pwm-stm32: Document pinctrl sleep state")
>>
>> from the pwm tree.
>>
>> I fixed it up (I just deleted the file - more fixup is probably required=
)
>> and can carry the fix as necessary. This is now fixed as far as linux-ne=
xt
>> is concerned, but any non trivial conflicts should be mentioned to your
>> upstream maintainer when your tree is submitted for merging.  You may
>> also want to consider cooperating with the maintainer of the conflicting
>> tree to minimise any particularly complex conflicts.
> It should be trivial to rewrite the sleep state patch on top of the
> json-schema conversion and then take that version into the devicetree
> tree.
>
> Fabrice, can you resend that patch based on the devicetree tree?
Describing sleep state in json-schema is not need since it is included

by the "top" schema.

Benjamin

>
> Thierry=
