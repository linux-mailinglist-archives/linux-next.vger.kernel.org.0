Return-Path: <linux-next+bounces-7596-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8E3B082D9
	for <lists+linux-next@lfdr.de>; Thu, 17 Jul 2025 04:21:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A3580580C5F
	for <lists+linux-next@lfdr.de>; Thu, 17 Jul 2025 02:21:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 236E719F421;
	Thu, 17 Jul 2025 02:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="SsnFMdME"
X-Original-To: linux-next@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA3319ABD8;
	Thu, 17 Jul 2025 02:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752718902; cv=none; b=CCzjl7kNfpKNT5unAHWJwuGWou+mT96fI6BLqpDuH53M1mXXb2go1sWrEsiqU/SzGb9Pih1A/g/T5hL7hSp2Z7dj7tdvZ4pncPcmwj8qt39QMXLSzRzx+7gCGeyzwRUUpZFx9dZnJzpsBITPGprrIvVWSOLQZ6Y8jX/8I6WmnHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752718902; c=relaxed/simple;
	bh=CQmph+MbVmsbsW5DG2Z/8RQnTT2cs03YhDNRbnnbb74=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vA5NatKPg3OhnC3+MvPr3dySTF97tGJa9uD0A97yUOqK2IhjmFU6YS/zVTxtKR06cxOcuCYPLi5qEZWv6CXz9RurQTvRfFJ+QNyKIEgjg8WNk1QsWg3Kq38fMOWW6zAfG3+kIKRyFJKKntrRFrYwDjhlt3ugIf6M6Gn0mgZTgBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=SsnFMdME; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=/F2PgCQKoPD0rq8kezRiNiQEZa/h4WP2ifWG1ROpCTA=; b=SsnFMdMEssCNfHvxp7PJ+56Up4
	ACIXXOxEiZwKWIib5PlP+6vWLMJpJl1nyxAgZW0qjLMletRTLCivAHSkYCp/oB85fXzANNOunKaSw
	QtHdehZwsp1FZgBUmmhW9aThyi5XYCisttQcpRXlNdwpC/p8x7LAOxcl3Z58mpw4XXAd2LsfGMpla
	uBf2YiNnAoqJsJ7Gh/OXypRBPPxgDv59iSjGv1R8yWATHvIpZRa10y6EP9nxE7HSd+viAOkL2lPka
	VNGBHTp2pXO5hjQzGoPeOSssDrDy+jJhtbddeff6TUJGp0Sg1SwY7E03WOL1gFfO64GT8QzRdoz0q
	KPSPRD1Q==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucEFb-000000093Na-09NI;
	Thu, 17 Jul 2025 02:21:35 +0000
Message-ID: <d9d1ece9-8567-4b8b-b47c-140cf6bedcc9@infradead.org>
Date: Wed, 16 Jul 2025 19:21:34 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build warning after merge of the drm-misc tree
To: Andy Yan <andyshrk@163.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, Andy Yan
 <andy.yan@rock-chips.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250716203115.6e02e50c@canb.auug.org.au>
 <73ab4497.98ab.19813525561.Coremail.andyshrk@163.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <73ab4497.98ab.19813525561.Coremail.andyshrk@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/16/25 6:00 AM, Andy Yan wrote:
> 
> 
> Hi all,
> 
> At 2025-07-16 18:31:15, "Stephen Rothwell" <sfr@canb.auug.org.au> wrote:
>> Hi all,
>>
>> After merging the drm-misc tree, today's linux-next build (htmldocs)
>> produced this warning:
>>
>> drivers/gpu/drm/drm_bridge.c:1242: warning: Function parameter or struct member 'connector' not described in 'drm_bridge_detect'
>>
>> Introduced by commit
>>
>>  5d156a9c3d5e ("drm/bridge: Pass down connector to drm bridge detect hook")
> 
> Once again, I apologize. I have sent a patch[0]  which I hope will fix this issue.
> When I ran "make htmldocs" locally, I didn't see this warning. I'm not sure if it's because my method was incorrect.
> 
> 
> [0]https://lore.kernel.org/dri-devel/20250716125602.3166573-1-andyshrk@163.com/T/#u

That patch [0] LGTM.

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

-- 
~Randy

