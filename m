Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4BE698AE8
	for <lists+linux-next@lfdr.de>; Thu, 22 Aug 2019 07:47:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730914AbfHVFrI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 22 Aug 2019 01:47:08 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:56244 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728497AbfHVFrH (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 22 Aug 2019 01:47:07 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x7M5kcxD086942;
        Thu, 22 Aug 2019 01:46:55 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2uhmhrs6e7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 22 Aug 2019 01:46:55 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
        by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x7M5kU6f032463;
        Thu, 22 Aug 2019 05:46:55 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
        by ppma03dal.us.ibm.com with ESMTP id 2ue977182w-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 22 Aug 2019 05:46:55 +0000
Received: from b03ledav003.gho.boulder.ibm.com (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
        by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x7M5krml48824728
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 22 Aug 2019 05:46:53 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id D59906A04D;
        Thu, 22 Aug 2019 05:46:53 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id CFECC6A047;
        Thu, 22 Aug 2019 05:46:51 +0000 (GMT)
Received: from [9.124.31.100] (unknown [9.124.31.100])
        by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
        Thu, 22 Aug 2019 05:46:51 +0000 (GMT)
Message-ID: <1566452811.526.7.camel@abdul.in.ibm.com>
Subject: [linux-next][PPC][bisected c7d8b7][gcc 6.4.1] build error at
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c:1471
From:   Abdul Haleem <abdhalee@linux.vnet.ibm.com>
To:     linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        linux-next <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>, jgg@mellanox.com.hch,
        rcampbell@nvidia.com
Date:   Thu, 22 Aug 2019 11:16:51 +0530
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
 mlxlogscore=538 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908220061
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

Reverting the commit fixes the issue.

-- 
Regard's

Abdul Haleem
IBM Linux Technology Centre



