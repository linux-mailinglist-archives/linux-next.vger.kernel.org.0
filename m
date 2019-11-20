Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA3111031A6
	for <lists+linux-next@lfdr.de>; Wed, 20 Nov 2019 03:36:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727343AbfKTCgP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 Nov 2019 21:36:15 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:38132 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727336AbfKTCgP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 19 Nov 2019 21:36:15 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAK2Y7Lt188176;
        Wed, 20 Nov 2019 02:35:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : references : date : in-reply-to : message-id : mime-version :
 content-type; s=corp-2019-08-05;
 bh=kMNB9Wd/qp0aU9VNTHv9rqi4duD2FBTzYcT8m9eYRzI=;
 b=mTnA4pH5LqzhXRNF3MV5F7ec5DKZAX7H+IrBqao+On56wvgkfBZ5jpFjWWpmF34v+gAi
 JBt0Cgv4Vn4emHWQes/GSybOMnmxgFAfSLDoYMJlKg5KA3DXw26XocouVIW2W3ATI5BR
 HvVbQXYS7jDR9Dol6VZVmWQQtpb41d8k3Seze1lE27vc+26mOIxJWaFQ989GZZ152c8B
 K0bEh5oNOs2M/00+7NZFgyp3fw7WOHoMRo9X1dJpFf3MGSFtI2sLIXQThu5cFymIGfdR
 1HvMixRu+Dri2f65L/LwEMatVo5+nDAzj0NfjJ2I5GxV7LtJ3KFTeE1KTiUQhMjMb/8q yg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 2wa92ptqaa-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 20 Nov 2019 02:35:57 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAK2XSRC122759;
        Wed, 20 Nov 2019 02:35:57 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 2wcemcsqm2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 20 Nov 2019 02:35:56 +0000
Received: from abhmp0022.oracle.com (abhmp0022.oracle.com [141.146.116.28])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xAK2Zstw024365;
        Wed, 20 Nov 2019 02:35:54 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 19 Nov 2019 18:35:54 -0800
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     "Martin K. Petersen" <martin.petersen@oracle.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Pan Bian <bianpan2016@163.com>
Subject: Re: linux-next: Fixes tag needs some work in the scsi-mkp tree
From:   "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
References: <20191119202821.2283a14c@canb.auug.org.au>
Date:   Tue, 19 Nov 2019 21:35:51 -0500
In-Reply-To: <20191119202821.2283a14c@canb.auug.org.au> (Stephen Rothwell's
        message of "Tue, 19 Nov 2019 20:28:21 +1100")
Message-ID: <yq1tv6zff5k.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.92 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9446 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=986
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1911200022
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9446 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1911200022
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


Stephen,

>   Fixes: 2a49a78ed3c ("[SCSI] qla4xxx: added IPv6 support.")
>
> has these problem(s):
>
>   - SHA1 should be at least 12 digits long

Fixed, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
