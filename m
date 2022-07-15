Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38C635762AC
	for <lists+linux-next@lfdr.de>; Fri, 15 Jul 2022 15:20:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234657AbiGONUN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 15 Jul 2022 09:20:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbiGONUL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 15 Jul 2022 09:20:11 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 488AF550A2;
        Fri, 15 Jul 2022 06:20:10 -0700 (PDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26FD7DUu016059;
        Fri, 15 Jul 2022 13:20:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : content-type :
 subject : message-id : date : cc : to : content-transfer-encoding :
 mime-version; s=pp1; bh=bvfEcQthPppdDUhmK1oAFu2rcAWVigm3l8flhHV+6K8=;
 b=gbdmXMu2H8+J9Civ7fw+dVU4pryFUHVwPCtF1zxc/84MdD/FIwwgFgluCCLMT2YFx0Qw
 Ps3QgTc9ktUt3unqoobF7Qode3Trx7O/uMVk843Pl6BWzBmYWo/fqAUVXLotPBI+0Bt7
 esHj5LuHjHu+Gqol77d2G2EMH7YH4eLC14NUCYoeX3e+3HXKnlificMDuI3L+oBr37oY
 BuWZ2lu7BjAcKo1VNvgyWmfvt8U9Q3bJRqbATRQ3kcjoZmGhCOpXiG/+H+DULc7gfjBv
 zJ6iQ1bZcac348HsLB7K1dpyzJDiWYNXvGzAcq8yLIXdMJ3pbxwFctzXuIc08cSB5snA Mw== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hb8fkrqhe-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 15 Jul 2022 13:20:06 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26FD7Us3018646;
        Fri, 15 Jul 2022 13:20:06 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hb8fkrqgh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 15 Jul 2022 13:20:06 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
        by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26FDK38a009877;
        Fri, 15 Jul 2022 13:20:03 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
        by ppma04fra.de.ibm.com with ESMTP id 3h99s7b6vp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 15 Jul 2022 13:20:03 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
        by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26FDK1qH10682738
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 15 Jul 2022 13:20:01 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 60BBE4203F;
        Fri, 15 Jul 2022 13:20:01 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 2732C42042;
        Fri, 15 Jul 2022 13:20:00 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.67.10])
        by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Fri, 15 Jul 2022 13:19:59 +0000 (GMT)
From:   Sachin Sant <sachinp@linux.ibm.com>
Content-Type: text/plain;
        charset=us-ascii
Subject: Re: [PATCH] null_blk: cleanup null_init_tag_set
Message-Id: <443E9662-1342-482A-B3BC-E64287FF9FE4@linux.ibm.com>
Date:   Fri, 15 Jul 2022 18:49:58 +0530
Cc:     Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
        vincent.fu@samsung.com, linux-next@vger.kernel.org
To:     ming.lei@redhat.com
X-Mailer: Apple Mail (2.3696.100.31)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ku3qbGpneJfP7wNBZsBu6E_7ImYIyPav
X-Proofpoint-GUID: fCfZlV3rKN_JcYB0ITY-47x6_CDS5G0I
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-15_05,2022-07-15_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 impostorscore=0
 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=786 mlxscore=0 spamscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207150057
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

I ran into similar[1] issue (addressed by this patch ) while running blktes=
ts and
can confirm that this patch fixes the reported problem for me.

Tested-by: Sachin Sant <sachinp@linux.ibm.com>

Thanks
- Sachin

[1] -> https://lore.kernel.org/linux-next/20220715124158.GA25618@test-zns/T=
/#t=
