Return-Path: <linux-next+bounces-7356-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B939AF882F
	for <lists+linux-next@lfdr.de>; Fri,  4 Jul 2025 08:43:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 82A6017ECF4
	for <lists+linux-next@lfdr.de>; Fri,  4 Jul 2025 06:43:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E9682609FA;
	Fri,  4 Jul 2025 06:43:08 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62529260571;
	Fri,  4 Jul 2025 06:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751611388; cv=none; b=srEiT2hjW1aAfBiDp29umIqKkU5mKESdLu0Wt+HEnDdN9J8af38rvDIeHg7DOm4sMBQXOAz7EvwIzqNuF/D7S6Pqvmh3zxbPr1nwmZoUvNsMpx2SdgxmdG9vwnHQi9WY4LOJ+nt1L6g+5X9aLYZv29y5mF9upX66Q27QaFB/520=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751611388; c=relaxed/simple;
	bh=wypsT0H5v9nNmzUczEzDcC49ULMczTA7cZr7AyJGEUM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pJxAMiNcK6yJghtIf9bixtUv1OGuCbgUoYl7+BX+/gRP+jv78I51WNfRljb0n3HzYY5GlyrisGDdkqKy8BF6iHWD548AWFUqWpeOazv4IvASauVXw0SBPR6OFfEmV20dqPAEc0P3ppEmUe/y4OqkiYmjxac2SlduwV6mVPlXNWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=h-partners.com; arc=none smtp.client-ip=45.249.212.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=h-partners.com
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4bYPD91ZLJz2Bcmr;
	Fri,  4 Jul 2025 14:41:13 +0800 (CST)
Received: from kwepemg500010.china.huawei.com (unknown [7.202.181.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 9430D1A0188;
	Fri,  4 Jul 2025 14:43:02 +0800 (CST)
Received: from [10.174.178.209] (10.174.178.209) by
 kwepemg500010.china.huawei.com (7.202.181.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 4 Jul 2025 14:43:01 +0800
Message-ID: <d3e4f6f8-be94-4914-af7c-0a03196d53ae@huawei.com>
Date: Fri, 4 Jul 2025 14:43:01 +0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Fixes tag needs some work in the cifs tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, Steve French <smfrench@gmail.com>
CC: Wang Zhaolong <wangzhaolong@huaweicloud.com>, CIFS
	<linux-cifs@vger.kernel.org>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, Linux Next Mailing List
	<linux-next@vger.kernel.org>
References: <20250704082645.37b267dd@canb.auug.org.au>
From: Wang Zhaolong <wangzhaolong1@huawei.com>
In-Reply-To: <20250704082645.37b267dd@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemg500010.china.huawei.com (7.202.181.71)





> Hi all,
> 
> In commit
> 
>    2799c0ada68c ("smb: client: fix race condition in negotiate timeout by using more precise timing")
> 
> Fixes tag
> 
>    Fixes: 515ccdbe9b2f ("[Backport] smb: client: fix hang in wait_for_response() for negproto")
> 
> has these problem(s):
> 
>    - Target SHA1 does not exist
> 
> Maybe you meant
> 
> Fixes: 7ccc1465465d ("smb: client: fix hang in wait_for_response() for negproto")
> 


I apologize for the oversight on my part. I’ll ensure to carefully
verify `Fixes` tag SHA1 references in the future to avoid such mistakes.

Thanks again for your help and support!

Best regards,
Wang Zhaolong

