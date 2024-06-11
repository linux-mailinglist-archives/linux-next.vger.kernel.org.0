Return-Path: <linux-next+bounces-2512-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E449035B4
	for <lists+linux-next@lfdr.de>; Tue, 11 Jun 2024 10:20:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7C4A3B26FE7
	for <lists+linux-next@lfdr.de>; Tue, 11 Jun 2024 08:20:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F358173351;
	Tue, 11 Jun 2024 08:19:47 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252EA17334D;
	Tue, 11 Jun 2024 08:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718093987; cv=none; b=c0/F/5q3R2ckdxVo/pHlbfvXNSeYRF2CNkcdFxXn/NyDu83O3aekNkgwfwy9y4VHnoj0Bi0xB51tWksv0PXygfFnMnJA1IgEozONUbcWm0tcrFTy2P3b4EJ60EYuEIQyutON3lzhYlegg+6owS9gyD/w3iMf2V2PMzuUknFVcuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718093987; c=relaxed/simple;
	bh=/Jpq7EjOx9Ak4Ee2TneFpD6LvsLd6xd35TVUysLlRA4=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bgSA8dTivjxzgZmq2fJ/96J5c/dPx357fPLzIqEZ6wYuwkjKCgguFJ52rFe8GvW5X0fMNLav7Et3Cdza3mLLeoE6yZi7ITR7zEEn+mXw14MlzskWB6Q63ORaQ5SklKDfsFKrDdsAgAA1uOfiIfdpCVXb4p1HVISF+Cj2yPvFiE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Vz1gC3K2Yz67lZ9;
	Tue, 11 Jun 2024 16:14:47 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 48E9E140A70;
	Tue, 11 Jun 2024 16:19:41 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 11 Jun
 2024 09:19:40 +0100
Date: Tue, 11 Jun 2024 09:19:44 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
CC: Arnd Bergmann <arnd@arndb.de>, Ke Sun <sunke@kylinos.cn>, "Linux Kernel
 Mailing List" <linux-kernel@vger.kernel.org>, Linux Next Mailing List
	<linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the iio tree
Message-ID: <20240611091944.0000448a@Huawei.com>
In-Reply-To: <20240611151820.63a404bc@canb.auug.org.au>
References: <20240611151820.63a404bc@canb.auug.org.au>
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
X-ClientProxiedBy: lhrpeml500005.china.huawei.com (7.191.163.240) To
 lhrpeml500005.china.huawei.com (7.191.163.240)

On Tue, 11 Jun 2024 15:18:20 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> The following commits are also in the iio-fixes tree as different
> commits (but the same patches):
> 
>   f8a5217d06e2 ("iio: dac: ad9739a: drop COMPILE_TEST option")
> 
> This is commit
> 
>   75183e461ce0 ("iio: dac: fix ad9739a random config compile error")
> 
> in the iio-fixes tree.
> 

Thanks Stephen,

Indeed my mess up. I picked up Arnd's the wrong branch and then
failed to remember it when Ke Sun posted a similar fix.
I'll drop one of them and do a pull request for the fix in the next
few days (as I gather this one is particularly irritating for some
of the build testers on mainline).

Jonathan

