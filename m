Return-Path: <linux-next+bounces-2453-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 142B88D7D53
	for <lists+linux-next@lfdr.de>; Mon,  3 Jun 2024 10:27:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4581B1C21AF7
	for <lists+linux-next@lfdr.de>; Mon,  3 Jun 2024 08:27:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CEA8446CF;
	Mon,  3 Jun 2024 08:27:27 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8445821A;
	Mon,  3 Jun 2024 08:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717403247; cv=none; b=qaXgO0yKEur88hcKgu9a+qiJR2VOlk2am7Pvp84TpC7NYdu7rWNGoV3idnqdYQ0qzQP/HKBHHdkcyXfGRBD753HLdr3FSwlggGCszU1QCHEWbIrgSK/bAT7guB09IFcD648LS18yk7GZeA0/VFJAVgXWSi9KpnfmV921aO5v3o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717403247; c=relaxed/simple;
	bh=LdZfNJx5uwyImcha9l8MhIHsQjs0ln2WKhrjf5bSk+c=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TosmhV+R+uZZQwNkoUn3Na+37kiL75HFcmX8hbE/Kr9fQgyrCeHyCqNqMAp7LghtbOOF2YWHMHWtzc6j6v38rOaw46+tyBLjZEw6iyDfijbyi/m2tr2oi5IvLFJeTHmUzykNORizLg52eInZsm5cPjRvTXwYiU5eYNzSuXGr7Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Vt6DD6Xhqz67Hqp;
	Mon,  3 Jun 2024 16:22:52 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 007E4140B73;
	Mon,  3 Jun 2024 16:27:22 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 3 Jun
 2024 09:27:21 +0100
Date: Mon, 3 Jun 2024 09:27:22 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
CC: Dumitru Ceclan <dumitru.ceclan@analog.com>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, Linux Next Mailing List
	<linux-next@vger.kernel.org>, <jic23@kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the iio-fixes tree
Message-ID: <20240603092722.00007f33@Huawei.com>
In-Reply-To: <20240603082919.215c9b95@canb.auug.org.au>
References: <20240603082919.215c9b95@canb.auug.org.au>
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
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
 lhrpeml500005.china.huawei.com (7.191.163.240)

On Mon, 3 Jun 2024 08:44:48 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> In commits
> 
>   0c9b60531f77 ("iio: adc: ad7173: Fix sampling frequency setting")
>   8d0184667b32 ("iio: adc: ad7173: Clear append status bit")
> 
> Fixes tag
> 
>   Fixes: 8eb903272f75 ("iio: adc: ad7173: add AD7173 driver")
> 
> has these problem(s):
> 
>   - Target SHA1 does not exist
> 
> Maybe you meant
> 
> Fixes: 76a1e6a42802 ("iio: adc: ad7173: add AD7173 driver")
> 
Thanks. I'll fix.  I'm clearly getting sloppy with running a
test on that. :(

Sorry for the noise.

Jonathan


