Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BD28147789
	for <lists+linux-next@lfdr.de>; Fri, 24 Jan 2020 05:18:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730183AbgAXESA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 23 Jan 2020 23:18:00 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:35758 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729797AbgAXESA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 23 Jan 2020 23:18:00 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00O4ELx6016590;
        Fri, 24 Jan 2020 04:17:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=XLOdnbZIL76YVu/c7iAycSPzU7MVAwrF2SN9ST0y8ro=;
 b=fRK/VQQDbRHpNuMoBoYPsKQ2aof4IYU514cMfSXnBvSOiCABgTyQvaIlDLeI8YS1KvfF
 5btrna0hWw6f92bD2Q37YCf7ngkuz9k+1VUC84Q7ZA5sirFsT1Qt4l8yBb5RwqQOH21q
 sKgkNFOCcaBBOKjRAs5+BCSrXaShte8hunIk/PIAPuo+swASA9V+s+5S3Ke2aDbgNn9k
 yfc+IF+cdFpaRYb2YkSJKe2MNnlmPKahkNmXh67QW6qwY9MTSFZDrETsxuN9vlUfbG4L
 xCQuor5HbZqfwRNk58W5yBIl25oyNrOOn2z+1CcpdXgfEhb9UKINAEXbFlWFVmOobVVd mg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2130.oracle.com with ESMTP id 2xkseuxvyh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 24 Jan 2020 04:17:49 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00O4E9Nj180488;
        Fri, 24 Jan 2020 04:17:48 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3030.oracle.com with ESMTP id 2xqmue194g-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 24 Jan 2020 04:17:48 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 00O4HkNT013236;
        Fri, 24 Jan 2020 04:17:46 GMT
Received: from localhost (/67.169.218.210)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 23 Jan 2020 20:17:46 -0800
Date:   Thu, 23 Jan 2020 20:17:43 -0800
From:   "Darrick J. Wong" <darrick.wong@oracle.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     David Chinner <david@fromorbit.com>, linux-xfs@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the xfs tree
Message-ID: <20200124041743.GU8257@magnolia>
References: <20200116091242.087b425e@canb.auug.org.au>
 <20200124134722.728032e6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200124134722.728032e6@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9509 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=970
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001240032
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9509 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001240032
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jan 24, 2020 at 01:47:22PM +1100, Stephen Rothwell wrote:
> Hi all
> 
> On Thu, 16 Jan 2020 09:12:42 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > After merging the xfs tree, today's linux-next build
> > (powerpppc64_defconfig) produced this warning:
> > 
> > fs/xfs/xfs_inode.c: In function 'xfs_itruncate_extents_flags':
> > fs/xfs/xfs_inode.c:1523:8: warning: unused variable 'done' [-Wunused-variable]
> >  1523 |  int   done = 0;
> >       |        ^~~~
> > 
> > Introduced by commit
> > 
> >   4bbb04abb4ee ("xfs: truncate should remove all blocks, not just to the end of the page cache")
> 
> I am still getting this warning.

Aha, I had though this was gone but it turns out that I accidentally
merged the fix for this into an internal patch to grease my internal CI
scripts.  Ah well.  Patch soon.

--D

> 
> -- 
> Cheers,
> Stephen Rothwell


