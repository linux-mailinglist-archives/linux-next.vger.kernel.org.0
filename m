Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4C2C8DA9B
	for <lists+linux-next@lfdr.de>; Wed, 14 Aug 2019 19:19:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728969AbfHNRTH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 14 Aug 2019 13:19:07 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:11048 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728776AbfHNRTG (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 14 Aug 2019 13:19:06 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x7EGr4o1001880;
        Wed, 14 Aug 2019 13:18:51 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2ucp47s3vu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 14 Aug 2019 13:18:51 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
        by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x7EGtZYC006002;
        Wed, 14 Aug 2019 17:18:50 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
        by ppma03wdc.us.ibm.com with ESMTP id 2u9nj648pe-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 14 Aug 2019 17:18:50 +0000
Received: from b03ledav006.gho.boulder.ibm.com (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
        by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x7EHIn2S52232660
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 14 Aug 2019 17:18:49 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 97EBBC605B;
        Wed, 14 Aug 2019 17:18:49 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 1204FC6059;
        Wed, 14 Aug 2019 17:18:45 +0000 (GMT)
Received: from [9.85.86.184] (unknown [9.85.86.184])
        by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
        Wed, 14 Aug 2019 17:18:44 +0000 (GMT)
Message-ID: <1565803123.6908.10.camel@abdul>
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
        linux-kernel <linux-kernel@vger.kernel.org>
Date:   Wed, 14 Aug 2019 22:48:43 +0530
In-Reply-To: <cafb1d40-a11e-c137-db06-4564e5f5caf5@acm.org>
References: <1565801523.6908.6.camel@abdul>
         <cafb1d40-a11e-c137-db06-4564e5f5caf5@acm.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-08-14_06:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=850 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908140158
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 2019-08-14 at 10:05 -0700, Bart Van Assche wrote:
> On 8/14/19 9:52 AM, Abdul Haleem wrote:
> > Greeting's
> > 
> > Today's linux-next kernel (5.3.0-rc4-next-20190813)  booted with warning on my powerpc power 8 lpar
> > 
> > The WARN_ON_ONCE() was introduced by commit 88263208 (scsi: qla2xxx: Complain if sp->done() is not...)
> > 
> > boot logs:
> > 
> > WARNING: CPU: 10 PID: 425 at drivers/scsi/qla2xxx/qla_isr.c:2784
> 
> Hi Abdul,
> 
> Thank you for having reported this. Is that the only warning reported on your setup by the qla2xxx
> driver? If that warning is commented out, does the qla2xxx driver work as expected?

boot warning did not show up when the commit is reverted.

should I comment out only the WARN_ON_ONCE() which is causing the issue,
and not the other one ?

-- 
Regard's

Abdul Haleem
IBM Linux Technology Centre



