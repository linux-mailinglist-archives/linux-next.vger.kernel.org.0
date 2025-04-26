Return-Path: <linux-next+bounces-6386-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A452CA9D7AA
	for <lists+linux-next@lfdr.de>; Sat, 26 Apr 2025 07:21:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1DE79A241E
	for <lists+linux-next@lfdr.de>; Sat, 26 Apr 2025 05:21:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8C9119B3EC;
	Sat, 26 Apr 2025 05:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="ofJF6C9k"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD82086342;
	Sat, 26 Apr 2025 05:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745644906; cv=none; b=KWqdc4d7f2IeuPsYnxKHqc6zkdqgwMebgvSiZoW4weiFsBY8NTbCA4UpuOPsvVnPHVe7m80H+pASyxKkkLCa2Sf9sg4D1OewtWrMq/0ySOWVK3b+eEoq/nY5lhJq6yeMeCDDIXImEeCUTcE6vTj4YPeqKxgyEwpPlO2VqCeZN4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745644906; c=relaxed/simple;
	bh=enQF22aY5mNtx7RUu/s0KIYropXdDX6uf4jswJ9dB2c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HWPL32wY4Fc2hLKb4JpTDTsmwMSobdO/BXBvhPLNK7JkFFqITJC1H7yR1lY22ZJqCti1v/PRrG6DUG+Nd0LKkC7ii2KetFLKKNmAlkzKc3toSRya+4sXyZWvpj+W4+0LRkx5Sm7AaLJ/0OHjq5zlOc8jmNYRoK2THODFbYgT22s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=ofJF6C9k; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53Q3e1jh018859;
	Sat, 26 Apr 2025 05:21:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=aSNXN4
	vueWcNxoPQ65LE4WXR8kg0AdX2QbcmR/J+to8=; b=ofJF6C9kirjsPkayEiqxcl
	LFDMZXl3bkmCQGWjqN5udHzOIetQfg/jBU8sYlqmp8OhPFCx6lOXtI7llnL+XpH7
	3oCyxWHrIhG+frhbGl/XV8zcvzsg6QgvcYoyY4V6phWJF8NONttZOS3uxgx6LKte
	VauFmsIAwq78I9Iut5cdCeRpb1HnEA1Lv1H4gnHjZFSqSzPgtHXgZFqIrpvX5PMu
	NNIAgQqdCJDwljdpkx3kgBTzO7/eL9W7247FeS08AlIC6ya89/KlPe6bMO/GgOlg
	wEC9DWVtw9LUYId7mJWllYRkemP/Jcyn/s2cDiDkv0DIpEaGzZjUr7QVbWLQUMvQ
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 468mwrrmnv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 26 Apr 2025 05:21:31 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53Q0p8IE004061;
	Sat, 26 Apr 2025 05:21:30 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 466jg08pd6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 26 Apr 2025 05:21:30 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53Q5LTc349021214
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 26 Apr 2025 05:21:29 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5CE6058056;
	Sat, 26 Apr 2025 05:21:29 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BB68E58050;
	Sat, 26 Apr 2025 05:21:26 +0000 (GMT)
Received: from [9.204.204.179] (unknown [9.204.204.179])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 26 Apr 2025 05:21:26 +0000 (GMT)
Message-ID: <850ba4bc-a703-4e1e-b19f-ccf09b38b2cd@linux.ibm.com>
Date: Sat, 26 Apr 2025 10:51:24 +0530
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next-20250422] Build failure: Wvla-larger-than=0 is
 meaningless
Content-Language: en-GB
To: Stephen Rothwell <sfr@canb.auug.org.au>, Kees Cook <kees@kernel.org>,
        nathan@kernel.org, hch@lst.de,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        LKML <linux-kernel@vger.kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <7780883c-0ac8-4aaa-b850-469e33b50672@linux.ibm.com>
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <7780883c-0ac8-4aaa-b850-469e33b50672@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI2MDAzMCBTYWx0ZWRfX7zop/KE38L6q /uDVqqe1atu5BhqiyJCxqCfU6kZkfGnh8JyookRnBrwvLDJcHEyzn72Em0OpOnNJGbzxTrghKGF sW9s6pR+5txTuDP9HJaqsXLwpBuRyUkqpvN+xjXC8OEyOGG5mkoLiPYYKTXKxhdnP/DWcgk2BbU
 rw1IRzh0hwOWVOpLCzQHNDPys7xrRdBhrkFEsIdqzpiJdWkgcdrqWOJy00HJCXiKNALn2Xh99Sg xF6XNibLd/oCrDekYBlYRli87IK9ekEAOqPrczV2PkSzAIt+dcyahV0qljk2mZd4zLJkAEW54kc oNtWybNzveWcaZypffvO+zoZZJD0Zw1ygsSH/iL+V12jU+CObg3mlkoyRPS9ml0TTXjor0VHFbM
 ikAVIC3lm0nRibEbWuu5QZww2Z9bmAvSHjy8FeJMILDIA9kJpaXA8ftByzbRtyWDxjyU+Z94
