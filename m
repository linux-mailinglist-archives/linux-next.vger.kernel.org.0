Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 870A113D8E3
	for <lists+linux-next@lfdr.de>; Thu, 16 Jan 2020 12:24:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726151AbgAPLYx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Jan 2020 06:24:53 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:38990 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726100AbgAPLYx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 16 Jan 2020 06:24:53 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00GBNbiV059917;
        Thu, 16 Jan 2020 11:24:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : in-reply-to : message-id : references : mime-version :
 content-type; s=corp-2019-08-05;
 bh=zAnzD9q8B7Q1poIdgZ29M4dXdCIgOhZQNNwNMulmJGo=;
 b=HJq4BLABER5AKLa6UcuJVzFupzb643a105yhjDOXXllnVJBJMacvEiDygeqkrT+FxbB+
 XgL+i9xyhiBkdCxLE0LuEDswTq8jPSyBm9vQ2Rj64yXphaPkazCMpFdzB6PKuhbp5ncI
 VeFAAKyW1lJ42dnOk+pihRWsnQfaz1DILmYi9rZEik3Q0YG5irFH6X+55wpLfPlA49Kb
 XEx1fd4IM1m8nJP8yTesn/MbsiqC6UNeJtdEWcIUNpUbljgjycl9fcqJZ+VC4r8YBGeF
 BV8ai7+xLQwDrh4J8DKch11GQ973Fi14Pxo7VoBpDGcMgb2b8p+4ZFPPOUa3J0x3C3w/ 9w== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 2xf73u1u6j-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 16 Jan 2020 11:24:42 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00GBOUhD081993;
        Thu, 16 Jan 2020 11:24:42 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 2xj1auyjc7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 16 Jan 2020 11:24:37 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 00GBNJGG014730;
        Thu, 16 Jan 2020 11:23:19 GMT
Received: from dhcp-10-175-200-122.vpn.oracle.com (/10.175.200.122)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 16 Jan 2020 03:23:18 -0800
Date:   Thu, 16 Jan 2020 11:23:09 +0000 (GMT)
From:   Alan Maguire <alan.maguire@oracle.com>
X-X-Sender: alan@dhcp-10-175-200-122.vpn.oracle.com
To:     Stephen Rothwell <sfr@canb.auug.org.au>
cc:     Shuah Khan <skhan@linuxfoundation.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alan Maguire <alan.maguire@oracle.com>
Subject: Re: linux-next: build failure after merge of the kunit-next tree
In-Reply-To: <20200116165703.4e04be51@canb.auug.org.au>
Message-ID: <alpine.LRH.2.20.2001161120230.2505@dhcp-10-175-200-122.vpn.oracle.com>
References: <20200116165703.4e04be51@canb.auug.org.au>
User-Agent: Alpine 2.20 (LRH 67 2015-01-07)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9501 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001160098
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9501 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001160098
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 16 Jan 2020, Stephen Rothwell wrote:

> Hi all,
> 
> After merging the kunit-next tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> x86_64-linux-gnu-ld: drivers/base/test/property-entry-test.o: in function `kunit_test_suites_init':
> property-entry-test.c:(.text+0x26): undefined reference to `kunit_run_tests'
> x86_64-linux-gnu-ld: drivers/base/test/property-entry-test.o: in function `pe_test_reference':
> property-entry-test.c:(.text+0x275): undefined reference to `kunit_binary_assert_format'
> x86_64-linux-gnu-ld: property-entry-test.c:(.text+0x2c4): undefined reference to `kunit_do_assertion'
> 
> and lots more ...
> 
> Caused by commit
> 
>   27f9d7e984d9 ("software node: introduce CONFIG_KUNIT_DRIVER_PE_TEST")
> 
> from the pm tree interacting with commit
> 
>   35c57fc3f8ea ("kunit: building kunit as a module breaks allmodconfig")
> 
> I have disabled CONFIG_KUNIT_DRIVER_PE_TEST for today.
>

Apologies again, I should have explicitly specified that
CONFIG_KUNIT_DRIVER_PE_TEST depends on KUNIT=y; I've
sent a patch to fix this:

https://lore.kernel.org/lkml/1579173451-2439-1-git-send-email-alan.maguire@oracle.com/T/#u

Thank you!

Alan
 
> -- 
> Cheers,
> Stephen Rothwell
> 
