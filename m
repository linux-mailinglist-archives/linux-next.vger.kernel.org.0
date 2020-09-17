Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D19C026D61B
	for <lists+linux-next@lfdr.de>; Thu, 17 Sep 2020 10:13:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726385AbgIQINR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Sep 2020 04:13:17 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:45180 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726442AbgIQINQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 17 Sep 2020 04:13:16 -0400
X-Greylist: delayed 3321 seconds by postgrey-1.27 at vger.kernel.org; Thu, 17 Sep 2020 04:13:15 EDT
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 08H71THD123417;
        Thu, 17 Sep 2020 03:17:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=CIaPOVNbmqTtCtZVIPDosBxYXlLl5cQmfhaysc+mS3o=;
 b=ApMf+l2mD3F39w7urgtt4nhNBe3cAhi6F7ZOd/xx/qIcx8d66KIIWXbP3G48KC+4bqf0
 E4xsioMz0uI9VnLzHW9jIGOEftmchh+zv0GaSMkrNVoDPbyw6CGbDEM6z4kVKHJTaU1X
 zC9GebkLviCnKYgsv8N3oq+nPU+pImFjvsxghaJZhgaB4CYv6DoNQCg6c8RbHTr8p+sU
 w/+d3Xwj2jwYYfOyCFgTK7eeK/qd/YzgwMIFRXVChUyUIpDkuau/qU4HN03YTelCRPSu
 xoOH2JJsqlLyIy5tGZcjFnOFnYyfSqyLRs3H4gifNwipd7q311hFXPt87tP5pFDQXRFu +A== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
        by mx0b-001b2d01.pphosted.com with ESMTP id 33m2f0hkfd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 17 Sep 2020 03:17:46 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
        by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08H72UQv030541;
        Thu, 17 Sep 2020 07:17:44 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
        by ppma03ams.nl.ibm.com with ESMTP id 33k6eshtw1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 17 Sep 2020 07:17:44 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
        by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 08H7G7JG9765130
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 17 Sep 2020 07:16:07 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 5CDC94C04A;
        Thu, 17 Sep 2020 07:17:41 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 20B3A4C044;
        Thu, 17 Sep 2020 07:17:41 +0000 (GMT)
Received: from osiris (unknown [9.171.81.108])
        by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Thu, 17 Sep 2020 07:17:41 +0000 (GMT)
Date:   Thu, 17 Sep 2020 09:17:39 +0200
From:   Heiko Carstens <hca@linux.ibm.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        linux-next@vger.kernel.org
Subject: Re: linux-next: add s390 set_fs branch?
Message-ID: <20200917071739.GA6743@osiris>
References: <20200915155534.GA11180@osiris>
 <20200916095437.77e7365d@canb.auug.org.au>
 <20200916162846.GE7076@osiris>
 <20200917085138.0bd1998e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200917085138.0bd1998e@canb.auug.org.au>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-17_03:2020-09-16,2020-09-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 suspectscore=2
 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009170049
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On Thu, Sep 17, 2020 at 08:54:29AM +1000, Stephen Rothwell wrote:
> On Wed, 16 Sep 2020 18:28:46 +0200 Heiko Carstens <hca@linux.ibm.com> wrote:
> >
> > Ok, so we have a "for-next" branch now:
> > 
> > git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git for-next
> > 
> > If you would include that in linux-next then you can drop the
> > following ones:
> > 
> > git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git#fixes
> > git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git#features
> > git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git#set_fs
> 
> I have removed the s390-setfs tree and updated the s390 tree.  I like
> to keep the s390-fixes tree separate as I merge all the pending fixes
> early and they get tested separately.   That should not stop you
> merging your fixes branch into your for-next branch as well (to get rid
> of conflicts or you local testing).

Great, thank you!
