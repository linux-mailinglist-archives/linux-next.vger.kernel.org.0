Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50C251BD112
	for <lists+linux-next@lfdr.de>; Wed, 29 Apr 2020 02:28:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726524AbgD2A2I (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 28 Apr 2020 20:28:08 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:60454 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726509AbgD2A2I (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 28 Apr 2020 20:28:08 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 03T04j9K134445;
        Tue, 28 Apr 2020 20:28:00 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
        by mx0a-001b2d01.pphosted.com with ESMTP id 30mhq8yc27-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 28 Apr 2020 20:28:00 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
        by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03T0GHjc032388;
        Wed, 29 Apr 2020 00:28:00 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com [9.57.198.26])
        by ppma04dal.us.ibm.com with ESMTP id 30mcu6rg59-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 29 Apr 2020 00:28:00 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com [9.57.199.106])
        by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 03T0RxjJ32375146
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 29 Apr 2020 00:27:59 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 2F7A628064;
        Wed, 29 Apr 2020 00:27:59 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 3A4D12805C;
        Wed, 29 Apr 2020 00:27:58 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.160.64.115])
        by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
        Wed, 29 Apr 2020 00:27:58 +0000 (GMT)
Subject: Re: linux-next: build warning after merge of the scsi-fixes tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200429092154.35958687@canb.auug.org.au>
From:   Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <ba29c840-e327-6f0b-b760-188aec566c6c@linux.ibm.com>
Date:   Tue, 28 Apr 2020 17:27:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200429092154.35958687@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.676
 definitions=2020-04-28_15:2020-04-28,2020-04-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 phishscore=0 clxscore=1011 adultscore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 mlxlogscore=884 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004280181
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 4/28/20 4:21 PM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the scsi-fixes tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
> 
> drivers/scsi/ibmvscsi/ibmvscsi.c: In function 'ibmvscsi_remove':
> drivers/scsi/ibmvscsi/ibmvscsi.c:2323:16: warning: unused variable 'flags' [-Wunused-variable]
>  2323 |  unsigned long flags;
>       |                ^~~~~
> 
> Introduced by commit
> 
>   5b77d181bee1 ("scsi: ibmvscsi: Fix WARN_ON during event pool release")
> 

Crud, artifact from removing the spinlock.

Martin,

Do you want me to resend, or can you fixup your tree?

-Tyrel
