Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56956212461
	for <lists+linux-next@lfdr.de>; Thu,  2 Jul 2020 15:16:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726343AbgGBNQw convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Thu, 2 Jul 2020 09:16:52 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:30438 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728851AbgGBNQw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 2 Jul 2020 09:16:52 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 062D3lp6092955;
        Thu, 2 Jul 2020 09:16:44 -0400
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0b-001b2d01.pphosted.com with ESMTP id 320xaywgu4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 02 Jul 2020 09:16:44 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 062D44iY094400;
        Thu, 2 Jul 2020 09:16:44 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
        by mx0b-001b2d01.pphosted.com with ESMTP id 320xaywgt8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 02 Jul 2020 09:16:44 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
        by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 062DATCh027107;
        Thu, 2 Jul 2020 13:16:42 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
        by ppma05fra.de.ibm.com with ESMTP id 31wwr8avt7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 02 Jul 2020 13:16:42 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 062DGekB11927982
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 2 Jul 2020 13:16:40 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 289084C04E;
        Thu,  2 Jul 2020 13:16:40 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 26D524C044;
        Thu,  2 Jul 2020 13:16:39 +0000 (GMT)
Received: from [9.85.87.208] (unknown [9.85.87.208])
        by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Thu,  2 Jul 2020 13:16:38 +0000 (GMT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.14\))
Subject: Re: [powerpc][next-20200701] Hung task timeouts during regression
 test runs
From:   Sachin Sant <sachinp@linux.vnet.ibm.com>
In-Reply-To: <20200702115216.GF2452799@T590>
Date:   Thu, 2 Jul 2020 18:46:38 +0530
Cc:     linuxppc-dev@lists.ozlabs.org, linux-block@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        axboe@kernel.dk
Content-Transfer-Encoding: 8BIT
Message-Id: <16B5C41B-2078-4259-9942-6642F713788E@linux.vnet.ibm.com>
References: <CDAB3931-FAAD-443A-A9CD-362E527043A1@linux.vnet.ibm.com>
 <20200702115216.GF2452799@T590>
To:     Ming Lei <ming.lei@redhat.com>
X-Mailer: Apple Mail (2.3445.104.14)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-02_08:2020-07-02,2020-07-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 cotscore=-2147483648 suspectscore=0 impostorscore=0 priorityscore=1501
 mlxscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 spamscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2007020094
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



> On 02-Jul-2020, at 5:22 PM, Ming Lei <ming.lei@redhat.com> wrote:
> 
> On Thu, Jul 02, 2020 at 04:53:04PM +0530, Sachin Sant wrote:
>> Starting with linux-next 20200701 release I am observing automated regressions
>> tests taking longer time to complete. A test which took 10 minutes with next-20200630
>> took more than 60 minutes against next-20200701. 
>> 
>> Following hung task timeout messages were seen during these runs
>> 
>> [ 1718.848351]       Not tainted 5.8.0-rc3-next-20200701-autotest #1
>> [ 1718.848356] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
>> [ 1718.848362] NetworkManager  D    0  2626      1 0x00040080
>> [ 1718.848367] Call Trace:
>> [ 1718.848374] [c0000008b0f6b8f0] [c000000000c6d558] schedule+0x78/0x130 (unreliable)
>> [ 1718.848382] [c0000008b0f6bad0] [c00000000001b070] __switch_to+0x2e0/0x480
>> [ 1718.848388] [c0000008b0f6bb30] [c000000000c6ce9c] __schedule+0x2cc/0x910
>> [ 1718.848394] [c0000008b0f6bc10] [c000000000c6d558] schedule+0x78/0x130
>> [ 1718.848401] [c0000008b0f6bc40] [c0000000005d5a64] jbd2_log_wait_commit+0xd4/0x1a0
>> [ 1718.848408] [c0000008b0f6bcc0] [c00000000055fb6c] ext4_sync_file+0x1cc/0x480
>> [ 1718.848415] [c0000008b0f6bd20] [c000000000493530] vfs_fsync_range+0x70/0xf0
>> [ 1718.848421] [c0000008b0f6bd60] [c000000000493638] do_fsync+0x58/0xd0
>> [ 1718.848427] [c0000008b0f6bda0] [c0000000004936d8] sys_fsync+0x28/0x40
>> [ 1718.848433] [c0000008b0f6bdc0] [c000000000035e28] system_call_exception+0xf8/0x1c0
>> [ 1718.848440] [c0000008b0f6be20] [c00000000000ca70] system_call_common+0xf0/0x278
>> 
>> Comparing next-20200630 with next-20200701 one possible candidate seems to
>> be following commit:
>> 
>> commit 37f4a24c2469a10a4c16c641671bd766e276cf9f
>>    blk-mq: centralise related handling into blk_mq_get_driver_tag
>> 
>> Reverting this commit allows the test to complete in 10 minutes.
> 
> Hello,
> 
> Thanks for the report.
> 
> Please try the following fix:
> 
> https://lore.kernel.org/linux-block/20200702062041.GC2452799@T590/raw

The fix works for me.

Tested-by : Sachin Sant <sachinp@linux.vnet.ibm.com>

Thanks
-Sachin

> 
> 
> Thanks,
> Ming

