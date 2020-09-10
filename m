Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0948263A7D
	for <lists+linux-next@lfdr.de>; Thu, 10 Sep 2020 04:30:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730339AbgIJC3z (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Sep 2020 22:29:55 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:57712 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730324AbgIJC14 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 9 Sep 2020 22:27:56 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08A2PZkS114583;
        Thu, 10 Sep 2020 02:27:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : message-id : references : date : in-reply-to : mime-version :
 content-type; s=corp-2020-01-29;
 bh=9Ibs7xWJTEoFALDAJQCCP9M59JmFkAkVy3lEm4PabJs=;
 b=FD2ji85HIJiDkq37oNgiXWtPe0WdfYEe1ZeYqlSm8zAu4AduTGZUd+wY3fkIicK+x172
 vBZQlD8ojp3ToHwBcQYMywHKBzy7uofdhXl5YUgGBWwmV/CYCa7LwUy+wq/MPDW2cOuy
 5bAWieUnyrPmns282VnfofjU/j5fFaSX4HL+2QztoytFzbDXpjjUATFyjH4O49BihRUi
 9rAlA5vxFfvU246O4o/hFJm/4ljhhwF5WUWe53jCm15PdT/89scZJ5Fb/JyKVEN1oqr+
 3CJ9xlEGl0pcid0a/fHba2HHx5QBuaO7dw2vHMsbosDjAFJudg/ZVT4UiyO8H77I6L1x IA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2130.oracle.com with ESMTP id 33c23r5b0p-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 10 Sep 2020 02:27:44 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08A2QOhJ131789;
        Thu, 10 Sep 2020 02:27:44 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3030.oracle.com with ESMTP id 33cmkyyqat-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 10 Sep 2020 02:27:44 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 08A2RdLP011989;
        Thu, 10 Sep 2020 02:27:40 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 09 Sep 2020 19:27:38 -0700
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        "'Stephen Rothwell'" <sfr@canb.auug.org.au>,
        "'Linux Next Mailing List'" <linux-next@vger.kernel.org>,
        "'Linux Kernel Mailing List'" <linux-kernel@vger.kernel.org>,
        "'linux-scsi'" <linux-scsi@vger.kernel.org>,
        "'Santosh Yaraganavi'" <santosh.sy@samsung.com>,
        "'Vinayak Holikatti'" <h.vinayak@samsung.com>,
        "'Seungwon Jeon'" <essuuj@gmail.com>
Subject: Re: linux-next: Tree for Jul 20 (scsi/ufs/exynos)
From:   "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1a6xy2wph.fsf@ca-mkp.ca.oracle.com>
References: <20200720194225.17de9962@canb.auug.org.au>
        <CGME20200720164116epcas5p2021c67d1778e737d7c695f6bdbc5b2d4@epcas5p2.samsung.com>
        <e6112633-61c9-fa80-8479-fe90bb360868@infradead.org>
        <06a601d65f86$3d8aeee0$b8a0cca0$@samsung.com>
        <f72b8022-1ebd-c5a1-2fe2-a3e93854fd0e@infradead.org>
Date:   Wed, 09 Sep 2020 22:27:36 -0400
In-Reply-To: <f72b8022-1ebd-c5a1-2fe2-a3e93854fd0e@infradead.org> (Randy
        Dunlap's message of "Wed, 9 Sep 2020 13:04:24 -0700")
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9739 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 suspectscore=1
 spamscore=0 mlxlogscore=921 adultscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009100021
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9739 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 priorityscore=1501
 mlxlogscore=928 mlxscore=0 bulkscore=0 suspectscore=1 spamscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1011
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009100021
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


Randy,

> I am still seeing this in linux-next of 20200909.
> Was there a patch posted that I missed and is not applied anywhere yet?

This patch became a victim of dropping the Exynos changes in 5.9. I have
added it back in.

-- 
Martin K. Petersen	Oracle Linux Engineering
