Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD3F2E7E89
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2019 03:28:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730591AbfJ2C2c (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Oct 2019 22:28:32 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:49038 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728497AbfJ2C2c (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Oct 2019 22:28:32 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9T2OaUF115353;
        Tue, 29 Oct 2019 02:28:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : references : date : in-reply-to : message-id : mime-version :
 content-type; s=corp-2019-08-05;
 bh=tyj9iPZVM1ln5cihhU5/f6DMh/yMMr/OY/pC8cBQitg=;
 b=YYAOcmdRHjx08QaYEy/3tDJzslpPlOuprEBAtLY+sd13exYNQYEVsjaGBC7xjYQgmb5e
 MC7OUT/uNXvZ1jZR3CwnchO+8QeBiRunZnkXadWvglHeD2WA1cHgQJqGLktyk0aA0zbk
 +VcX6pkFq9SbBNz1CxgG3L34coPUFaIh8EBuA8iI6U+aGjLrb/3KJjPpPhGi3PvUDc3e
 fWOA8DYZfCRRgJ7DU559YZHWSARIj3R+N0TZny4QWnilVP9nGUJhp9PfrsYa5qdgmiJe
 jU1Oolc/jbAosR1YMoZIMBhEIRLLQSoYgG93uduT8YeFid1hdso0YR40CjqMvKgJWbzB ZA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2120.oracle.com with ESMTP id 2vve3q5pec-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 29 Oct 2019 02:28:16 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9T2SCkv194128;
        Tue, 29 Oct 2019 02:28:15 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3020.oracle.com with ESMTP id 2vw09gvhek-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 29 Oct 2019 02:28:15 +0000
Received: from abhmp0022.oracle.com (abhmp0022.oracle.com [141.146.116.28])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x9T2S8JE004845;
        Tue, 29 Oct 2019 02:28:08 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 28 Oct 2019 19:28:08 -0700
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     "Martin K. Petersen" <martin.petersen@oracle.com>,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        James Smart <jsmart2021@gmail.com>
Subject: Re: linux-next: build failure after merge of the scsi-mkp tree
From:   "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
References: <20191025140736.0c9e9d64@canb.auug.org.au>
        <20191028164924.232e32e5@canb.auug.org.au>
Date:   Mon, 28 Oct 2019 22:28:03 -0400
In-Reply-To: <20191028164924.232e32e5@canb.auug.org.au> (Stephen Rothwell's
        message of "Mon, 28 Oct 2019 16:49:24 +1100")
Message-ID: <yq14kzs8evg.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.92 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9424 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=778
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910290025
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9424 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=880 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910290024
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


Stephen,

>> I have used the scsi-mkp tree from next-20191024 for today.
>
> This build failure now appears in the scsi tree build.  I have applied
> the fix from James Smart for today.

Should be fixed in my for-next now.

-- 
Martin K. Petersen	Oracle Linux Engineering
