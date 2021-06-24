Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C67373B32E5
	for <lists+linux-next@lfdr.de>; Thu, 24 Jun 2021 17:55:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231761AbhFXP5o (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 24 Jun 2021 11:57:44 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:11930 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230267AbhFXP5o (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 24 Jun 2021 11:57:44 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15OFYDdQ036150;
        Thu, 24 Jun 2021 11:55:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : reply-to : mime-version : content-type; s=pp1;
 bh=70voqBDCjLyVbA4YA+h5sR8dzQZQGfW8a3mYRzXbcLs=;
 b=r+Tk1RmqR4X1TkU2b5ybkQ9Y1bL0emshaAKQwRO/4UAUtljOk+fjt4MqajZU+j71VUuh
 jQ4qNwRHpntoseB7v+dZkc12ZKQmg558/i3kOZPSUTxIJcl8jYEtWAmKrtlcTQRxIXbT
 Ci9g5AtjFFoYoVte0M3UKWKfcTcLPyw0y/TCIqoz2Q0iBn5SSZRiuqB0PeGgh/CkevqS
 aWP3yk1s+XiVjjFn4tBSO76tMnssSh91f2j9BL6P/9fx4yr+Zy+oYgsKWvR7HwyjQze9
 6fwsyDC1gy3zEcZaqkCPa9dP5qUczfTp/Exh9d2Q+ccrNMgjQwQXn+2W/gSzQnaGUaBO /w== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
        by mx0a-001b2d01.pphosted.com with ESMTP id 39cvq8s095-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 24 Jun 2021 11:55:17 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
        by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15OFs3Pj001390;
        Thu, 24 Jun 2021 15:55:15 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
        by ppma03ams.nl.ibm.com with ESMTP id 399878amuy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 24 Jun 2021 15:55:15 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 15OFtCqZ34931150
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 24 Jun 2021 15:55:13 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id D27A74C040;
        Thu, 24 Jun 2021 15:55:12 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 086654C058;
        Thu, 24 Jun 2021 15:55:12 +0000 (GMT)
Received: from in.ibm.com (unknown [9.199.47.185])
        by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Thu, 24 Jun 2021 15:55:11 +0000 (GMT)
Date:   Thu, 24 Jun 2021 21:25:09 +0530
From:   Bharata B Rao <bharata@linux.ibm.com>
To:     linux-next@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc:     mpe@ellerman.id.au
Subject: PowerPC guest getting "BUG: scheduling while atomic" on
 linux-next-20210623 during secondary CPUs bringup
Message-ID: <YNSq3UQTjm6HWELA@in.ibm.com>
Reply-To: bharata@linux.ibm.com
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: jHPrxFdDA7ykan0m5jEhuQwh3ZUNLzGP
X-Proofpoint-ORIG-GUID: jHPrxFdDA7ykan0m5jEhuQwh3ZUNLzGP
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-06-24_12:2021-06-24,2021-06-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 phishscore=0 impostorscore=0 clxscore=1011
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106240086
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

A PowerPC KVM guest gets the following BUG message when booting
linux-next-20210623:

smp: Bringing up secondary CPUs ...
BUG: scheduling while atomic: swapper/1/0/0x00000000
no locks held by swapper/1/0.
Modules linked in:
CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.13.0-rc7-next-20210623
Call Trace:
[c00000000ae5bc20] [c000000000badc64] dump_stack_lvl+0x98/0xe0 (unreliable)
[c00000000ae5bc60] [c000000000210200] __schedule_bug+0xb0/0xe0
[c00000000ae5bcd0] [c000000001609e28] __schedule+0x1788/0x1c70
[c00000000ae5be20] [c00000000160a8cc] schedule_idle+0x3c/0x70
[c00000000ae5be50] [c00000000022984c] do_idle+0x2bc/0x420
[c00000000ae5bf00] [c000000000229d88] cpu_startup_entry+0x38/0x40
[c00000000ae5bf30] [c0000000000666c0] start_secondary+0x290/0x2a0
[c00000000ae5bf90] [c00000000000be54] start_secondary_prolog+0x10/0x14

<The above repeats for all the secondary CPUs>

smp: Brought up 2 nodes, 16 CPUs
numa: Node 0 CPUs: 0-7
numa: Node 1 CPUs: 8-15

This seems to have started from next-20210521 and isn't seen on
next-20210511.

Regards,
Bharata.
