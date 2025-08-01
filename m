Return-Path: <linux-next+bounces-7817-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FBDB18026
	for <lists+linux-next@lfdr.de>; Fri,  1 Aug 2025 12:31:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC008A824D7
	for <lists+linux-next@lfdr.de>; Fri,  1 Aug 2025 10:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9978E1FECBA;
	Fri,  1 Aug 2025 10:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JTfPhGUP"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0815A29
	for <linux-next@vger.kernel.org>; Fri,  1 Aug 2025 10:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754044265; cv=none; b=GqrdSkBh9/x4tF5g3SLw1Ui8lb80s4k2bDFwNDPxlXpbt5vW/7QEPFNWIL2C4NPsboFMXK/bAq2jX45+jkUfQQnmskvo2fhCmq4rSCYQKkqO19zm+liwbHc1gbp+vpmSx7e9QuHs9fmrYKgMWMVa30XvBuqDKeO4sYIX9O6Ql+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754044265; c=relaxed/simple;
	bh=eCl7dMtFhK3LQlNnK5vPVFvtpM+k3WxFas4em8n7rBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gEv+FuvZ8Eed/b/No+AJ4RhXpnngrcbZ9xufqs2SrSyvxpwqbMyiM0vISX9lsx3SyypB2bt1D265SbDlbe0n5xlxDBlQwNaMW5AObwMY9QvoaEz3SHKF97vUqUiAekKNbq9YMYK1lWDdgbud1NREyoLAmaxEgt7I7GatWXaw3ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JTfPhGUP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 571750Z6013642
	for <linux-next@vger.kernel.org>; Fri, 1 Aug 2025 10:30:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L84CyF+woWXvkwBzd7M9RuuiXRAGPXc2Q4DgUeAC+f8=; b=JTfPhGUPPA8j0Ovh
	zlYaGqbYQbcMEk+9sj9CeEoEZ8yVfvu1NvmEonIV4+m1eZtYr2geyQb6zadeS98c
	PfPg44biaWsvMGO4GFtG5lengPCT4tyr5FC18ejZI3u16akjFJ2iLIi6MAVnxJ1Z
	gp+ky7rZSxSSjUpL8jXQGASTZvJS4KNGCRyKyEOnacA6JT0xQraDWb1eywQYlt1m
	RQFCMtq5gt+dlRMsOhNgy01tIjI3iKl2YAuohmo8YKjLhXECwbRyXgtzdOR+hcJ3
	/r+huZ9FlAIBinJTpZ7L96oubmy1Z+rKKYd3VNb2n6hNx6jTcpkTUH2H6fND7fcg
	AeFhEw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pm2uc0x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-next@vger.kernel.org>; Fri, 01 Aug 2025 10:30:56 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4aa826c9464so15181721cf.3
        for <linux-next@vger.kernel.org>; Fri, 01 Aug 2025 03:30:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754044256; x=1754649056;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L84CyF+woWXvkwBzd7M9RuuiXRAGPXc2Q4DgUeAC+f8=;
        b=Y3UwuR2ML8YO01ZWAcf+SyqFw9tW1Hu8it7HYPLKluCh7EaQJFHBX9RR+6L5AzFQMq
         /pv8oT4T/r/zXTttWpqBrpK3AGlZsmtTQEgJ/AtzzU52QmbSVbwToMV2hK2RUUX80mX7
         YjyyQe7CbuQv8w+qmygjPuUZuxDMrGkxlxPKXM6Nl2cHIDPirlr9Kge+X7kOE/mccAqn
         BXunBZX7zJOfm2sFCRheRHuqZ+dsB9JC/B0nbzZdyo42oUpiDO0g1V7q57NYMpbf1ll3
         rpQyyR+LIC1v3/aaOHccjQ1uZLzqoW5dGmXqZOnWA6o8bLLNtpXV4fEhQ9Jh0od3e8WP
         koyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUg1O+5ybJd27/R2YBoL3b2lh4gYs0OhOutaV5t9n+BOlk1OIaZTuf15rXWtJMOL+znOOSbxnHqQT3s@vger.kernel.org
X-Gm-Message-State: AOJu0YyEDVKiq3UxXlRxVjTuX9eGYQWFg8gw6BQnciadRZ30eJKazzYY
	bSLM8qakH8hKzZioTGufvt1dnT6qUwqYnQTmEJt22mRtAjFnt/w7wjq7hj+kj7NsvG/tO3OsZn5
	GM+F/pvL7aUGjzmQ9Vo770QbBf+bIu4T6f9mDoQgJCMyhtJ5hVWSMObuJ4boBNAjI
