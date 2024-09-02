Return-Path: <linux-next+bounces-3537-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEA49682C9
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2024 11:11:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DED6281966
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2024 09:11:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C223187323;
	Mon,  2 Sep 2024 09:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="J8bQVCkG"
X-Original-To: linux-next@vger.kernel.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C483185B62
	for <linux-next@vger.kernel.org>; Mon,  2 Sep 2024 09:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725268275; cv=none; b=tIZ2SANRaYN6l66UCNql623g2JnVT+Ov3aSh0b+Df92hTp3kadctLRrXvB9or80LJq/1XP2aJoRZE321FWnsmWR/OvX1Fax+QRMnplSno5HcIaFcMr8E7wgGfGZPaek5taDSS1zagxOcgWNH3ldC/4taB2t/ZRulOAJmptctkfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725268275; c=relaxed/simple;
	bh=SdiPHKnCa3L4fefBVI4PmPPfp6Agp5HYbiAU4hJOxww=;
	h=Date:From:To:CC:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:References; b=hgdgpytEs78bCUfssyY7glACC/JUd8xf6jKroLxKYQLJd03wE39sjg3E3OpVBUx7R0rE+IVUCLstTB/4zKoNs/M2BrOM3ykG1M8FHRH+QGwYX9WlXNqKmh9EDRm2MOWyMjIF032b06R/4Wk3Pk5Uv3+rtBDYuSPn4xzhLMs3V84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=J8bQVCkG; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20240902091111euoutp01b68e3cf270ba69ce1afceed462f9a0d2~xYloSjC3P0127301273euoutp01Q
	for <linux-next@vger.kernel.org>; Mon,  2 Sep 2024 09:11:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20240902091111euoutp01b68e3cf270ba69ce1afceed462f9a0d2~xYloSjC3P0127301273euoutp01Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1725268271;
	bh=fuvRpVOJoRgsyoj9M2cmAAz5t3JWPzGXNiUZUEg/vKI=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=J8bQVCkGbsZnPUOzNaDX5rYnCmdzlchQt6vjvaKe+r/5O8n7m9sawKAsSMx9cJ8ya
	 ys6nuUl/KN1JDeR3neAIXqMa1z2eujVP24s5ojAT9HTYarEdr9os3RyzaDpydsEsGK
	 fao4cCdz4xo70H19CZp6+/eI/s/akTvsF28i8cjU=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20240902091111eucas1p11e66eb26adc6cdf48aa69f7ec9847fd2~xYloKpd_n0411404114eucas1p1z;
	Mon,  2 Sep 2024 09:11:11 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges1new.samsung.com (EUCPMTA) with SMTP id E5.E1.09624.E2185D66; Mon,  2
	Sep 2024 10:11:11 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20240902091110eucas1p23de28e4283497e5aae24a2916cf5c357~xYlnxJbVt2396123961eucas1p23;
	Mon,  2 Sep 2024 09:11:10 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240902091110eusmtrp10a399ffab40c3f5a566bbe7fb32acc78~xYlnwlc0_1257012570eusmtrp1G;
	Mon,  2 Sep 2024 09:11:10 +0000 (GMT)
X-AuditID: cbfec7f2-c11ff70000002598-f3-66d5812ef41d
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id 21.B7.19096.E2185D66; Mon,  2
	Sep 2024 10:11:10 +0100 (BST)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240902091109eusmtip290aa8c6ce88afc6a4b2512e2f1334dc8~xYlm7mucD0925109251eusmtip2F;
	Mon,  2 Sep 2024 09:11:09 +0000 (GMT)
