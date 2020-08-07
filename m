Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DA0723ECE3
	for <lists+linux-next@lfdr.de>; Fri,  7 Aug 2020 13:50:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728293AbgHGLts (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 7 Aug 2020 07:49:48 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:38804 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728159AbgHGLtr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 7 Aug 2020 07:49:47 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 077BmPa7042504;
        Fri, 7 Aug 2020 11:49:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=MApzyHnmExjGWQNHHBlWhBsaX3jE1XvA21fvZMpg+Tc=;
 b=EyXbU6S1jX+nqFMrDAOn7yPjSHibQN8ptMgf24gZCVhRBsNLttyN6Ktya5KkD6OOQCjX
 iZmGInCQRpd6azqf8EmUCwPoKWtw3JloS+wYNVkgID22rsfh++hBE9eIoADJOkSlPJat
 v0A2bVhiasKTsJXeOg4d7Dvq3kmS8T+Et8Zktt+gDRc6JDrPmKa0IiuCjED/Afj3VaG9
 AW5t6yNS3Ajv/vhqjUzN6o6rySc7yy2krB+hUfguSTSBwaKW/hvpFqcnMm3LCwRmnjLA
 N/lGQOeFbKVwv37o2fc6RS8iYrbbQfS4IgpSikNSc95RYnL+MM/ZfjFKKbCrf0k/Y3Jm /A== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2120.oracle.com with ESMTP id 32r6fxr3jf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 07 Aug 2020 11:49:36 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 077BlwOw028894;
        Fri, 7 Aug 2020 11:49:36 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3030.oracle.com with ESMTP id 32r6cxggpd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 07 Aug 2020 11:49:36 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 077BnZF4013749;
        Fri, 7 Aug 2020 11:49:35 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 07 Aug 2020 04:49:34 -0700
Date:   Fri, 7 Aug 2020 14:49:27 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Steve French <smfrench@gmail.com>,
        CIFS <linux-cifs@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the cifs tree
Message-ID: <20200807114927.GY5493@kadam>
References: <20200806164505.0eada105@canb.auug.org.au>
 <CAH2r5mvGD3ftLDfwrpx61kaJQnPpspupdDHD8NOjnF-q-ByTfg@mail.gmail.com>
 <20200807083342.6977153b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200807083342.6977153b@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9705 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 bulkscore=0
 spamscore=0 adultscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008070085
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9705 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 impostorscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 clxscore=1011 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008070085
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Aug 07, 2020 at 08:33:42AM +1000, Stephen Rothwell wrote:
> Hi Steve,
> 
> Thanks for fixing this up.
> 
> On Thu, 6 Aug 2020 10:31:33 -0500 Steve French <smfrench@gmail.com> wrote:
> >
> > I just fixed the Author tag in this patch to match your email address
> > but seems like the author email address gets mangled when sent through
> > some mailing lists.  Any ideas how to avoid this.
> 
> You may need to ask people to add an explicit From: line at the start
> of the body for patches sent via the samba.org mailing lists (since
> they mangle addresses to get around DKIM checks, I assume).
> 

I wonder why it affects me in particular and only now...

Steve, could you send me a copy of the patch that you recieved or
something?

regards,
dan carpenter


