Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A7F2B66C5
	for <lists+linux-next@lfdr.de>; Wed, 18 Sep 2019 17:10:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728227AbfIRPKE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Sep 2019 11:10:04 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:43548 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728330AbfIRPKE (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 18 Sep 2019 11:10:04 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x8IF8afQ137150
        for <linux-next@vger.kernel.org>; Wed, 18 Sep 2019 11:10:02 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2v3m2eeu1e-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Wed, 18 Sep 2019 11:10:02 -0400
Received: from localhost
        by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <maier@linux.ibm.com>;
        Wed, 18 Sep 2019 16:09:59 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
        by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Wed, 18 Sep 2019 16:09:53 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
        by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x8IF9pud50724936
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 18 Sep 2019 15:09:51 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 774F3A4040;
        Wed, 18 Sep 2019 15:09:51 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id C0E36A4055;
        Wed, 18 Sep 2019 15:09:50 +0000 (GMT)
Received: from oc4120165700.ibm.com (unknown [9.152.98.33])
        by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Wed, 18 Sep 2019 15:09:50 +0000 (GMT)
Subject: Re: [PATCH 1/2] scsi: core: fix missing .cleanup_rq for SCSI hosts
 without request batching
To:     "Martin K. Petersen" <martin.petersen@oracle.com>,
        Ming Lei <tom.leiming@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Mark Brown <broonie@kernel.org>
Cc:     "James E . J . Bottomley" <jejb@linux.ibm.com>,
        Ming Lei <ming.lei@redhat.com>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Linux SCSI List <linux-scsi@vger.kernel.org>,
        linux-block <linux-block@vger.kernel.org>,
        "open list:DEVICE-MAPPER (LVM)" <dm-devel@redhat.com>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Benjamin Block <bblock@linux.ibm.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Hannes Reinecke <hare@suse.com>, Jens Axboe <axboe@kernel.dk>,
        "Ewan D . Milne" <emilne@redhat.com>,
        Christoph Hellwig <hch@lst.de>,
        Mike Snitzer <snitzer@redhat.com>
References: <20190807144948.28265-1-maier@linux.ibm.com>
 <20190807144948.28265-2-maier@linux.ibm.com>
 <CACVXFVM0tFj8CmcHON04_KjxR=QErCbUx0abJgG2W9OBb7akZA@mail.gmail.com>
 <yq136iccsbw.fsf@oracle.com>
From:   Steffen Maier <maier@linux.ibm.com>
Date:   Wed, 18 Sep 2019 17:09:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <yq136iccsbw.fsf@oracle.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19091815-0028-0000-0000-0000039F8818
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091815-0029-0000-0000-000024618C14
Message-Id: <bec80a65-9a8c-54a9-fe70-876fcbe3d592@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-09-18_08:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909180148
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 8/8/19 4:18 AM, Martin K. Petersen wrote:
> 
> Ming,
> 
>>> +       .cleanup_rq     = scsi_cleanup_rq,
>>>          .busy           = scsi_mq_lld_busy,
>>>          .map_queues     = scsi_map_queues,
>>>   };
>>
>> This one is a cross-tree thing, either scsi/5.4/scsi-queue needs to
>> pull for-5.4/block, or do it after both land linus tree.
> 
> I'll set up an amalgamated for-next branch tomorrow.

Martin, is it possible that you re-wrote your for-next and it now no longer 
contains a merged 5.4/scsi-postmerge with those fixes?
At least I cannot find the fix code in next-20190917 and it fails again for me.


-- 
Mit freundlichen Gruessen / Kind regards
Steffen Maier

Linux on IBM Z Development

https://www.ibm.com/privacy/us/en/
IBM Deutschland Research & Development GmbH
Vorsitzender des Aufsichtsrats: Matthias Hartmann
Geschaeftsfuehrung: Dirk Wittkopp
Sitz der Gesellschaft: Boeblingen
Registergericht: Amtsgericht Stuttgart, HRB 243294

