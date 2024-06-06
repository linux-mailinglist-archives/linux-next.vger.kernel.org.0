Return-Path: <linux-next+bounces-2481-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8954C8FDD89
	for <lists+linux-next@lfdr.de>; Thu,  6 Jun 2024 05:36:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 202A71F24715
	for <lists+linux-next@lfdr.de>; Thu,  6 Jun 2024 03:36:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D9C71798C;
	Thu,  6 Jun 2024 03:36:38 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5723C17;
	Thu,  6 Jun 2024 03:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717644998; cv=none; b=JYiSp0s/j52lVSO3tijGV64iN+Y7fRo7p1tkl29ST3HjpbPaNWSshYxjNvcRzbW/HV4k3pbOXUrrxoOjielDzJrOYX8MAAc74dWVZ1bc5ieh/YTrqUX/+KuD3Y/AOLjCSX7m2jfvsHKlrRkEGXKUfc/iIGMqw1162uNnY67W6hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717644998; c=relaxed/simple;
	bh=IIm28iCsVSosHwNqrlq/T7wI9/fOZaw8gYMnkfAx/eE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=A3WA50xJzvwTL9uxve++0xt7CxzNbCj6dbHUMMjpsckpdLujqUfsTcWi4Z2KWDPqwmdqKEuBD6dY7fvOfiMCikTh+TMKbBLFTNbOotuclWcOr3ddViH/YNhLdlxgyWAnE5qBEfoRD08uc48JOM/YdfjKLiPdyYMXHHsvC5bEh20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4VvqhL2vflz1HDBh;
	Thu,  6 Jun 2024 11:34:42 +0800 (CST)
Received: from dggpemm100001.china.huawei.com (unknown [7.185.36.93])
	by mail.maildlp.com (Postfix) with ESMTPS id 8B60B1402D0;
	Thu,  6 Jun 2024 11:36:30 +0800 (CST)
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm100001.china.huawei.com (7.185.36.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 6 Jun 2024 11:36:30 +0800
Message-ID: <61b256c7-4989-44ec-83db-f34a1bd4be2d@huawei.com>
Date: Thu, 6 Jun 2024 11:36:29 +0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build warning after merge of the mm tree
Content-Language: en-US
To: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton
	<akpm@linux-foundation.org>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
References: <20240606131954.30d0be64@canb.auug.org.au>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <20240606131954.30d0be64@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm100001.china.huawei.com (7.185.36.93)



On 2024/6/6 11:19, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the mm tree, today's linux-next build (htmldocs) produced
> this warning:
> 
> Documentation/core-api/pin_user_pages.rst:200: WARNING: Title underline too short.
> 
> folio_maybe_dma_pinned(): the whole point of pinning
> ===================================================

Oh, after page->folio, we need an extra "=", should I send a fix?

diff --git a/Documentation/core-api/pin_user_pages.rst 
b/Documentation/core-api/pin_user_pages.rst
index 532ba8e8381b..57b17978e156 100644
--- a/Documentation/core-api/pin_user_pages.rst
+++ b/Documentation/core-api/pin_user_pages.rst
@@ -197,7 +197,7 @@ INCORRECT (uses FOLL_GET calls):
      put_page()

  folio_maybe_dma_pinned(): the whole point of pinning
-===================================================
+====================================================


> 
> Introduced by commit
> 
>    b3d997231b4d ("mm: remove page_maybe_dma_pinned()")
> 

