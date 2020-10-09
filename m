Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9FF12882F4
	for <lists+linux-next@lfdr.de>; Fri,  9 Oct 2020 08:48:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731475AbgJIGsN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 9 Oct 2020 02:48:13 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:10294 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730876AbgJIGsN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 9 Oct 2020 02:48:13 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0996W237136616;
        Fri, 9 Oct 2020 02:47:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=pp1;
 bh=bJGsDaTl6Wgk45pyigT3PBRKwZbeGizbWtsFP39KQ+0=;
 b=iqPdzKdlH6OugicNusgNRbmLf4PkygyIpvzgTqBUpH0DOIO4+YxsEwJBOaYvbb3lLmnM
 U2sv5JiZ1/AfM1k7haToTJHLRJJGJt22DetFMgGHGtV9R96V7TKOxxHR6nuEM9ffSaiU
 YhryU0zGW6AnrvPFftdGmBBKkPf+En6fGvle1Q06IHD4Zjap05mV5j32WwlbgW976f8a
 72UjZxsEtEuedGM3ANl1d84uYHWjnawhsXlOfltmuFSrkXESOlstOImCfN7ZFneT9AG9
 Bi6bhdjYgV8HXX8xYytcaetTeq5ra+PKNg3P9VfPsb0LvhXHZvtDKdqNbLMnYmo6kHV2 fA== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0b-001b2d01.pphosted.com with ESMTP id 342jp6r9ve-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 09 Oct 2020 02:47:49 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0996aaM8146187;
        Fri, 9 Oct 2020 02:47:48 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
        by mx0b-001b2d01.pphosted.com with ESMTP id 342jp6r9ux-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 09 Oct 2020 02:47:48 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
        by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0996SO63025059;
        Fri, 9 Oct 2020 06:47:46 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
        by ppma03fra.de.ibm.com with ESMTP id 3429j2g6kp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 09 Oct 2020 06:47:46 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
        by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 0996liKM22348184
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 9 Oct 2020 06:47:44 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 568F2A406F;
        Fri,  9 Oct 2020 06:47:44 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 9D343A4051;
        Fri,  9 Oct 2020 06:47:43 +0000 (GMT)
Received: from localhost (unknown [9.145.0.122])
        by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Fri,  9 Oct 2020 06:47:43 +0000 (GMT)
Date:   Fri, 9 Oct 2020 08:47:42 +0200
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
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <cover.thread-d92c35.your-ad-here.call-01602224864-ext-8734@work.hours>
References: <20201009152846.072e6bbf@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201009152846.072e6bbf@canb.auug.org.au>
X-Patchwork-Bot: notify
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-10-09_02:2020-10-09,2020-10-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 mlxscore=0 impostorscore=0 suspectscore=1 lowpriorityscore=0 bulkscore=0
 spamscore=0 mlxlogscore=999 clxscore=1011 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010090044
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Oct 09, 2020 at 03:28:46PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the tip tree, today's linux-next build (perf) failed
> like this:
> 
> In file included from tools/include/linux/build_bug.h:5,
>                  from tools/include/linux/kernel.h:8,
>                  from util/intel-pt-decoder/intel-pt-insn-decoder.c:7:
> util/intel-pt-decoder/../../../arch/x86/lib/insn.c: In function '__insn_get_emulate_prefix':
> tools/include/linux/compiler.h:37:38: error: nested extern declaration of '__compiletime_assert_0' [-Werror=nested-externs]
>    37 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>       |                                      ^~~~~~~~~~~~~~~~~~~~~
...snip...
> 
> Caused by commit
> 
>   2a522b53c470 ("x86/insn: Support big endian cross-compiles")
> 
> I have reverted commits
> 
> a23b701ae9b3 objtool: Rework header include paths
> 1b4998c364bc objtool: Fix x86 orc generation on big endian cross compiles
> 317664a7fcc9 objtool: Fix reloc generation on big endian cross compiles
> 2a522b53c470 x86/insn: Support big endian cross-compiles
> 2486baae2cf6 objtool: Allow nested externs to enable BUILD_BUG()
> 
> for today.
> 
> This is a PowerPC LE native build of tools/perf.

Oh, I missed that. Sorry about that. Obviously x86 instruction
decoder is also used in perf. The question is, should we just disable
-Wnested-externs for perf like we did for the objtool. Or since we got
BUILD_BUG() implementation in tools simply disable -Wnested-externs for
all tools altogether? By throwing it out of EXTRA_WARNINGS.

Vasily Gorbik (1):
  perf build: Allow nested externs to enable BUILD_BUG() usage

 tools/perf/Makefile.config | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
⣿⣿⣿⣿⢋⡀⣀⠹⣿⣿⣿⣿
⣿⣿⣿⣿⠠⣶⡦⠀⣿⣿⣿⣿
⣿⣿⣿⠏⣴⣮⣴⣧⠈⢿⣿⣿
⣿⣿⡏⢰⣿⠖⣠⣿⡆⠈⣿⣿
⣿⢛⣵⣄⠙⣶⣶⡟⣅⣠⠹⣿
⣿⣜⣛⠻⢎⣉⣉⣀⠿⣫⣵⣿
