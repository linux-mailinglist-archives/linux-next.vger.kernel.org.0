Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F085717BE40
	for <lists+linux-next@lfdr.de>; Fri,  6 Mar 2020 14:25:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727185AbgCFNZr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 6 Mar 2020 08:25:47 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:8522 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726524AbgCFNZr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 6 Mar 2020 08:25:47 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 026DLGl9087771
        for <linux-next@vger.kernel.org>; Fri, 6 Mar 2020 08:25:46 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2ykmr6e496-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Fri, 06 Mar 2020 08:25:46 -0500
Received: from localhost
        by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <imbrenda@linux.ibm.com>;
        Fri, 6 Mar 2020 13:25:43 -0000
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
        by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Fri, 6 Mar 2020 13:25:40 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
        by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 026DPcAu28180808
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 6 Mar 2020 13:25:38 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 8A7A2A4053;
        Fri,  6 Mar 2020 13:25:38 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id E6C3BA4057;
        Fri,  6 Mar 2020 13:25:37 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.0.1])
        by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Fri,  6 Mar 2020 13:25:37 +0000 (GMT)
From:   Claudio Imbrenda <imbrenda@linux.ibm.com>
To:     linux-next@vger.kernel.org, akpm@linux-foundation.org,
        jack@suse.cz, kirill@shutemov.name
Cc:     borntraeger@de.ibm.com, david@redhat.com, aarcange@redhat.com,
        linux-mm@kvack.org, frankja@linux.ibm.com, sfr@canb.auug.org.au,
        jhubbard@nvidia.com, linux-kernel@vger.kernel.org,
        linux-s390@vger.kernel.org
Subject: [PATCH v4 0/2] add callbacks for inaccessible pages
Date:   Fri,  6 Mar 2020 14:25:35 +0100
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20030613-0020-0000-0000-000003B11797
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20030613-0021-0000-0000-0000220957F9
Message-Id: <20200306132537.783769-1-imbrenda@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-03-06_04:2020-03-06,2020-03-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0 mlxlogscore=800
 priorityscore=1501 mlxscore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003060096
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

This patchset has a fixup for gup/mm, and provides the necessary arch
hooks to enable protected virtualization.

Andrew: please simply squash/fixup the first patch into the appropriate
one that is already in your tree.

v3-> v4:
* changed WARN_ON into VM_BUG_ON_PAGE as per review,
* and small improvement of the associated comment
v2 -> v3:
* revert some cosmetic changes to improve readability
* improve some comments
v1 -> v2:
* use put_compound_head in the first patch
* fix commit message of the second patch
* minor code cleanups
* some comments to explain why sometimes we are not doing things

Claudio Imbrenda (2):
  mm/gup: fixup for 9947ea2c1e608e32 "mm/gup: track FOLL_PIN pages"
  mm/gup/writeback: add callbacks for inaccessible pages

 include/linux/gfp.h |  6 ++++
 mm/gup.c            | 76 +++++++++++++++++++++++++++++----------------
 mm/page-writeback.c |  9 +++++-
 3 files changed, 64 insertions(+), 27 deletions(-)

-- 
2.24.1

