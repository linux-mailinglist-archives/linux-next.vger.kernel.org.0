Return-Path: <linux-next+bounces-5962-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E43CCA6DC22
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 14:52:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8098816B50F
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 13:52:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5A7725EF90;
	Mon, 24 Mar 2025 13:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cjuVdss9"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3998F25DAF7
	for <linux-next@vger.kernel.org>; Mon, 24 Mar 2025 13:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742824361; cv=none; b=l7LRP8t6FiBDHN4Svplc78gcKNtXtbhzp0Dt4KhxtLHZDCOqer4st/HLFiDPgzk7eI1rusC6poA0B7Irba/EJMglcIbBBHBM+k3NI5TnsSHVvY0r8EW+2WV5mgS/Rl9X1eUdjLpeUPOwYuiFB4jm8lhAk+XmxBw7WlIlx8GPZCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742824361; c=relaxed/simple;
	bh=cCcpMPMYcC+FGUxw3pn4s2VgODhnv5UmUO39fyS3Nug=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Roel0ZAbMSfbhKGWuzWypm3nf0bRPTHbcLuk9mUC5+k4q5zjPP7zvo1C8g724+lc+euv5tp6B1aD0IdCRbAUEYzVGB3A2cg6RRIHSXE1xkCggaBxemwilIGmtT94bGOr5TTszWiRMJO7snubvYVM3tXSJ0Ql+pbxgf3EYvdwa0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cjuVdss9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52O9PVPK030746
	for <linux-next@vger.kernel.org>; Mon, 24 Mar 2025 13:52:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/UD3W4jqq06DgOfRCtMG3oWGQAJktkFgKzna85q3z8o=; b=cjuVdss9qW6kSW80
	Y6jJaDkuzXtyfhGecLnpKvEZN9QXZhQXQo7xBdOXhCapx/DgYC3Fqsh3PSlMWoOt
	L9ATqSeJIj4fJuQmAV65E8fqCSGoT0vgomjEtjcV6RIz+fiSrT4Z+HSx5ouIipDR
	jN+GtH2B2+Mwel4Rk3EWkv+A8GLB3lZp+hzSpx1A0yFvOLgayWe/gkT+IslrJWqh
	zs6cuXDSJaJrjH++y+24isNvVtG4wtZh9b5cG3Bxm9wUCaqIvDK9zTAfMXSCHHdQ
	bFFXjvdsZ+tRe8zp9OxmKINLMvD162dGwNvLZMC/FWrs4p193t+dowW+Uou+4cCc
	CUr28g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hpgbcfpj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-next@vger.kernel.org>; Mon, 24 Mar 2025 13:52:39 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ff8119b436so6969680a91.0
        for <linux-next@vger.kernel.org>; Mon, 24 Mar 2025 06:52:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742824358; x=1743429158;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/UD3W4jqq06DgOfRCtMG3oWGQAJktkFgKzna85q3z8o=;
        b=O6wbJOV2G/Daa1IjYNhhuxuQREfqA9UYBSVsMfgDcfBmCvJYEXNtyUVUXGWXSfTGHu
         kSSayTXNB1aEsl6JXc26UVjfVFmr84Kh+O0Wj8PRb+cTqmdRu58DsMyn6Zwcnic1DFrO
         6tMU9yvxive7JeuQhNFNok8i6uZ+zoQSZVpzXnf5HuwKiai2h8bIaF6uU0VVSd7io/1Z
         LHOSuaPiWBNBhqZh/zRbCvLSEAkMLUIaZMjPjBAzoVezL9c+q0HSFtELiRx24vpTuAhj
         cMDVwIkX9L8P0OUIceoYTGJ52HhNpIzSbDMVESnX+q6KNZeVMk7gsTvi+mW5EKAwnm9o
         tlgw==
