Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1906136C87
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2020 12:57:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727915AbgAJL4v (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 10 Jan 2020 06:56:51 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:37196 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727710AbgAJL4v (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 10 Jan 2020 06:56:51 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00ABs9nt148211;
        Fri, 10 Jan 2020 11:56:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : in-reply-to : message-id : references : mime-version :
 content-type; s=corp-2019-08-05;
 bh=aVBuJse/naIUdn4LmrJ2H45/8etoKIjPPGr5v+bWVUM=;
 b=DfCAriWNWDgory7uMY+jahQIPr+Wp5IPQZ6dH2Wkqyb3xUO0hNEOJYO2huseN9iiatqN
 A9OU9O9hv7akCvcGKIKmoDUatdwgtyKQE3rVPXYgEapXjxnO5ZeHGqqjRi6zRViQjakt
 XNyKvCHiRMdo9khHa+/tOmXpFUYoMG65DsP5MKveoOppBocnTq7ylbM2ZfwgL1N38h2w
 eLfZdkwVjHYoPH4YRw+AAK7WrvOWwvCBBCenFYZvCm2bJTANvQUQf6f1ala1ke9CxTxv
 mTqET3AHfBRafWVF+JzFfjD2moveDphePMcimsTHCR+FXL38cHGPTV0pfmNPPHRuf6Ul cA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2120.oracle.com with ESMTP id 2xakbr9jsk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 10 Jan 2020 11:56:40 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00ABsQV3062696;
        Fri, 10 Jan 2020 11:56:40 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3030.oracle.com with ESMTP id 2xeh90kdja-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 10 Jan 2020 11:56:39 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 00ABuc9k012576;
        Fri, 10 Jan 2020 11:56:38 GMT
Received: from dhcp-10-175-222-124.vpn.oracle.com (/10.175.222.124)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 10 Jan 2020 03:56:37 -0800
Date:   Fri, 10 Jan 2020 11:56:30 +0000 (GMT)
From:   Alan Maguire <alan.maguire@oracle.com>
X-X-Sender: alan@dhcp-10-175-222-124.vpn.oracle.com
To:     Stephen Rothwell <sfr@canb.auug.org.au>
cc:     Shuah Khan <skhan@linuxfoundation.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mike Salvatore <mike.salvatore@canonical.com>,
        Alan Maguire <alan.maguire@oracle.com>
Subject: Re: linux-next: build failure after merge of the kunit-next tree
In-Reply-To: <20200110174300.1836d6c3@canb.auug.org.au>
Message-ID: <alpine.LRH.2.20.2001101153140.3212@dhcp-10-175-222-124.vpn.oracle.com>
References: <20200110174300.1836d6c3@canb.auug.org.au>
User-Agent: Alpine 2.20 (LRH 67 2015-01-07)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9495 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001100102
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9495 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001100102
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 10 Jan 2020, Stephen Rothwell wrote:

> Hi all,
> 
> After merging the kunit-next tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> x86_64-linux-gnu-ld: security/apparmor/policy_unpack.o: in function `policy_unpack_test_unpack_X_out_of_bounds':
> policy_unpack.c:(.text+0xf5c): undefined reference to `kunit_unary_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0xf6f): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: security/apparmor/policy_unpack.o: in function `policy_unpack_test_unpack_X_code_mismatch':
> policy_unpack.c:(.text+0x1113): undefined reference to `kunit_unary_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x1126): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x1161): undefined reference to `kunit_unary_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x11a5): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: security/apparmor/policy_unpack.o: in function `policy_unpack_test_unpack_X_code_match':
> policy_unpack.c:(.text+0x1350): undefined reference to `kunit_unary_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x1363): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x139e): undefined reference to `kunit_unary_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x13e9): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: security/apparmor/policy_unpack.o: in function `policy_unpack_test_unpack_u64_out_of_bounds':
> policy_unpack.c:(.text+0x15a1): undefined reference to `kunit_unary_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x15b4): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x1646): undefined reference to `kunit_binary_ptr_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x1677): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: security/apparmor/policy_unpack.o: in function `policy_unpack_test_unpack_u64_with_name':
> policy_unpack.c:(.text+0x17e7): undefined reference to `kunit_unary_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x17fa): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x1857): undefined reference to `kunit_binary_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x18a2): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x1934): undefined reference to `kunit_binary_ptr_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x1965): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: security/apparmor/policy_unpack.o: in function `policy_unpack_test_unpack_u64_with_null_name':
> policy_unpack.c:(.text+0x1ab0): undefined reference to `kunit_unary_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x1ac3): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x1b20): undefined reference to `kunit_binary_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x1b6b): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x1bfd): undefined reference to `kunit_binary_ptr_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x1c2e): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: security/apparmor/policy_unpack.o: in function `policy_unpack_test_unpack_u32_out_of_bounds':
> policy_unpack.c:(.text+0x1db1): undefined reference to `kunit_unary_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x1dc4): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x1e56): undefined reference to `kunit_binary_ptr_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x1e87): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: security/apparmor/policy_unpack.o: in function `policy_unpack_test_unpack_u32_with_name':
> policy_unpack.c:(.text+0x1feb): undefined reference to `kunit_unary_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x1ffe): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x2060): undefined reference to `kunit_binary_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x20b3): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x2145): undefined reference to `kunit_binary_ptr_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x2176): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: security/apparmor/policy_unpack.o: in function `policy_unpack_test_unpack_u32_with_null_name':
> policy_unpack.c:(.text+0x22b4): undefined reference to `kunit_unary_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x22c7): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x2329): undefined reference to `kunit_binary_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x237c): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x240e): undefined reference to `kunit_binary_ptr_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x243f): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: security/apparmor/policy_unpack.o: in function `policy_unpack_test_unpack_u16_chunk_out_of_bounds_2':
> policy_unpack.c:(.text+0x2643): undefined reference to `kunit_binary_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x266c): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x26b4): undefined reference to `kunit_binary_ptr_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x26dd): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x2757): undefined reference to `kunit_binary_ptr_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x2777): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: security/apparmor/policy_unpack.o: in function `policy_unpack_test_unpack_u16_chunk_out_of_bounds_1':
> policy_unpack.c:(.text+0x297e): undefined reference to `kunit_binary_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x29a7): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x29ef): undefined reference to `kunit_binary_ptr_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x2a18): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x2a94): undefined reference to `kunit_binary_ptr_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x2ab4): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: security/apparmor/policy_unpack.o: in function `policy_unpack_test_unpack_u16_chunk_basic':
> policy_unpack.c:(.text+0x2ce1): undefined reference to `kunit_binary_ptr_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x2d01): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x2d4e): undefined reference to `kunit_binary_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x2d7a): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x2ddf): undefined reference to `kunit_binary_ptr_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x2e07): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: security/apparmor/policy_unpack.o: in function `policy_unpack_test_unpack_strdup_out_of_bounds':
> policy_unpack.c:(.text+0x2f86): undefined reference to `kunit_binary_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x2fcc): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x3023): undefined reference to `kunit_binary_ptr_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x3052): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x30bf): undefined reference to `kunit_binary_ptr_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x30ea): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: security/apparmor/policy_unpack.o: in function `policy_unpack_test_unpack_strdup_with_name':
> policy_unpack.c:(.text+0x324f): undefined reference to `kunit_binary_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x329f): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x32da): undefined reference to `kunit_unary_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x3350): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x33c9): undefined reference to `kunit_binary_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x3418): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: security/apparmor/policy_unpack.o: in function `policy_unpack_test_unpack_strdup_with_null_name':
> policy_unpack.c:(.text+0x359c): undefined reference to `kunit_binary_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x35ec): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x3627): undefined reference to `kunit_unary_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x369d): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x3716): undefined reference to `kunit_binary_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x3765): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: security/apparmor/policy_unpack.o: in function `policy_unpack_test_unpack_str_out_of_bounds':
> policy_unpack.c:(.text+0x38d3): undefined reference to `kunit_binary_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x3919): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x3986): undefined reference to `kunit_binary_ptr_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x39b1): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: security/apparmor/policy_unpack.o: in function `policy_unpack_test_unpack_str_with_name':
> policy_unpack.c:(.text+0x3ae7): undefined reference to `kunit_binary_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x3b2e): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x3b95): undefined reference to `kunit_binary_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x3bdb): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: security/apparmor/policy_unpack.o: in function `policy_unpack_test_unpack_str_with_null_name':
> policy_unpack.c:(.text+0x3d26): undefined reference to `kunit_binary_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x3d6d): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x3dd4): undefined reference to `kunit_binary_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x3e1a): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: security/apparmor/policy_unpack.o: in function `policy_unpack_test_unpack_nameX_with_wrong_name':
> policy_unpack.c:(.text+0x3f55): undefined reference to `kunit_unary_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x3f68): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x3ffa): undefined reference to `kunit_binary_ptr_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x402b): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: security/apparmor/policy_unpack.o: in function `policy_unpack_test_unpack_nameX_with_name':
> policy_unpack.c:(.text+0x4186): undefined reference to `kunit_unary_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x4199): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x4229): undefined reference to `kunit_binary_ptr_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x425a): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: security/apparmor/policy_unpack.o: in function `policy_unpack_test_unpack_nameX_with_wrong_code':
> policy_unpack.c:(.text+0x4390): undefined reference to `kunit_unary_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x43a3): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x4435): undefined reference to `kunit_binary_ptr_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x4466): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: security/apparmor/policy_unpack.o: in function `policy_unpack_test_unpack_nameX_with_null_name':
> policy_unpack.c:(.text+0x459f): undefined reference to `kunit_unary_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x45b2): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x4642): undefined reference to `kunit_binary_ptr_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x4673): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: security/apparmor/policy_unpack.o: in function `policy_unpack_test_unpack_blob_out_of_bounds':
> policy_unpack.c:(.text+0x47f3): undefined reference to `kunit_binary_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x4839): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x48a6): undefined reference to `kunit_binary_ptr_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x48d1): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: security/apparmor/policy_unpack.o: in function `policy_unpack_test_unpack_blob_with_name':
> policy_unpack.c:(.text+0x4a2a): undefined reference to `kunit_binary_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x4a7a): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x4ac3): undefined reference to `kunit_unary_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x4af9): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: security/apparmor/policy_unpack.o: in function `policy_unpack_test_unpack_blob_with_null_name':
> policy_unpack.c:(.text+0x4c55): undefined reference to `kunit_binary_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x4ca5): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x4cee): undefined reference to `kunit_unary_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x4d24): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: security/apparmor/policy_unpack.o: in function `policy_unpack_test_unpack_array_out_of_bounds':
> policy_unpack.c:(.text+0x4eac): undefined reference to `kunit_binary_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x4eed): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x4f6c): undefined reference to `kunit_binary_ptr_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x4f8c): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: security/apparmor/policy_unpack.o: in function `policy_unpack_test_unpack_array_with_name':
> policy_unpack.c:(.text+0x50ec): undefined reference to `kunit_binary_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x512e): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x51ad): undefined reference to `kunit_binary_ptr_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x51cd): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: security/apparmor/policy_unpack.o: in function `policy_unpack_test_unpack_array_with_null_name':
> policy_unpack.c:(.text+0x52f8): undefined reference to `kunit_binary_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x533a): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x53b9): undefined reference to `kunit_binary_ptr_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x53d9): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: security/apparmor/policy_unpack.o: in function `policy_unpack_test_inbounds_when_out_of_bounds':
> policy_unpack.c:(.text+0x54cf): undefined reference to `kunit_unary_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x5533): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: security/apparmor/policy_unpack.o: in function `policy_unpack_test_inbounds_when_inbounds':
> policy_unpack.c:(.text+0x562e): undefined reference to `kunit_unary_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x5641): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x5685): undefined reference to `kunit_unary_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x56e8): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x5727): undefined reference to `kunit_unary_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x5787): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: security/apparmor/policy_unpack.o: in function `kunit_test_suites_init':
> policy_unpack.c:(.text+0x57f6): undefined reference to `kunit_run_tests'
> x86_64-linux-gnu-ld: security/apparmor/policy_unpack.o: in function `build_aa_ext_struct':
> policy_unpack.c:(.text+0x9e2e): undefined reference to `kunit_kmalloc'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x9e69): undefined reference to `kunit_ptr_not_err_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x9ebc): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x9ece): undefined reference to `kunit_kmalloc'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x9f09): undefined reference to `kunit_ptr_not_err_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0x9f5d): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: security/apparmor/policy_unpack.o: in function `policy_unpack_test_init':
> policy_unpack.c:(.text+0xa216): undefined reference to `kunit_kmalloc'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0xa251): undefined reference to `kunit_ptr_not_err_assert_format'
> x86_64-linux-gnu-ld: policy_unpack.c:(.text+0xa2a1): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: drivers/base/power/qos-test.o: in function `kunit_test_suites_init':
> qos-test.c:(.text+0x26): undefined reference to `kunit_run_tests'
> x86_64-linux-gnu-ld: drivers/base/power/qos-test.o: in function `freq_qos_test_readd':
> qos-test.c:(.text+0x179): undefined reference to `kunit_binary_assert_format'
> x86_64-linux-gnu-ld: qos-test.c:(.text+0x1c8): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: qos-test.c:(.text+0x244): undefined reference to `kunit_binary_assert_format'
> x86_64-linux-gnu-ld: qos-test.c:(.text+0x294): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: qos-test.c:(.text+0x306): undefined reference to `kunit_binary_assert_format'
> x86_64-linux-gnu-ld: qos-test.c:(.text+0x359): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: qos-test.c:(.text+0x3c3): undefined reference to `kunit_binary_assert_format'
> x86_64-linux-gnu-ld: qos-test.c:(.text+0x413): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: qos-test.c:(.text+0x482): undefined reference to `kunit_binary_assert_format'
> x86_64-linux-gnu-ld: qos-test.c:(.text+0x4d1): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: qos-test.c:(.text+0x54d): undefined reference to `kunit_binary_assert_format'
> x86_64-linux-gnu-ld: qos-test.c:(.text+0x59d): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: qos-test.c:(.text+0x60f): undefined reference to `kunit_binary_assert_format'
> x86_64-linux-gnu-ld: qos-test.c:(.text+0x662): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: drivers/base/power/qos-test.o: in function `freq_qos_test_min':
> qos-test.c:(.text+0x7f8): undefined reference to `kunit_binary_assert_format'
> x86_64-linux-gnu-ld: qos-test.c:(.text+0x848): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: qos-test.c:(.text+0x8c7): undefined reference to `kunit_binary_assert_format'
> x86_64-linux-gnu-ld: qos-test.c:(.text+0x917): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: qos-test.c:(.text+0x989): undefined reference to `kunit_binary_assert_format'
> x86_64-linux-gnu-ld: qos-test.c:(.text+0x9dc): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: qos-test.c:(.text+0xa49): undefined reference to `kunit_binary_assert_format'
> x86_64-linux-gnu-ld: qos-test.c:(.text+0xa99): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: qos-test.c:(.text+0xb0b): undefined reference to `kunit_binary_assert_format'
> x86_64-linux-gnu-ld: qos-test.c:(.text+0xb5e): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: qos-test.c:(.text+0xbc8): undefined reference to `kunit_binary_assert_format'
> x86_64-linux-gnu-ld: qos-test.c:(.text+0xc18): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: qos-test.c:(.text+0xc87): undefined reference to `kunit_binary_assert_format'
> x86_64-linux-gnu-ld: qos-test.c:(.text+0xcd6): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: drivers/base/power/qos-test.o: in function `freq_qos_test_maxdef':
> qos-test.c:(.text+0xe6e): undefined reference to `kunit_binary_assert_format'
> x86_64-linux-gnu-ld: qos-test.c:(.text+0xec1): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: qos-test.c:(.text+0xf3a): undefined reference to `kunit_binary_assert_format'
> x86_64-linux-gnu-ld: qos-test.c:(.text+0xf89): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: qos-test.c:(.text+0x1005): undefined reference to `kunit_binary_assert_format'
> x86_64-linux-gnu-ld: qos-test.c:(.text+0x1054): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: qos-test.c:(.text+0x10c3): undefined reference to `kunit_binary_assert_format'
> x86_64-linux-gnu-ld: qos-test.c:(.text+0x1113): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: qos-test.c:(.text+0x1185): undefined reference to `kunit_binary_assert_format'
> x86_64-linux-gnu-ld: qos-test.c:(.text+0x11d8): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: qos-test.c:(.text+0x1247): undefined reference to `kunit_binary_assert_format'
> x86_64-linux-gnu-ld: qos-test.c:(.text+0x1296): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: qos-test.c:(.text+0x1308): undefined reference to `kunit_binary_assert_format'
> x86_64-linux-gnu-ld: qos-test.c:(.text+0x135b): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: qos-test.c:(.text+0x13c5): undefined reference to `kunit_binary_assert_format'
> x86_64-linux-gnu-ld: qos-test.c:(.text+0x1415): undefined reference to `kunit_do_assertion'
> x86_64-linux-gnu-ld: qos-test.c:(.text+0x1487): undefined reference to `kunit_binary_assert_format'
> x86_64-linux-gnu-ld: qos-test.c:(.text+0x14da): undefined reference to `kunit_do_assertion'
> 
> I am not sure what caused this.
> 
> This build is a cross build and using a separate object directory (in
> case that matters).
> 
> I used the kunit-next tree from next-20200109 for today.
>

This is my fault; when kunit is built as a module, kunit
tests that are builtin-only fail to build.  I've posted
a patch to fix this at

https://lore.kernel.org/linux-kselftest/1578656965-2993-1-git-send-email-alan.maguire@oracle.com/T/#u 

Thanks for catching this Stephen, and apologies for the noise!

Alan

> -- 
> Cheers,
> Stephen Rothwell
> 
