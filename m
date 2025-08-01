Return-Path: <linux-next+bounces-7819-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E79B180A3
	for <lists+linux-next@lfdr.de>; Fri,  1 Aug 2025 13:04:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A3CDD1633A8
	for <lists+linux-next@lfdr.de>; Fri,  1 Aug 2025 11:04:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C705237160;
	Fri,  1 Aug 2025 11:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Up3tLr1+"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489D2A921
	for <linux-next@vger.kernel.org>; Fri,  1 Aug 2025 11:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754046269; cv=none; b=YWjuRNnTlB/7DF6OfmgVo7TRX1B0W+tG3gKPjf+60wv7Iv573movxNT38i7Q2yyM/oPpLBoyr+nYDxDv57biaDIt03tt/+5FSDsJPVe9l/qRtk91przilO4GhQRNU0enlbvmXw26PWq+cxrrUZKVUjOiZSqHNiM5DOaE9pdUJVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754046269; c=relaxed/simple;
	bh=zOehqtXHRDO6fWosdVjMRCsZ1EtHdLfJqca5uCbIWtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VgSohbabRiWPSi8zBUm0kM0/yfTMWBqG1PUtvxY/ErlY9jXQ/2WAFNqEsDe67Rf1GcWZfcHcluvzzdUK25RL4wJkPFh8JHc0hfC+vLYz+wSZHAzTLzjGF4jYxKR/7SH1vJlry4XFoELTkJ+qPTeC7KASXV6v6dI/RUBkuGQ1/6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Up3tLr1+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5718xg5v018834
	for <linux-next@vger.kernel.org>; Fri, 1 Aug 2025 11:04:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NgRcL7ZzvTtLCYCuWN7Ar9gM
	KYLMCAowZwuINSJ1rW4=; b=Up3tLr1+ZRyH/8JyXscwVyb++epGiqLhGPbiCd1n
	dg6EXUVBuHHB6ETD4o3lY8aRx21kaXbIHsxw/ONgW+zHrTKjSjhrBxVI/xrcCgJo
	L92+LphSidvf82akRopdNEx4/MCKeAuwvZ7aySqEPplr8SVqPagGgIf9Cls1DnhK
	/stb+p0QSyYmhEKPQ3e61K23zRh5SMkvMjHljJtG9dgi7dRXrxzoPFdbyO/GlTLF
	01ubzJhQWzq39DlqiLUAWLIJUQehyriJRPPRBlj9p8Ucg1DtddqLu8SbzsGarXOv
	nyJRy3GQtw8Iq+elK5hU2cXLl5lhhRsAy9uozCOPY97uvw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484qdabgh0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-next@vger.kernel.org>; Fri, 01 Aug 2025 11:04:27 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4af0100c03fso14736901cf.2
        for <linux-next@vger.kernel.org>; Fri, 01 Aug 2025 04:04:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754046266; x=1754651066;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NgRcL7ZzvTtLCYCuWN7Ar9gMKYLMCAowZwuINSJ1rW4=;
        b=oQbfxke/cIyLspKbcZi80bO37/wwxGSlQB/ZEfFvtuNciQTfQ+wmmIv6suwHSUJLhV
         0TOUn7utR7pvj90nnpGMOeZSK3X8BA8gbYmd7uhuJr4nTyAmubhptHq49jWrvCvLw83V
         w+p/8XGro9ErtJsOqauz/Ty5E8QrZZ+gf7cdEW6lhZ3pmLCby0EGin7g+JIkQWZ4Iku5
         SraQADSXTv3c5GucrkTj4Y85rtba9fHDKrHcnzX8NGx9ytTUuBnn0v9ivxoI0ZoIMzSu
         rLZVINMOncXYZeVXBlah4Zn4CVkVa3rleNhcJeDWxHbsGjl6qqTXZ49YB6ILrekdFclQ
         f1bg==
X-Forwarded-Encrypted: i=1; AJvYcCVXUBvSmBjZuETanEilDDL/ek2t1YBzOVKnKw+raQHIZBJul0hdofdF34ltk9tQ/MgJnKJb15NQC+Ag@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2FPGOxnDlLYd86YzbVw80KEj6uKuwSke2VK/4fEeWl69Gwoio
	E5siKeRUyXK1ZndRwqv+QL4Non7D+Ywe9vbe3WzsG0L2+/rsSp8WzbBfeFgN720dmARC/RsunuN
	034XWbHhzmL1H0VTpfNj0yZITpYELeENXGwk7ArUdCe3CA7YAW1vI0fShxp5lQ+zl
