Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A73D1578282
	for <lists+linux-next@lfdr.de>; Mon, 18 Jul 2022 14:40:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234888AbiGRMko (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 Jul 2022 08:40:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233786AbiGRMkn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 18 Jul 2022 08:40:43 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AF5823B;
        Mon, 18 Jul 2022 05:40:42 -0700 (PDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26ICax3G012712;
        Mon, 18 Jul 2022 12:40:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=JaG6Jg1iP6JRc4hKh1yNH9brztMAziIq7oii+Ehcmso=;
 b=Iv+zlpU9nKnXtVAlosoF3tmHH3RXqF1vWchRY5RK8JIsKv3LrMxZWCYarhe99tD8QGzc
 HySx33eDaeUsYZLOLEnPOiSSWDsh0BpuSMiMx/P1w/2443tJy9mA5xUv76C9GvCoaDtW
 iyUB2u9srF8Q7lYj+l2i1IWeA6y8VevxrXiRwZAVc+pUkFGyXr9sj8CGsffkjZ+VaRzz
 KGYpxaphtLhnrd+ZkZU/H8slXH0fdkZCVeNa3yR6R3jgm9qa5YHuZWtH69asNjFTZ+zv
 JozqQV1yJee9TC1amETHh6cb2W3ehNKsTTcG8hLK3ZiQ1Axhwa26F+zRAC49djC72exL Bw== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hd7e9g8wy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 18 Jul 2022 12:40:38 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26ICbAjw014622;
        Mon, 18 Jul 2022 12:40:38 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hd7e9g8vy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 18 Jul 2022 12:40:38 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
        by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26ICag54005548;
        Mon, 18 Jul 2022 12:40:35 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
        by ppma01fra.de.ibm.com with ESMTP id 3hbmy8tnq1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 18 Jul 2022 12:40:35 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
        by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26ICeXI424314162
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 18 Jul 2022 12:40:33 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 2EDD35204E;
        Mon, 18 Jul 2022 12:40:33 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.36.77])
        by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id B6B7852054;
        Mon, 18 Jul 2022 12:40:31 +0000 (GMT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.100.31\))
Subject: Re: BUG xfs_buf while running tests/xfs/435 (next-20220715)
From:   Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <20220718080112.GS3861211@dread.disaster.area>
Date:   Mon, 18 Jul 2022 18:10:30 +0530
Cc:     dchinner@redhat.com, linux-xfs@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-next@vger.kernel.org,
        riteshh@linux.ibm.com
Content-Transfer-Encoding: 7bit
Message-Id: <E1661B4B-D2BF-465F-8C65-935909A2E527@linux.ibm.com>
References: <C6CAF8E3-0447-465D-9C83-F55910739BE2@linux.ibm.com>
 <20220718080112.GS3861211@dread.disaster.area>
To:     Dave Chinner <david@fromorbit.com>
X-Mailer: Apple Mail (2.3696.100.31)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: eCQpeuJwX6uModo8laEmqGSYPLva-8U0
X-Proofpoint-GUID: -CNcpwPBoqeeOP1paBfubOvzUqzKa_1v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-18_11,2022-07-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 mlxlogscore=999 clxscore=1011 priorityscore=1501 phishscore=0
 impostorscore=0 mlxscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207180054
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


> Fix it by removing the xfs_buf_init/terminate wrappers that just
> allocate and destroy the xfs_buf slab, and move them to the same
> place that all the other slab caches are set up and destroyed.
> 
> Reported-by: Sachin Sant <sachinp@linux.ibm.com>
> Fixes: 298f34224506 ("xfs: lockless buffer lookup")
> Signed-off-by: Dave Chinner <dchinner@redhat.com>
> ---

Thanks. The patch fixes the reported problem for me.

Tested-by: Sachin Sant <sachinp@linux.ibm.com>

- Sachin
