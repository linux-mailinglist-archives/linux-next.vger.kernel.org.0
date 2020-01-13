Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92640138CB7
	for <lists+linux-next@lfdr.de>; Mon, 13 Jan 2020 09:17:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728794AbgAMIR1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 13 Jan 2020 03:17:27 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:48894 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728789AbgAMIR1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 13 Jan 2020 03:17:27 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 00D8ENoO003461;
        Mon, 13 Jan 2020 09:17:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=BNM4YoMzz8mNUvF1txkbtT7/0heb6WHqiZtZ1ldOKhw=;
 b=qPoyNKH8jTIWXU82omvks7gDUV71lAKVshmwiphNM1ReCj6JiZZ6bPp3/pgnAekSihDC
 RUUhnOVJZirq6ZdKAGWeK0u23lxjzSMd452NLEb9EM7UXaZHjMuTLgfE7736DbUlBozb
 KhPWBtL9oh3yzDeLfTqrQYYxvTxwARKDMF90tv/HaOZ1FmVGN5Oh+MiZ+tqIhGD5WCGs
 /9q0HeU+/bOI6bhou9rrmZlNSTHHoIw/8SRr0Y4eccYqZgsBF4Zn5+p89Gda5sDFC6Gl
 Xa9fmHlvLuLrLEENXSjKC0e68J9Fm4MT5tTIMk2bFE5utK+fkJCzF43b66PSCj9ZRzys bw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2xf7jp6whm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 13 Jan 2020 09:17:11 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CFEC210003A;
        Mon, 13 Jan 2020 09:17:09 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B4A912A4D88;
        Mon, 13 Jan 2020 09:17:09 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.49) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 13 Jan
 2020 09:17:09 +0100
Subject: Re: linux-next: Signed-off-by missing for commit in the arm-soc tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Olof Johansson <olof@lixom.net>
CC:     Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ludovic Barre <ludovic.barre@st.com>,
        Yann Gautier <yann.gautier@st.com>
References: <20200113065808.25f28c40@canb.auug.org.au>
 <CAOesGMifHn6DbNgYm6YUbdKjSL5rNgdWrq+HX9dEusrOr9xX2A@mail.gmail.com>
 <20200113113837.130c3936@canb.auug.org.au>
From:   Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <caeb1af8-4aa2-71dc-0a70-127c0b474f93@st.com>
Date:   Mon, 13 Jan 2020 09:17:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200113113837.130c3936@canb.auug.org.au>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG5NODE2.st.com (10.75.127.14) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-01-13_02:2020-01-13,2020-01-13 signatures=0
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi guys

On 1/13/20 1:38 AM, Stephen Rothwell wrote:
> Hi Olof,
> 
> On Sun, 12 Jan 2020 11:59:58 -0800 Olof Johansson <olof@lixom.net> wrote:
>>
>> Thanks for the report. Time to automate this at our end, we've had a
>> few too many of these slip through all the way to you lately.
>>
>> Where do you keep your scripts that you catch these things with? Do
>> you have a writeup of the checks you do? I should add it to my
>> automation once and for all.
> 
> I should export my linux-next scripts as a git repo, but I haven't (yet) :-(
> 
> Attached pleas find check_commits which I run after fetching each tree
> and pass the changed commit range.  This, in turn, runs check_fixes
> (also attached).
> 


Sorry for this oversight. DO I have something to do ? (except to not 
forget to check my signed-off next time).

Regards
Alex
