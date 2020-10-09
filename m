Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC1F828889B
	for <lists+linux-next@lfdr.de>; Fri,  9 Oct 2020 14:25:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733001AbgJIMZt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 9 Oct 2020 08:25:49 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:6456 "EHLO
        mx0b-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729272AbgJIMZt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 9 Oct 2020 08:25:49 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 099C2rVA048984;
        Fri, 9 Oct 2020 08:25:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=pp1;
 bh=4sDFivrWAQoYvkrL3f3Cuu9HI2ks/opmLPH+ErRVI4I=;
 b=Hgz16izkjkj1qcNgh5REi2iRad02tDUjThSLm57nPdu4qufoU7gRtUogsJ0wfU/0cT05
 k/Tkw2uoWovG60KiMdj1egoGhTOPwwkQX/F7H+8QOx9MFPA0h4HSmRs3yTZcdNsZDI20
 N09ii78MlMaeTZNGIxxKeBL62NIPmT0GYXrKIWgeMeUP6rV2tkcwah1rupF/t8xZsUju
 7wW4TR1jCko/XLq5Dqvj4RYtQGOxmBfvQvynvMZoN2u6izcLCnSfHoJROpjNRWIKZkBx
 TPOFs2dhvn1qb5DVpC87o6rv1gJxeFnklISsWtACqxZ0IbW1+C0TbXxvgCLOcHJ/sT0y qw== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 342nnuugaf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 09 Oct 2020 08:25:29 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 099C3AHn050018;
        Fri, 9 Oct 2020 08:25:27 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
        by mx0a-001b2d01.pphosted.com with ESMTP id 342nnuug9m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 09 Oct 2020 08:25:27 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
        by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 099CBQNa015770;
        Fri, 9 Oct 2020 12:25:25 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
        by ppma04ams.nl.ibm.com with ESMTP id 3429hm0n3k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 09 Oct 2020 12:25:25 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
        by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 099CPMxs22610218
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 9 Oct 2020 12:25:23 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id C66EBA4055;
        Fri,  9 Oct 2020 12:25:22 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 06AC9A4040;
        Fri,  9 Oct 2020 12:25:22 +0000 (GMT)
Received: from localhost (unknown [9.145.0.122])
        by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Fri,  9 Oct 2020 12:25:21 +0000 (GMT)
Date:   Fri, 9 Oct 2020 14:25:20 +0200
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
Subject: Re: [PATCH 1/1] perf build: Allow nested externs to enable
 BUILD_BUG() usage
Message-ID: <cover.thread-251403.your-ad-here.call-01602244460-ext-7088@work.hours>
References: <20201009112327.GC656950@krava>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201009112327.GC656950@krava>
X-Patchwork-Bot: notify
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-10-09_06:2020-10-09,2020-10-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 malwarescore=0 adultscore=0 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 suspectscore=1 phishscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010090086
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Oct 09, 2020 at 01:23:27PM +0200, Jiri Olsa wrote:
> On Fri, Oct 09, 2020 at 08:47:45AM +0200, Vasily Gorbik wrote:
> > Currently BUILD_BUG() macro is expanded to smth like the following:
...snip...
> > diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
> > index 190be4fa5c21..8137a6046a47 100644
> > --- a/tools/perf/Makefile.config
> > +++ b/tools/perf/Makefile.config
> > @@ -16,7 +16,7 @@ $(shell printf "" > $(OUTPUT).config-detected)
> >  detected     = $(shell echo "$(1)=y"       >> $(OUTPUT).config-detected)
> >  detected_var = $(shell echo "$(1)=$($(1))" >> $(OUTPUT).config-detected)
> >  
> > -CFLAGS := $(EXTRA_CFLAGS) $(EXTRA_WARNINGS)
> > +CFLAGS := $(EXTRA_CFLAGS) $(filter-out -Wnested-externs,$(EXTRA_WARNINGS))
> 
> looks good, but I can't apply the patch with 'git am'
> 
> 	Applying: perf build: Allow nested externs to enable BUILD_BUG() usage
> 	error: patch failed: tools/perf/Makefile.config:16
> 	error: tools/perf/Makefile.config: patch does not apply
> 	Patch failed at 0001 perf build: Allow nested externs to enable BUILD_BUG() usage
> 	hint: Use 'git am --show-current-patch=diff' to see the failed patch
> 	When you have resolved this problem, run "git am --continue".
> 	If you prefer to skip this patch, run "git am --skip" instead.
> 	To restore the original branch and stop patching, run "git am --abort".
> 
> I wonder it's that picture at the bottom ;-)
> 
> jirka
> 
> 
> >  
> >  include $(srctree)/tools/scripts/Makefile.arch
> >  
> > -- 
> > ⣿⣿⣿⣿⢋⡀⣀⠹⣿⣿⣿⣿
> > ⣿⣿⣿⣿⠠⣶⡦⠀⣿⣿⣿⣿
> > ⣿⣿⣿⠏⣴⣮⣴⣧⠈⢿⣿⣿
> > ⣿⣿⡏⢰⣿⠖⣠⣿⡆⠈⣿⣿
> > ⣿⢛⣵⣄⠙⣶⣶⡟⣅⣠⠹⣿
> > ⣿⣜⣛⠻⢎⣉⣉⣀⠿⣫⣵⣿
> 

What? This makes tux and blind people very unhappy. Those are nothing
else but braille utf-8 characters. And I've seen people on lkml are
using those, i.e. debian icon in a signature. Oh, well... I'll avoid
using this signature in future.

BTW which branch did you try to apply it on? I've just checked perf/core
and there should be no conflicts as well. But I assume this should go
via objtool together with other changes which introduced that BUILD_BUG()
usage.
 
Anyhow I've resent the patch without fancy signatures included.
