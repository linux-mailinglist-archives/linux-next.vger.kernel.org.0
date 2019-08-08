Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 853FB85811
	for <lists+linux-next@lfdr.de>; Thu,  8 Aug 2019 04:22:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727950AbfHHCWG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Aug 2019 22:22:06 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:36892 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727946AbfHHCWG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 7 Aug 2019 22:22:06 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x782IO1G084078;
        Thu, 8 Aug 2019 02:21:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : references : date : in-reply-to : message-id : mime-version :
 content-type; s=corp-2018-07-02;
 bh=ACq7S8nv7dzK0UkdAc/DjZFBJLQC3vr+kzfxusPxV1A=;
 b=JByW4jwGa6f+Xwbst5KPM8rIDbegbBj7AhOUjZK4MebDLGwMcDdoPU3xUW3WCFpNGH2r
 B0LC7542OLvCigeDvVClu5FxFhy/QF57BLn9iR3GojxMB9S2zYA8SwO+Ptyz09NYB39i
 mw+Yy/rH6noS2QnTkh/9cpow8SjRCZ3NIAUkDYqFLxlD3BPj5R3wWP2TPpy8uo9Cv6m9
 S2tAVATA29SQFJm/Ji7uy5ZmpWC7G2O+Ba6ji0Aa1TUM6mNku82RpnFbQqQtivLPvFRw
 k1TB+o1dXqjECG57jOTNE3EI+Rw97jV/P264JDlW50FvSwt+rDzEk7vnQssXTnXA/DJq NA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 2u51pu7rvp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 08 Aug 2019 02:21:07 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x782HTul031517;
        Thu, 8 Aug 2019 02:19:06 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3020.oracle.com with ESMTP id 2u763jjs5v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 08 Aug 2019 02:19:06 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x782J3Qu015908;
        Thu, 8 Aug 2019 02:19:03 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 07 Aug 2019 19:19:02 -0700
To:     Ming Lei <tom.leiming@gmail.com>
Cc:     Steffen Maier <maier@linux.ibm.com>,
        "James E . J . Bottomley" <jejb@linux.ibm.com>,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Ming Lei <ming.lei@redhat.com>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Linux SCSI List <linux-scsi@vger.kernel.org>,
        linux-block <linux-block@vger.kernel.org>,
        "open list\:DEVICE-MAPPER \(LVM\)" <dm-devel@redhat.com>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Benjamin Block <bblock@linux.ibm.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Hannes Reinecke <hare@suse.com>, Jens Axboe <axboe@kernel.dk>,
        "Ewan D . Milne" <emilne@redhat.com>,
        Christoph Hellwig <hch@lst.de>,
        Mike Snitzer <snitzer@redhat.com>
Subject: Re: [PATCH 1/2] scsi: core: fix missing .cleanup_rq for SCSI hosts without request batching
From:   "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
References: <20190807144948.28265-1-maier@linux.ibm.com>
        <20190807144948.28265-2-maier@linux.ibm.com>
        <CACVXFVM0tFj8CmcHON04_KjxR=QErCbUx0abJgG2W9OBb7akZA@mail.gmail.com>
Date:   Wed, 07 Aug 2019 22:18:59 -0400
In-Reply-To: <CACVXFVM0tFj8CmcHON04_KjxR=QErCbUx0abJgG2W9OBb7akZA@mail.gmail.com>
        (Ming Lei's message of "Thu, 8 Aug 2019 07:32:29 +0800")
Message-ID: <yq136iccsbw.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.92 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9342 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908080022
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9342 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908080022
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


Ming,

>> +       .cleanup_rq     = scsi_cleanup_rq,
>>         .busy           = scsi_mq_lld_busy,
>>         .map_queues     = scsi_map_queues,
>>  };
>
> This one is a cross-tree thing, either scsi/5.4/scsi-queue needs to
> pull for-5.4/block, or do it after both land linus tree.

I'll set up an amalgamated for-next branch tomorrow.

-- 
Martin K. Petersen	Oracle Linux Engineering