X-Forwarded-Encrypted: i=1; AJvYcCVPVC8bZTcWAocXqC2OdvhohHyGwDHhabZacj827GcHeBeA7Fm3l2FoZGevZu3rCsvKocmTFZIoz2ul@vger.kernel.org
X-Gm-Message-State: AOJu0YwozjeqWntplQqcamQDbCuXppd8cKFePEiO+ji9X9+Rjw06DJle
	pRKYP1ztNArSHuR6fuScv2mNOn3Ncnhlkr7l6rk1ZpgNnxmmpnD9vdhjcRKXVQPXvV6EomU/QI3
	/HVJ8FS5tmCJ1j9hbBhc1R4lgROdnX7l6ZHUWKIjRLclf9nFKEn53iSIJyAcG
X-Gm-Gg: ASbGncs+kzDJ0nvw4aEFM9lyKUgYWifMWDP9j5nEevAetbrnFD9hmCX0/zweM181pI3
	ofxyqeOfF3l7tPG2jXXK37BCiq+RgKrXQX5sI4LKWk3hPQPL81//KpPxMSJS2HdLirTFM3vP1MH
	QYiLDDeT1+BMb/1LkgvPDhj/hQX8PSv0568TlXDFuSGq7TNUN0OCR/TezHeHLMiaqR+i5DEJiY9
	YHOdUUbjbK1hZy9KnVmeUyFgqfkb7Pzav7+DxeKaiymvs/GgEXwr6lLP3y6XbAFOrfya14uygb7
	R6bDis47bNbH8ETYESfA8TbuIu3BGZzFbG9Ln1W/ycPZZ2QVKjV2PMAweinOowejxNorHrE=
X-Received: by 2002:a17:90b:2743:b0:2ee:c04a:4276 with SMTP id 98e67ed59e1d1-3030fe75769mr18922003a91.5.1742824358147;
        Mon, 24 Mar 2025 06:52:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvTPFmjQo+xxh11gqrWMfkyIACXf50EIP4OUpHJj/V2D298Z5CE/Ft/u3GcrvffooO1TB3Mw==
X-Received: by 2002:a17:90b:2743:b0:2ee:c04a:4276 with SMTP id 98e67ed59e1d1-3030fe75769mr18921954a91.5.1742824357497;
        Mon, 24 Mar 2025 06:52:37 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf576c65sm12203927a91.10.2025.03.24.06.52.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 06:52:37 -0700 (PDT)
Message-ID: <9faf14a1-ba47-46bf-9ddb-629782b8b52d@oss.qualcomm.com>
Date: Mon, 24 Mar 2025 06:52:35 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the kbuild tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Oliver Glitta <glittao@gmail.com>,
        Alessandro Carminati <acarmina@redhat.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250324103048.3d8230f9@canb.auug.org.au>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250324103048.3d8230f9@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BoydwZX5 c=1 sm=1 tr=0 ts=67e163a7 cx=c_pps a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=_BF6GIfXpBVThKZNOKYA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: NB4jhMJzu8R8H58qXiGR-6dmmvXwMfMy
X-Proofpoint-ORIG-GUID: NB4jhMJzu8R8H58qXiGR-6dmmvXwMfMy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_04,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 spamscore=0 adultscore=0 bulkscore=0 clxscore=1011 malwarescore=0
 impostorscore=0 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503240100

On 3/23/2025 4:30 PM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the kbuild tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> ERROR: modpost: missing MODULE_DESCRIPTION() in lib/kunit/backtrace-suppression-test.o
> ERROR: modpost: missing MODULE_DESCRIPTION() in lib/slub_kunit.o
> 
> Caused by commits
> 
>   19f3496e6241 ("kunit: add test cases for backtrace warning suppression")
> 
> from the mm-nonmm-unstable branch of the mm tree and
> 
>   1f9f78b1b376 ("mm/slub, kunit: add a KUnit test for SLUB debugging functionality")
> 
> from Linus' tree (in v5.14rc1) interacting with commit
> 
>   6c6c1fc09de3 ("modpost: require a MODULE_DESCRIPTION()")
> 
> from the kbuild tree.
> 
> I have temporarily reverted the latter commit until the former are
> fixed up.
> 

+Arnd, will you post your changes for these?

