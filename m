Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACE2A2C3536
	for <lists+linux-next@lfdr.de>; Wed, 25 Nov 2020 01:08:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726489AbgKYAHB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 24 Nov 2020 19:07:01 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:48032 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726466AbgKYAHB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 24 Nov 2020 19:07:01 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AP04UgN094489;
        Wed, 25 Nov 2020 00:06:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to;
 s=corp-2020-01-29; bh=flgBnNNU+g2LwphjYEVQVDbTUWswVLicXqtOOaZ4HkY=;
 b=EqYVjFUDAoZ9bdbqb2cBBa29KmvGo1LUKjhu8MBi9KgjlluzemT47wofP+SEc1cy1OZQ
 ribJ6rMHHfeqn6FPo9Tk8rdPH6nl/LvUOsZVciOSsat3Dv8M1YPndYT8Rmo6z9IMcsIn
 LCZlOF7EjfsSOvbyQGOZXaq/OOMhpArsyAIo8U82s1Aizv1MQrbFDegfiSacqhD2lsa7
 hwdyknv2xJwXA9ExOox47XCvmGjjsLWSWtrQyXCMBS/uxAClVtEiweqX6sQfb+WqDcQp
 uNVdV9VvKu1/Fl0UAcYN+bOC6gkuXeRrKD7VVoo+AfQkHuoGxB84R7GkiPkWRgI2hAwh Jg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2130.oracle.com with ESMTP id 3514q8j51x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 25 Nov 2020 00:06:53 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AP04vVe036442;
        Wed, 25 Nov 2020 00:06:53 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3030.oracle.com with ESMTP id 34yctx56s1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 25 Nov 2020 00:06:53 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0AP06qQT006621;
        Wed, 25 Nov 2020 00:06:52 GMT
Received: from anon-dhcp-152.1015granger.net (/68.61.232.219)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 24 Nov 2020 16:06:51 -0800
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: linux-next: Signed-off-by missing for commit in the cel tree
From:   Chuck Lever <chuck.lever@oracle.com>
In-Reply-To: <20201125100342.4a758809@canb.auug.org.au>
Date:   Tue, 24 Nov 2020 19:06:50 -0500
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Message-Id: <C063DF43-7EB0-42BB-BCF7-C11C7235D28F@oracle.com>
References: <20201125100342.4a758809@canb.auug.org.au>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9815 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0
 malwarescore=0 spamscore=0 phishscore=0 mlxlogscore=999 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011240141
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9815 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 clxscore=1011
 impostorscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011240121
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



> On Nov 24, 2020, at 6:03 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> Hi all,
> 
> Commits
> 
>  287428e8d11f ("nfsd: skip some unnecessary stats in the v4 case")
>  6f76e787daea ("nfs: use change attribute for NFS re-exports")
>  9fb0a61fedf7 ("nfsd4: don't query change attribute in v2/v3 case")
> 
> are missing a Signed-off-by from their committers.

My bad. I assumed my SoB was not required because I didn't alter the
patch in any way.

But, now fixed in my public repo.


--
Chuck Lever



