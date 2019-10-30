Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BDA4E9485
	for <lists+linux-next@lfdr.de>; Wed, 30 Oct 2019 02:19:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726099AbfJ3BTk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 29 Oct 2019 21:19:40 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:58362 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726094AbfJ3BTk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 29 Oct 2019 21:19:40 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9U1IZLg084462;
        Wed, 30 Oct 2019 01:19:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : references : date : in-reply-to : message-id : mime-version :
 content-type; s=corp-2019-08-05;
 bh=c5+lFQYw9MqkRlmXjHFM6qZOVPk1WfwxH8Y/qSrcCyc=;
 b=rnXjenJABMJmVwKEJoBb5fjue59Igo47X0nBU7oEB5RbTqGCZQde5keCZMvgHfnTOxWc
 +Xs+rznnnSc4/9a/5ovMfkOvuPEfchC0qqYwgGffg28KyUZFKt0VsHpgpwr8E25RcUsK
 7/MyTOdoAvhrQCbL+4SWWHyYpI47A6+0H9OXavzVT+CPV84R8xYJsMocYoB2vJK0Rieq
 uEH7oKsxKu8izj3dbPVrUkm8HJdHmsjnjrDSQ8SRUI6k7DTK3Bt+WB2pG0/vACPt7MVl
 F47AAtaSQpIAqCzsgUKTEKjjEmLJYdgD0UeGKYuAldKqoDJQWPdnUBaUL0LE4/BWw46P og== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 2vxwhfgmpr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 30 Oct 2019 01:19:21 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9U1IUgp054551;
        Wed, 30 Oct 2019 01:19:20 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3030.oracle.com with ESMTP id 2vxwj8yss8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 30 Oct 2019 01:19:20 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x9U1JEUM024685;
        Wed, 30 Oct 2019 01:19:19 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 29 Oct 2019 18:19:14 -0700
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ryan Attard <ryanattard@ryanattard.info>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: Re: linux-next: manual merge of the scsi tree with the rcu tree
From:   "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
References: <20191029150826.38c26ef8@canb.auug.org.au>
Date:   Tue, 29 Oct 2019 21:19:12 -0400
In-Reply-To: <20191029150826.38c26ef8@canb.auug.org.au> (Stephen Rothwell's
        message of "Tue, 29 Oct 2019 15:08:26 +1100")
Message-ID: <yq1pnif6ne7.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.92 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9425 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910300012
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9425 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910300013
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


Stephen,

> Today's linux-next merge of the scsi tree got a conflict in:
>
>   drivers/scsi/scsi_sysfs.c
>
> between commit:
>
>   81db81f82993 ("drivers/scsi: Replace rcu_swap_protected() with rcu_replace()")
>
> from the rcu tree and commit:
>
>   d188b0675b21 ("scsi: core: Add sysfs attributes for VPD pages 0h and 89h")
>
> from the scsi tree.

Yes, this was expected. Fix is fine, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
