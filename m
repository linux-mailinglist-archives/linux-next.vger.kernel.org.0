Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FD9E2AB35D
	for <lists+linux-next@lfdr.de>; Mon,  9 Nov 2020 10:16:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729107AbgKIJQO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 9 Nov 2020 04:16:14 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:45306 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726482AbgKIJQO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 9 Nov 2020 04:16:14 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0A99FB4a084078;
        Mon, 9 Nov 2020 09:16:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=SESB/eBQmsB5XbY8ocQHPHfBiORlRACTNaDWSyPh8Us=;
 b=UrN9R1d4RviMPVnd5rCNFNPr966taLsyeIAT3HcEayLmIfXdeF2y+aRglRU0qCT3MdzO
 0C0Eq9pvr7iLd014J/aoaracAa4f0y/4g9DqlkdM9ZPUIJvKOCPkxIVSHAAZwXm00PAh
 y42IQJ5zI7fdtcOMLkaHeZ5Xf0ElOGMkv6LSD/3aBWXbHaLY6RG+hyg4I4cmMMqUOiJt
 odm0Q4zJQl/bv6ofDGRF8yOr3KEhDG0VGbFo2etq23ryY2gqzupjJrS+xCtvMNQPOv4s
 0iPqFjlJHz5FJhWW9jHoMgZc+1CXjRIg22iKAT5txZs7VdvBamqnbTSlQ90kgMW7Cp60 DQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2120.oracle.com with ESMTP id 34p72eay02-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 09 Nov 2020 09:16:06 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0A99G3BT148878;
        Mon, 9 Nov 2020 09:16:05 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3030.oracle.com with ESMTP id 34p5gv0wds-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 09 Nov 2020 09:16:05 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0A99G1Bb006946;
        Mon, 9 Nov 2020 09:16:01 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 09 Nov 2020 01:16:01 -0800
Date:   Mon, 9 Nov 2020 12:15:56 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     "J. Bruce Fields" <bfields@fieldses.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the nfsd tree
Message-ID: <20201109091555.GK18329@kadam>
References: <20201109082032.3bf8f58d@canb.auug.org.au>
 <20201108212936.GD14422@fieldses.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201108212936.GD14422@fieldses.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9799 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011090060
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9799 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011090060
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sun, Nov 08, 2020 at 04:29:36PM -0500, J. Bruce Fields wrote:
> On Mon, Nov 09, 2020 at 08:20:32AM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Commit
> > 
> >   bfb5aa1685d5 ("net/sunrpc: fix useless comparison in proc_do_xprt()")
> > 
> > is missing a Signed-off-by from its author.
> 
> I split the original patch in 2 and fixed a bug in this second patch,
> but unless I hear otherwise I'll assume Dan's OK with his Signed-off-by
> staying on both....

Yep.  Thanks!

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

regards,
dan carpenter

