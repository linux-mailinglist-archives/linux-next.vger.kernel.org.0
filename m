Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA7EA32DDF8
	for <lists+linux-next@lfdr.de>; Fri,  5 Mar 2021 00:44:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233238AbhCDXok (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 4 Mar 2021 18:44:40 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:62740 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S233236AbhCDXoj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 4 Mar 2021 18:44:39 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 124NYuhF050759;
        Thu, 4 Mar 2021 18:44:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=dKxQSV0s+AzGR22eYmP20n9pQj18t3CtP+UNUhBaF8A=;
 b=Vf4wFkq7K1QxA45HPP9oWsbvaCLG4W2pjM8jSYgcTtkMmXABp1uVQLh/itk7kwHmDOyt
 t23avwApNxGdVBfXiBnuq94lgCeCbEuo3hcVfxzXxCSNV0eP7FG6sLTPuG4jotEiWPzI
 cxWrCawFH5nKFQSgCNahhPmW9FS00ZWPn0eJPWRO5tUVK6/Fj1FJhqmzeq860tCkewLz
 se0CpX6BmWu/VfS6a+PCbRVmXFm02cq2Zd1Xyg9cbGhTiFSwp8ddPebP/2xp0hAwxyK0
 dJyuSTtbLLLKyZxKWpMsxDOo7jekx9QUbGAOsdYwUpfL60R2gQmaMJEpUU/hWsADZky7 kQ== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
        by mx0b-001b2d01.pphosted.com with ESMTP id 3739ae07ty-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 04 Mar 2021 18:44:30 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
        by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 124NaqXG003630;
        Thu, 4 Mar 2021 23:44:30 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
        by ppma03wdc.us.ibm.com with ESMTP id 37128gue3q-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 04 Mar 2021 23:44:30 +0000
Received: from b03ledav005.gho.boulder.ibm.com (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
        by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 124NiTNc23200028
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 4 Mar 2021 23:44:29 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 35096BE054;
        Thu,  4 Mar 2021 23:44:29 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 500DCBE04F;
        Thu,  4 Mar 2021 23:44:28 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.160.44.137])
        by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
        Thu,  4 Mar 2021 23:44:28 +0000 (GMT)
Subject: Re: linux-next: Fixes tags need some work in the scsi-fixes tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210305081233.6b8ad732@canb.auug.org.au>
From:   Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <92184036-e187-7b7f-394e-9ad29a35c162@linux.ibm.com>
Date:   Thu, 4 Mar 2021 15:44:27 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210305081233.6b8ad732@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-04_09:2021-03-03,2021-03-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1011
 bulkscore=0 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103040117
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 3/4/21 1:12 PM, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   f4c5e949056d ("scsi: ibmvfc: Reinitialize sub-CRQs and perform channel enquiry after LPM")
> 
> Fixes tag
> 
>   Fixes: 3034ebe26389 ("ibmvfc: add alloc/dealloc routines for SCSI Sub-CRQ Channels")
> 
> has these problem(s):
> 
>   - Subject does not match target commit subject
> 

Well crap. I realized I botched them in v4, and fixed up the commit ids in v5
but clearly not the subjects.

> Plese just use
> 	git log -1 --format='Fixes: %h ("%s")'
> 

Noted.

-Tyrel

