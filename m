Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 924EF20F18E
	for <lists+linux-next@lfdr.de>; Tue, 30 Jun 2020 11:27:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731944AbgF3J1c (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 30 Jun 2020 05:27:32 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:57166 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730256AbgF3J1c (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 30 Jun 2020 05:27:32 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05U9IGnX141742;
        Tue, 30 Jun 2020 09:27:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : in-reply-to : message-id : references : mime-version :
 content-type; s=corp-2020-01-29;
 bh=p7l5BOkY6l6Gt/C4GiSucUE677LFprJkxNVuzkjGD1M=;
 b=pTL/0O8rggakV3TIE3i0fWZxXLn7dijdgqll9Y49Mk93Zb78rFFvye3P37dHGy4avBzU
 l+ZzzJVb9HFH+RxB7YqI2rQM7T/bACsj8hPmafRzQcoQvhXKqAUCqPugju+MKtC0jWf8
 xzw8PnP/3MPrvXaiBJhLL04nsISYwF6//4nw2FBwXpzQsNMv1dsugyr0uoj3QkU8TtiV
 jcm4GhLJkgESfudAYcKcDkaYJU2Iag/ymzkR9ShslfyIgxfFxhGCEMMlHjFe6/MEZivC
 zk+ZXr9EXlGfjQkZvhvVYaDoEf0/XVRylcIOKdzxxnwADEkrtqx6t79wZf2bZ2AXlM9R tw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 31xx1dr7cg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 30 Jun 2020 09:27:19 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05U9IeBo196590;
        Tue, 30 Jun 2020 09:27:19 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3020.oracle.com with ESMTP id 31xg12ujmv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 30 Jun 2020 09:27:19 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 05U9RIfQ020087;
        Tue, 30 Jun 2020 09:27:18 GMT
Received: from dhcp-10-175-202-192.vpn.oracle.com (/10.175.202.192)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 30 Jun 2020 09:27:17 +0000
Date:   Tue, 30 Jun 2020 10:27:12 +0100 (IST)
From:   Alan Maguire <alan.maguire@oracle.com>
X-X-Sender: alan@localhost
To:     Stephen Rothwell <sfr@canb.auug.org.au>
cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alan Maguire <alan.maguire@oracle.com>
Subject: Re: linux-next: build failure after merge of the thunderbolt tree
In-Reply-To: <20200630160346.696f6419@canb.auug.org.au>
Message-ID: <alpine.LRH.2.21.2006301021590.13740@localhost>
References: <20200630160346.696f6419@canb.auug.org.au>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9667 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0
 mlxlogscore=999 suspectscore=3 bulkscore=0 mlxscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006300068
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9667 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 clxscore=1011 adultscore=0
 suspectscore=3 mlxlogscore=999 cotscore=-2147483648 lowpriorityscore=0
 malwarescore=0 phishscore=0 impostorscore=0 mlxscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006300068
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 30 Jun 2020, Stephen Rothwell wrote:

> Hi all,
> 
> After merging the thunderbolt tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> 
> Caused by commit
> 
>   54509f5005ca ("thunderbolt: Add KUnit tests for path walking")
> 
> interacting with commit
> 
>   d4cdd146d0db ("kunit: generalize kunit_resource API beyond allocated resources")
> 
> from the kunit-next tree.
> 
> I have applied the following merge fix patch.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 30 Jun 2020 15:51:50 +1000
> Subject: [PATCH] thunderbolt: merge fix for kunix_resource changes
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Thanks Stephen, resolution looks good to me! If you need it

Reviewed-by: Alan Maguire <alan.maguire@oracle.com>

Once the kunit and thunderbolt trees are merged there may
be some additional things we can do to simplify kunit
resource utilization in the thuderbolt tests using the new
kunit resource APIs; no hurry with that though. Nice to
see the kunit resources code being used!

Alan
