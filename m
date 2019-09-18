Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC549B66FE
	for <lists+linux-next@lfdr.de>; Wed, 18 Sep 2019 17:23:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729463AbfIRPXd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Sep 2019 11:23:33 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:38180 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725899AbfIRPXc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 18 Sep 2019 11:23:32 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8IFEr1N150047;
        Wed, 18 Sep 2019 15:22:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : references : date : in-reply-to : message-id : mime-version :
 content-type; s=corp-2019-08-05;
 bh=QP/of89H1iKlQJSJwjQxXAmLxnPt3PCrIeV/m5qNqgE=;
 b=nXx8GMbC4L/o3mQfkXRyVvElpxXXkG2pJeE86ZX+eKYDfswZwENGjCYP0eMI3gHV/xwx
 rv7xiC3frDk0mN2dWtIzIcEsDSkLaWyw5VSi5ljx5BsY6k9tcG85ootU1svDbRWsRqzO
 d0XWre/wJR74pYg3YNM17FkIZC/9WvJlA/TcvISHbGxh35jZ/lovnUM62AyyEI4YdsPs
 sIdIdEOK6NfsVuxKyU9pR2EYhvOTQsfrc2bzDMXJpkhils/p6MmCa5F2/qK3qtbTY+Ii
 h3jo7tGb4IgexyBH0K/bdWtHSfzczGFWM1AKnAoNSWjMFrF/cut4wNCb9apfyNmy5RIn Rg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2120.oracle.com with ESMTP id 2v385dvnrc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 18 Sep 2019 15:22:50 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8IFDpWL161853;
        Wed, 18 Sep 2019 15:22:50 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3020.oracle.com with ESMTP id 2v37mmt1b2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 18 Sep 2019 15:22:49 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x8IFMhWn002796;
        Wed, 18 Sep 2019 15:22:43 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 18 Sep 2019 08:22:42 -0700
To:     Steffen Maier <maier@linux.ibm.com>
Cc:     "Martin K. Petersen" <martin.petersen@oracle.com>,
        Ming Lei <tom.leiming@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Mark Brown <broonie@kernel.org>,
        "James E . J . Bottomley" <jejb@linux.ibm.com>,
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
        <yq136iccsbw.fsf@oracle.com>
        <bec80a65-9a8c-54a9-fe70-876fcbe3d592@linux.ibm.com>
Date:   Wed, 18 Sep 2019 11:22:39 -0400
In-Reply-To: <bec80a65-9a8c-54a9-fe70-876fcbe3d592@linux.ibm.com> (Steffen
        Maier's message of "Wed, 18 Sep 2019 17:09:50 +0200")
Message-ID: <yq1lful8w8w.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.92 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9384 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1909180151
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9384 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1909180151
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


Steffen,

> Martin, is it possible that you re-wrote your for-next and it now no
> longer contains a merged 5.4/scsi-postmerge with those fixes?  At
> least I cannot find the fix code in next-20190917 and it fails again
> for me.

Yes, looks like you're right. Not sure how I managed to mess that up. I
must have inadvertently done a reset in the wrong worktree because my
for-next branch maintenance script only does merges.

In any case, since Linus has pulled the block tree dependencies, I'll
rebase the postmerge branch on top of current linus/master and create a
new for-next.

Thanks for the heads-up!

-- 
Martin K. Petersen	Oracle Linux Engineering