Received: from localhost (106.110.32.44) by CAMSVWEXC02.scsc.local
	(2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
	Mon, 2 Sep 2024 10:11:08 +0100
Date: Mon, 2 Sep 2024 10:38:55 +0200
From: Joel Granados <j.granados@samsung.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
CC: Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <kees@kernel.org>, Linux
	Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
	<linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the sysctl tree
Message-ID: <20240902083855.seu2euueeizr5at6@joelS2.panther.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240829071743.0b1052b9@canb.auug.org.au>
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
	CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se1BMYRjG+/ac3T3bOHxtmV7lumjGYrWYsSaaXMZETA3/JDNYOl10Y49F
	aKZtTLQTu9PWyEoiuewOTTtIF8q6q2lHKitq6PZHMYioLTs6ncJ/v+95n+eZ9535KEI6TPpR
	8ckHGU2yOlEm8iTvPh1yLF6ia44JbLoiUN367BCqXlcWiFQPL2UildPYjVR37jeLQ4ShOqdT
	FGqzZIlCv9tmRhBRnquimcT4Q4xmSfBuz7jGvC9o/3nBkW5XjTgdtSA9klCAl0OhyyTSI09K
	iq8jMDVZxdxAin8gyDOv5Pk7gg/V+yYCQ035Qj5wDUF/Tj3x13TDvocf2EYDPVythCLxPLCa
	9QKORXgROD69Hw1QlA9eCLXDmPMTuALBybqcMb833gxtVWfGmMYhYHzzGvHsBS/OdZEcE6M9
	RVX9Iq6HwP5wzU1xsgSvgEJdoYBfdA4MFLeTPKfBy9ut43o9BeUG4KKA14PTupSXvaH32W0x
	z9OhzpRNcqsBNiGocX8V8w8rgqu6gfGiIDjR1DWeWANvivMRXzoZnJ+9+DUnQ87dswQv03Aq
	U8q7A8Da/ok0ornm/w4z/3eY+d9hRYiwIF9GyybFMqwymTmsYNVJrDY5VrE3JcmGRv9HnftZ
	/z10ofebwo4EFLIjoAiZD11S/SpGSkerU48ympRdGm0iw9qRP0XKfOn50bMYKY5VH2QSGGY/
	o5mYCiiJX7og91Dk1hS6o6Vq8IeKfitpfGxpe1vgL+sr3VJJHM2IboyyKtBshS7opm94vmW7
	X+qT8CnOTJd3qeFycJvOo0qJXW2ODw/CSozBF8N+ybUbLsh6PnbkDbbLw83HxI5Ad4DA/GpR
	7p1t9YaexwkZK7u8ZF0bC2pd680Kj/Khc7j80tWyzgNHRnZ39obZ3+lt6xJqd+yc8fO44cbv
	qFQhLVTUpEUOLmNTI5R0w4GKoLWTptZl72sNWzUdtT5a3dlnwt3GXQsrg05vilP6GvTPF/QV
	+VSw7jJt4nZX1rqy6/KepaYSS9YCOdHQp6wuG/lqJ5tHtmSEDnRPK4qx782TlspINk6tlBMa
	Vv0HAFbbf44DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFIsWRmVeSWpSXmKPExsVy+t/xe7p6jVfTDLZ0aVise3ue1eLyrjls
	FgcXtjFa3JjwlNFi696r7A6sHo03brB5bFrVyebxeZNcAHOUnk1RfmlJqkJGfnGJrVK0oYWR
	nqGlhZ6RiaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXsalqe8ZC2YzVTz9tZ+9gfEaYxcjJ4eE
	gInEzyszWEFsIYGljBJz52RCxGUkNn65ygphC0v8udbFBlHzkVHizSG1LkYuIHsTo8TfO8/A
	BrEIqEisntXFBGKzCehInH9zh7mLkYNDREBb4sBvAZB6ZoGdjBKvp78FqxEW8JG4u7sPbCiv
	gIPEhOuXGSGGdjFKHNu4gBEiIShxcuYTFhCbGWjogt2f2ECGMgtISyz/xwES5hQwl5jXOI8J
	4lBFia+L77FA2LUSn/8+Y5zAKDwLyaRZSCbNQpi0gJF5FaNIamlxbnpusZFecWJucWleul5y
	fu4mRmAkbTv2c8sOxpWvPuodYmTiYDzEKMHBrCTCu3TPxTQh3pTEyqrUovz4otKc1OJDjKbA
	oJjILCWanA+M5bySeEMzA1NDEzNLA1NLM2MlcV62K+fThATSE0tSs1NTC1KLYPqYODilGpjK
	5Nc0vhS8tNl2mp6L/gQ9Dw7HnhufOquun/nrs9DyzUXt9/OMFZ3bBWZvzTiadIlXV7S1KUPy
	xXyO8sbD51lU5xvpvjV/rc1UGffzWVm47/t2x8zP//KEJ+s+Fw15de/+Mrn0GOZ3zCHbHpkk
	L7/sUS3y6mVpy+qePUbfI39tzrwY6pPxZslJFg7WhS8+nXDqWsU745y20qI54nO0/vZM2vGc
	2z/bV/0Vi/nzS1tZVCqf6C6Nz/GKOLQ/1nDWMz5XlV/LnawzXKsUdQ5ZzF2Z2Zi+6JFRgun2
	tCkXt3idbOIQvFJqXpnyWk7434vDe9mjM9tK0jkOfZl/mUf9XmnFtaw7Fcfnv12hz8nudkWJ
	pTgj0VCLuag4EQAUGltMLQMAAA==
X-CMS-MailID: 20240902091110eucas1p23de28e4283497e5aae24a2916cf5c357
X-Msg-Generator: CA
X-RootMTR: 20240828211751eucas1p15dce08fef267343b2b904ef9d7f9e42c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240828211751eucas1p15dce08fef267343b2b904ef9d7f9e42c
References: <CGME20240828211751eucas1p15dce08fef267343b2b904ef9d7f9e42c@eucas1p1.samsung.com>
	<20240829071743.0b1052b9@canb.auug.org.au>

On Thu, Aug 29, 2024 at 07:17:43AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   ed674ae9a6e6 ("sysctl: avoid spurious permanent empty tables")
> 
> is missing a Signed-off-by from its committer.
Fixed this. Thx for the report.

Best

-- 

Joel Granados

