Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 771C79213F
	for <lists+linux-next@lfdr.de>; Mon, 19 Aug 2019 12:27:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726627AbfHSK1M (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 19 Aug 2019 06:27:12 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:43732 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726594AbfHSK1M (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 19 Aug 2019 06:27:12 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x7JAM2WJ022562;
        Mon, 19 Aug 2019 06:26:56 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2ufr6vcjy5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 19 Aug 2019 06:26:56 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
        by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x7JAP2OH014030;
        Mon, 19 Aug 2019 10:26:55 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
        by ppma01wdc.us.ibm.com with ESMTP id 2ue976d1bf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 19 Aug 2019 10:26:55 +0000
Received: from b03ledav002.gho.boulder.ibm.com (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
        by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x7JAQtQh57868626
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 19 Aug 2019 10:26:55 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id E90EC13608C;
        Mon, 19 Aug 2019 10:26:54 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id E5603136083;
        Mon, 19 Aug 2019 10:26:51 +0000 (GMT)
Received: from [9.124.31.25] (unknown [9.124.31.25])
        by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
        Mon, 19 Aug 2019 10:26:51 +0000 (GMT)
Message-ID: <1566210410.25520.5.camel@abdul.in.ibm.com>
Subject: Re: [5.3.0-rc4-next][bisected 882632][qla2xxx] WARNING: CPU: 10
 PID: 425 at drivers/scsi/qla2xxx/qla_isr.c:2784 qla2x00_status_entry.isra
From:   Abdul Haleem <abdhalee@linux.vnet.ibm.com>
To:     Bart Van Assche <bvanassche@acm.org>
Cc:     linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-next <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-scsi <linux-scsi@vger.kernel.org>,
        martin.petersen@oracle.com, hmadhani@marvell.com,
        sachinp <sachinp@linux.vnet.ibm.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        manvanth <manvanth@linux.vnet.ibm.com>
Date:   Mon, 19 Aug 2019 15:56:50 +0530
In-Reply-To: <7fc59d4c-b3d5-5ec8-cb7c-51cb863f2a77@acm.org>
References: <1565801523.6908.6.camel@abdul>
         <cafb1d40-a11e-c137-db06-4564e5f5caf5@acm.org>
         <1565803123.6908.10.camel@abdul>
         <7fc59d4c-b3d5-5ec8-cb7c-51cb863f2a77@acm.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-08-19_02:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908190119
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 2019-08-14 at 20:42 -0700, Bart Van Assche wrote:
> On 8/14/19 10:18 AM, Abdul Haleem wrote:
> > On Wed, 2019-08-14 at 10:05 -0700, Bart Van Assche wrote:
> >> On 8/14/19 9:52 AM, Abdul Haleem wrote:
> >>> Greeting's
> >>>
> >>> Today's linux-next kernel (5.3.0-rc4-next-20190813)  booted with warning on my powerpc power 8 lpar
> >>>
> >>> The WARN_ON_ONCE() was introduced by commit 88263208 (scsi: qla2xxx: Complain if sp->done() is not...)
> >>>
> >>> boot logs:
> >>>
> >>> WARNING: CPU: 10 PID: 425 at drivers/scsi/qla2xxx/qla_isr.c:2784
> >>
> >> Hi Abdul,
> >>
> >> Thank you for having reported this. Is that the only warning reported on your setup by the qla2xxx
> >> driver? If that warning is commented out, does the qla2xxx driver work as expected?
> > 
> > boot warning did not show up when the commit is reverted.
> > 
> > should I comment out only the WARN_ON_ONCE() which is causing the issue,
> > and not the other one ?
> 
> Yes please. Commit 88263208 introduced five kernel warnings but I think 
> only one of these should be removed again, e.g. as follows:
> 
> diff --git a/drivers/scsi/qla2xxx/qla_isr.c b/drivers/scsi/qla2xxx/qla_isr.c
> index cd39ac18c5fd..d81b5ecce24b 100644
> --- a/drivers/scsi/qla2xxx/qla_isr.c
> +++ b/drivers/scsi/qla2xxx/qla_isr.c
> @@ -2780,8 +2780,6 @@ qla2x00_status_entry(scsi_qla_host_t *vha, struct 
> rsp_que *rsp, void *pkt)
> 
>   	if (rsp->status_srb == NULL)
>   		sp->done(sp, res);
> -	else
> -		WARN_ON_ONCE(true);
>   }
> 
>   /**
 
Applying above patch on system boots fine.

i.e no warnings pop up when keeping all WARN_ON_ONCE() except above one.

Reported-and-Tested-by: Abdul Haleem <abdhalee@linux.vnet.ibm.com>

-- 
Regard's

Abdul Haleem
IBM Linux Technology Centre



