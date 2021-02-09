Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72EAC315266
	for <lists+linux-next@lfdr.de>; Tue,  9 Feb 2021 16:09:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231480AbhBIPJe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 9 Feb 2021 10:09:34 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:26488 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230269AbhBIPJb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 9 Feb 2021 10:09:31 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 119F5BYF103346;
        Tue, 9 Feb 2021 10:07:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id; s=pp1;
 bh=Gxn6kpNJlqOqapCM9P6ePsC9LFlfSKLt8BCMgsufOVo=;
 b=jgjeWAmAdjhhTIa+VQ/qmP09nXiKKx3JIjZfBZlUWECNLdBXIuOgZBW/yyELG2CJWVEh
 p87ihPPgVhxdfsqO8P3G3QEi5Dy8HrZcV7Dg+QBIoYsT5LSc4QkNgRn4gG+yHYBvJ+yt
 HNTNXoWpadkoqJa4+r+juS49jmffrna0RGlzPGlpoamL9LPEAV/TBQOG7QNS5uu0vG8T
 YRY8AVcLtBlQW4g9JWJH5CLcYvVitgn6D9tllt3DBAwNb8U3LJx1IFp9NR10OYnT6JF5
 42N0EW82LtbAF9EikKHhHtYZMll4x0WjvFJFL1+SX+dKy/a1knWElVCBGr4sCKFRHbdr Ag== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
        by mx0a-001b2d01.pphosted.com with ESMTP id 36kvmmrak8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 09 Feb 2021 10:07:52 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
        by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 119F48l9005132;
        Tue, 9 Feb 2021 15:07:27 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
        by ppma04ams.nl.ibm.com with ESMTP id 36hjr8bfd3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 09 Feb 2021 15:07:27 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
        by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 119F7PrM43319742
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 9 Feb 2021 15:07:25 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 081D142047;
        Tue,  9 Feb 2021 15:07:25 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id EA7474203F;
        Tue,  9 Feb 2021 15:07:24 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
        by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Tue,  9 Feb 2021 15:07:24 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 55390)
        id 8F725E23E8; Tue,  9 Feb 2021 16:07:24 +0100 (CET)
From:   Sven Schnelle <svens@linux.ibm.com>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
        Sven Schnelle <svens@linux.ibm.com>
Subject: [PATCH] uprobes: add missing get_uprobe() in __find_uprobe()
Date:   Tue,  9 Feb 2021 16:07:11 +0100
Message-Id: <20210209150711.36778-1-svens@linux.ibm.com>
X-Mailer: git-send-email 2.17.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.737
 definitions=2021-02-09_03:2021-02-09,2021-02-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 phishscore=0 mlxlogscore=999 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102090079
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

commit c6bc9bd06dff49fa4c("rbtree, uprobes: Use rbtree helpers") from
next-20210208 accidentally removed the refcount increase. Add it again.

Signed-off-by: Sven Schnelle <svens@linux.ibm.com>
---
 kernel/events/uprobes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/events/uprobes.c b/kernel/events/uprobes.c
index 7e15b2efdd87..6addc9780319 100644
--- a/kernel/events/uprobes.c
+++ b/kernel/events/uprobes.c
@@ -661,7 +661,7 @@ static struct uprobe *__find_uprobe(struct inode *inode, loff_t offset)
 	struct rb_node *node = rb_find(&key, &uprobes_tree, __uprobe_cmp_key);
 
 	if (node)
-		return __node_2_uprobe(node);
+		return get_uprobe(__node_2_uprobe(node));
 
 	return NULL;
 }
-- 
2.17.1

