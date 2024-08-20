Return-Path: <linux-next+bounces-3365-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2F39581A2
	for <lists+linux-next@lfdr.de>; Tue, 20 Aug 2024 11:08:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3927D282DF2
	for <lists+linux-next@lfdr.de>; Tue, 20 Aug 2024 09:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E76DE18A943;
	Tue, 20 Aug 2024 09:08:50 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E271F4595B;
	Tue, 20 Aug 2024 09:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724144930; cv=none; b=EOjm9t1tI9yBNsLrAI31/DwihEhUU6s1eGtEyrxxDWjg6v4fYc/7DvNy7iVvlSrzZfh4lJt+f05F6y5k84X0x6Ze9AY/P6Pn+pn6mTRF6ZAO5ICo+vkBdhPlXhypE+qk54cu4o+/B15AoPn9VgUqRsLBmlGvy9QCtfc8JTt7/9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724144930; c=relaxed/simple;
	bh=qXv6xjsuk2N1/g2GprhMT4gTyu/by/C0RN+UuYIpBRw=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eIi8D4z6g+8Eo39vf76S7YIZFSdxww/ffVXynq2RwKTg1R6m+2t+o0OG1s3m7zay/rHZ/KtkNv83291QkQBabyTiK9yInRnWZkKPAJDlm7lqfjjy0tVcUANBDFqzi+rlkhexlyHmpJ62FjeAzykKkbvyjco6gem13T431hd/hhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Wp3Tc5p4lz6K8qR;
	Tue, 20 Aug 2024 17:05:40 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 039791400DB;
	Tue, 20 Aug 2024 17:08:45 +0800 (CST)
Received: from localhost (10.203.177.66) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 20 Aug
 2024 10:08:44 +0100
Date: Tue, 20 Aug 2024 10:08:43 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
CC: David Lechner <dlechner@baylibre.com>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, Linux Next Mailing List
	<linux-next@vger.kernel.org>, Andreas Klinger <ak@it-klinger.de>
Subject: Re: linux-next: build warning after merge of the iio tree
Message-ID: <20240820100843.00003b77@Huawei.com>
In-Reply-To: <20240820134739.50c771cb@canb.auug.org.au>
References: <20240820134739.50c771cb@canb.auug.org.au>
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
X-ClientProxiedBy: lhrpeml500001.china.huawei.com (7.191.163.213) To
 lhrpeml500005.china.huawei.com (7.191.163.240)

On Tue, 20 Aug 2024 13:47:39 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the iio tree, today's linux-next build (htmldocs) produced
> this warning:
> 
> Warning: /sys/bus/iio/devices/iio:deviceX/in_resistance_calibbias is defined 2 times:  Documentation/ABI/testing/sysfs-bus-iio-chemical-sgp40:18  Documentation/ABI/testing/sysfs-bus-iio:541
> 
> Introduced by commit
> 
>   0f718e10da81 ("iio: ABI: add missing calibbias attributes")
Thanks.

I think it's a case of just deleting the sgp40 version.
We will loose a bit of information, but I don't think it's critical
info to be worth a special chunk in the main docs.

Jonathan


> 


