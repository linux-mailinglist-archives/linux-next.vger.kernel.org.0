Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51A0BF2491
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2019 02:56:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727597AbfKGB45 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 6 Nov 2019 20:56:57 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:43094 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727328AbfKGB45 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 6 Nov 2019 20:56:57 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xA71s5YH187038;
        Thu, 7 Nov 2019 01:56:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : references : date : in-reply-to : message-id : mime-version :
 content-type; s=corp-2019-08-05;
 bh=hHR5/nxvketnU54a1k1e33bJv4PJgcmLZua+X2UwC5I=;
 b=eF/HmLvludviEdI7FYGvN0fyZo+Y58fqWFjoOYN4lACrGMPNnLKKcvTlYmCgbmlS2+MU
 fHFGW7QlbGrnA/m/v7g6mmk/V31asBxRb61FHsTZUzMNlPTvPVUrRQlH5jKZsvKJMG3z
 wJDdBmR3FJTkVGkszvM72/aiRUaNFOZRtuw9L3fiCEVgLZv0m4ZF1BA0OI+mlxz+MwzN
 MxWPrXo6QfyWFG+EqVlDB1OF/P54jZ7cKV7//fhikgUbzhSNeEKJVI2cHWm47GRh37c+
 hKpI8TmivpqiIrytuWVayss+yZdUdkkgDOtr5gu2ADeT8WMxmAN7r8fSwlNGQrhu8/f5 uQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 2w41w0tsjq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 07 Nov 2019 01:56:41 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xA71s3wG026240;
        Thu, 7 Nov 2019 01:56:40 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3030.oracle.com with ESMTP id 2w41w8g75p-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 07 Nov 2019 01:56:40 +0000
Received: from abhmp0022.oracle.com (abhmp0022.oracle.com [141.146.116.28])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xA71ub1N025231;
        Thu, 7 Nov 2019 01:56:37 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 06 Nov 2019 17:56:37 -0800
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     "Martin K. Petersen" <martin.petersen@oracle.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>,
        Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: manual merge of the scsi-fixes tree with Linus' tree
From:   "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
References: <20191106082239.5c4d139c@canb.auug.org.au>
Date:   Wed, 06 Nov 2019 20:56:34 -0500
In-Reply-To: <20191106082239.5c4d139c@canb.auug.org.au> (Stephen Rothwell's
        message of "Wed, 6 Nov 2019 08:22:39 +1100")
Message-ID: <yq1mud8zbxp.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.92 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9433 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=989
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1910280000 definitions=main-1911070018
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9433 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1910280000
 definitions=main-1911070018
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


Stephen,

[Looks like this mail didn't go out last night]

> 8437bb81853e claims to fix d81e9d494354, however the latter is not an
> ancestor of the former ...

Should be fixed now. d81e9d494354 was part of a series that went through
Jens' tree post -rc1.

-- 
Martin K. Petersen	Oracle Linux Engineering
