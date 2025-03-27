Return-Path: <linux-next+bounces-6031-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A20E3A727B6
	for <lists+linux-next@lfdr.de>; Thu, 27 Mar 2025 01:20:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 259D617A879
	for <lists+linux-next@lfdr.de>; Thu, 27 Mar 2025 00:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDD52256D;
	Thu, 27 Mar 2025 00:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WG1gKdVF"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1034BA55
	for <linux-next@vger.kernel.org>; Thu, 27 Mar 2025 00:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743034840; cv=none; b=K9/eznSJJWFExJg0f2B448kSwBYC5EDMI8dSQ0MEtCHSivlfYYcDC98l267eF5k3mMdlrKQxIqu1T14B+3Jtl2alFsVR2DpY0APKOuArLxKsd4wG9jpsBoe9sMyZ42XFoTsOcEnBh4tndlT7dQfv+STN5aOHTw2nrgmyuYjfiPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743034840; c=relaxed/simple;
	bh=oT86x151NRNQrKFuKk++HZi+a9RbkKjXhwJl/1Npiyk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IMAkviiDOLvdil3I/KhXTWdAeJDrXDL+57YkLYqMwJOukdUrxyP48YRCszhb6eeoM/FTJYh0t/wWo60rboID4Zxw6xW9tvJZxwm2AxORwMvUXHzyO54vro9pEYyJb3rivv/VeAgEwpd3CqY2aCpUkk3bbBDk7Dttc3+sb+XzwW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WG1gKdVF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52QEmQln009008
	for <linux-next@vger.kernel.org>; Thu, 27 Mar 2025 00:20:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	of8QtCoWCO2HkVGtOiFqijpidWD9Kyv6Ep+ZR6p7yq4=; b=WG1gKdVFiCjM1Yst
	UEYU8zbHLCYg1qwjc03eldbgfgsm8OEhsM+RCwbyxVg35UcVFPNwClKPJrxhQQVm
	z6kZKUgKSwx3ukKfVKIM2L5IA0DaLj9mh9mCeOHgNXmY+s9DO1scLxHxL/oj/r1w
	v4+5Grnvig4eT56WVTk85nuQk5yITXe2rluoBY22mNLZppjGsdvzc3I4+qqMH5vV
	LHKmswe1qfEeRspdwuwAwRE3zVdamH1UnWnJHxGEjgfBeONVvgpwOBF4kKWoD5jI
	+WFFI45IlXWZmyicr/XQ7XqQLC1iY25tFF2w/asDbzwpIfjzXqLw8ZDIBGIeD1qV
	5A1s4A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45kmd4psnt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-next@vger.kernel.org>; Thu, 27 Mar 2025 00:20:37 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-22647ff3cf5so6994775ad.0
        for <linux-next@vger.kernel.org>; Wed, 26 Mar 2025 17:20:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743034837; x=1743639637;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=of8QtCoWCO2HkVGtOiFqijpidWD9Kyv6Ep+ZR6p7yq4=;
        b=A8pcvsAngsRDlDaGwh0jZ+Yn/FfB5QM3QHQT9uC8GlMZ47VPSo0MG0VEpF6isSg4Kf
         Rc8NIW7HXFvTqslRtKbwIJMwGbRZeNi1XCAq7PfL6DQQTQdMY7Ec4CCXmYBqniScIazD
         Dx0jwtNjunol88HkU8rwSnoc8EgugW7+K6eWrORtP4YLifJs1tN15uEYSAUuCWD5TbiC
         +/B7Q0cTQocTaryGCF+E6Vi9MMSGp/id6x+UjYix6N3HZcIbSYS5DdFYitRjBrfPetrd
         qqlEdwc+a5hhzonbwJwy5WQXhYRRxwVn3bGV8o1dgE5FBuQFKYmtYTEtMRKicQnEcGxz
         IGMA==
X-Forwarded-Encrypted: i=1; AJvYcCXQZbAe6HHMImnSpdxlONGx1voufJwNcGmQhZk/44218K45qWSsmHOmJ2+NoxBvFz8yT2esZ3A+aNEH@vger.kernel.org
X-Gm-Message-State: AOJu0YzXZ7DdgbtZ0pV5Yem2NJvn8GFz11mZKeJBrieuQ9RvPh4wJnMt
	OdL+tUmN7v81Y7HuxkdMTtJnpb4yX5VrTWYgz7vR2HRHhSaPcnpFJyXC8BUbGMG5QzvkUeI8UtO
	raitimipXsG31r0kQeotTGsXA2WfYCdfbWdGoDF1cps8N95PHGXP45iseQPLQ
