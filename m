Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 368681BD2BC
	for <lists+linux-next@lfdr.de>; Wed, 29 Apr 2020 05:01:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726536AbgD2DBB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 28 Apr 2020 23:01:01 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:59106 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726507AbgD2DBB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 28 Apr 2020 23:01:01 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03T2nVBl077258;
        Wed, 29 Apr 2020 03:00:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : references : date : in-reply-to : message-id : mime-version :
 content-type; s=corp-2020-01-29;
 bh=qUhCjByvOjfzhixiS4FU44bF5YsZ9dETXbiZPeNFf1g=;
 b=pZgbkwvoHDc1zc7bN7jIuvFaq8ZE+zpOL1DwD1JA5eaK2UghLN2gVYyx7Z4xgN/9Y7XC
 UNAFdiorNQ17sm34lkVmhtZFni77G9Gn40Fzi/+2Q5Qf9VfUkfQMocXA0uj/Mj/P2Hgy
 jePYovmhDQzg6CarLmE/Ai+9k0QRW8TU/3pvT7qDNgXXLv8f+RbgamhLE4OcqID+OIlL
 geIVcs5ecwey7S2kg1otRp2Ftms5okAgQOrCP5JqOtPOAaDoLxDMrvK7dyHK6hDk8AZR
 St4yzfsfVLzzuVGbOT/8g8F5T+7xyH0zrPnx5GC3NYr5DoUh4vKKu7N+z0yin+HSHT+C Bg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 30nucg3anv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 29 Apr 2020 03:00:49 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03T2ggWg071508;
        Wed, 29 Apr 2020 03:00:48 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3030.oracle.com with ESMTP id 30mxphq36e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 29 Apr 2020 03:00:48 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 03T30lX9030243;
        Wed, 29 Apr 2020 03:00:47 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 28 Apr 2020 20:00:46 -0700
To:     Tyrel Datwyler <tyreld@linux.ibm.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the scsi-fixes tree
From:   "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
References: <20200429092154.35958687@canb.auug.org.au>
        <ba29c840-e327-6f0b-b760-188aec566c6c@linux.ibm.com>
Date:   Tue, 28 Apr 2020 23:00:43 -0400
In-Reply-To: <ba29c840-e327-6f0b-b760-188aec566c6c@linux.ibm.com> (Tyrel
        Datwyler's message of "Tue, 28 Apr 2020 17:27:57 -0700")
Message-ID: <yq1mu6v8084.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.92 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9605 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=861 malwarescore=0
 mlxscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004290020
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9605 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1011 priorityscore=1501
 mlxlogscore=932 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 mlxscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004290020
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


Tyrel,

> Do you want me to resend, or can you fixup your tree?

I fixed it up.

-- 
Martin K. Petersen	Oracle Linux Engineering
