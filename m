Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C031F17C1D7
	for <lists+linux-next@lfdr.de>; Fri,  6 Mar 2020 16:31:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726462AbgCFPaw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 6 Mar 2020 10:30:52 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:54008 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726259AbgCFPaw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 6 Mar 2020 10:30:52 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 026FK4Bk070503;
        Fri, 6 Mar 2020 10:30:44 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2yk8hn010j-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 06 Mar 2020 10:30:44 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
        by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 026FUavg026764;
        Fri, 6 Mar 2020 15:30:43 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com [9.57.198.27])
        by ppma03dal.us.ibm.com with ESMTP id 2yffk89jx2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 06 Mar 2020 15:30:43 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com [9.57.199.107])
        by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 026FUguc32375148
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 6 Mar 2020 15:30:42 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id AF71D124058;
        Fri,  6 Mar 2020 15:30:42 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 6608A124054;
        Fri,  6 Mar 2020 15:30:42 +0000 (GMT)
Received: from oc6034535106.ibm.com (unknown [9.10.86.157])
        by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
        Fri,  6 Mar 2020 15:30:42 +0000 (GMT)
Subject: Re: linux-next: build warning after merge of the scsi-mkp tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
Cc:     "Martin K. Petersen" <martin.petersen@oracle.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200302133543.7052d654@canb.auug.org.au>
 <5bff0f26-3b20-e240-e1b4-65af411a3a56@linux.vnet.ibm.com>
 <20200306155209.34e85ab2@canb.auug.org.au>
From:   Brian King <brking@linux.vnet.ibm.com>
Message-ID: <a2fdf25f-5ec1-5997-ad6f-33b1c000d6a8@linux.vnet.ibm.com>
Date:   Fri, 6 Mar 2020 09:30:42 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200306155209.34e85ab2@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-03-06_04:2020-03-06,2020-03-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003060108
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 3/5/20 10:52 PM, Stephen Rothwell wrote:
> Hi all,
> 
> On Mon, 2 Mar 2020 08:36:20 -0600 Brian King <brking@linux.vnet.ibm.com> wrote:
>>
>> On 3/1/20 8:35 PM, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> After merging the scsi-mkp tree, today's linux-next build (powerpc
>>> ppc64_defconfig) produced this warning:
>>>
>>> In file included from include/uapi/linux/posix_types.h:5,
>>>                  from include/uapi/linux/types.h:14,
>>>                  from include/linux/types.h:6,
>>>                  from include/linux/list.h:5,
>>>                  from include/linux/module.h:12,
>>>                  from drivers/scsi/ibmvscsi/ibmvfc.c:10:
>>> drivers/scsi/ibmvscsi/ibmvfc.c: In function 'ibmvfc_tgt_implicit_logout_and_del':
>>> include/linux/stddef.h:8:14: warning: 'return' with a value, in function returning void [-Wreturn-type]
>>>     8 | #define NULL ((void *)0)
>>>       |              ^
>>> drivers/scsi/ibmvscsi/ibmvfc.c:3644:10: note: in expansion of macro 'NULL'
>>>  3644 |   return NULL;
>>>       |          ^~~~
>>> drivers/scsi/ibmvscsi/ibmvfc.c:3638:13: note: declared here
>>>  3638 | static void ibmvfc_tgt_implicit_logout_and_del(struct ibmvfc_target *tgt)
>>>       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>
>>> Introduced by commit
>>>
>>>   54b04c99d02e ("scsi: ibmvfc: Avoid loss of all paths during SVC node reboot")
>>
>> Thanks. I'll send the one line fix.
> 
> I am still getting this warning, but it is now after the merge of the
> scsi tree.
> 

I sent the fix to the list, waiting for it to get pulled in:

https://marc.info/?l=linux-scsi&m=158315998321290&w=2


-- 
Brian King
Power Linux I/O
IBM Linux Technology Center

