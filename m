Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6045A26551D
	for <lists+linux-next@lfdr.de>; Fri, 11 Sep 2020 00:31:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725562AbgIJWbt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Sep 2020 18:31:49 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:50060 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725300AbgIJWbs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 10 Sep 2020 18:31:48 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08AMOU9E131171;
        Thu, 10 Sep 2020 22:31:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=HyCDiwjB1G5xfHnbn3vMCOQZ7CXVbOMUFyahdLU5mq0=;
 b=pFMcLDLVJ90mPsz/Pad5FPhwlJYSmOPjkPiL+AY295sS9a1jL9r2DQh5PLeOoZOVxG8e
 b5yXIsjbvE0TMc1QoSIS3tMthEtj3VSZCJzqoGgGIFh1Q0EdW8T18iCx6ZYS/FRfDcvj
 rxUflAIiB9UUQ8N6FQXpceV0TjvzUng9PwL8/kpAnPxr2lnRG9izmm38K87fXGZUwO5u
 BZaNKjrO2so+tLbqPVinjeRCr0tR9JioT1e6ZbNcvN+ij/D0Blyf7NF8T5UQJ0pAm1HO
 rHDsmYOvIRss59+3yPA1hkt9bygkkLIPr19mrc6yQ4SDC5n50oz/uajyt/ot1K8H5WUc JQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2120.oracle.com with ESMTP id 33c3anavt3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 10 Sep 2020 22:31:37 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08AMVatB195168;
        Thu, 10 Sep 2020 22:31:37 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3020.oracle.com with ESMTP id 33cmevv6dr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 10 Sep 2020 22:31:37 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 08AMVNdI022494;
        Thu, 10 Sep 2020 22:31:24 GMT
Received: from localhost (/67.169.218.210)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 10 Sep 2020 15:31:21 -0700
Date:   Thu, 10 Sep 2020 15:31:20 -0700
From:   "Darrick J. Wong" <darrick.wong@oracle.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the iomap tree
Message-ID: <20200910223120.GE7964@magnolia>
References: <20200911080314.4849d3b5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200911080314.4849d3b5@canb.auug.org.au>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9740 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=2 adultscore=0
 bulkscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009100196
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9740 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 priorityscore=1501
 clxscore=1011 bulkscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=999 suspectscore=2 adultscore=0 mlxscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009100195
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Sep 11, 2020 at 08:03:14AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   3e88e7243277 ("xfs: don't crash with assfail")
> 
> is missing a Signed-off-by from its author and committer.

DOH, I accidentally pushed the debugging patches and other crap from the
tip to kernel.org.

Er, if it's not too late, I rewound the tip of iomap-for-next to where
it's supposed to be.  If not, I guess you'll catch it up next week. :(

--D

> -- 
> Cheers,
> Stephen Rothwell


