Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F150A9CCBD
	for <lists+linux-next@lfdr.de>; Mon, 26 Aug 2019 11:44:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730877AbfHZJod (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Aug 2019 05:44:33 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:31972 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726266AbfHZJod (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 26 Aug 2019 05:44:33 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x7Q9flPh019662;
        Mon, 26 Aug 2019 11:44:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=VTmTOEmJtBhkUABaG/XSF9y7CY7sNsb6fCHiw63nQjM=;
 b=s7risFeSlR3qAFh9zk6ZVfvYjWJzNQfjHqNtgkWelXFWXeLacjP9j6QoUQPKzpUC7HE2
 FXbCdpkCNBG7VaFodiobUYUMlvq1tD242iFIxBuzUkucS+qiesrMfXOCCvpemIYPsiai
 NWSWOXJ7KwUverZ5yXaO9SFyi5KkJmQMbbbDXpitPqHUdsTLJKJKmYyZunigA+XoSPll
 2jDpdPuDFW1ggPgsvVJRo/2dSumFHpT5dexbo4LKVP9DYJOjk1eSwUJmYB7Bq5nJHE0/
 zJYfz6ioajIH7AgiMBVf6gPG+TvcNQ6Pz0iAOqVsqbMcwhEVbvX/EjF122kMLrR+NjAo qg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2ujtq1314w-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Mon, 26 Aug 2019 11:44:10 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DA5A231;
        Mon, 26 Aug 2019 09:44:08 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BFB2D2D49C0;
        Mon, 26 Aug 2019 11:44:08 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.46) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 26 Aug
 2019 11:44:08 +0200
Subject: Re: linux-next: Fixes tags need some work in the arm-soc tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>
CC:     Olof Johansson <olof@lixom.net>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Fabrice Gasnier <fabrice.gasnier@st.com>
References: <20190814002836.4b6aa14b@canb.auug.org.au>
 <CAK8P3a2q1mShg-EQhiAFUOAET8UEMHfLJV-+HoLTaSQY+M7yBQ@mail.gmail.com>
 <20190814074730.402ec3ec@canb.auug.org.au>
From:   Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <f4e0e924-03ea-bf63-85a0-5718874ceb38@st.com>
Date:   Mon, 26 Aug 2019 11:44:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190814074730.402ec3ec@canb.auug.org.au>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-08-26_06:,,
 signatures=0
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi guys

On 8/13/19 11:47 PM, Stephen Rothwell wrote:
> Hi Arnd,
> 
> On Tue, 13 Aug 2019 21:35:58 +0200 Arnd Bergmann <arnd@arndb.de> wrote:
>>
>> On Tue, Aug 13, 2019 at 4:28 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>>>
>>> Please do not split Fixes tags over more than one line.  Also, please
>>> keep them with the rest of the other tags.
>>
>> Thanks for the report. How bad is this? Should I undo the merge and
>> wait for an updated pull request?
> 
> Its probably ok to leave as long as lessons are learnt :-)
> 

Sorry for my late answer.

Thanks Stephen for information. I'll take care next time before merging 
patches with "fixes" tag.

Arnd, no need to update the PR ?

regards

Alex
