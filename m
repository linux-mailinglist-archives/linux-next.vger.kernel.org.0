Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D5A8175D52
	for <lists+linux-next@lfdr.de>; Mon,  2 Mar 2020 15:36:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727104AbgCBOgb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Mar 2020 09:36:31 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:58978 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727030AbgCBOga (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 2 Mar 2020 09:36:30 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 022EKcwB068726;
        Mon, 2 Mar 2020 09:36:23 -0500
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2yfnccm256-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 02 Mar 2020 09:36:22 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
        by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 022EWqPS008952;
        Mon, 2 Mar 2020 14:36:21 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com [9.57.198.23])
        by ppma02wdc.us.ibm.com with ESMTP id 2yffk6arnm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 02 Mar 2020 14:36:21 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com [9.57.199.110])
        by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 022EaLJ945285730
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 2 Mar 2020 14:36:21 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 66153AE060;
        Mon,  2 Mar 2020 14:36:21 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 04908AE063;
        Mon,  2 Mar 2020 14:36:20 +0000 (GMT)
Received: from oc6034535106.ibm.com (unknown [9.160.4.131])
        by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
        Mon,  2 Mar 2020 14:36:20 +0000 (GMT)
Subject: Re: linux-next: build warning after merge of the scsi-mkp tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200302133543.7052d654@canb.auug.org.au>
From:   Brian King <brking@linux.vnet.ibm.com>
Message-ID: <5bff0f26-3b20-e240-e1b4-65af411a3a56@linux.vnet.ibm.com>
Date:   Mon, 2 Mar 2020 08:36:20 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200302133543.7052d654@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-03-02_04:2020-03-02,2020-03-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1011
 impostorscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003020105
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 3/1/20 8:35 PM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the scsi-mkp tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
> 
> In file included from include/uapi/linux/posix_types.h:5,
>                  from include/uapi/linux/types.h:14,
>                  from include/linux/types.h:6,
>                  from include/linux/list.h:5,
>                  from include/linux/module.h:12,
>                  from drivers/scsi/ibmvscsi/ibmvfc.c:10:
> drivers/scsi/ibmvscsi/ibmvfc.c: In function 'ibmvfc_tgt_implicit_logout_and_del':
> include/linux/stddef.h:8:14: warning: 'return' with a value, in function returning void [-Wreturn-type]
>     8 | #define NULL ((void *)0)
>       |              ^
> drivers/scsi/ibmvscsi/ibmvfc.c:3644:10: note: in expansion of macro 'NULL'
>  3644 |   return NULL;
>       |          ^~~~
> drivers/scsi/ibmvscsi/ibmvfc.c:3638:13: note: declared here
>  3638 | static void ibmvfc_tgt_implicit_logout_and_del(struct ibmvfc_target *tgt)
>       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Introduced by commit
> 
>   54b04c99d02e ("scsi: ibmvfc: Avoid loss of all paths during SVC node reboot")
> 

Thanks. I'll send the one line fix.

-- 
Brian King
Power Linux I/O
IBM Linux Technology Center

