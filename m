Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8842D397CC5
	for <lists+linux-next@lfdr.de>; Wed,  2 Jun 2021 00:54:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234947AbhFAW40 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Jun 2021 18:56:26 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:24830 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234766AbhFAW4Z (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 1 Jun 2021 18:56:25 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 151MmHuZ169830;
        Tue, 1 Jun 2021 18:54:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=+wWzQP9rjd2CHTXRY5GoVE+0wcUvqFNy3Jyzv3lkdHE=;
 b=TSK7Z63wtUrrWNIj/b5fV4ZrQRQoBF5D+s4kN/kLVbQfbnGfND78eodJEHgExIVJrUVZ
 0Psa3FRBORWrWsVeGwyEeqnbSjS30XRMnUXht0Awd1FCnkL4uS64F4TFv7dvr2Pmp2Kg
 1IUZsVaBPUdv2euAVHgvmEnshlh7rNN0SXH6RhznXTm1B2pzKanNmX0WLgVY8EUcDhi/
 u8Zq2F+P8hG93u47Reqbjd4+7E9zT4bZf7EzljDVC+txM1Nw7pfNmjVyEkwGzRKWGbyq
 a7NWQVGGu3N6Ox+iXuvzejAUJ1fFKoS1qoEec2ig753oUki2vYWhR70ZuPwfZkMVC8Ky xg== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 38wx0hg2rg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 01 Jun 2021 18:54:36 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 151Mpje7193367;
        Tue, 1 Jun 2021 18:54:36 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
        by mx0a-001b2d01.pphosted.com with ESMTP id 38wx0hg2qy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 01 Jun 2021 18:54:36 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
        by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 151Mnaal009160;
        Tue, 1 Jun 2021 22:54:33 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
        by ppma04fra.de.ibm.com with ESMTP id 38ud88132f-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 01 Jun 2021 22:54:33 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 151MsVIJ33751436
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 1 Jun 2021 22:54:31 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 7915EA407E;
        Tue,  1 Jun 2021 22:54:31 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id E9329A4083;
        Tue,  1 Jun 2021 22:54:29 +0000 (GMT)
Received: from li-f45666cc-3089-11b2-a85c-c57d1a57929f.ibm.com (unknown [9.160.20.75])
        by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Tue,  1 Jun 2021 22:54:29 +0000 (GMT)
Message-ID: <1bb738125345283693fb41ea188e934b3d33ae75.camel@linux.ibm.com>
Subject: Re: linux-next: Fixes tag needs some work in the integrity tree
From:   Mimi Zohar <zohar@linux.ibm.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Mimi Zohar <zohar@linux.vnet.ibm.com>,
        Dmitry Kasatkin <dmitry.kasatkin@gmail.com>
Cc:     Roberto Sassu <roberto.sassu@huawei.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Date:   Tue, 01 Jun 2021 18:54:28 -0400
In-Reply-To: <20210602080742.1832f12c@canb.auug.org.au>
References: <20210602080742.1832f12c@canb.auug.org.au>
Content-Type: text/plain; charset="ISO-8859-15"
X-Mailer: Evolution 3.28.5 (3.28.5-14.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: M0wqmwW3InNGAISZxhDvFgOeAmKTtZrQ
X-Proofpoint-ORIG-GUID: QEa9AiUv7kOCYyL1L9W_xtUDW8TiYUmm
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-06-01_12:2021-06-01,2021-06-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 malwarescore=0 adultscore=0
 spamscore=0 impostorscore=0 clxscore=1011 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106010150
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 2021-06-02 at 08:07 +1000, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   9eea2904292c ("evm: Execute evm_inode_init_security() only when an HMAC key is loaded")
> 
> Fixes tag
> 
>   Fixes: 26ddabfe96b ("evm: enable EVM when X509 certificate is loaded")
> 
> has these problem(s):
> 
>   - SHA1 should be at least 12 digits long
> 
> Probably not worth rebasing for, but can be avoided in the future by
> setting core.abbrev to 12 (or more) or (for git v2.11 or later) just
> making sure it is not set (or set to "auto").

Stephen, thank you for catching the short hash.  It would be nice if
checkpatch would be updated to catch it.  I recently noticed
Documentation/process/submitting-patches.rst has directions for setting
up "--pretty=fixes".

thanks,

Mimi

