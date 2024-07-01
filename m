Return-Path: <linux-next+bounces-2755-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D05A391DB0F
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 11:08:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D0A51C20E83
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 09:08:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4118184DE9;
	Mon,  1 Jul 2024 09:07:56 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388DD84A39;
	Mon,  1 Jul 2024 09:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719824876; cv=none; b=r+rQEsx0dsPGJwjRmrAztG3AN/Jmu+WZjEV48CiZq1YAVxLj4UHPrWb+ZGENdGoPhUKdqoh45VQqf1QBtLnXNtqnsqWUDBMpbzjFKfdZhEN2hjLlsqkd8priJfaykUeaMzivob/JEqhukrsupQBMqNkz9iH+dC1N4KaBazp5juw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719824876; c=relaxed/simple;
	bh=/IZXXZjOvtVc39q90mZgzNzvaY6DYnsWnylw+vN7b1w=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HydnpOlufiltsI3KqbQrpMgRlUutolK/HOnqGtCS4+53y0ENNCqZzI8bDrL7eycjPf9FRU6Vz30jM6T8bxZV6Fu4WTa8UddmW33l2g3IcZbxZvs7cdLAP09mIRT7J7EhqZD9uUMk2q4dGqemtjJCB89AYfRgITtDf+AM4wNm9cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WCKs56HCCz6K9TP;
	Mon,  1 Jul 2024 17:06:01 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id D17FC1400D1;
	Mon,  1 Jul 2024 17:07:51 +0800 (CST)
Received: from localhost (10.203.174.77) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 1 Jul
 2024 10:07:51 +0100
Date: Mon, 1 Jul 2024 10:07:50 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
CC: Yury Norov <yury.norov@gmail.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, James Morse
	<james.morse@arm.com>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, Linux Next Mailing List
	<linux-next@vger.kernel.org>, "Russell King (Oracle)"
	<rmk+kernel@armlinux.org.uk>
Subject: Re: linux-next: manual merge of the bitmap tree with the arm64 tree
Message-ID: <20240701100750.00002b8e@Huawei.com>
In-Reply-To: <20240701175051.0ef5d901@canb.auug.org.au>
References: <20240701175051.0ef5d901@canb.auug.org.au>
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
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
 lhrpeml500005.china.huawei.com (7.191.163.240)

On Mon, 1 Jul 2024 17:50:51 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the bitmap tree got a conflict in:
> 
>   include/linux/cpumask.h
> 
> between commit:
> 
>   4e1a7df45480 ("cpumask: Add enabled cpumask for present CPUs that can be brought online")
> 
> from the arm64 tree and commit:
> 
>   5c563ee90a22 ("cpumask: introduce assign_cpu() macro")
> 
> from the bitmap tree.
> 
> I fixed it up (I just did the obvious - see below) and can carry the
> fix as necessary. This is now fixed as far as linux-next is concerned,
> but any non trivial conflicts should be mentioned to your upstream
> maintainer when your tree is submitted for merging.  You may also want
> to consider cooperating with the maintainer of the conflicting tree to
> minimise any particularly complex conflicts.
> 

Thanks Stephen,

We can make a similar change to the others in 
 5c563ee90a22 ("cpumask: introduce assign_cpu() macro")
but to avoid merge complexity probably easier to just do it next cycle.

Jonathan