X-Authority-Analysis: v=2.4 cv=IMsCChvG c=1 sm=1 tr=0 ts=680c6d5b cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=e5mUnYsNAAAA:8 a=NEAV23lmAAAA:8 a=VnNF1IyMAAAA:8
 a=iVOyuGI5PMKcQA6MX0cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: VCcDIBeGdDpilvrL9HhoKNCBgfIQR8NM
X-Proofpoint-GUID: VCcDIBeGdDpilvrL9HhoKNCBgfIQR8NM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-26_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504260030


On 23/04/25 7:11 pm, Venkat Rao Bagalkote wrote:
> Hello,
>
>
> I am observing linux-next build failure on IBM Power8 server.
>
>
> Repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>
> Branch: master
>
> GCC: 8.5.0 20210514
>
> ldd (GNU libc) 2.28
>
> Attached is the .config file.
>
>
> Build errors:
>
>
> [[01m^[[Kcc1:^[[m^[[K ^[[01;36m^[[Knote: ^[[m^[[K-Wvla-larger-than=0 
> is meaningless
> ^[[01m^[[Kcc1:^[[m^[[K ^[[01;36m^[[Knote: ^[[m^[[K-Wvla-larger-than=0 
> is meaningless
> ^[[01m^[[Kcc1:^[[m^[[K ^[[01;36m^[[Knote: ^[[m^[[K-Wvla-larger-than=0 
> is meaningless
> ^[[01m^[[Kcc1:^[[m^[[K ^[[01;36m^[[Knote: ^[[m^[[K-Wvla-larger-than=0 
> is meaningless
> ^[[01m^[[Kcc1:^[[m^[[K ^[[01;36m^[[Knote: ^[[m^[[K-Wvla-larger-than=0 
> is meaningless
> make[1]: *** [/home/upstreamci/linux/Makefile:2011: .] Error 2
> make: *** [Makefile:248: __sub-make] Error 2
>

I am seeing this failure on 6.15.0-rc3-next-20250424 kernel as well. Can 
someone please help in fixing this.


Regards,

Venkat.

>
> Git bisect is pointing to first bad commit as: 
> 4e5222bc2eef69252277f837880c876bf0ffee04
>
>
> Git Bisect log:
>
>
> git bisect start
> # status: waiting for both good and bad commits
> # good: [9c32cda43eb78f78c73aee4aa344b777714e259b] Linux 6.15-rc3
> git bisect good 9c32cda43eb78f78c73aee4aa344b777714e259b
> # status: waiting for bad commit, 1 good commit known
> # bad: [2c9c612abeb38aab0e87d48496de6fd6daafb00b] Add linux-next 
> specific files for 20250422
> git bisect bad 2c9c612abeb38aab0e87d48496de6fd6daafb00b
> # good: [d1da62193ce9715a3cd25a6007b32284aef3725e] Merge branch 
> 'drm-next' of https://gitlab.freedesktop.org/drm/kernel.git
> git bisect good d1da62193ce9715a3cd25a6007b32284aef3725e
> # good: [165991dc7afd1eec364a4b980cf6befdfca84404] next-20250414/tip
> git bisect good 165991dc7afd1eec364a4b980cf6befdfca84404
> # good: [feaa817f7fbb1bb50f3c6b119098c5940c2e2532] Merge branch 
> 'togreg' of git://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git
> git bisect good feaa817f7fbb1bb50f3c6b119098c5940c2e2532
> # good: [b7d37856d1bddb8e79a7e27a8605dfbb82fe8e9a] Merge branch 
> 'for-next' of 
> git://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git
> git bisect good b7d37856d1bddb8e79a7e27a8605dfbb82fe8e9a
> # good: [77fe94f0d068193c22ce8cfd7ee6317ab2f679c2] Merge branch 
> 'kunit' of 
> git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git
> git bisect good 77fe94f0d068193c22ce8cfd7ee6317ab2f679c2
> # good: [627d1af4ec321f81d7ca76f541aef908d5a0e4bd] Merge branch 
> 'ntb-next' of https://github.com/jonmason/ntb.git
> git bisect good 627d1af4ec321f81d7ca76f541aef908d5a0e4bd
> # good: [f34fa2aef257678d9534cb3debbceaf453df02cc] Merge branch 
> 'pin-init-next' of https://github.com/Rust-for-Linux/linux.git
> git bisect good f34fa2aef257678d9534cb3debbceaf453df02cc
> # good: [9b7c1e4703dbff94ee0a545445f706518fccb73a] Merge branch 
> 'bitmap-for-next' of https://github.com/norov/linux.git
> git bisect good 9b7c1e4703dbff94ee0a545445f706518fccb73a
> # bad: [685b6cba6fcbdc4a3b1708ac70aef556f594907c] Merge branch 
> 'for-next/kspp' of 
> git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git
> git bisect bad 685b6cba6fcbdc4a3b1708ac70aef556f594907c
> # good: [431f4fcea79ffe17f396c10cf42d226494d2f489] kunit/usercopy: 
> Disable u64 test on 32-bit SPARC
> git bisect good 431f4fcea79ffe17f396c10cf42d226494d2f489
> # good: [89860db3b0405ccf4419e76eff487544aab4e4d4] overflow: Clarify 
> expectations for getting DEFINE_FLEX variable sizes
> git bisect good 89860db3b0405ccf4419e76eff487544aab4e4d4
> # bad: [c5b45570cac5302cb650531a35142eab8231853c] mod_devicetable: 
> Enlarge the maximum platform_device_id name length
> git bisect bad c5b45570cac5302cb650531a35142eab8231853c
> # bad: [4e5222bc2eef69252277f837880c876bf0ffee04] kbuild: Switch from 
> -Wvla to -Wvla-larger-than=0
> git bisect bad 4e5222bc2eef69252277f837880c876bf0ffee04
> # first bad commit: [4e5222bc2eef69252277f837880c876bf0ffee04] kbuild: 
> Switch from -Wvla to -Wvla-larger-than=0
>
>
> I tried reverting the bad commit, but build fails with something like 
> this.
>
>
> Build Error after reverting the first bad commit
>
> kernel/watchdog.c: In function 'lockup_detector_reconfigure':
> kernel/watchdog.c:936:2: error: too many arguments to function 
> '__lockup_detector_reconfigure'
>   __lockup_detector_reconfigure(false);
>   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> kernel/watchdog.c:926:13: note: declared here
>  static void __lockup_detector_reconfigure(void)
>              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> kernel/watchdog.c: In function 'lockup_detector_setup':
> kernel/watchdog.c:940:2: error: too many arguments to function 
> '__lockup_detector_reconfigure'
>   __lockup_detector_reconfigure(false);
>   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> kernel/watchdog.c:926:13: note: declared here
>  static void __lockup_detector_reconfigure(void)
>              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> kernel/watchdog.c: In function 'proc_watchdog_update':
> kernel/watchdog.c:962:2: error: too many arguments to function 
> '__lockup_detector_reconfigure'
>   __lockup_detector_reconfigure(thresh_changed);
>   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> kernel/watchdog.c:926:13: note: declared here
>  static void __lockup_detector_reconfigure(void)
>              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> kernel/watchdog.c: At top level:
> cc1: warning: unrecognized command line option 
> '-Wno-unterminated-string-initialization'
> make[3]: *** [scripts/Makefile.build:203: kernel/watchdog.o] Error 1
> make[3]: *** Waiting for unfinished jobs....
> make[2]: *** [scripts/Makefile.build:461: kernel] Error 2
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [/root/linux-next/Makefile:2011: .] Error 2
> make: *** [Makefile:248: __sub-make] Error 2
>
>
> If you happen to fix this issue, please add below tag.
>
>
> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
>
>
> Regards,
>
> Venkat.

