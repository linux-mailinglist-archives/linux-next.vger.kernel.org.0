Return-Path: <linux-next+bounces-4949-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FA49F0131
	for <lists+linux-next@lfdr.de>; Fri, 13 Dec 2024 01:41:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A24211610ED
	for <lists+linux-next@lfdr.de>; Fri, 13 Dec 2024 00:41:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 476C621345;
	Fri, 13 Dec 2024 00:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="sbcA/gRt"
X-Original-To: linux-next@vger.kernel.org
Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE51E383;
	Fri, 13 Dec 2024 00:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734050471; cv=none; b=AM3I3qhHJOmGINPRct/n0MHmck6b6MD+4BngP0PpMgCXpjGKZKB7RlDdBHTYIL3YhriGYVjZ6649mXR4mHmfop8P4zECX3vMHA/yKpCAA10oYhwET0Atisv6c0rU0c5AQveAlIvxX2sXpk54IxJj9Bd10vJ7093jxicfWY7kRRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734050471; c=relaxed/simple;
	bh=V99Syqf3xXZE0RSCkir7+jSVbE4ih48d5LJbQB15a2I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sqpNfBtrlAMmc9av56nDljNknkqL94hzXMkfE52KbOyJ+M6MhhxOnl6DDb8RjlHukn+MoKgpfQVEoau2OEHHJiP0XWiZQqCMLKR1LNba72ZCpCsFS+4ruYc3/rdo7maNlgl0NRY/VG7C+kPz1y94Gb3NS2518OKwgIiNHCcQyts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=sbcA/gRt; arc=none smtp.client-ip=115.124.30.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1734050460; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=JYOZrW7zvgS0OnnzVl97x5gXXS0+sDRCGDc230tyZVs=;
	b=sbcA/gRtn2nYeFTdz5Kr+jJz6QYtVdU79wTo+P/BbdCm2eZs8ifrLowwO1986Ko619m773VUNIm8vNZR1DqfnSXeVWIRM2vbEulRZGiMoLXw2KtZbnQQLwTIZ4ETJ8VlkFjeE2rVu87mpSxEIzRiAebLLtKoS6hcMlOlijbcsAQ=
Received: from 30.170.86.122(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0WLN43r5_1734050458 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 13 Dec 2024 08:40:59 +0800
Message-ID: <9035af43-cecc-4082-bdc1-4698a1dce502@linux.alibaba.com>
Date: Fri, 13 Dec 2024 08:40:56 +0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the erofs-fixes tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, Gao Xiang <xiang@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20241213101602.745dc685@canb.auug.org.au>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <20241213101602.745dc685@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2024/12/13 07:16, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the erofs-fixes tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> fs/erofs/fscache.c: In function 'erofs_fscache_bio_alloc':
> fs/erofs/fscache.c:201:30: error: 'struct erofs_map_dev' has no member named 'm_fscache'
>    201 |         io->io.private = mdev->m_fscache->cookie;
>        |                              ^~
> fs/erofs/fscache.c: In function 'erofs_fscache_data_read_slice':
> fs/erofs/fscache.c:319:47: error: 'struct erofs_map_dev' has no member named 'm_fscache'
>    319 |         ret = erofs_fscache_read_io_async(mdev.m_fscache->cookie,
>        |                                               ^
> 
> Caused by commit
> 
>    34cff83201d5 ("erofs: reference `struct erofs_device_info` for erofs_map_dev")
> 
> I have used the erofs-fixes tree from next-20241212 for today.

Thanks, fixed and pushed.

Thanks,
Gao Xiang

> 


