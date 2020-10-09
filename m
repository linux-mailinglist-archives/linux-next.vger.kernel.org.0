Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52B842882F5
	for <lists+linux-next@lfdr.de>; Fri,  9 Oct 2020 08:48:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731579AbgJIGsO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 9 Oct 2020 02:48:14 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:9010 "EHLO
        mx0b-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731076AbgJIGsN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 9 Oct 2020 02:48:13 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0996XFNH116259;
        Fri, 9 Oct 2020 02:47:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=pp1;
 bh=7npiYY1G2FfggAYyTzA/cJHByVtE439s2uXTBc239oE=;
 b=qjM8f/zejSo3hgzFFDr/S09kFTEkbfIf6HMg6sbWAmn81tQDPgfg4IJME1T4/nWAzBLS
 wktlHR3CXTIp1CbbzlUmdGQNGH7MSceiueIyq6e2vhHgDXeB99K8MNJv6l1dCkj4v3bW
 dCyQupq8Sfq7I1QrHnWN+WXNyfqlRXlmOym3YoZh6cggmN9a8whyc/LdobjpOROi69xG
 4D4HQ0iot+/GcccrX+kCfOC18VdFXWWNm7xj3y1Mbn3BzYm1ycMCRpQ4yJtVq/GThCq3
 1SeJgOleKg2byl8FHF4J3Aw8toI3GBFqR1f/UjgoVEdA2Vl/Lw8/RFuIC+6nGCznE5RO pg== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 342hk1swse-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 09 Oct 2020 02:47:54 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0996XoYj118041;
        Fri, 9 Oct 2020 02:47:53 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
        by mx0a-001b2d01.pphosted.com with ESMTP id 342hk1swr2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 09 Oct 2020 02:47:53 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
        by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0996S2Rr031925;
        Fri, 9 Oct 2020 06:47:49 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
        by ppma03ams.nl.ibm.com with ESMTP id 3429hugccw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 09 Oct 2020 06:47:49 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
        by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 0996llI328442938
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 9 Oct 2020 06:47:47 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 9B9DE11C054;
        Fri,  9 Oct 2020 06:47:47 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id DA2BD11C050;
        Fri,  9 Oct 2020 06:47:46 +0000 (GMT)
Received: from localhost (unknown [9.145.0.122])
        by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Fri,  9 Oct 2020 06:47:46 +0000 (GMT)
Date:   Fri, 9 Oct 2020 08:47:45 +0200
From:   Vasily Gorbik <gor@linux.ibm.com>
To:     Arnaldo Carvalho de Melo <acme@kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Ingo Molnar <mingo@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: [PATCH 1/1] perf build: Allow nested externs to enable BUILD_BUG()
 usage
Message-ID: <patch-1.thread-d92c35.git-d92c35ca4748.your-ad-here.call-01602224864-ext-8734@work.hours>
References: <20201009152846.072e6bbf@canb.auug.org.au>
 <cover.thread-d92c35.your-ad-here.call-01602224864-ext-8734@work.hours>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.thread-d92c35.your-ad-here.call-01602224864-ext-8734@work.hours>
X-Patchwork-Bot: notify
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-10-09_02:2020-10-09,2020-10-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 suspectscore=1 phishscore=0 impostorscore=0
 mlxscore=0 bulkscore=0 clxscore=1015 spamscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010090046
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
 tools/perf/Makefile.config | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 190be4fa5c21..8137a6046a47 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -16,7 +16,7 @@ $(shell printf "" > $(OUTPUT).config-detected)
 detected     = $(shell echo "$(1)=y"       >> $(OUTPUT).config-detected)
 detected_var = $(shell echo "$(1)=$($(1))" >> $(OUTPUT).config-detected)
 
-CFLAGS := $(EXTRA_CFLAGS) $(EXTRA_WARNINGS)
+CFLAGS := $(EXTRA_CFLAGS) $(filter-out -Wnested-externs,$(EXTRA_WARNINGS))
 
 include $(srctree)/tools/scripts/Makefile.arch
 
-- 
⣿⣿⣿⣿⢋⡀⣀⠹⣿⣿⣿⣿
⣿⣿⣿⣿⠠⣶⡦⠀⣿⣿⣿⣿
⣿⣿⣿⠏⣴⣮⣴⣧⠈⢿⣿⣿
⣿⣿⡏⢰⣿⠖⣠⣿⡆⠈⣿⣿
⣿⢛⣵⣄⠙⣶⣶⡟⣅⣠⠹⣿
⣿⣜⣛⠻⢎⣉⣉⣀⠿⣫⣵⣿
