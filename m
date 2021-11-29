Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47E9D46126C
	for <lists+linux-next@lfdr.de>; Mon, 29 Nov 2021 11:28:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233640AbhK2Kb4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 29 Nov 2021 05:31:56 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:56678 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232949AbhK2K34 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 29 Nov 2021 05:29:56 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AT8g2hV024506;
        Mon, 29 Nov 2021 10:26:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=DpQapP1iYdDs9/blA8KcABzBjpVNbUS1R/t6HOOXaKI=;
 b=huWPmO5IXvT+ZD9GVH9lh/R/1QFQkR504l/tJzIK+oJNv9GeQ2xpX1DjqurzCGr95YRx
 e0IJEJb4omrnfdCx6ANiOhEUbUDPt8FTmR4Iequ2KEEqxY7QOznpsbwoCiV3VUW0k55p
 Cm5cJJZ2c1mQfyX12whCqSOWefqrFmchq7zvJxMenfxL+HfThLjatRpGcvVNT7wwmfGR
 MmaSTGIpQEE+PKnNFLAUTOXUixAERB50ApzUpBV1O/VEyHFJzKJ76AxodnBN8hpXvctP
 80XxbPtbvLCxHvnbv3ffguvJRhw6pIbKVxRMEtVm6w8hp+cTsifgqE7NsLHNa4Ti+LRN 5g== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3cmujxtcch-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 29 Nov 2021 10:26:30 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
        by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1ATAESHf001089;
        Mon, 29 Nov 2021 10:26:28 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
        by ppma03ams.nl.ibm.com with ESMTP id 3ckca93ebw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 29 Nov 2021 10:26:28 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 1ATAQQDi24772880
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 29 Nov 2021 10:26:26 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 14C06A4068;
        Mon, 29 Nov 2021 10:26:26 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id E88C3A4065;
        Mon, 29 Nov 2021 10:26:24 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.195.37.93])
        by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Mon, 29 Nov 2021 10:26:24 +0000 (GMT)
Content-Type: text/plain;
        charset=us-ascii
Subject: Re: [linux-next] Read-only file system after boot (powerpc)
From:   Sachin Sant <sachinp@linux.vnet.ibm.com>
In-Reply-To: <20211129095947.GA32642@lst.de>
Date:   Mon, 29 Nov 2021 15:56:23 +0530
Cc:     linux-block@vger.kernel.org, linux-next@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, Jens Axboe <axboe@kernel.dk>
Message-Id: <2CD932C2-A553-4676-B73C-5A65198F73F2@linux.vnet.ibm.com>
References: <87F94FF1-5D9D-475B-B083-C101DDB7A108@linux.vnet.ibm.com>
 <20211129095947.GA32642@lst.de>
To:     Christoph Hellwig <hch@lst.de>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: bPKF31uG6UyOWzoO02wEdCcmEm-HtxG_
X-Proofpoint-GUID: bPKF31uG6UyOWzoO02wEdCcmEm-HtxG_
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-29_07,2021-11-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 mlxscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111290049
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


> On 29-Nov-2021, at 3:29 PM, Christoph Hellwig <hch@lst.de> wrote:
>=20
> Can you check if your tree already includes this commit:
>=20
> https://git.kernel.dk/cgit/linux-block/commit/?h=3Dfor-5.17/block&id=3D3f=
39d47d7ad858c024bd777f5f2a86fa7f6a9f14
>=20
> and if not see if that fixes the problem?

Thanks. Yes, this patch fixes the problem for me.

-Sachin