X-Gm-Gg: ASbGncsyJEkQbrcMfUGNa/0oqC07Aj66W3DVe4i9v9DOBTQ0UuMmXJM4+2xdw8JTICI
	fCTB2rqzhJDVL0zfgHDN62YZ7NiVJx5vALtHT7Z35kDtdYNlzewzT1+kofuVLrS90cYw6V2ifVN
	3pRvekGTaqmEZQ1GIasrS0sCs87xvmhAXoIqMTBwJXeS6utA+0Dcm5SlJSPQQZGIFfRNp2gCs4a
	tGgQAjUDyOPSbC1jFIRYRxSP/QJkSNf/LUsDIcjN98tVVTGIJhPBWZWJ1gKwiaZonQ5j8VEuxHp
	Zr/emDi0b5MFiCHuiaKP87AALw/vJlGMwNqPR7x9EzOpiOnNhVytomzAOFt20nbgU2u9ta7e9/o
	wKoXefLJn
X-Received: by 2002:a05:6a21:78a7:b0:1f5:7873:3041 with SMTP id adf61e73a8af0-1fea2d7e078mr2787984637.18.1743034836937;
        Wed, 26 Mar 2025 17:20:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEeZQUHW17xyRIGxMp6yweCQMjqa5GFBetmO0dud0soamNjfYWDY56HKGzCXhpuMfZWbcOSQg==
X-Received: by 2002:a05:6a21:78a7:b0:1f5:7873:3041 with SMTP id adf61e73a8af0-1fea2d7e078mr2787957637.18.1743034836561;
        Wed, 26 Mar 2025 17:20:36 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a27db2ebsm11678477a12.5.2025.03.26.17.20.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Mar 2025 17:20:36 -0700 (PDT)
Message-ID: <e9c50bf0-e85f-4c71-b46b-b9b919955045@oss.qualcomm.com>
Date: Wed, 26 Mar 2025 17:20:35 -0700
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
        Masahiro Yamada <masahiroy@kernel.org>
Cc: Oliver Glitta <glittao@gmail.com>,
        Alessandro Carminati <acarmina@redhat.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250324103048.3d8230f9@canb.auug.org.au>
 <20250327101610.45f13473@canb.auug.org.au>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250327101610.45f13473@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DHOem6AAPLxei_9ota8tXPGWvsLM6iew
X-Proofpoint-GUID: DHOem6AAPLxei_9ota8tXPGWvsLM6iew
X-Authority-Analysis: v=2.4 cv=QLZoRhLL c=1 sm=1 tr=0 ts=67e499d6 cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=e70TP3dOR9hTogukJ0528Q==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rOUgymgbAAAA:8 a=4OeygS09qlqKeb4FxogA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=MP9ZtiD8KjrkvI0BhSjB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_09,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0
 mlxlogscore=949 mlxscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270001

On 3/26/2025 4:16 PM, Stephen Rothwell wrote:
> Hi all,
> 
> On Mon, 24 Mar 2025 10:30:48 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> After merging the kbuild tree, today's linux-next build (powerpc
>> ppc64_defconfig) failed like this:
>>
>> ERROR: modpost: missing MODULE_DESCRIPTION() in lib/kunit/backtrace-suppression-test.o
>> ERROR: modpost: missing MODULE_DESCRIPTION() in lib/slub_kunit.o
> 
> This is now lib/tests/slub_kuni.c
> 
>> Caused by commits
>>
>>   19f3496e6241 ("kunit: add test cases for backtrace warning suppression")
>>
>> from the mm-nonmm-unstable branch of the mm tree and
>>
>>   1f9f78b1b376 ("mm/slub, kunit: add a KUnit test for SLUB debugging functionality")
>>
>> from Linus' tree (in v5.14rc1) interacting with commit
>>
>>   6c6c1fc09de3 ("modpost: require a MODULE_DESCRIPTION()")
>>
>> from the kbuild tree.
>>
>> I have temporarily reverted the latter commit until the former are
>> fixed up.
> 
> I am still reverting that commit.
> 

Guenter & Oliver, can you add MODULE_DESCRIPTION() macros to your respective modules?

Context:
https://lore.kernel.org/all/20250311-moddesc-error-v1-1-79adedf48d0e@oss.qualcomm.com/


