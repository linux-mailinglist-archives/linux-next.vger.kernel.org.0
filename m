Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B839EAFE9E
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2019 16:21:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727093AbfIKOVU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Sep 2019 10:21:20 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:39338 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726341AbfIKOVU (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 11 Sep 2019 10:21:20 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x8BEEEsR015982
        for <linux-next@vger.kernel.org>; Wed, 11 Sep 2019 10:21:19 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2uy1y01rjf-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Wed, 11 Sep 2019 10:21:18 -0400
Received: from localhost
        by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <rppt@linux.ibm.com>;
        Wed, 11 Sep 2019 15:21:17 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
        by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Wed, 11 Sep 2019 15:21:14 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x8BELD0W35062012
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 11 Sep 2019 14:21:13 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 2C7A45206C;
        Wed, 11 Sep 2019 14:21:13 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.148.207.74])
        by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 85A0552054;
        Wed, 11 Sep 2019 14:21:10 +0000 (GMT)
Date:   Wed, 11 Sep 2019 15:21:07 +0100
From:   Mike Rapoport <rppt@linux.ibm.com>
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mike Rapoport <mike.rapoport@gmail.com>,
        Chester Lin <clin@suse.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the arm tree
References: <20190911001459.6ccc76ee@canb.auug.org.au>
 <20190910142128.GR13294@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190910142128.GR13294@shell.armlinux.org.uk>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-GCONF: 00
x-cbid: 19091114-4275-0000-0000-000003647F66
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091114-4276-0000-0000-00003876D745
Message-Id: <20190911142106.GA6429@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-09-11_08:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909110133
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Sep 10, 2019 at 03:21:28PM +0100, Russell King - ARM Linux admin wrote:
> This is correctly signed off, but Mike didn't send the patch correctly.
> It missed a From: line for the proper author, so the patch was committed
> as if Mike had authored it, which he didn't.

Sorry about that, haven't used the patch system for couple of years now.
Would you like me to resubmit the patch?
 
> On Wed, Sep 11, 2019 at 12:14:59AM +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Commit
> > 
> >   2505b9ba9c37 ("ARM: 8904/1: skip nomap memblocks while finding the lowmem/highmem boundary")
> > 
> > is missing a Signed-off-by from its author.
> > 
> > -- 
> > Cheers,
> > Stephen Rothwell
> 
> 
> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
> According to speedtest.net: 11.9Mbps down 500kbps up

-- 
Sincerely yours,
Mike.

