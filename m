Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F4BA43B395
	for <lists+linux-next@lfdr.de>; Tue, 26 Oct 2021 16:06:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234914AbhJZOIl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Oct 2021 10:08:41 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:63905 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S233975AbhJZOIj (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 26 Oct 2021 10:08:39 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19QDk9bf026984;
        Tue, 26 Oct 2021 14:06:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : mime-version : content-type; s=pp1;
 bh=GP8CO/2jsR8SHNwqcsSjaXyiOqIp4oc3BF7XnJL/5pY=;
 b=qO0JMbbTbfscV8rkaFtDdTNO8fKrx8p17GvYZVrjGxB50mkJRGrx7frrSB+p+Uq0g1FD
 yy90tiTzO3z5kfd6FXqEovQx8jz2Mby2QU/XQ4Vfh8ZaA627DPFhvb95ca5D0LxpyxXv
 o4d0zy6A5cOHHRvglWTTaloDdRYnMTdLEEBv2BTuXsSLokAR1mIQMeE9aCNAXHbMRiZH
 ajWUCWlGG1VkOpjUjdWJZoP3hOM+wh/QNo1Yl55sJwcYZ6lfs7xWmxu/6X/zTanmYbwl
 mcsdGiyNEVTK69HV833pfwzSTXQkOZnBhVBWAZtgRnBpu8SLacQKThNWPPXgUnCxSedb BQ== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
        by mx0b-001b2d01.pphosted.com with ESMTP id 3bx59700ky-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 26 Oct 2021 14:06:02 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
        by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19QDsxew002847;
        Tue, 26 Oct 2021 14:06:01 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
        by ppma06ams.nl.ibm.com with ESMTP id 3bx4f16ams-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 26 Oct 2021 14:06:00 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
        by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 19QE5vZ260424492
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 26 Oct 2021 14:05:57 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 5C6C042041;
        Tue, 26 Oct 2021 14:05:57 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 1727642047;
        Tue, 26 Oct 2021 14:05:57 +0000 (GMT)
Received: from localhost (unknown [9.171.26.69])
        by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Tue, 26 Oct 2021 14:05:57 +0000 (GMT)
Date:   Tue, 26 Oct 2021 16:05:55 +0200
From:   Vasily Gorbik <gor@linux.ibm.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Alexander Gordeev <agordeev@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Mike Rapoport <rppt@kernel.org>, linux-next@vger.kernel.org
Subject: Upcoming merge conflict between akpm-current/current and s390 trees
Message-ID: <your-ad-here.call-01635257155-ext-6484@work.hours>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: KX05YV3QhWiTwpYS7oXNyeQ1a2Dv6QK4
X-Proofpoint-GUID: KX05YV3QhWiTwpYS7oXNyeQ1a2Dv6QK4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-26_04,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 malwarescore=0
 mlxlogscore=904 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110260081
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

updating s390 tree for linux-next today I hit a merge conflict with
akpm-current/current. Please find conflict resolution below.

Thank you

diff --cc arch/s390/kernel/setup.c
index 27454962c119,e738a45057ac..40405f2304f1
--- a/arch/s390/kernel/setup.c
+++ b/arch/s390/kernel/setup.c
@@@ -880,14 -878,12 +879,12 @@@ static void __init setup_randomness(voi
  {
  	struct sysinfo_3_2_2 *vmms;
  
- 	vmms = (struct sysinfo_3_2_2 *) memblock_phys_alloc(PAGE_SIZE,
- 							    PAGE_SIZE);
+ 	vmms = memblock_alloc(PAGE_SIZE, PAGE_SIZE);
  	if (!vmms)
  		panic("Failed to allocate memory for sysinfo structure\n");
- 
  	if (stsi(vmms, 3, 2, 2) == 0 && vmms->count)
  		add_device_randomness(&vmms->vm, sizeof(vmms->vm[0]) * vmms->count);
- 	memblock_phys_free((unsigned long)vmms, PAGE_SIZE);
 -	memblock_free_ptr(vmms, PAGE_SIZE);
++	memblock_free(vmms, PAGE_SIZE);
  }
  
  /*