X-Gm-Gg: ASbGncvM0RPKkiabUO0YQsdwMA9QSdvKSvHzsrY1RD9rJEngNX8OAlzue5Kk2AogDbT
	XFDClzQhDXsA9CqDWNtOHOFEDwCuPVX/ThFVGaI0J3nQ+RKNx/grm7FhA/gzcUU9px3BFgeRZhc
	CWFsOJIVQ+e2cvr6SO5MJcd7r7X0GA/iVHJUcdLqdMqyizY9mfODfTcowNHkvHWJOfTy9NjT4VZ
	4wv9rzEhNWULDGnMMmmGUAoJXAUwdeDcurecRAUv9fSYEAkdeJYTdhHWEv3ruYXvFek4/xCCWxq
	kjKY/+YGXRt0JvkApXWHNzpWznv5y/h9NEnx2Kr+qI0PoeJWNc1hrXZ3KHVMzNUeibGHl9w+SFl
	WW0539FiJSE3HM+gD5bxKh4nad/y/sY4WIsuOVkZtfQ9hGYfKgWmg
X-Received: by 2002:a05:622a:1921:b0:4ab:5b3a:5f14 with SMTP id d75a77b69052e-4aedb9584d0mr162698721cf.4.1754044255845;
        Fri, 01 Aug 2025 03:30:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJTrlqeDQwfKaCw8yyW7SIaGimL48nbTtFzI8FnF8q1lx/G/dFdELduNg51Bv5DRhilMLjzg==
X-Received: by 2002:a05:622a:1921:b0:4ab:5b3a:5f14 with SMTP id d75a77b69052e-4aedb9584d0mr162698231cf.4.1754044255332;
        Fri, 01 Aug 2025 03:30:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b88ca314bsm532410e87.128.2025.08.01.03.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 03:30:54 -0700 (PDT)
Date: Fri, 1 Aug 2025 13:30:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andy Yan <andyshrk@163.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
        Simona Vetter <simona.vetter@ffwll.ch>,
        Andy Yan <andy.yan@rock-chips.com>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the drm-misc tree
Message-ID: <cn3l445yzdhehsyyxurjn4x5stnyo34beogguupk7wsjqrloh5@d2berut7dn3l>
References: <20250716203115.6e02e50c@canb.auug.org.au>
 <20250801144354.0ac00f39@canb.auug.org.au>
 <7304e450.4ca8.198645108de.Coremail.andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7304e450.4ca8.198645108de.Coremail.andyshrk@163.com>
X-Proofpoint-GUID: SzqC-JakkC3rQzOQy5sLtLEpyv6CZgdf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDA3NyBTYWx0ZWRfX8CZVePLgsKE5
 IG9raOZ9dulxclKC4hY5r3Pp0avsIcAeq1+cbobkt+sA28ILAahkGtpv8outLxMT4gvadCVsvIm
 i/t42hBiwXkOdAB/kTSBmPIdYDQbTNtAmAa7DyxlbrgW4GKOec/llKFe776Qcr2G+QjV7pNCRE5
 HEZ+w0XIBlVGpONStF3FSwlPw2dgvi/No3gCDve8EdBOBl7xW9/Ycmg0ERQc4ITx+8LluMBuni8
 jE3mQyUzPPgGxoAVLpZjZMYaZTnzClAqWnTrBkGBM/tMZxW+7wGYkKA1BlY4duRxgWA4e9RG2hl
 7netp80vcHdToqgw5gUOAx/HYy2/WosnLZ4Y664N3ohL2LpOTO5VlptDIIaH0J0Hw0V3tdmR1gk
 UaIIHLTWT96CniK1BKFl0GzV+gBjuEOCVWjFe+EjYPTeIxb14XFmVO2sHeMstFiPVeQiBzOf
X-Authority-Analysis: v=2.4 cv=HfYUTjE8 c=1 sm=1 tr=0 ts=688c9761 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=Byx-y9mGAAAA:8 a=rOUgymgbAAAA:8
 a=7bnOuvaNDU_t_1VFS9oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=MP9ZtiD8KjrkvI0BhSjB:22
X-Proofpoint-ORIG-GUID: SzqC-JakkC3rQzOQy5sLtLEpyv6CZgdf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_03,2025-07-31_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1011 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508010077

On Fri, Aug 01, 2025 at 02:28:09PM +0800, Andy Yan wrote:
> 
> Hello，
> 
> At 2025-08-01 12:43:54, "Stephen Rothwell" <sfr@canb.auug.org.au> wrote:
> >Hi all,
> >
> >On Wed, 16 Jul 2025 20:31:15 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >>
> >> After merging the drm-misc tree, today's linux-next build (htmldocs)
> >> produced this warning:
> >> 
> >> drivers/gpu/drm/drm_bridge.c:1242: warning: Function parameter or struct member 'connector' not described in 'drm_bridge_detect'
> >> 
> >> Introduced by commit
> >> 
> >>   5d156a9c3d5e ("drm/bridge: Pass down connector to drm bridge detect hook")
> >
> >I am still seeing that warning.  That commit is now in Linus' tree.
> 
> 
> The fix is here：
> 
> https://lore.kernel.org/dri-devel/20250716125602.3166573-1-andyshrk@163.com/
> 
> Hope that a Maintainer can review and apply it.

I tried picking it up into the drm-misc-next-fixes branch, but I could
not do it: the offending commit is present in drm-misc-next-2025-07-17,
while drm-misc-next-fixes is based on drm-misc-next-2025-07-10.

-- 
With best wishes
Dmitry

