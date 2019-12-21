Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 369DC128ADE
	for <lists+linux-next@lfdr.de>; Sat, 21 Dec 2019 19:44:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726736AbfLUSn7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 21 Dec 2019 13:43:59 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:35022 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726107AbfLUSn7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 21 Dec 2019 13:43:59 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xBLIdSNh077229;
        Sat, 21 Dec 2019 18:43:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : references : date : in-reply-to : message-id : mime-version :
 content-type; s=corp-2019-08-05;
 bh=UfzN2UDX4fWPogNdGu4QDs5N7abpWGeCYkezLSfi6/Y=;
 b=BrE51O8dUAvh/5SKWowqAGILbsV9MihD+NSfBPqA31XhBcnf5Yc9yBOG5kaC76/EcNc5
 Od16kbO7p3MPy2f4BLbT8HEefJ8mljvOlOxS9f5f1w2F8/rQ8xRBFSpTKzfYE4YqlTag
 uq2YEm5OhMWK134eJvUmHy5a40WyEZhPN+I5X/nW2/PGNaOLxG+rk7vPweUlL+G4PpVm
 FJOsUbMiEhjNOIclUnOLHcnxXUoJsdbuQ3TfvAo/Sj8FO8NYuxyDKNgJYWselbnmCi1G
 0A3BuMZeR71S3IoqXZKWymACIglJcVTykOuQ8qoQPQBZFOiOmYRCXSMB9MHfXqcmou+X 6Q== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2120.oracle.com with ESMTP id 2x1bbphj7c-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 21 Dec 2019 18:43:45 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xBLIhhHr103190;
        Sat, 21 Dec 2019 18:43:45 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3030.oracle.com with ESMTP id 2x19f5khjb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 21 Dec 2019 18:43:45 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id xBLIhgJ9006244;
        Sat, 21 Dec 2019 18:43:42 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Sat, 21 Dec 2019 10:43:41 -0800
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     "Martin K. Petersen" <martin.petersen@oracle.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Quinn Tran <qutran@marvell.com>,
        Himanshu Madhani <hmadhani@marvell.com>
Subject: Re: linux-next: Fixes tag needs some work in the scsi-mkp tree
From:   "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
References: <20191220161908.10b18dcf@canb.auug.org.au>
Date:   Sat, 21 Dec 2019 13:43:39 -0500
In-Reply-To: <20191220161908.10b18dcf@canb.auug.org.au> (Stephen Rothwell's
        message of "Fri, 20 Dec 2019 16:19:08 +1100")
Message-ID: <yq1y2v57c4k.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.92 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9478 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1912210165
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9478 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1912210164
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


Stephen,

> Fixes tag
>
>   Fixes: 974950710e2a ("qla2xxx: Fix stuck login session")
>
> has these problem(s):
>
>   - Target SHA1 does not exist
>
> Did you mean
>
> Fixes: ce0ba496dccf ("scsi: qla2xxx: Fix stuck login session")

Fixed, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
