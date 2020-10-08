Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D8D5287D4A
	for <lists+linux-next@lfdr.de>; Thu,  8 Oct 2020 22:40:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728008AbgJHUkx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Oct 2020 16:40:53 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:53716 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726022AbgJHUkx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 8 Oct 2020 16:40:53 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 098Kdfkl057454;
        Thu, 8 Oct 2020 20:40:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : message-id : references : date : in-reply-to : mime-version :
 content-type; s=corp-2020-01-29;
 bh=wpJwDablKFFDfkEM7eTe80cS7DPSS3zt2y0g1uxH/c0=;
 b=pHBHNWDQiXPkCjzVDbq5ZOdeHmqPVoVjcnCxLE0pMvEKptiDiGX7lTYaIdtr/3olS6yi
 YfCLR7xfuiwWA7e3lyL+p6m0VHuO9yaD6jO3uMcFZPFiAX78l2l3Y2JyCllq/S6UjAGG
 Xl0K7me6rfX+cIknnni3FKElw5CgE+k1JNnRvAEnkS0ZDMa492wXz+AXMQ+9r+mIbkQv
 jAvQfCXOLA8wcMpgbgDJZ8MWubJy2aaPHQzm9bv0oZqRQOATa9pYtR40KY0XlfNnd0iS
 x5h6/xPm4em9FFlqOQb8ZFBB4faRxnYyiWWFaToE8ftabG4pwUYDPKvBQT7+ASWjDOX9 Mw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2120.oracle.com with ESMTP id 3429jmg5ab-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 08 Oct 2020 20:40:30 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 098KYtwb087014;
        Thu, 8 Oct 2020 20:40:30 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 3429kagsre-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 08 Oct 2020 20:40:29 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 098KeMso009103;
        Thu, 8 Oct 2020 20:40:22 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 08 Oct 2020 13:40:21 -0700
To:     Christoph Hellwig <hch@lst.de>
Cc:     Jens Axboe <axboe@kernel.dk>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        dm-devel@redhat.com, open list <linux-kernel@vger.kernel.org>,
        linux-block <linux-block@vger.kernel.org>,
        drbd-dev@tron.linbit.com,
        "open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)" 
        <linux-ide@vger.kernel.org>, linux-raid@vger.kernel.org,
        linux-mmc <linux-mmc@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        lkft-triage@lists.linaro.org, Song Liu <song@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        martin.petersen@oracle.com, Hannes Reinecke <hare@suse.de>
Subject: Re: [ Regressions ] linux next 20201008: blk_update_request: I/O
 error, dev sda, sector 0 op 0x1:(WRITE) flags 0x800 phys_seg 0 prio class
 0
From:   "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1zh4w1mrq.fsf@ca-mkp.ca.oracle.com>
References: <CA+G9fYtwisRJtN4ht=ApeWc1jWssDok-7y2wee6Z0kzMP-atKg@mail.gmail.com>
        <CA+G9fYseTYRWoHUNZ=j4mjFs9dDJ-KOD8hDy+RnyDPx75HcVWw@mail.gmail.com>
        <24c8ee4d-d5f7-e49f-cd0c-7cf50a5fd885@kernel.dk>
        <20201008203058.GA27821@lst.de>
Date:   Thu, 08 Oct 2020 16:40:18 -0400
In-Reply-To: <20201008203058.GA27821@lst.de> (Christoph Hellwig's message of
        "Thu, 8 Oct 2020 22:30:58 +0200")
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9768 signatures=668681
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1 adultscore=0
 phishscore=0 spamscore=0 mlxscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010080145
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9768 signatures=668681
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 suspectscore=1
 clxscore=1011 phishscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010080146
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


Christoph,

> On Thu, Oct 08, 2020 at 02:17:41PM -0600, Jens Axboe wrote:
>> Just for everyones edification, that would be these 9 patches from the
>> SCSI tree:
>
> I sent the fixes out a bit ago and Cced the reporters..

I do not have any libata-connected devices in the SCSI test setup so
things worked fine for me yesterday. I have a retired Nehalem server in
the rack which has a couple of ATA 500GB disk drives in it. I'll try to
see if I can add that to my test pool. Just for good measure.

In any case the fixes are now in my for-next branch:

b6ba9b0e201a scsi: core: Set sc_data_direction to DMA_NONE for no-transfer commands
9120ac54cce6 scsi: sr: Initialize ->cmd_len

-- 
Martin K. Petersen	Oracle Linux Engineering