X-Gm-Gg: ASbGncuYEwAHuU/s3MLSu5PyYbO4VenF+woqnil23uiv1X9ASLhLp/GDOILLlI7njGg
	f/NwI9bnqhKauymM+wbKXaYjcI8fVI/bfrNl0XLe9/J2YCv9JRt8U+oJ9XCY4ZCxksE8W3VMxI0
	etAOhFOLpIMBzvQj4cIXmwR6Sw622t/6k4ursccC/xFJtw6Q//7lESyasjVEPFuyg1MloYJHyqy
	L6iDzL+dEGFrOyUu8MtlvBDoWB5i0dNvw09/ywGFiVWiWNgKfZayIqxaHueSoZvnuqCsvN+y4LX
	c+Wuj1+MVnWSSrLOcVFXbtziHG9ohmRYnneyrMSOXu+dSrg3Q9onw+XdjshtNkATSeXd4Gs2Gjj
	zFk7TU8936e0SdvTqz7pU5wPLaC6nocg+uvXXMZYTtIkjkSJXYEsk
X-Received: by 2002:ac8:6312:0:b0:4ab:65ae:410e with SMTP id d75a77b69052e-4aedd3d7118mr112659771cf.29.1754046266194;
        Fri, 01 Aug 2025 04:04:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuigU5I/fNY+R/JXK4FaI194+ce8U1d910+DeVFR6Gtmc8iLAg+RFSFlfj1DqL2LEydQoptw==
X-Received: by 2002:ac8:6312:0:b0:4ab:65ae:410e with SMTP id d75a77b69052e-4aedd3d7118mr112659231cf.29.1754046265530;
        Fri, 01 Aug 2025 04:04:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-33238272d3fsm5667011fa.5.2025.08.01.04.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 04:04:24 -0700 (PDT)
Date: Fri, 1 Aug 2025 14:04:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the drm-misc tree
Message-ID: <bnmpfzdhbr4wlpk4qfcewfotmstbf53ulni3jo7bklranpq7ls@qugmpsudkzzy>
References: <20250611140933.1429a1b8@canb.auug.org.au>
 <20250801143440.59e13a4b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250801143440.59e13a4b@canb.auug.org.au>
X-Proofpoint-ORIG-GUID: 8hf_vNmpGDlfuc1-m1iQo3OW14YQF-7U
X-Authority-Analysis: v=2.4 cv=Pfv/hjhd c=1 sm=1 tr=0 ts=688c9f3b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rOUgymgbAAAA:8
 a=83lZ8fBB0w3I-Wmrrl8A:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=MP9ZtiD8KjrkvI0BhSjB:22
X-Proofpoint-GUID: 8hf_vNmpGDlfuc1-m1iQo3OW14YQF-7U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDA4MSBTYWx0ZWRfXzPeRPrQnA1C6
 z5CMELRGHHVsgXukDarFimVuSTSjbuhvsapbb5qa16EGdYruLKH9nckNA4411+w03iHsE6TLK1k
 Dzton5v+rZGbUauiH62JtNgSh4fCgMUaY8bxxoBfEgKbsV3/Z4K38nAGt5ytbw0Qitqz7T/hZpq
 4/NjLmSo9YkAJgqI1Gq+V+DOskSxMfmY1V6TMTvJRxYrsKIyTwkFK278dofHOXZnONOWeA+t2rD
 b038Q8rake3RqQUKIySaSjFZX6QHbz61jwQ7aghHqi6Bo+QCTCaw5BrIMdksqUgnNP2NkY7LZwk
 eRIILI4iTcTv9Ad786uSd7YMeK1wzEp2QucNFr+o+8yZAp5XIo5nf/szOy+hnQ6Jz8Nlw7USdZ4
 CvWF49h7kOmq5XtACDj4aZi7eRRCgi4a3HBm/oGUfEgH3p3czVRXkzZRiW4moEUINJasFrAp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_03,2025-07-31_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 adultscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508010081

On Fri, Aug 01, 2025 at 02:34:40PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> On Wed, 11 Jun 2025 14:09:33 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > 
> > After merging the drm-misc tree, today's linux-next build (htmldocs)
> > produced these warnings:
> > 
> > include/drm/drm_bridge.h:943: warning: Function parameter or struct member 'hdmi_cec_init' not described in 'drm_bridge_funcs'
> > include/drm/drm_bridge.h:943: warning: Function parameter or struct member 'hdmi_cec_enable' not described in 'drm_bridge_funcs'
> > include/drm/drm_bridge.h:943: warning: Function parameter or struct member 'hdmi_cec_log_addr' not described in 'drm_bridge_funcs'
> > include/drm/drm_bridge.h:943: warning: Function parameter or struct member 'hdmi_cec_transmit' not described in 'drm_bridge_funcs'
> > 
> > Introduced by commit
> > 
> >   a74288c8ded7 ("drm/display: bridge-connector: handle CEC adapters")
> 
> I am still seeing these warnings.  That commit is now in Linus' tree.

I've posted the fix at:
https://lore.kernel.org/dri-devel/20250801-drm-hdmi-cec-docs-v1-1-be63e6008d0e@oss.qualcomm.com/

-- 
With best wishes
Dmitry

