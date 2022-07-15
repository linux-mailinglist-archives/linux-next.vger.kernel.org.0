Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF9025762B5
	for <lists+linux-next@lfdr.de>; Fri, 15 Jul 2022 15:27:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230503AbiGON1K (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 15 Jul 2022 09:27:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbiGON1J (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 15 Jul 2022 09:27:09 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E84078DDF;
        Fri, 15 Jul 2022 06:27:05 -0700 (PDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26FDJGS1032711;
        Fri, 15 Jul 2022 13:27:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=4stIaNutWDJ8lwB09kyhlbl5FKlvtViMM8hrPgSMzEY=;
 b=MYCiWYdqRUnqE2loxcUxzFeJxvN3aC2enaArf0TYOfP6Jv64ot9MP42nMBXGp/W9bbfm
 eUioVaCdluTWvgwOjYXC5JFnp/zgPO1r9uDW81jgIBYcMCiN0tcsuy4RWJbmbdZwos4o
 XbYRTRzZo5MRF+Kg62okKM0sddiWwrE+B2w/BFHYc5Rx8CL+G58FKBXX5l2vZIj42Udp
 jLattnODJeT9VziKATlfCFEXM8G0n08ci/kukC3uoLYWSvCF/9pPvX/WCxf1qCgqLLfj
 lyEAqgL7N+rX5ZLDbK8WIVoN4XZ+/BZG/KUsQtpksBYZB6vkDt/9nGWZgnj62FlwgXlJ Pg== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hb90vr4p8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 15 Jul 2022 13:27:00 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
        by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26FDKiPj014399;
        Fri, 15 Jul 2022 13:26:58 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
        by ppma03ams.nl.ibm.com with ESMTP id 3h71a90f0k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 15 Jul 2022 13:26:57 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
        by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26FDR6iE32506292
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 15 Jul 2022 13:27:06 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 7F14542041;
        Fri, 15 Jul 2022 13:26:55 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 2C1FA4203F;
        Fri, 15 Jul 2022 13:26:54 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.67.10])
        by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Fri, 15 Jul 2022 13:26:53 +0000 (GMT)
Content-Type: text/plain;
        charset=us-ascii
Subject: Re: Kernel crash(block/null_blk) while running blktests (block/10)
From:   Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <20220715124158.GA25618@test-zns>
Date:   Fri, 15 Jul 2022 18:56:52 +0530
Cc:     linux-block@vger.kernel.org, vincent.fu@samsung.com,
        linuxppc-dev@lists.ozlabs.org, linux-next@vger.kernel.org
Message-Id: <FB56C15D-5E85-4EC4-AEDA-199884F6B30B@linux.ibm.com>
References: <CGME20220715123722epcas5p209d7ab2411e2ca5d63f5e2e42a83a665@epcas5p2.samsung.com>
 <9CCFA12F-603C-4C70-844F-83B5C9580BAB@linux.ibm.com>
 <20220715124158.GA25618@test-zns>
To:     Kanchan Joshi <joshi.k@samsung.com>
X-Mailer: Apple Mail (2.3696.100.31)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: w5GuckQdDVUVVjL9Mti_wQmaMQo8vxNq
X-Proofpoint-ORIG-GUID: w5GuckQdDVUVVjL9Mti_wQmaMQo8vxNq
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-15_05,2022-07-15_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 spamscore=0 mlxlogscore=999 clxscore=1011 mlxscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207150057
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



> On 15-Jul-2022, at 6:11 PM, Kanchan Joshi <joshi.k@samsung.com> wrote:
>=20
> On Fri, Jul 15, 2022 at 06:07:01PM +0530, Sachin Sant wrote:
>> While running blktests[*] (block/10) on a IBM Power server booted with
>> 5.19.0-rc6-next-20220714 following crash is seen:
> Ming has posted a fix , please see if this can be tried -
> https://lore.kernel.org/linux-block/20220715031916.151469-1-ming.lei@redh=
at.com/
>=20
Thanks for the pointer.=20
Yes the posted patch fixes the problem for me.

- Sachin

