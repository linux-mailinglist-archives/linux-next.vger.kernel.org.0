Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70EA7E7E2E
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2019 02:49:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727379AbfJ2Bt0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Oct 2019 21:49:26 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:46716 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727364AbfJ2Bt0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Oct 2019 21:49:26 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9T1mn6S085568;
        Tue, 29 Oct 2019 01:49:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : references : date : in-reply-to : message-id : mime-version :
 content-type; s=corp-2019-08-05;
 bh=BwpL56zWq/DyfZTKkawyTy/VoYhLLKsZYiZWk9+XeG4=;
 b=Pbz4wDP9qK47sd+UlHmbfMR3sAcbeA0oh32YCSuQdVpKoX8XO48b0IfZs0nUosmVmthm
 JYN81VCbL2MDePWj4lYeyKOSbT61lsbCNoyNODldDV4n46xKAh+IXJa3PJ/8Deqk9JqC
 QYN6O4lm7AF3hDZE8r3sBg2ImjoUJYyGU5wKj0zhiP3noaNOeb8dKwVJXR0LieJ3dFw+
 nO/wm8J0ziZw4RhP6Md8jTwebZSS0j21+6+ht4HL6I7JnhAuB2WXNDj9RUsQ8gySDnpv
 V7f+cbsuRQTLA4Z/tA+cXadlID/Lzc8ggBcz/MZhS204cwCH/DgK/EQBv3E+r8+hdetT jw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2120.oracle.com with ESMTP id 2vvumfag7b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 29 Oct 2019 01:49:11 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9T1gq6A107620;
        Tue, 29 Oct 2019 01:49:11 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3020.oracle.com with ESMTP id 2vw09gu3nn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 29 Oct 2019 01:49:10 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x9T1n6qI020391;
        Tue, 29 Oct 2019 01:49:06 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 28 Oct 2019 18:49:06 -0700
To:     James Smart <jsmart2021@gmail.com>
Cc:     linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org, martin.petersen@oracle.com,
        sfr@canb.auug.org.au, Dick Kennedy <dick.kennedy@broadcom.com>
Subject: Re: [PATCH] lpfc: fix build error of lpfc_debugfs.c for vfree/vmalloc
From:   "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
References: <20191025182530.26653-1-jsmart2021@gmail.com>
Date:   Mon, 28 Oct 2019 21:49:04 -0400
In-Reply-To: <20191025182530.26653-1-jsmart2021@gmail.com> (James Smart's
        message of "Fri, 25 Oct 2019 11:25:30 -0700")
Message-ID: <yq1tv7s8gof.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.92 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9424 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=722
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910290017
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9424 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=821 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910290018
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


James,

> lpfc_debufs.c was missing include of vmalloc.h when compiled on PPC.
>
> Add missing header.

Applied to 5.5/scsi-queue, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
