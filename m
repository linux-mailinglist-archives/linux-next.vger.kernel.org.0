Return-Path: <linux-next+bounces-4243-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EAACB99A04D
	for <lists+linux-next@lfdr.de>; Fri, 11 Oct 2024 11:42:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8EC251F22D23
	for <lists+linux-next@lfdr.de>; Fri, 11 Oct 2024 09:42:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22B3720CCD0;
	Fri, 11 Oct 2024 09:42:39 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7FF19413B;
	Fri, 11 Oct 2024 09:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728639759; cv=none; b=oldONrGTnD7Z9ykteVmBSo6PbnXq538X5aksYk2eEKKFl4quQxKjpDDDw93iujEJEmR8VmejdXFDqR+yslmQySk37BVLU2Gp9XDLfpZLHfNoNr20LuqqyWNOrLOtkRC27KhsR9dGOMH6ioV+SOFMl2cyYEQoWDv8ADX5S17eNpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728639759; c=relaxed/simple;
	bh=/a+9b5ouLrp1o+mJiuqLbe+ifCCr4IT5ucpHB+gPjsM=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qanbhuuqCypPH6DgUHJ/CJJTKc54YzQp4H2iKtum5T6ajKWuf+m809yal6bIA1FQdLEBuZlVVfUL2OmEIqMCF6lqUV1UIg3xMs4rUhZ43WgVz6L2GylrPzuZd0oR4j3xWF3vCF7RrDAoKoOn2XGiR5v8qQdBVCnQrzfTIWzoOvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XQ1qk6BXrz6K9N5;
	Fri, 11 Oct 2024 17:42:10 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id ED8A014010C;
	Fri, 11 Oct 2024 17:42:33 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 11 Oct
 2024 11:42:33 +0200
Date: Fri, 11 Oct 2024 10:42:32 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
CC: Abhash Jha <abhashkumarjha123@gmail.com>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, Linux Next Mailing List
	<linux-next@vger.kernel.org>, <gregkh@linuxfoundation.org>
Subject: Re: linux-next: build failure after merge of the iio tree
Message-ID: <20241011104232.000042a9@Huawei.com>
In-Reply-To: <20241011154241.511878bd@canb.auug.org.au>
References: <20241011154241.511878bd@canb.auug.org.au>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml100006.china.huawei.com (7.191.160.224) To
 frapeml500008.china.huawei.com (7.182.85.71)

On Fri, 11 Oct 2024 15:42:41 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
>
Thanks Stephen,

I'll call these out (I think we have 3 of them now) when I send Greg a pull request as
probably best place to tidy this up is when merging into char-misc which has
merged rc2 with Al's patch.

Greg, let me know if you'd rather I handled these in the iio tree
(probably a merge of rc2 as I'd rather not rebase)

Jonathan


> After merging the iio tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> drivers/iio/dac/ad5770r.c:20:10: fatal error: asm/unaligned.h: No such file or directory
>    20 | #include <asm/unaligned.h>
>       |          ^~~~~~~~~~~~~~~~~
> drivers/iio/adc/max1363.c:37:10: fatal error: asm/unaligned.h: No such file or directory
>    37 | #include <asm/unaligned.h>
>       |          ^~~~~~~~~~~~~~~~~
> 
> Caused by commits
> 
>   c2c4826cfa46 ("iio: adc: max1363: Convert to get_unaligned_be16")
>   0f87813bc338 ("iio: dac: ad5770r: Convert to get_unaligned_le16")
> 
> interacting with commit
> 
>   5f60d5f6bbc1 ("move asm/unaligned.h to linux/unaligned.h")
> 
> from Linus' tree (in v6.12-rc2).
> 
> I have applied the following merge fix patch.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 11 Oct 2024 15:35:57 +1100
> Subject: [PATCH] fix up for asm/unaligned inclusions in ad5770r.c and max1363.c
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/iio/adc/max1363.c | 2 +-
>  drivers/iio/dac/ad5770r.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iio/adc/max1363.c b/drivers/iio/adc/max1363.c
> index d59cd638db96..d065b1ade95a 100644
> --- a/drivers/iio/adc/max1363.c
> +++ b/drivers/iio/adc/max1363.c
> @@ -34,7 +34,7 @@
>  #include <linux/iio/trigger_consumer.h>
>  #include <linux/iio/triggered_buffer.h>
>  
> -#include <asm/unaligned.h>
> +#include <linux/unaligned.h>
>  
>  #define MAX1363_SETUP_BYTE(a) ((a) | 0x80)
>  
> diff --git a/drivers/iio/dac/ad5770r.c b/drivers/iio/dac/ad5770r.c
> index 12c98f3e62a5..7d7f5110d66a 100644
> --- a/drivers/iio/dac/ad5770r.c
> +++ b/drivers/iio/dac/ad5770r.c
> @@ -17,7 +17,7 @@
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/spi/spi.h>
> -#include <asm/unaligned.h>
> +#include <linux/unaligned.h>
>  
>  #define ADI_SPI_IF_CONFIG_A		0x00
>  #define ADI_SPI_IF_CONFIG_B		0x01


