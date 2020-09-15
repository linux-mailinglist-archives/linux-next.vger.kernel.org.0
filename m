Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11C9D26B235
	for <lists+linux-next@lfdr.de>; Wed, 16 Sep 2020 00:43:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727570AbgIOWmR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Sep 2020 18:42:17 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:35006 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727455AbgIOP4D (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 15 Sep 2020 11:56:03 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 08FFtHA5122917;
        Tue, 15 Sep 2020 11:55:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : mime-version : content-type; s=pp1;
 bh=kXdEGL2gPNUg6d8s/J1VONpUzVRwiUhLRy3ED/9oUxk=;
 b=FlWYpamroa52hxtin7SjsiZxb6oQpgzd9TijUwrvw+K+aguggruqb4Z+S3nUNl/pGDCa
 MAsb8V3pVPd6100wezu+BzlpZdgIig//xP9/GHfMVkrcxlOOmO8oJWqkIJb2sugKxSgI
 zQKrxz79Wmpc+L03UQV33CqCoWQw2KD0IElneiCflnm1GbCLQ22BuKxUDc8aN30OlA2z
 AzFsvFSFN6wSWjBC/xYeXhdoLc/saextAqVrIOjSX1WzLC45vZLG7uYPGCrYGIiGajpI
 YWMnrpKe4bSN/78sHSp5+tJi9/irpC0O6B1ttfYRYwVHWJfSXfLnl/RTQahJ70xQsSVa yg== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
        by mx0b-001b2d01.pphosted.com with ESMTP id 33k0b40m9j-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 15 Sep 2020 11:55:54 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
        by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08FFmhva023161;
        Tue, 15 Sep 2020 15:55:39 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
        by ppma02fra.de.ibm.com with ESMTP id 33gny81xd3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 15 Sep 2020 15:55:39 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
        by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 08FFtaiN23331288
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 15 Sep 2020 15:55:36 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 9FE624C046;
        Tue, 15 Sep 2020 15:55:36 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 5FA544C040;
        Tue, 15 Sep 2020 15:55:36 +0000 (GMT)
Received: from osiris (unknown [9.171.78.178])
        by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Tue, 15 Sep 2020 15:55:36 +0000 (GMT)
Date:   Tue, 15 Sep 2020 17:55:34 +0200
From:   Heiko Carstens <hca@linux.ibm.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Christoph Hellwig <hch@lst.de>, linux-next@vger.kernel.org
Subject: linux-next: add s390 set_fs branch?
Message-ID: <20200915155534.GA11180@osiris>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-15_11:2020-09-15,2020-09-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 spamscore=0 mlxscore=0 mlxlogscore=887 suspectscore=2
 bulkscore=0 adultscore=0 clxscore=1011 impostorscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009150127
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

could you please add the 'set_fs' branch of the s390 kernel.org
repository to linux-next?

git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git set_fs

I'm wondering what the best way would be to deal with additional s390
specific topic branches and how to get them merged into linux-next?

As far as I can tell other maintainers merge all their branches into a
'for-next' branch, so that you only need to pull one branch (and don't
need to deal with requests like this one ;) ).

Would that the best way for you? If so we could simply do the same for
s390 as well. Please let us know.

Thank you!
