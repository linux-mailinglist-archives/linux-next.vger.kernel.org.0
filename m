Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46A4A98AFB
	for <lists+linux-next@lfdr.de>; Thu, 22 Aug 2019 07:59:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731436AbfHVFxl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 22 Aug 2019 01:53:41 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:40084 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729854AbfHVFxl (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 22 Aug 2019 01:53:41 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x7M5qM56089297;
        Thu, 22 Aug 2019 01:53:28 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2uhm1cabje-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 22 Aug 2019 01:53:27 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
        by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x7M5o1kO030793;
        Thu, 22 Aug 2019 05:53:26 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
        by ppma04wdc.us.ibm.com with ESMTP id 2ufye0eneq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 22 Aug 2019 05:53:26 +0000
Received: from b03ledav005.gho.boulder.ibm.com (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
        by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x7M5rOeZ50921898
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 22 Aug 2019 05:53:24 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 4C09EBE04F;
        Thu, 22 Aug 2019 05:53:24 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 523A9BE053;
        Thu, 22 Aug 2019 05:53:22 +0000 (GMT)
Received: from [9.124.31.100] (unknown [9.124.31.100])
        by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
        Thu, 22 Aug 2019 05:53:21 +0000 (GMT)
Message-ID: <1566453201.526.9.camel@abdul.in.ibm.com>
Subject: [linux-next][PPC][bisected c7d8b7][gcc 6.4.1] build error at
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c:1471
From:   Abdul Haleem <abdhalee@linux.vnet.ibm.com>
To:     linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        linux-next <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>, jgg@mellanox.com,
        rcampbell <rcampbell@nvidia.com>
Date:   Thu, 22 Aug 2019 11:23:21 +0530
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-08-22_04:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=514 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908220062
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Greeting's

Today's linux-next kernel 5.3.0-rc5-next-20190820 failed to build on my
powerpc machine

Build errors:
drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c: In function amdgpu_exit:
drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c:1471:2: error: implicit
declaration of function mmu_notifier_synchronize
[-Werror=implicit-function-declaration]
  mmu_notifier_synchronize();
  ^~~~~~~~~~~~~~~~~~~~~~~~ 
cc1: some warnings being treated as errors
make[4]: *** [drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o] Error 1
make[3]: *** [drivers/gpu/drm/amd/amdgpu] Error 2

It was introduced with commit c7d8b7 (hmm: use mmu_notifier_get/put for
'struct hmm')

error disappears when commit is reverted.

-- 
Regard's

Abdul Haleem
IBM Linux Technology Centre



