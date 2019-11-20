Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 599A51031AE
	for <lists+linux-next@lfdr.de>; Wed, 20 Nov 2019 03:39:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727348AbfKTCjV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 Nov 2019 21:39:21 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:47644 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726957AbfKTCjU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 19 Nov 2019 21:39:20 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAK2d8TY007296;
        Wed, 20 Nov 2019 02:39:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : references : date : in-reply-to : message-id : mime-version :
 content-type; s=corp-2019-08-05;
 bh=4X/c4NHPnj8g/WpZKl4NI7A40bV5gBFWeebHagXE1ao=;
 b=kSsgirbYxvhVUJrF4G0gN5OJANOlLUQnofKIpWTYM8czaAeaIA2dwYd63cX9Y1gn0unb
 ehUGjp1unxMBSM4RFHmSU2EpGM9Il03XVMDNd+HklDLsiqyiyN8t9hQRxdDRLEsn7Hlh
 ZNswxNJpg+ImHVp20AaJtWlSSGp/x57vK7Xy8VVC3sudEOn4HsCZBBpm/FNfjt52s9+o
 ewLUAP8WKq3B9V6l+h+tgX4a0FKvvd6/i56ohh1kfOsx08GIi6JDHzhHFxPj6MUJjlbx
 cP33lJ+L41HH0spjO00v+ABGGO4bNrEbdTFnGaR+IDS6b6HrvFYbE/ulynQDeRTLC/bw gw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 2wa8httsp0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 20 Nov 2019 02:39:13 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAK2Y7qM104845;
        Wed, 20 Nov 2019 02:39:13 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3020.oracle.com with ESMTP id 2wc09yerhp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 20 Nov 2019 02:39:13 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id xAK2dC1E005447;
        Wed, 20 Nov 2019 02:39:12 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 19 Nov 2019 18:39:12 -0800
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     "Martin K. Petersen" <martin.petersen@oracle.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Venkat Gopalakrishnan <venkatg@codeaurora.org>,
        Can Guo <cang@codeaurora.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the scsi-mkp tree
From:   "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
References: <20191119203043.67cc7d32@canb.auug.org.au>
Date:   Tue, 19 Nov 2019 21:39:10 -0500
In-Reply-To: <20191119203043.67cc7d32@canb.auug.org.au> (Stephen Rothwell's
        message of "Tue, 19 Nov 2019 20:30:43 +1100")
Message-ID: <yq1pnhnff01.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.92 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9446 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1911200022
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9446 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1911200023
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


Stephen,

> Commit
>
>   379c3789d023 ("scsi: ufs: Fix irq return code")
>
> is missing a Signed-off-by from its author.

Fixed, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
