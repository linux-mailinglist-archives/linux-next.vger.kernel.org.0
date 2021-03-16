Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93C0F33E006
	for <lists+linux-next@lfdr.de>; Tue, 16 Mar 2021 22:09:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231396AbhCPVJU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 16 Mar 2021 17:09:20 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:10206 "EHLO
        mx0b-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232315AbhCPVIy (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 16 Mar 2021 17:08:54 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12GL3Faw110040;
        Tue, 16 Mar 2021 17:08:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : mime-version : content-type; s=pp1;
 bh=bkf5EjZqWML/TQagRmf6SCI88TpyhsUNJY5pNxgxxMk=;
 b=I96f+qAcRViuFDdm3G6MdFRUxEbNB6QFf+HgyTkbutDlyJXhKQ+kKcUKByTLkjn4NBaa
 O1dtEfgLJDBRITCM45CTJ/CZ4IgpbtNQz4b6/Qx5CjQVFDO0A+5cmE+yKlj1yzwfK5AK
 metC+4jCch9HgL4SCbcn47VzQ+ZTEl62VJCE/RAJkW4ky1mcMydxEynhY+ojV9RchRsw
 Dh7QtICqPH+FoJ86NKol6XIJtVc7mvpj/9HAYtuBaF/+DwWhs85pmwkjZjZL7HjTARzA
 M2MWmAw2yCxceqPKAMueFeuuSIuzzaJ0jeYd+7BNkhBlqYgJjSUghW/PqN4I30dUhh+j 3A== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 37b0pnntky-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 16 Mar 2021 17:08:48 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12GL3Foq110065;
        Tue, 16 Mar 2021 17:08:47 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
        by mx0a-001b2d01.pphosted.com with ESMTP id 37b0pnntk9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 16 Mar 2021 17:08:47 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
        by ppma02fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12GL8Ksw031290;
        Tue, 16 Mar 2021 21:08:45 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
        by ppma02fra.de.ibm.com with ESMTP id 378n181p8m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 16 Mar 2021 21:08:45 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 12GL8gWk38994332
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 16 Mar 2021 21:08:42 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 36ECFA405F;
        Tue, 16 Mar 2021 21:08:42 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id BE79AA4054;
        Tue, 16 Mar 2021 21:08:41 +0000 (GMT)
Received: from osiris (unknown [9.171.48.4])
        by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Tue, 16 Mar 2021 21:08:41 +0000 (GMT)
Date:   Tue, 16 Mar 2021 22:08:40 +0100
From:   Heiko Carstens <hca@linux.ibm.com>
To:     Shakeel Butt <shakeelb@google.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Roman Gushchin <guro@fb.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Hugh Dickins <hughd@google.com>,
        Juergen Christ <jchrist@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>, linux-mm@kvack.org,
        linux-next@vger.kernel.org
Subject: [BUG -next] "memcg: charge before adding to swapcache on swapin"
 broken
Message-ID: <YFEeWD7LMPYngtbA@osiris>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-16_08:2021-03-16,2021-03-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=1 mlxlogscore=225 clxscore=1011
 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=1 mlxscore=1
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103160135
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Shakeel,

your commit 3a9ca1b0ac0f ("memcg: charge before adding to swapcache on
swapin") in linux-next 20210316 appears to cause user process faults /
crashes on s390 like:

User process fault: interruption code 003b ilc:3 in sshd[2aa15280000+df000]
Failing address: 0000000000000000 TEID: 0000000000000800
Fault in primary space mode while using user ASCE.
AS:00000000966b41c7 R3:0000000000000024 
CPU: 0 PID: 401 Comm: sshd Not tainted 5.12.0-rc3-00048-geba7667a8534 #10
Hardware name: IBM 8561 T01 703 (z/VM 7.2.0)
User PSW : 0705000180000000 0000000000000000
           R:0 T:1 IO:1 EX:1 Key:0 M:1 W:0 P:1 AS:0 CC:0 PM:0 RI:0 EA:3
User GPRS: 0000000000000000 fffffffffffff000 0000000000000001 000002aa157b88f0
           000002aa157c43c0 0000000000000000 0000000000000000 0000000000000000
           0000000000000000 0000000000000000 0000000000000000 0000000000000000
           0000000000000000 0000000000000000 0000000000000000 0000000000000000
User Code: Bad PSW.

This was bisected using elfutils selftests:

autoreconf -fi
./configure --enable-maintainer-mode --disable-debuginfod
make -j $(nproc)
cd tests
make -j $(nproc) check
