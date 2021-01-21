Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BF612FED52
	for <lists+linux-next@lfdr.de>; Thu, 21 Jan 2021 15:49:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731951AbhAUOlT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 Jan 2021 09:41:19 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:32870 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731094AbhAUOk5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 21 Jan 2021 09:40:57 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 10LEZKG5078285;
        Thu, 21 Jan 2021 09:39:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id; s=pp1;
 bh=Hg8O/3NyPyD1b0SsDnsMlBAxCup8B3TJKtL7UarxjVY=;
 b=T4uVCSw30SYYkD7k/mson9qUmit8Rt98EQ9whjDa5fuSz0knTSnSlfZU95vmA8Zys4Mb
 q3x1Eo2ZwsdxrYn0qcLfFid8qCoUgTFHOjuUoCU+PGokX/WTjSSe2gsM4l3zT/ZqKomV
 qoOgbbYgfkWiHrCLkqQNQqPhKlaBbzwmH5zg3B66kXxCxLacyLh95KAVlfJS+9sb2fN/
 DXz4Gtnda0z7PldX/UvGLSwdwHgMaWcpy8XgDssmxuVI/WUU9i/gxGRTaH7hPWv6Lgqs
 oDn8XIjmPr8Ba6PCc8SpdjXG0xhfcM1f+iQNILwXEIDJcb09XUCtBV1B9P0kwnA77RnY kg== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
        by mx0a-001b2d01.pphosted.com with ESMTP id 367ax59jjt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 21 Jan 2021 09:39:50 -0500
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
        by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10LEcia8007814;
        Thu, 21 Jan 2021 14:39:48 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
        by ppma04fra.de.ibm.com with ESMTP id 3668pj8wp0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 21 Jan 2021 14:39:48 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
        by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 10LEdjQB46924250
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 21 Jan 2021 14:39:45 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 9DD1B11C04A;
        Thu, 21 Jan 2021 14:39:45 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 8C97A11C04C;
        Thu, 21 Jan 2021 14:39:45 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
        by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Thu, 21 Jan 2021 14:39:45 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 55390)
        id 0B140E1FBD; Thu, 21 Jan 2021 15:39:45 +0100 (CET)
From:   Sven Schnelle <svens@linux.ibm.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Subject: Warning with next-20210121 on s390
Date:   Thu, 21 Jan 2021 15:39:25 +0100
Message-Id: <20210121143926.21440-1-svens@linux.ibm.com>
X-Mailer: git-send-email 2.17.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2021-01-21_08:2021-01-21,2021-01-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=493 priorityscore=1501 spamscore=0 adultscore=0 clxscore=1011
 phishscore=0 bulkscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101210081
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

there's a warning with linux-next on s390:

[   33.893818] systemd-xdg-autostart-generator[544]: Not generating service for XDG autostart app-at\x2dspi\x2ddbus\x2dbus-autostart.service, startup phases are not supported. 
[   54.613344] ------------[ cut here ]------------ 
[   54.613702] Late current task rescheduling may be lost 
[   54.613709] WARNING: CPU: 0 PID: 574 at linux/kernel/sched/core.c:628 sched_resched_local_assert_allowed+0x86/0x90 
[   54.613714] Modules linked in: 
[   54.613717] CPU: 0 PID: 574 Comm: qemu-system-s39 Not tainted 5.11.0-rc4-next-20210121 #2601 
[   54.613721] Hardware name: IBM 3906 M04 704 (z/VM 7.1.0) 
[   54.613724] Krnl PSW : 0404e00180000000 0000000000d86bea (sched_resched_local_assert_allowed+0x8a/0x90) 
[   54.613730]            R:0 T:1 IO:0 EX:0 Key:0 M:1 W:0 P:0 AS:3 CC:2 PM:0 RI:0 EA:3 

This is because of a non-obvious merge conflict between 56e62a737028
("s390: convert to generic entry") and 845f44e8ef28 ("sched: Report local
wake up on resched blind zone within idle loop"). Can you include the attached patch
into linux-next?

Thanks,
Sven

