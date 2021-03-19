Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34717341F64
	for <lists+linux-next@lfdr.de>; Fri, 19 Mar 2021 15:31:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230129AbhCSObC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 19 Mar 2021 10:31:02 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:5774 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229736AbhCSOaz (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 19 Mar 2021 10:30:55 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12JE3ggL170815;
        Fri, 19 Mar 2021 10:30:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=nPYk32jb71QEmloYR5iZ0vl+OlgkRWqpOAxJYikM4XA=;
 b=GPn8xSYI6EhiIY9q+dHIDG5s6bv28rKyO9YUHwrFXg+VKFTeRRP3E3Ve22zhDv6jQjAP
 8H+5colOftAvq2cnbHc1Z+RFEtS5yXXOAHp/l1t6DXP25JFr7QdNLbCgwh8OLjx6C82G
 yLR9DmHCCIJ1iF6DSCV7jI4CvWTCALRwLss78NUUqlQ5Bf2FbLkO7l53cNW6fcN39FTd
 Dw2YUbuth8azJgbLyV3ObFT/ip5Id9Jm8c4yCTbZVI7OXsVM3vg4TzcAyFILAbe8Td4Z
 j1saSoTWSmRcdUazSaG5FcJnK4M3h4/1anmd18AL6aiWNM1gz8BSKx07cdBfW8GaZ6Po 9A== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0b-001b2d01.pphosted.com with ESMTP id 37byr4gchy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 19 Mar 2021 10:30:38 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12JE3th4172598;
        Fri, 19 Mar 2021 10:30:38 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
        by mx0b-001b2d01.pphosted.com with ESMTP id 37byr4gcgs-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 19 Mar 2021 10:30:38 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
        by ppma06fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12JEME5s014362;
        Fri, 19 Mar 2021 14:30:36 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
        by ppma06fra.de.ibm.com with ESMTP id 378mnhb2ym-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 19 Mar 2021 14:30:36 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
        by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 12JEUGx031719694
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 19 Mar 2021 14:30:16 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 0FEF8A4060;
        Fri, 19 Mar 2021 14:30:33 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 8B698A4054;
        Fri, 19 Mar 2021 14:30:32 +0000 (GMT)
Received: from osiris (unknown [9.171.14.194])
        by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Fri, 19 Mar 2021 14:30:32 +0000 (GMT)
Date:   Fri, 19 Mar 2021 15:30:31 +0100
From:   Heiko Carstens <hca@linux.ibm.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Miguel Ojeda <ojeda@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: linux-next: Tree for Mar 19
Message-ID: <YFS1h6h+71sRlwFR@osiris>
References: <20210319175950.509fcbd0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210319175950.509fcbd0@canb.auug.org.au>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-19_06:2021-03-19,2021-03-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 suspectscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103190101
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Mar 19, 2021 at 05:59:50PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Warning: Some of the branches in linux-next may still based on v5.12-rc1,
> so please be careful if you are trying to bisect a bug.
> 
> News: if your -next included tree is based on Linus' tree tag
> v5.12-rc1{,-dontuse} (or somewhere between v5.11 and that tag), please
> consider rebasing it onto v5.12-rc2. Also, please check any branches
> merged into your branch.
> 
> Changes since 20210318:
> 
> The net-next tree gained a conflict against the net tree.
> 
> The amdgpu tree gained a build failure so I used the version from
> next-20210318.
> 
> The security tree gained a conflict against the ext3 tree.
> 
> The rcu tree lost its build failure.
> 
> The akpm-current tree still had its build failure for which I applied
> a hack.
> 
> The akpm tree gained a conflict against the security tre.
> 
> Non-merge commits (relative to Linus' tree): 5051
>  4781 files changed, 329814 insertions(+), 90904 deletions(-)
...
> Merging rust/rust-next (8ef6f74a3571 Rust support)

This breaks now on s390 with commit 8ef6f74a3571 ("Rust support").
make modules_install / depmod now fails with:

depmod: WARNING: /.../lib/modules/5.12.0-rc3-00001-g8ef6f74a3571/kernel/drivers/s390/scsi/zfcp.ko needs unknown symbol

for every module (yes, the line is complete).
