Return-Path: <linux-next+bounces-7390-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE797AFC040
	for <lists+linux-next@lfdr.de>; Tue,  8 Jul 2025 03:58:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 168F23AEDDA
	for <lists+linux-next@lfdr.de>; Tue,  8 Jul 2025 01:57:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BA2A1552FD;
	Tue,  8 Jul 2025 01:58:11 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272F923DE;
	Tue,  8 Jul 2025 01:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751939891; cv=none; b=QRBCmovBZZz/gvNQINM4Z9ZxKjS7GhyaWaujZUrNUF/tXdDJJS14Jmaouq4mYed5SZ+x/dcscNNRiYAM//wdZkHGJnEa7JExB51sVWhnPfyjxDdLumcqZYOnOsmaatItQKg773FOo0aE//qvcC4WzdvspBwHSuy2MbEZ3ui25b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751939891; c=relaxed/simple;
	bh=irH2w41k9Uvwito0VsAvxOhTKcuRLLK8X19x6yZULL0=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=KYUl2adyIG2Swg+Ras555J/DOVYxQXTAfRFDQZqqnzmjYpos3y05fPMxUAq7YzdLRXgpKYK6I9s9tdpiYptpIXWm994s/4xKrtDdM6hJLwcWPyQvz+WbwyziKskrkS5Z/BVXxflg9XDxHUqmRm9ICFQmI7WQLgyggwu4CWbfgOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4bbklZ2nkvzYQvJk;
	Tue,  8 Jul 2025 09:58:02 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id 35ABD1A10FF;
	Tue,  8 Jul 2025 09:58:01 +0800 (CST)
Received: from [10.174.179.143] (unknown [10.174.179.143])
	by APP3 (Coremail) with SMTP id _Ch0CgAHaCUne2xo2J8ABA--.63781S3;
	Tue, 08 Jul 2025 09:58:01 +0800 (CST)
Subject: Re: linux-next: Fixes tag needs some work in the block tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, Jens Axboe <axboe@kernel.dk>
Cc: Zheng Qixing <zhengqixing@huawei.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 "yukuai (C)" <yukuai3@huawei.com>
References: <20250708114925.2413cc77@canb.auug.org.au>
From: Yu Kuai <yukuai1@huaweicloud.com>
Message-ID: <c1e6ab2e-7562-1c99-38cd-5083e728057d@huaweicloud.com>
Date: Tue, 8 Jul 2025 09:57:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250708114925.2413cc77@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_Ch0CgAHaCUne2xo2J8ABA--.63781S3
X-Coremail-Antispam: 1UD129KBjvdXoWrXrWrXry7WryxCr4fAw1rCrg_yoWxXwcEgF
	yjyr97G3yDXws7tas0yrZ8AFW3Gr4avrWDGrWvgF42ywn8ur4DXFZ2k3s7XrWfta98tr1Y
	gr13J34fZFWYvjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb4AYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
	A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x02
	67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCY1x0262kKe7AK
	xVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
	0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1l
	IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
	AFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j
	6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU1veHD
	UUUUU==
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/

Hi,

在 2025/07/08 9:49, Stephen Rothwell 写道:
> Hi all,
> 
> In commit
> 
>    5fa31c499281 ("md/raid1,raid10: strip REQ_NOWAIT from member bios")
> 
> Fixes tag
> 
>    Fixes: 9f346f7d4ea7 ("md/raid1,raid10: don't handle IO error for
> 
> has these problem(s):
> 
>    - Subject has leading but no trailing parentheses
>    - Subject has leading but no trailing quotes
> 
> Please do not split Fixes tags over more than one line.
> 

This is my fault, I just build a new development environment and I added
the fix tag while applying the patch, without noticing the line is
wrapped automatically.

Jens, please let me know if I should send a new pr.

Thanks,
Kuai


