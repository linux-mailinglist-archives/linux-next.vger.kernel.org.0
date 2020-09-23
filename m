Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67E47275846
	for <lists+linux-next@lfdr.de>; Wed, 23 Sep 2020 14:53:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbgIWMxL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 23 Sep 2020 08:53:11 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:59202 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726606AbgIWMxK (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 23 Sep 2020 08:53:10 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 08NCWvgP155709;
        Wed, 23 Sep 2020 08:53:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=pp1;
 bh=Z8mPk36VOce+KlKDpk8jJO4I7+ATiLIwcpb4W6Wl/mQ=;
 b=X10kQhDhAVJx9QlHu9KXpP16n0+0avj7fF2vo2AxUZva6aFKGF83CwVdIv9cuj6djNc6
 BtYzYGS23UamJ4SP4pX0oRSRlapYUQlX+9/b/mnj7fWwjADhK5xjHr2jRxAtG4h+dDnl
 lAMZya9iXkFMW36DvyA6ky8vdSi1gUIDM8I8QwRmz19I9T1Vk5giql7c6jXYME3SZvPT
 twpJ/MTPEozK2tJ7cQNNkucnrnBThh3x/Jscgc3wqLrxbYuoDk84fG8/sCplztzH22Id
 lVrcxt7+BAhxPKyKEsv028mmvhpt9SpdGsyElu5Yv6Krk6SgcAPCXlVla1fchPyv+xue 9A== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
        by mx0b-001b2d01.pphosted.com with ESMTP id 33r5dy2p90-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 23 Sep 2020 08:53:06 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
        by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08NChkh9019993;
        Wed, 23 Sep 2020 12:53:04 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
        by ppma05fra.de.ibm.com with ESMTP id 33n9m7t5bh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 23 Sep 2020 12:53:04 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
        by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 08NCr1XF23068940
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 23 Sep 2020 12:53:01 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 3E14642047;
        Wed, 23 Sep 2020 12:53:01 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 7BAC94203F;
        Wed, 23 Sep 2020 12:53:00 +0000 (GMT)
Received: from marcibm (unknown [9.145.64.218])
        by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Wed, 23 Sep 2020 12:53:00 +0000 (GMT)
From:   Marc Hartmayer <mhartmay@linux.ibm.com>
To:     Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Christian Borntraeger <borntraeger@de.ibm.com>,
        Marc Hartmayer <mhartmay@linux.ibm.com>,
        Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Block Mailing List <linux-block@vger.kernel.org>,
        Linux SCSI Mailing List <linux-scsi@vger.kernel.org>
Subject: linux-next: possible bug in 'block: remove the BIO_NULL_MAPPED flag'
Date:   Wed, 23 Sep 2020 14:52:59 +0200
Message-ID: <87tuvo8xjo.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-23_07:2020-09-23,2020-09-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=999
 impostorscore=0 clxscore=1011 phishscore=0 bulkscore=0 malwarescore=0
 suspectscore=1 priorityscore=1501 adultscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009230098
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Christoph, Jens,

I found an interesting bug in my KVM guest (tested on s390x). The guest
uses a virtio-scsi disk and the current linux-next kernel. The problem
is that I cannot get the SCSI ID of the attached SCSI disk. Running the
command `lsscsi --scsi_id` in the guest returns:

root@qemus390x:~# lsscsi --scsi_id
[0:0:0:0]    disk    Linux    scsi_debug       0190  /dev/sda   -

but the expected result is something like:

root@qemus390x:~# lsscsi --scsi_id
[0:0:0:0]    disk    Linux    scsi_debug       0190  /dev/sda   33333333000002710

Also there is no /dev/disk/by-id/scsi-* path created. I bisected the
problem to...

commit f3256075ba49d80835b601bfbff350a2140b2924 (HEAD, refs/bisect/bad)
Author: Christoph Hellwig <hch@lst.de>
Date:   Thu Aug 27 17:37:45 2020 +0200

    block: remove the BIO_NULL_MAPPED flag

When I reverted this commit the problem was gone. Any ideas what the
problem is? Thanks in advance.

Best regards,
 Marc
