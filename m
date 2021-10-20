Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFB7F434E1D
	for <lists+linux-next@lfdr.de>; Wed, 20 Oct 2021 16:41:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230201AbhJTOn0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 Oct 2021 10:43:26 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:37454 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230260AbhJTOnZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 20 Oct 2021 10:43:25 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19KE1enX011240;
        Wed, 20 Oct 2021 10:40:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : content-type : mime-version; s=pp1;
 bh=XB2TQv+AHPx5f/d5UjqgOA5QJ7F0oxPbKwbP6ZjZgKY=;
 b=tKhA35xkKoGK8n1z1lJvMYEcOYGBCBqtm8Rmm4DZ1yVLdg+l42ACEaLkFtAuZk83y63X
 4AaZRXvRXc9RSwEDcNgfcByKJhKT26Fu+XmSar1/4s06W23xVAqGHKDqjuQSgRuoGh5g
 hutTZe82/xjfX/Qj327lX1i1JLvpEoZLNrz6UVG1DV6nrX+SQUT15pzpG8h70ZlXS8V0
 qm+WLNQZdOexN73KRgS0GuYQRqMeuXxbDd67InXtE5mQ2/WTzw0xbILCn6dkX4EAApvs
 7Xf7IRxfEYmASLxMmL9+qnhRa8/5+aDCTrfp8gFt04jYp1vCmR75f97r2I4/SWwbqeSN yQ== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3btcaa4ens-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 20 Oct 2021 10:40:47 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19KCeaPq027348;
        Wed, 20 Oct 2021 10:40:46 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3btcaa4emq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 20 Oct 2021 10:40:46 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
        by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19KEcB6U005428;
        Wed, 20 Oct 2021 14:40:44 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
        by ppma02fra.de.ibm.com with ESMTP id 3bqpca35fk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 20 Oct 2021 14:40:43 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
        by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 19KEYovp60686594
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 20 Oct 2021 14:34:50 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 71EADAE04D;
        Wed, 20 Oct 2021 14:40:41 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 3A942AE059;
        Wed, 20 Oct 2021 14:40:41 +0000 (GMT)
Received: from osiris (unknown [9.145.21.78])
        by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Wed, 20 Oct 2021 14:40:41 +0000 (GMT)
Date:   Wed, 20 Oct 2021 16:40:39 +0200
From:   Heiko Carstens <hca@linux.ibm.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Steven Rostedt <rostedt@goodmis.org>, Jiri Olsa <jolsa@redhat.com>,
        Vasily Gorbik <gor@linux.ibm.com>, linux-next@vger.kernel.org
Subject: Upcoming merge conflict between ftrace and s390 trees
Message-ID: <YXAqZ/EszRisunQw@osiris>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: AAgtfWrH_xln0ruN9OMrGs_Ie5HRnWsN
X-Proofpoint-ORIG-GUID: sqANYT7OVJyTXNpTpvnrTxDpgG2RWI1-
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-20_05,2021-10-20_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 adultscore=0 clxscore=1011 mlxlogscore=879 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110200085
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

just as heads-up: there will be an upcoming merge conflict between
ftrace and s390 trees in linux-next which will cause a compile error
for s390.

With the s390 tree this commit is already in linux-next:
https://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git/commit/?h=features&id=c316eb4460463b6dd1aee6d241cb20323a0030aa

And soon this patch will likely be within the ftrace tree:
https://lore.kernel.org/lkml/20211008091336.33616-9-jolsa@kernel.org/

Maybe Steven could reply to this when he applies it.

This would be required to fix the conflict:

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 999907dd7544..d654b95a1e3e 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -190,6 +190,7 @@ config X86
 	select HAVE_DYNAMIC_FTRACE_WITH_ARGS	if X86_64
 	select HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 	select HAVE_SAMPLE_FTRACE_DIRECT	if X86_64
+	select HAVE_SAMPLE_FTRACE_MULTI_DIRECT	if X86_64
 	select HAVE_EBPF_JIT
 	select HAVE_EFFICIENT_UNALIGNED_ACCESS
 	select HAVE_EISA
diff --git a/samples/Kconfig b/samples/Kconfig
index 0823b97d8546..7561f3e42296 100644
--- a/samples/Kconfig
+++ b/samples/Kconfig
@@ -229,3 +229,6 @@ endif # SAMPLES
 
 config HAVE_SAMPLE_FTRACE_DIRECT
 	bool
+
+config HAVE_SAMPLE_FTRACE_MULTI_DIRECT
+	bool
diff --git a/samples/Makefile b/samples/Makefile
index 291663e56a3c..7a38538b577d 100644
--- a/samples/Makefile
+++ b/samples/Makefile
@@ -21,6 +21,7 @@ subdir-$(CONFIG_SAMPLE_TIMER)		+= timers
 obj-$(CONFIG_SAMPLE_TRACE_EVENTS)	+= trace_events/
 obj-$(CONFIG_SAMPLE_TRACE_PRINTK)	+= trace_printk/
 obj-$(CONFIG_SAMPLE_FTRACE_DIRECT)	+= ftrace/
+obj-$(CONFIG_SAMPLE_FTRACE_MULTI_DIRECT) += ftrace/
 obj-$(CONFIG_SAMPLE_TRACE_ARRAY)	+= ftrace/
 subdir-$(CONFIG_SAMPLE_UHID)		+= uhid
 obj-$(CONFIG_VIDEO_PCI_SKELETON)	+= v4l/
diff --git a/samples/ftrace/Makefile b/samples/ftrace/Makefile
index ab1d1c05c288..e8a3f8520a44 100644
--- a/samples/ftrace/Makefile
+++ b/samples/ftrace/Makefile
@@ -3,7 +3,7 @@
 obj-$(CONFIG_SAMPLE_FTRACE_DIRECT) += ftrace-direct.o
 obj-$(CONFIG_SAMPLE_FTRACE_DIRECT) += ftrace-direct-too.o
 obj-$(CONFIG_SAMPLE_FTRACE_DIRECT) += ftrace-direct-modify.o
-obj-$(CONFIG_SAMPLE_FTRACE_DIRECT) += ftrace-direct-multi.o
+obj-$(CONFIG_SAMPLE_FTRACE_MULTI_DIRECT) += ftrace-direct-multi.o
 
 CFLAGS_sample-trace-array.o := -I$(src)
 obj-$(CONFIG_SAMPLE_TRACE_ARRAY) += sample-trace-array.o
