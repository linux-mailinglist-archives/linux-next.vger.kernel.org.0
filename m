Return-Path: <linux-next+bounces-3496-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA26963E20
	for <lists+linux-next@lfdr.de>; Thu, 29 Aug 2024 10:13:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72B971C20D83
	for <lists+linux-next@lfdr.de>; Thu, 29 Aug 2024 08:12:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFDEA18A6BA;
	Thu, 29 Aug 2024 08:12:39 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C60189909;
	Thu, 29 Aug 2024 08:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724919159; cv=none; b=Jkqt7Ut9pIMbDOfwnM+ZaMcdD441IH1jH3dWzVdCFLASMo9+KFPyfE6U12pU937+USKSIxicUpWLTh9++Ayp5VfqY5D5atIELIzciBBPVj+2IHxvRGeWGpn6yoHmihKsusaUjF76Axk9LPFkgB8XZqepfGtm9c/QD02isBcwzMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724919159; c=relaxed/simple;
	bh=w8VlsCOQJU+BEGrVxHaHGvlTBxgEYlvPYc8NgA9mLDk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=o4vOTVx+eRNcaUleFOWRUVhHenJ//n/c+U/zQ0SaZ/7lTyXwJ5/5GJS8Am5hZQAz5YwZMnOukdqVNOmNeDcVzv1L28Xoi6drYY7UUev8OiBFcLiuMsZTwKUhGy0NQWDHF/tOGUEAd4Nnku1LiBqcaCqPOR+7f7ucsuzYzRuJexk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4WvYpL47wDz1HHpB;
	Thu, 29 Aug 2024 16:09:14 +0800 (CST)
Received: from dggpeml500022.china.huawei.com (unknown [7.185.36.66])
	by mail.maildlp.com (Postfix) with ESMTPS id 5650B1400FD;
	Thu, 29 Aug 2024 16:12:35 +0800 (CST)
Received: from [10.67.111.104] (10.67.111.104) by
 dggpeml500022.china.huawei.com (7.185.36.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 29 Aug 2024 16:12:35 +0800
Message-ID: <4d49a148-a87d-4f10-a3b1-b908d7201a0d@huawei.com>
Date: Thu, 29 Aug 2024 16:12:34 +0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the kspp tree with the mm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, Kees Cook <kees@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Michal Wajdeczko
	<michal.wajdeczko@intel.com>
References: <20240829153145.7f768337@canb.auug.org.au>
Content-Language: en-US
From: Hongbo Li <lihongbo22@huawei.com>
In-Reply-To: <20240829153145.7f768337@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml500022.china.huawei.com (7.185.36.66)



On 2024/8/29 13:31, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the kspp tree got a conflict in:
> 
>    include/linux/string_choices.h
> 
> between commit:
> 
>    533f2ca2a8a2 ("lib/string_choices: add str_true_false()/str_false_true() helper")
> 
> from the mm-nonmm-unstable branch of the mm tree and commits:
> 
>    a98ae7f045b2 ("lib/string_choices: Add str_up_down() helper")
>    f5c1ca3a15fd ("string_choices: Add wrapper for str_down_up()")
> 
May be there is the order trouble. In the linux-next, 
str_up_down/str_up_down have been added. And 
str_true_false()/str_false_true() helper are based on the newest linux-next.

Thanks,
Hongbo

> from the kspp tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 

