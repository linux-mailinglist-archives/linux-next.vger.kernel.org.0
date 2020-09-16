Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5552D26CB54
	for <lists+linux-next@lfdr.de>; Wed, 16 Sep 2020 22:26:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727017AbgIPR0z (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 16 Sep 2020 13:26:55 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:52472 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727061AbgIPR0u (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 16 Sep 2020 13:26:50 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 08GG3DLS131847;
        Wed, 16 Sep 2020 12:28:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=TJr0qkDghNCPG6hPr3uEVka0fh005kVOuX9Xz33kY1g=;
 b=J6dqbtMrG5mf72dDY+tt6Ib4ZbLg232Gsq2pMEIeI1r99kRHMlYDCm8+PRvkFVNQSOwJ
 jziGTKMsizgpZvHiV+oDIidyJdF6lYiu0dC2IbD6A0lc+mUUS0jsztfNS6mTM3zg+OFm
 bNWZm0T3oKcp17Axu+3kdQi/OrU2B8LQX0jJOSE7gNpL2cV0UtGDuuFTscwaqfvuSHQe
 BGRDgIJg6V3kzfpO7jKL9R2YJXUjbdPuilf5Lxp8CUZyGiQT0yD1IV5J9vQMrNdyr9SP
 qt/tg3ruLsF0sW43IL+5SGnTSFPTmH+o20VpJJjgiJ6gwNIXT36mLM4LTkAGy+n2lF9z 3A== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
        by mx0a-001b2d01.pphosted.com with ESMTP id 33knv40mw7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 16 Sep 2020 12:28:53 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
        by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08GGSXgq029463;
        Wed, 16 Sep 2020 16:28:51 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
        by ppma04fra.de.ibm.com with ESMTP id 33k64s8eh9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 16 Sep 2020 16:28:51 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
        by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 08GGSmMO29360544
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 16 Sep 2020 16:28:48 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 88A44AE045;
        Wed, 16 Sep 2020 16:28:48 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 4E31EAE04D;
        Wed, 16 Sep 2020 16:28:48 +0000 (GMT)
Received: from osiris (unknown [9.171.80.23])
        by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Wed, 16 Sep 2020 16:28:48 +0000 (GMT)
Date:   Wed, 16 Sep 2020 18:28:46 +0200
From:   Heiko Carstens <hca@linux.ibm.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        linux-next@vger.kernel.org
Subject: Re: linux-next: add s390 set_fs branch?
Message-ID: <20200916162846.GE7076@osiris>
References: <20200915155534.GA11180@osiris>
 <20200916095437.77e7365d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200916095437.77e7365d@canb.auug.org.au>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-16_10:2020-09-16,2020-09-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 mlxscore=0
 clxscore=1015 mlxlogscore=999 spamscore=0 suspectscore=2 bulkscore=0
 adultscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2009160116
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

> > I'm wondering what the best way would be to deal with additional s390
> > specific topic branches and how to get them merged into linux-next?
> > 
> > As far as I can tell other maintainers merge all their branches into a
> > 'for-next' branch, so that you only need to pull one branch (and don't
> > need to deal with requests like this one ;) ).
> > 
> > Would that the best way for you? If so we could simply do the same for
> > s390 as well. Please let us know.
> 
> Yes, normally maintainers merge their topic branches into a single
> "for-next" (or similar) branch for me to merge.  However, in some cases
> I carry separate topic branches.  So what ever is easiest.
> 
> I have added the set_fs branch today (I called it s390-setfs).  If this
> is going to be short lived (or you decide to do the merge yourself),
> please try to remember to tell me to remove it when it is done with.

Ok, so we have a "for-next" branch now:

git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git for-next

If you would include that in linux-next then you can drop the
following ones:

git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git#fixes
git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git#features
git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git#set_fs

Thanks a lot!
