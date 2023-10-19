Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 615C37CFE99
	for <lists+linux-next@lfdr.de>; Thu, 19 Oct 2023 17:46:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346360AbjJSPq6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 19 Oct 2023 11:46:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346423AbjJSPq5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 19 Oct 2023 11:46:57 -0400
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E91C113E
        for <linux-next@vger.kernel.org>; Thu, 19 Oct 2023 08:46:54 -0700 (PDT)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39JFiYA8025128;
        Thu, 19 Oct 2023 15:46:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : mime-version : content-type; s=pp1;
 bh=i04QYZheeZR2FWtEC6W80ZW9/4fsi/AEtlw+BXIT+Oc=;
 b=Gs2PbOnqC3Nj+5ksG4Wx5K1tKZpaRC1e9pvNnnAxoZLGbSkO73oF5RHnnHbsKpxXJnF4
 MTyNXSjmGoe6yIZY4rZBe9GgfiZypMqQuiM+kjDlCH6T6oLC2zsd4r2LctBfhosxvemX
 c/oROsgxy7l9WUSz3Dt6hqWeoP8b/fxCWkWQdxPfSwvpf/i1KdwhfSDLGJvAZKQGGJtV
 8MVh6FPtOXZJ+nXjlmtcyY2OSuSvEj81nrbA/VtmPIxf615laW9Lhg6vMoxZgnON4DnD
 H0kuBf5tKEqcjyPG2eRMDma41EGJ4D9fg8Y6wMIXkK9LX+pcUdKsjXeK6ubCRG7NV+Vm nQ== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tu7c108du-15
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 19 Oct 2023 15:46:44 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
        by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39JDXYLk027394;
        Thu, 19 Oct 2023 15:17:36 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
        by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tr5asswqy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 19 Oct 2023 15:17:36 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
        by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39JFHXPs21234388
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 19 Oct 2023 15:17:33 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 5B1CD20043;
        Thu, 19 Oct 2023 15:17:33 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id ED2BA20040;
        Thu, 19 Oct 2023 15:17:32 +0000 (GMT)
Received: from localhost (unknown [9.171.19.124])
        by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
        Thu, 19 Oct 2023 15:17:32 +0000 (GMT)
Date:   Thu, 19 Oct 2023 17:17:31 +0200
From:   Vasily Gorbik <gor@linux.ibm.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Joerg Roedel <jroedel@suse.de>,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Upcoming merge conflict between s390 fixes and iommu trees
Message-ID: <your-ad-here.call-01697728651-ext-4593@work.hours>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Kl2XJ_7CSZ2y7zldMQHOJ4Xbps58YbKm
X-Proofpoint-GUID: Kl2XJ_7CSZ2y7zldMQHOJ4Xbps58YbKm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-19_15,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 mlxlogscore=580 clxscore=1011 malwarescore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 bulkscore=0 spamscore=0
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310190132
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,
Hi Joerg,

I've just picked up commit
c1ae1c59c8c6 ("s390/pci: fix iommu bitmap allocation")
into the s390 fixes branch to still make it into v6.6 (and eventually
get into stable).

It will get conflicts in arch/s390/pci/pci_dma.c with commit
c76c067e488c ("s390/pci: Use dma-iommu layer")
from iommu tree, which is targeting the v6.7 merge window.

The latter commit removes arch/s390/pci/pci_dma.c, so that's
the way to go for the conflict resolution. Joerg, I believe it's your
decision whether you would like to mention this trivial merge conflict in
your pull request to Linus later.

Thank you.
