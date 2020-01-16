Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D08013D8D8
	for <lists+linux-next@lfdr.de>; Thu, 16 Jan 2020 12:20:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726084AbgAPLUN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Jan 2020 06:20:13 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:42734 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726045AbgAPLUN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 16 Jan 2020 06:20:13 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00GBJ9lW093932;
        Thu, 16 Jan 2020 11:19:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id; s=corp-2019-08-05;
 bh=YjFKVeJql6lw/iCy6LWo5CW0DXVtW3mwUUFRKQ485gU=;
 b=XtFE4lVNz2AHk/xSj27X7PMwQnut7Q+IPoYad1Yo0hw6nFtdq2q1uYgzb6Fl+Cl6Nfec
 wjSqrvNLJgudz0N3JsOJdke+w6F0e594aKWwJ7tXwployHKYaPzlDLaqan1AY/bN5jKN
 NYtt5aiADdHy+Og2b+ZdVnlAMgoa37dM+gwNi/xrL8G4+M02NvK/uxdJJHSVT/Z7h7Ep
 wdu3BE+8N+SXw13MCZIHFfl68Gbx5N/YBTcC9XzvoVnhJ3/7fUUg7lPTPIE34n7aVrCS
 M3jj4S8TJ52Y1SrmjBdb6vWFIfIozEyl8BDiVwJaJG2t+OFF6oJ1IWtpzECxCWfQjL7W Ew== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 2xf74shvpc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 16 Jan 2020 11:19:32 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00GBJ8hu189386;
        Thu, 16 Jan 2020 11:19:32 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3020.oracle.com with ESMTP id 2xj1psvwpv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 16 Jan 2020 11:19:31 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 00GBINs4016818;
        Thu, 16 Jan 2020 11:18:23 GMT
Received: from dhcp-10-175-200-122.vpn.oracle.com (/10.175.200.122)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 16 Jan 2020 03:18:23 -0800
From:   Alan Maguire <alan.maguire@oracle.com>
To:     rjw@rjwysocki.net
Cc:     gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        skhan@linuxfoundation.org, brendanhiggins@google.com,
        linux-next@vger.kernel.org, dmitry.torokhov@gmail.com,
        sfr@canb.auug.org.au, rdunlap@infradead.org,
        Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH] software node: property entry kunit tests must depend on KUNIT=y
Date:   Thu, 16 Jan 2020 11:17:31 +0000
Message-Id: <1579173451-2439-1-git-send-email-alan.maguire@oracle.com>
X-Mailer: git-send-email 1.8.3.1
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9501 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=5 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=800
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001160097
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9501 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=5 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=859 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001160097
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

property entry kunit tests are built if CONFIG_KUNIT_DRIVER_PE_TEST
(a boolean) is 'y'; it in turn depends on CONFIG_KUNIT.  However to
ensure clean merge with linux-next, where CONFIG_KUNIT is tristate,
we need to explicitly specify KUNIT=y as a dependency, otherwise
allmodconfig builds will build kunit as a module and fail to build
the property entry tests.  Later CONFIG_KUNIT_DRIVER_PE_TEST can
be converted to tristate.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Fixes: 27f9d7e984d9 ("software node: introduce CONFIG_KUNIT_DRIVER_PE_TEST")
Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 drivers/base/test/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/test/Kconfig b/drivers/base/test/Kconfig
index d29ae95..305c775 100644
--- a/drivers/base/test/Kconfig
+++ b/drivers/base/test/Kconfig
@@ -10,4 +10,4 @@ config TEST_ASYNC_DRIVER_PROBE
 	  If unsure say N.
 config KUNIT_DRIVER_PE_TEST
 	bool "KUnit Tests for property entry API"
-	depends on KUNIT
+	depends on KUNIT=y
-- 
1.8.3.1

