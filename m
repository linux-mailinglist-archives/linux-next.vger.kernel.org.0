Return-Path: <linux-next+bounces-5164-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBABA0AD52
	for <lists+linux-next@lfdr.de>; Mon, 13 Jan 2025 03:13:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8CB9C3A72AB
	for <lists+linux-next@lfdr.de>; Mon, 13 Jan 2025 02:13:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 250FC76034;
	Mon, 13 Jan 2025 02:13:44 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C112450F2;
	Mon, 13 Jan 2025 02:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736734424; cv=none; b=E8nsu/uNvt7Ov4GzxOzuKK+MeXvUF8SPduqAiK42T9YE5nfVUkSu/L6uJYBt4DgGrYk4G1Pg69uVy9YWwOe6zcgBbEGkN5utNxCzyHbDXNOTnoYL11DalXkV+R3MtqbEtjlL1SghBh85c8OQ4YJYlyQ3ug9MGEnaKOXNU91NLro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736734424; c=relaxed/simple;
	bh=RD0L4+GgKysgCemDuDDOMwaX0nbBMSsTLoUHQH78V08=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=KgTm1O+RCUbXXUCzoZi9xD57rhsOcekZF8hTfe4KocupkMjIikZedilW8YVANZq50Ey2wq55W30N8rl9qo4shUu33XbCnMM/x2t+dtK2xtEyBhttACJNEVqAwIsng5nK8O0W1KAgo2Knaq2/LkQSkuoMMcjef+cUQYntT83MS5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4YWbQH3nYdz4f3jLh;
	Mon, 13 Jan 2025 10:13:11 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id 1825C1A0C13;
	Mon, 13 Jan 2025 10:13:33 +0800 (CST)
Received: from [10.174.176.73] (unknown [10.174.176.73])
	by APP3 (Coremail) with SMTP id _Ch0CgB3ysTLdoRnnqsrAw--.32446S3;
	Mon, 13 Jan 2025 10:13:32 +0800 (CST)
Subject: Re: linux-next: build failure after merge of the block tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, Jens Axboe <axboe@kernel.dk>
Cc: Song Liu <song@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 "yukuai (C)" <yukuai3@huawei.com>
References: <20250113125142.001f056b@canb.auug.org.au>
From: Yu Kuai <yukuai1@huaweicloud.com>
Message-ID: <138ea43c-223b-ac64-bff7-9ccb5f3dbd7a@huaweicloud.com>
Date: Mon, 13 Jan 2025 10:13:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250113125142.001f056b@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_Ch0CgB3ysTLdoRnnqsrAw--.32446S3
X-Coremail-Antispam: 1UD129KBjvdXoW7Xr1fAFWkKr1kKFWxuFWfXwb_yoWxCFXEkF
	4qy3s7Cw18Xws7CrW5ta9I934ak3WjqryqqFykKr48uF1xXa17W3Z8C3WUX3W5JFZ2qFZx
	Cr1aqwn5CrW09jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb4AYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
	A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x02
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

在 2025/01/13 9:51, Stephen Rothwell 写道:
> Hi all,
> 
> After merging the block tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> make[5]: *** No rule to make target 'drivers/md/md-linear.o', needed by 'drivers/md/built-in.a'.  Stop.
> 
> Looks like a missed "git add".
> 
> Caused by commit
> 
>    7ad00dd67641 ("md: reintroduce md-linear")

So, I do checked today's linux-next tree, the above commit is not here.

2b88851f583d (HEAD -> master, tag: next-20250110, origin/master) Add 
linux-next specific files for 20250110

Are you sure about this report?

Thanks,
Kuai

> 
> I have used the block tree from next-20250110 for today.
> 


