Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C771173BFB
	for <lists+linux-next@lfdr.de>; Fri, 28 Feb 2020 16:43:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727175AbgB1Pnj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 28 Feb 2020 10:43:39 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:14802 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726954AbgB1Pnd (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 28 Feb 2020 10:43:33 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 01SFZeiG059312
        for <linux-next@vger.kernel.org>; Fri, 28 Feb 2020 10:43:32 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2yepwu2uxj-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Fri, 28 Feb 2020 10:43:32 -0500
Received: from localhost
        by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <imbrenda@linux.ibm.com>;
        Fri, 28 Feb 2020 15:43:29 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
        by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Fri, 28 Feb 2020 15:43:25 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
        by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 01SFgQ3b48365950
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 28 Feb 2020 15:42:26 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 3A054AE045;
        Fri, 28 Feb 2020 15:43:24 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 6CD88AE04D;
        Fri, 28 Feb 2020 15:43:23 +0000 (GMT)
Received: from p-imbrenda.emea.ibm.com (unknown [9.145.11.131])
        by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Fri, 28 Feb 2020 15:43:23 +0000 (GMT)
From:   Claudio Imbrenda <imbrenda@linux.ibm.com>
To:     linux-next@vger.kernel.org, akpm@linux-foundation.org
Cc:     borntraeger@de.ibm.com, david@redhat.com, aarcange@redhat.com,
        linux-mm@kvack.org, frankja@linux.ibm.com, sfr@canb.auug.org.au,
        jhubbard@nvidia.com, linux-kernel@vger.kernel.org,
        linux-s390@vger.kernel.org
Subject: [RFC v1 0/2] add callbacks for inaccessible pages
Date:   Fri, 28 Feb 2020 16:43:19 +0100
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20022815-0012-0000-0000-0000038B3506
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20022815-0013-0000-0000-000021C7E259
Message-Id: <20200228154322.329228-1-imbrenda@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-02-28_04:2020-02-28,2020-02-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=441 adultscore=0 mlxscore=0 suspectscore=0 clxscore=1011
 bulkscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002280124
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

This patchset has a fixup for gup/mm, and provides the necessary arch
hooks to enable protected virtualization.

Claudio Imbrenda (2):
  mm/gup: fixup for 9947ea2c1e608e32 "mm/gup: track FOLL_PIN pages"
  mm/gup/writeback: add callbacks for inaccessible pages

 include/linux/gfp.h |  6 ++++++
 mm/gup.c            | 24 ++++++++++++++++++++----
 mm/page-writeback.c |  5 +++++
 3 files changed, 31 insertions(+), 4 deletions(-)

-- 
2.24.1

