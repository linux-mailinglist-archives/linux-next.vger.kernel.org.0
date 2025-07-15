Return-Path: <linux-next+bounces-7541-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 185B7B04F0F
	for <lists+linux-next@lfdr.de>; Tue, 15 Jul 2025 05:32:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32479188907A
	for <lists+linux-next@lfdr.de>; Tue, 15 Jul 2025 03:32:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16D1586331;
	Tue, 15 Jul 2025 03:31:57 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320EE219E8;
	Tue, 15 Jul 2025 03:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752550317; cv=none; b=oO6aFQ7ewFV+BRAtVKyhpr2w3DNvImhzFRZUhM1ggYgXUFFRF2c/+vjxo5jPSrNcS0dhtmi0dLp2zZgivUWdDQ3+aCm6HNayMcs536fn6mpOT/pfNzx8QvbTY5eysnkJWIWu+rIuo6i2aHCsTBQ6FZpcQnqcGrPMER1PdZrwQEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752550317; c=relaxed/simple;
	bh=UfrPomyM4QHQzzHyDs5E1q2C5/LNjhXQJcketkYOe0s=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LqQjfKs9J3ki6TrYdF2wAPLVHqxieATiElKViAbkvLdFbngNFQEEY4ecvcPFAyw2eGp0Sb4ae30J3TVCs670d6qIBvnq+CX/lZ5FBlE9o3n8wnKsQiwkIp5kHSfr7/M8KpNnTWJ69C5mYL52UgHIn7bDBimDjVednuWVlRUObQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4bh4RZ6Rhsz29dpT;
	Tue, 15 Jul 2025 11:29:14 +0800 (CST)
Received: from kwepemf100017.china.huawei.com (unknown [7.202.181.16])
	by mail.maildlp.com (Postfix) with ESMTPS id A4128180043;
	Tue, 15 Jul 2025 11:31:51 +0800 (CST)
Received: from [10.174.179.80] (10.174.179.80) by
 kwepemf100017.china.huawei.com (7.202.181.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 15 Jul 2025 11:31:51 +0800
Message-ID: <3738cc55-f3fd-4b6c-b1dd-3f469c00b9f1@huawei.com>
Date: Tue, 15 Jul 2025 11:31:50 +0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the ext4 tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, Theodore Ts'o <tytso@mit.edu>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
References: <20250715082230.7f5bcb1e@canb.auug.org.au>
Content-Language: en-US
From: Zhang Yi <yi.zhang@huawei.com>
In-Reply-To: <20250715082230.7f5bcb1e@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemf100017.china.huawei.com (7.202.181.16)

On 2025/7/15 6:22, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the ext4 tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:

Hi Stephen!

I'm sorry for the regression, but I cannot reproduce this error
on my machine, could you please try this patch?

https://lore.kernel.org/linux-ext4/20250715031203.2966086-1-yi.zhang@huaw=
eicloud.com/

Thanks,
Yi.

>=20
> In file included from <command-line>:
> fs/ext4/inode.c: In function 'ext4_set_inode_mapping_order':
> include/linux/compiler_types.h:568:45: error: call to '__compiletime_as=
sert_652' declared with attribute error: min(({ __auto_type __UNIQUE_ID_x=
_647 =3D (((0 ? 4 : 6) * 2 - 1)); __auto_type __UNIQUE_ID_y_648 =3D (((16=
 + __pte_index_size)-16)); do { __attribute__((__noreturn__)) extern void=
 __compiletime_assert_649(void) __attribute__((__error__("min""(""((0 ? 4=
 : 6) * 2 - 1)"", ""((16 + __pte_index_size)-16)"") signedness error")));=
 if (!(!(!(((((typeof(__UNIQUE_ID_x_647))(-1)) < ( typeof(__UNIQUE_ID_x_6=
47))1) ? (2 + (__builtin_constant_p((long long)(__UNIQUE_ID_x_647) >=3D 0=
) && ((long long)(__UNIQUE_ID_x_647) >=3D 0))) : (1 + 2 * (sizeof(__UNIQU=
E_ID_x_647) < 4))) & ((((typeof(__UNIQUE_ID_y_648))(-1)) < ( typeof(__UNI=
QUE_ID_y_648))1) ? (2 + (__builtin_constant_p((long long)(__UNIQUE_ID_y_6=
48) >=3D 0) && ((long long)(__UNIQUE_ID_y_648) >=3D 0))) : (1 + 2 * (size=
of(__UNIQUE_ID_y_648) < 4))))))) __compiletime_assert_649(); } while (0);=
 ((__UNIQUE_ID_x_647) < (__UNIQUE_ID_y_648) ? (__UNIQUE_ID_x_647) : (__UN=
IQUE_ID_y_648)); }), (11 + (inode)->i_blkbits - 16)) signedness error
>   568 |         _compiletime_assert(condition, msg, __compiletime_asser=
t_, __COUNTER__)
>       |                                             ^
> include/linux/compiler_types.h:549:25: note: in definition of macro '__=
compiletime_assert'
>   549 |                         prefix ## suffix();                    =
         \
>       |                         ^~~~~~
> include/linux/compiler_types.h:568:9: note: in expansion of macro '_com=
piletime_assert'
>   568 |         _compiletime_assert(condition, msg, __compiletime_asser=
t_, __COUNTER__)
>       |         ^~~~~~~~~~~~~~~~~~~
> include/linux/build_bug.h:39:37: note: in expansion of macro 'compileti=
me_assert'
>    39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond),=
 msg)
>       |                                     ^~~~~~~~~~~~~~~~~~
> include/linux/minmax.h:93:9: note: in expansion of macro 'BUILD_BUG_ON_=
MSG'
>    93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
>       |         ^~~~~~~~~~~~~~~~
> include/linux/minmax.h:98:9: note: in expansion of macro '__careful_cmp=
_once'
>    98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_=
ID(y_))
>       |         ^~~~~~~~~~~~~~~~~~
> include/linux/minmax.h:105:25: note: in expansion of macro '__careful_c=
mp'
>   105 | #define min(x, y)       __careful_cmp(min, x, y)
>       |                         ^~~~~~~~~~~~~
> fs/ext4/inode.c:5204:17: note: in expansion of macro 'min'
>  5204 |                 min(MAX_PAGECACHE_ORDER, (11 + (i)->i_blkbits -=
 PAGE_SHIFT))
>       |                 ^~~
> fs/ext4/inode.c:5211:39: note: in expansion of macro 'EXT4_MAX_PAGECACH=
E_ORDER'
>  5211 |                                       EXT4_MAX_PAGECACHE_ORDER(=
inode));
>       |                                       ^~~~~~~~~~~~~~~~~~~~~~~~
>=20
> Caused by commit
>=20
>   e14bef2a00b5 ("ext4: limit the maximum folio order")
>=20
> I have used the ext4 tree from next-20250714 for today.
>=20


