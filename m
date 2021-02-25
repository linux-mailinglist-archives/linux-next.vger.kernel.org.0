Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62A0F3259B7
	for <lists+linux-next@lfdr.de>; Thu, 25 Feb 2021 23:37:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231414AbhBYWg4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 25 Feb 2021 17:36:56 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:8804 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230386AbhBYWgy (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 25 Feb 2021 17:36:54 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 11PMWu7O194326;
        Thu, 25 Feb 2021 17:36:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=mHKwSgepPZfDmj38IHgbJ9+M5MpnFlYOsbj2cozvhSU=;
 b=U3CvZK/FK4wwk6nclbyIGaOYAS1S1Rxf8jEyZtYTiS6/XMqeChMBbs4bMR82Gc+Wmh6w
 TccfZSEyuMpnGah6NSAYvn9VkBTfLQWaDpmLe+6kPFHTXdS25RSvsdjrMzSyHL1GdIGE
 MOtc3/UA9DEU98ndKXEmG8JkXk8aV7xcMZh3J3MGOWLV0HaFLY6/Z8uT7yPNm4IBop8r
 WfWkKNC/iqpir0R0vu31717vOfFDWgSj2YqWgU390v8Er4K8cHpIU4n2wXOnKY9rSrpY
 aMGu5EKNpBQYceHjHvvXeEhKHbJTb6rq0lPcR2RbCcHTcyKgziB8IAj2MScXHHWqP+RS Eg== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
        by mx0a-001b2d01.pphosted.com with ESMTP id 36xfck1yx7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 25 Feb 2021 17:36:08 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
        by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11PMThmr018850;
        Thu, 25 Feb 2021 22:36:05 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
        by ppma06ams.nl.ibm.com with ESMTP id 36tsph4t8c-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 25 Feb 2021 22:36:05 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
        by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 11PMZowT35389916
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 25 Feb 2021 22:35:50 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 806494C08B;
        Thu, 25 Feb 2021 22:36:03 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 373614C086;
        Thu, 25 Feb 2021 22:36:03 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
        by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Thu, 25 Feb 2021 22:36:03 +0000 (GMT)
Received: from [9.206.188.228] (unknown [9.206.188.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by ozlabs.au.ibm.com (Postfix) with ESMTPSA id DA6BE6023F;
        Fri, 26 Feb 2021 09:35:59 +1100 (AEDT)
Subject: Re: linux-next: Fixes tag needs some work in the jc_docs tree
To:     Jonathan Corbet <corbet@lwn.net>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210226083433.1419e9c9@canb.auug.org.au>
 <87a6rrbze2.fsf@meer.lwn.net>
From:   Andrew Donnellan <ajd@linux.ibm.com>
Message-ID: <89ce7fd6-f71c-b9b2-febd-bbfafdd7b484@linux.ibm.com>
Date:   Fri, 26 Feb 2021 09:35:54 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <87a6rrbze2.fsf@meer.lwn.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-02-25_14:2021-02-24,2021-02-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1011
 mlxlogscore=999 mlxscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102250170
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 26/2/21 8:39 am, Jonathan Corbet wrote:
> Stephen Rothwell <sfr@canb.auug.org.au> writes:
> 
>> Hi all,
>>
>> In commit
>>
>>    36eaf08fc283 ("docs: powerpc: Fix tables in syscall64-abi.rst")
>>
>> Fixes tag
>>
>>    Fixes: 209b44c804c ("docs: powerpc: syscall64-abi.rst: fix a malformed table")
>>
>> has these problem(s):
>>
>>    - SHA1 should be at least 12 digits long
>>
>> I don't think this is worth rebasing for, but in the future it can be
>> fixed by setting core.abbrev to 12 (or more) or (for git v2.11 or later)
>> just making sure it is not set (or set to "auto").
> 
> I made that tag by hand while "fixing" the changlog on that commit,
> which included the full ID.  Obviously, counting to 12 is a challenging
> task for a slow guy like me...:)

No, no, my local tree tells me that *I* made that tag by hand and failed 
to count properly... sorry for the noise!

-- 
Andrew Donnellan              OzLabs, ADL Canberra
ajd@linux.ibm.com             IBM Australia Limited
