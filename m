Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17BAD16259D
	for <lists+linux-next@lfdr.de>; Tue, 18 Feb 2020 12:38:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbgBRLit (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 18 Feb 2020 06:38:49 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:47100 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726312AbgBRLis (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 18 Feb 2020 06:38:48 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 01IBYDuq049062
        for <linux-next@vger.kernel.org>; Tue, 18 Feb 2020 06:38:48 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2y6e2fbx2j-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Tue, 18 Feb 2020 06:38:48 -0500
Received: from localhost
        by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <sachinp@linux.vnet.ibm.com>;
        Tue, 18 Feb 2020 11:38:46 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
        by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Tue, 18 Feb 2020 11:38:42 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
        by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 01IBcfJq46006298
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 18 Feb 2020 11:38:41 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 3D81BAE045;
        Tue, 18 Feb 2020 11:38:41 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 7044DAE04D;
        Tue, 18 Feb 2020 11:38:40 +0000 (GMT)
Received: from [9.199.196.80] (unknown [9.199.196.80])
        by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Tue, 18 Feb 2020 11:38:40 +0000 (GMT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [5.6.0-rc2-next-20200218/powerpc] Boot failure on POWER9 
From:   Sachin Sant <sachinp@linux.vnet.ibm.com>
In-Reply-To: <cf6be5f5-4bbc-0d34-fb64-33fd37bc48d9@virtuozzo.com>
Date:   Tue, 18 Feb 2020 17:08:39 +0530
Cc:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linuxppc-dev@lists.ozlabs.org, Michal Hocko <mhocko@suse.com>
Content-Transfer-Encoding: 7bit
References: <3381CD91-AB3D-4773-BA04-E7A072A63968@linux.vnet.ibm.com>
 <cf6be5f5-4bbc-0d34-fb64-33fd37bc48d9@virtuozzo.com>
To:     Kirill Tkhai <ktkhai@virtuozzo.com>
X-Mailer: Apple Mail (2.3445.104.11)
X-TM-AS-GCONF: 00
x-cbid: 20021811-0028-0000-0000-000003DC173B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20021811-0029-0000-0000-000024A11FF1
Message-Id: <D32F8819-6D7B-4B0E-95B4-E5A1D2E5CF7B@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-02-18_02:2020-02-17,2020-02-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=772 mlxscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002180096
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



> On 18-Feb-2020, at 4:20 PM, Kirill Tkhai <ktkhai@virtuozzo.com> wrote:
> 
> Hi, Sachin,
> 
> On 18.02.2020 13:45, Sachin Sant wrote:
>> 
>> commit a75056fc1e7c 
>> mm/memcontrol.c: allocate shrinker_map on appropriate NUMA node
>> 
>> I can boot the kernel successfully if the patch is reverted. 
> 
> 
> could you please test your boot with original patch from here:
> 
> https://patchwork.kernel.org/patch/11360007/
> 
> ?
With this original patch I can boot the machine successfully.

Thanks
-Sachin

