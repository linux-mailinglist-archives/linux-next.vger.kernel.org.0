Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0668C25CF24
	for <lists+linux-next@lfdr.de>; Fri,  4 Sep 2020 03:51:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728484AbgIDBve (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 3 Sep 2020 21:51:34 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:32770 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728311AbgIDBve (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 3 Sep 2020 21:51:34 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0841oHAR044024;
        Fri, 4 Sep 2020 01:51:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : message-id : references : date : in-reply-to : mime-version :
 content-type; s=corp-2020-01-29;
 bh=xTerveg1iM7HE8a+DezgguAb27685KYqWJzn3VkF2tg=;
 b=aktlAcIFOXohC+9B8MlRPIDBlIWpScAstl4WeVB+NMDfnqlc1qLQv588WkjVBqWhONJI
 ymu/pfI3wrltLIIXdy6ZNBM7Q+6xU7ar88gB6J8dyhprMxXxqhBuH9twppvLE0FNt9/q
 6RyN8ZN2uyVdYXPx2dKvQNC163oogM9dXTmr2HT056+uQK43wl8uXlGxTZ5CIzpQ5ctk
 7ppqEGqYffFg38bI54lkjdGao+u9yVFoGV5ZNadHdNnp5uXz3bxt0LwHU7jaGU0CDshc
 kel+DLtyd0nqvhxRkDk6D0Jf5fZ1wPC4ofUQmrpqWfRN4dIgjWqhPju3iuXL38rt3/Zq xg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 337eymkym5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 04 Sep 2020 01:51:23 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0841jmnG092059;
        Fri, 4 Sep 2020 01:51:23 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3030.oracle.com with ESMTP id 33b7v1mtu2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 04 Sep 2020 01:51:23 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0841pJuq026995;
        Fri, 4 Sep 2020 01:51:20 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 03 Sep 2020 18:51:19 -0700
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     "Martin K. Petersen" <martin.petersen@oracle.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tomas Henzl <thenzl@redhat.com>
Subject: Re: linux-next: Fixes tag needs some work in the scsi-fixes tree
From:   "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1lfhqb9aj.fsf@ca-mkp.ca.oracle.com>
References: <20200903184738.53f62617@canb.auug.org.au>
Date:   Thu, 03 Sep 2020 21:51:17 -0400
In-Reply-To: <20200903184738.53f62617@canb.auug.org.au> (Stephen Rothwell's
        message of "Thu, 3 Sep 2020 18:47:38 +1000")
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9733 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 spamscore=0
 mlxlogscore=950 phishscore=0 bulkscore=0 suspectscore=1 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009040014
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9733 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1 adultscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=972 mlxscore=0
 lowpriorityscore=0 clxscore=1011 spamscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009040014
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


Stephen,

>   Fixes: 320e77acb3 scsi: mpt3sas: Irq poll to avoid CPU hard lockups
>   Fixes: a6ffd5bf681 scsi: megaraid_sas: Call disable_irq from process IRQ poll

Ah, my regex missed the short SHAs due to the missing description
quotation marks. Fixed my script and fixed up the commits.

Thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
