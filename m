Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0207228889D
	for <lists+linux-next@lfdr.de>; Fri,  9 Oct 2020 14:25:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733065AbgJIMZy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 9 Oct 2020 08:25:54 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:7498 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729272AbgJIMZx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 9 Oct 2020 08:25:53 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 099C2rmb125001;
        Fri, 9 Oct 2020 08:25:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=a8tRcmxAyP73hI260eI4ug23S3jRSyJFhEOxcGgUnHw=;
 b=Donau3tQm2QcSkh0kF1KHdX482YfD0rVYGcU8EcsMU13PydiKdF4m2QySrZGJJLuZAQ1
 KNnzxrI2x2Nxj434D4lCsn6Z6c5lQWTXwFw2PbVpYYlpIIfAYWxyCYM1Y7tXaFbJJ9AT
 NQvcJNrR3Zc7PzLwopG1OuMXeSr21f7VFvmg493vaG+JS8hsRvTYGXxVuaqZfC8ZeYUZ
 uTH/KjrIE7xLkQ/T9cvrSyJL4Ues4W7CSPVJscmzpEtNhmaihpKCRZvAbrW1t9q9+/S9
 DZzQVb46LbocA/q+3qlAl5b9l8m4mPRfskEEMuz9nMzRLerbOWGewnKmR82BqVwxsjpO 7A== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 342mb4f8um-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 09 Oct 2020 08:25:31 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 099C4ntg133564;
        Fri, 9 Oct 2020 08:25:31 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
        by mx0a-001b2d01.pphosted.com with ESMTP id 342mb4f8th-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 09 Oct 2020 08:25:31 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
        by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 099CBY7L015780;
        Fri, 9 Oct 2020 12:25:28 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
        by ppma04ams.nl.ibm.com with ESMTP id 3429hm0n3m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 09 Oct 2020 12:25:28 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 099CPQce32637210
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 9 Oct 2020 12:25:26 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 18DD34C044;
        Fri,  9 Oct 2020 12:25:26 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 4E1A24C058;
        Fri,  9 Oct 2020 12:25:25 +0000 (GMT)
Received: from localhost (unknown [9.145.0.122])
        by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Fri,  9 Oct 2020 12:25:25 +0000 (GMT)
Date:   Fri, 9 Oct 2020 14:25:23 +0200
From:   Vasily Gorbik <gor@linux.ibm.com>
To:     Jiri Olsa <jolsa@redhat.com>
Cc:     Arnaldo Carvalho de Melo <acme@kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Ingo Molnar <mingo@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Namhyung Kim <namhyung@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: [PATCH RESEND 1/1] perf build: Allow nested externs to enable
 BUILD_BUG() usage
Message-ID: <patch-1.thread-251403.git-2514037e9477.your-ad-here.call-01602244460-ext-7088@work.hours>
References: <20201009112327.GC656950@krava>
 <cover.thread-251403.your-ad-here.call-01602244460-ext-7088@work.hours>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.thread-251403.your-ad-here.call-01602244460-ext-7088@work.hours>
X-Patchwork-Bot: notify
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-10-09_06:2020-10-09,2020-10-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 adultscore=0 mlxscore=0 suspectscore=1
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010090086
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Currently BUILD_BUG() macro is expanded to smth like the following:
   do {
           extern void __compiletime_assert_0(void)
                   __attribute__((error("BUILD_BUG failed")));
           if (!(!(1)))
                   __compiletime_assert_0();
   } while (0);

If used in a function body this obviously would produce build errors
with -Wnested-externs and -Werror.

To enable BUILD_BUG() usage in tools/arch/x86/lib/insn.c which perf
includes in intel-pt-decoder, build perf without -Wnested-externs.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Vasily Gorbik <gor@linux.ibm.com>
---
 Resend with no fancy signatures.

 tools/perf/Makefile.config | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 854da830b5ca..834061e94e7c 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -16,7 +16,7 @@ $(shell printf "" > $(OUTPUT).config-detected)
 detected     = $(shell echo "$(1)=y"       >> $(OUTPUT).config-detected)
 detected_var = $(shell echo "$(1)=$($(1))" >> $(OUTPUT).config-detected)
 
-CFLAGS := $(EXTRA_CFLAGS) $(EXTRA_WARNINGS)
+CFLAGS := $(EXTRA_CFLAGS) $(filter-out -Wnested-externs,$(EXTRA_WARNINGS))
 
 include $(srctree)/tools/scripts/Makefile.arch
 
-- 
2.25.4
