Return-Path: <linux-next+bounces-5406-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA1AA2E946
	for <lists+linux-next@lfdr.de>; Mon, 10 Feb 2025 11:25:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88E61162F2F
	for <lists+linux-next@lfdr.de>; Mon, 10 Feb 2025 10:25:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 957D11E5729;
	Mon, 10 Feb 2025 10:23:02 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E560A1E5732;
	Mon, 10 Feb 2025 10:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739182982; cv=none; b=sYF7NSbx2Fq9Zevo/2narPpQynucwk42kFYxr7X42fr6wph4HD6V+z5ks5b4lyKosqKyeCMy3lLL5/kslRocQLz+7a1CkydET+nA+S1J6Ljnl5bZTLUr4gZ67a93k8G5CgK0N421hGVTCyAb6z/3jb4MBsClZ8Bs4zCwDRBXCGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739182982; c=relaxed/simple;
	bh=1AH1+qDGBe3izN60C7CJNQrPXyH8uryGwGB9HKh0fPI=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GYhTfXAtAt0MWYQHj9dV5JorZC+sTpeMoPxFKgVwyaZbJncvXlVpBzhXAGLwafUobbU4RyyKjWwPPWDtKo28Vd35u69o6+DCIIY75/TQzoeTq9hIfd/fVZD6YLHZtiuUPOn4wv24JNA4fPJE42ftCMHHyKJ/B9+RJS99JpZAZyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Ys0x222gZz6K9Hx;
	Mon, 10 Feb 2025 18:21:42 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id F14731402A4;
	Mon, 10 Feb 2025 18:22:51 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 10 Feb
 2025 11:22:51 +0100
Date: Mon, 10 Feb 2025 10:22:50 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
CC: Antoni Pokusinski <apokusinski01@gmail.com>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, Linux Next Mailing List
	<linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the iio tree
Message-ID: <20250210102250.00006bfc@huawei.com>
In-Reply-To: <20250209173446.19590956@canb.auug.org.au>
References: <20250209173446.19590956@canb.auug.org.au>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
 frapeml500008.china.huawei.com (7.182.85.71)

On Sun, 9 Feb 2025 17:34:46 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> In commit
> 
>   3e2a7cb538ec ("iio: magnetometer: si7210: fix magnetic field measurement scale")
> 
> Fixes tag
> 
>   Fixes: cb29542a178f ("iio: magnetometer: si7210: add driver for Si7210")
> 
> has these problem(s):
> 
>   - Target SHA1 does not exist
> 
> Maybe you meant
> 
> Fixes: e0f5349ba881 ("iio: magnetometer: si7210: add driver for Si7210")
> 

Sorry, I pushed an update to fix this to my testing branch (squashed the commit)
but failed to update the togreg branch I'd pushed out earlier in the day.

Will fix up when I'm next on the right computer.

Thanks,

Jonathan

