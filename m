Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD88122B216
	for <lists+linux-next@lfdr.de>; Thu, 23 Jul 2020 17:03:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727916AbgGWPDf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 23 Jul 2020 11:03:35 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:33418 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727108AbgGWPDf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 23 Jul 2020 11:03:35 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06NF2ZNi044266;
        Thu, 23 Jul 2020 15:03:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : message-id : references : date : in-reply-to : mime-version :
 content-type; s=corp-2020-01-29;
 bh=L6YMu5hMIyONs163kBUsQtc+IsC5DQJqhzfU8lanX1o=;
 b=OxdHgVkuuWhyf2dp06bQtEnEQBWqhg40pozko6piztSlwsH3ACxJqrKpDvkJUwNY9fZm
 osupjqKm50GdqLJZ+ltP1Jhvn+U4Kp8ZQFITy981+Eh4CERhmUZdShlhTCCsnt2Z7iVh
 1B03PaTT88GWiGlEijqaWWiXNwrDH8lfZu0Ig+qqqPSwgR0HCjUlbtR9evDYS+1iLpud
 4v2CH6YsTyE6poW75ar3iGXYevSze3Rj/iXiPxLoR+r2F60WF46bwsfj2nACSWFpCwyN
 H1XGa2+cNEZLAFeaSexkOgYd+emZp8CVZlQZmIOc5WP9q9JgRFdZ3kI8py3aXZggOGNP rA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2130.oracle.com with ESMTP id 32brgrsx57-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 23 Jul 2020 15:03:18 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06NEx8aR112243;
        Thu, 23 Jul 2020 15:01:18 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3030.oracle.com with ESMTP id 32fb8gxn5x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 23 Jul 2020 15:01:18 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 06NF1FB0011054;
        Thu, 23 Jul 2020 15:01:17 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 23 Jul 2020 08:01:15 -0700
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     "Martin K. Petersen" <martin.petersen@oracle.com>,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kiwoong Kim <kwmad.kim@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: linux-next: build failure after merge of the scsi-mkp tree
From:   "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1mu3qe0wm.fsf@ca-mkp.ca.oracle.com>
References: <20200721163045.50c205a5@canb.auug.org.au>
        <20200723155452.6dccd510@canb.auug.org.au>
Date:   Thu, 23 Jul 2020 11:01:10 -0400
In-Reply-To: <20200723155452.6dccd510@canb.auug.org.au> (Stephen Rothwell's
        message of "Thu, 23 Jul 2020 15:54:52 +1000")
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9691 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 bulkscore=0 malwarescore=0 mlxscore=0 spamscore=0 phishscore=0
 suspectscore=1 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007230112
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9691 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 spamscore=0
 impostorscore=0 suspectscore=1 adultscore=0 clxscore=1011 mlxlogscore=999
 priorityscore=1501 phishscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007230112
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


Stephen,

>> ERROR: modpost: "exynos_ufs_dump_info" [drivers/scsi/ufs/ufs-exynos.ko] undefined!
>> ERROR: modpost: "exynos_ufs_init_dbg" [drivers/scsi/ufs/ufs-exynos.ko] undefined!
>> ERROR: modpost: "exynos_ufs_cmd_log_start" [drivers/scsi/ufs/ufs-exynos.ko] undefined!

*sigh* sorry about that. I did verify yesterday's exynos build fix with
COMPILE_TEST but it looks like I didn't have the new driver debugging
option enabled.

Kiwoong/Alim: Please fix!

-- 
Martin K. Petersen	Oracle Linux Engineering
