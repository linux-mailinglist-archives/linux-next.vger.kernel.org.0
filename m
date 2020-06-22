Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 277562036AC
	for <lists+linux-next@lfdr.de>; Mon, 22 Jun 2020 14:25:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728034AbgFVMZy convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Mon, 22 Jun 2020 08:25:54 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:52890 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726889AbgFVMZy (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 22 Jun 2020 08:25:54 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 05MC34uS034199;
        Mon, 22 Jun 2020 08:25:35 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
        by mx0b-001b2d01.pphosted.com with ESMTP id 31sqs04a0t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 22 Jun 2020 08:25:35 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
        by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05MCLvhn019384;
        Mon, 22 Jun 2020 12:25:33 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
        by ppma02fra.de.ibm.com with ESMTP id 31sa381amm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 22 Jun 2020 12:25:33 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 05MCPVkj42139800
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 22 Jun 2020 12:25:31 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 4A1C111C052;
        Mon, 22 Jun 2020 12:25:31 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 6442011C064;
        Mon, 22 Jun 2020 12:25:30 +0000 (GMT)
Received: from [9.85.95.171] (unknown [9.85.95.171])
        by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Mon, 22 Jun 2020 12:25:30 +0000 (GMT)
From:   Sachin Sant <sachinp@linux.vnet.ibm.com>
Content-Type: text/plain;
        charset=us-ascii
Content-Transfer-Encoding: 8BIT
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.14\))
Subject: [next-20200621] LTP tests af_alg02/05 failure on POWER9 PowerVM LPAR
Message-Id: <DF21C7B5-3824-4A6E-B59C-78B67E247383@linux.vnet.ibm.com>
Date:   Mon, 22 Jun 2020 17:55:29 +0530
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        linuxppc-dev@lists.ozlabs.org
To:     herbert@gondor.apana.org.au, linux-crypto@vger.kernel.org
X-Mailer: Apple Mail (2.3445.104.14)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.687
 definitions=2020-06-22_04:2020-06-22,2020-06-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 cotscore=-2147483648
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 mlxscore=0 spamscore=0 adultscore=0 clxscore=1011 phishscore=0
 mlxlogscore=930 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006220087
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

With recent next(next-20200621) af_alg02/05 tests fail while running on POWER9
PowerVM LPAR.

Results from  5.8.0-rc1-next-20200622
# ./af_alg02
tst_test.c:1096: INFO: Timeout per run is 0h 00m 20s
af_alg02.c:52: BROK: Timed out while reading from request socket.
#

5.8.0-rc1-next-20200618 was good. The test case ran fine.

Root cause analysis point to following commit:

commit f3c802a1f30013f8f723b62d7fa49eb9e991da23
    crypto: algif_aead - Only wake up when ctx->more is zero

Reverting this commit allows the test to PASS.

Results after reverting the mentioned commit:

# uname -r
5.8.0-rc1-next-20200622-dirty
# ./af_alg02 
tst_test.c:1096: INFO: Timeout per run is 0h 00m 20s
af_alg02.c:33: PASS: Successfully "encrypted" an empty message
#
# ./af_alg05
tst_test.c:1096: INFO: Timeout per run is 0h 05m 00s
af_alg05.c:34: PASS: read() expectedly failed with EINVAL
# 

Thanks
-Sachin
