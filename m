Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 055FA953DE
	for <lists+linux-next@lfdr.de>; Tue, 20 Aug 2019 03:53:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728719AbfHTBx0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 19 Aug 2019 21:53:26 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:43700 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728669AbfHTBx0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 19 Aug 2019 21:53:26 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7K1nIqS119998;
        Tue, 20 Aug 2019 01:53:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : references : date : in-reply-to : message-id : mime-version :
 content-type; s=corp-2019-08-05;
 bh=kXcVFLF29jNfWxOuv6FVFTinvlFbhMHi73ncYZOE9Ug=;
 b=mb2fqhTzDV7CjwqbFS5SZR0xEWNr7R3CCaq5thV419MseYtF0PNQ/H8S3Bnv6jGxC1R+
 df15J0FFSPfqUPYeSZ8Y62hTEZ9dXnLi2zx1cI+nJXcG7AU91LnBAAFCYiePqD+yjByS
 LUqUBeBfVOV0e6pwE8d0Ec5zjWvOGM4nsedfqX6DhPDkjRvUbpipcsyWCd76oYuGmT++
 gg7qInx1dRJ0Q/n0429q4QpX8i0UQctDfnGmnG9wVcwG6PEcCL/aFfnY0S08QJgsENxb
 bjaU3TWkEesSCHUBFS2eUayhbuFaZe7YsNkdfSluLkfbJmopuRT8RRq9Z3qMRNxaHHfE Mw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 2ue90tb18q-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 20 Aug 2019 01:53:17 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7K1qiNP125140;
        Tue, 20 Aug 2019 01:53:17 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3020.oracle.com with ESMTP id 2ug268193m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 20 Aug 2019 01:53:17 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x7K1rGTK026354;
        Tue, 20 Aug 2019 01:53:16 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 19 Aug 2019 18:53:16 -0700
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     "Martin K. Petersen" <martin.petersen@oracle.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Martin Wilck <mwilck@suse.com>
Subject: Re: linux-next: Fixes tag needs some work in the scsi-mkp tree
From:   "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
References: <20190815202934.1fb36c38@canb.auug.org.au>
Date:   Mon, 19 Aug 2019 21:53:14 -0400
In-Reply-To: <20190815202934.1fb36c38@canb.auug.org.au> (Stephen Rothwell's
        message of "Thu, 15 Aug 2019 20:29:34 +1000")
Message-ID: <yq1mug4zjp1.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.92 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9354 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908200014
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9354 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908200013
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


Stephen,

> In commit
>
>   cff1191553d9 ("scsi: qla2xxx: cleanup trace buffer initialization")
>
> Fixes tag
>
>   Fixes: ad0a0b01f088 ("scsi: qla2xxx: Fix Firmware dump size for Extended
>
> has these problem(s):
>
>   - Subject has leading but no trailing parentheses
>   - Subject has leading but no trailing quotes
>
> Please don't split Fixes tags over more than one line.
>
> Fixes tag
>
>   Fixes: (a28d9e4ef997 "scsi: qla2xxx: Add support for multiple fwdump
>
> has these problem(s):
>
>   - No SHA1 recognised

Fixed these up. Thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
