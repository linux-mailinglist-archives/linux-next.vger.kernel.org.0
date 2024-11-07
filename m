Return-Path: <linux-next+bounces-4666-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BEA9C05AC
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 13:25:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B8B12843AF
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 12:25:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A8F71F4280;
	Thu,  7 Nov 2024 12:25:08 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBD51DED5A;
	Thu,  7 Nov 2024 12:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730982308; cv=none; b=EWyhU0YBaT4H1axF/Luc/lH77Mceqj1BhcnbeKnGz9IYS8QBpHOjpzBPK2Ki1Ba1KiYyoYQWdKRaZhXKzZkDXlES13g/Sq1hCAuX/p2lcxK6YTMm7F1PH+3ZIkoHXk3LnPe9QPyjLXReT2ZbEtxzZWBmnllk5/v1ITg84ZkMwPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730982308; c=relaxed/simple;
	bh=6BVY3AmZ9aHstGPTxSgy0ZTLPouzM9rFndzOEzLLkto=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m5PGhpph6J0ZAGJD2YD5uYyGZX2UNRKiz/xqYuAfItOuBnsi+wO6bU47sVTReqE1gRk1v/hSH/XXGPCn6Pp2ODo/cYp95ix0zazvxjpSlX7pLR27Vf6+mi0/bKQtf08KAf3JvZiatlYsuH6HtT8HcOo4LvHACAfXYZPWxzS++s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Xkh961WhHz6LD63;
	Thu,  7 Nov 2024 20:24:58 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 1E981140CF4;
	Thu,  7 Nov 2024 20:25:02 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 7 Nov
 2024 13:25:01 +0100
Date: Thu, 7 Nov 2024 12:25:00 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Jonathan Corbet
	<corbet@lwn.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the iio tree
Message-ID: <20241107122500.00004628@Huawei.com>
In-Reply-To: <20241107224012.2981aa90@canb.auug.org.au>
References: <20241107224012.2981aa90@canb.auug.org.au>
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
X-ClientProxiedBy: lhrpeml100003.china.huawei.com (7.191.160.210) To
 frapeml500008.china.huawei.com (7.182.85.71)

On Thu, 7 Nov 2024 22:40:12 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the iio tree, today's linux-next build (htmldocs) produced
> this warning:
> 
> include/linux/iio/iio.h:628: warning: Function parameter or struct member '__private' not described in 'iio_dev'
> include/linux/iio/iio.h:628: warning: Excess struct member 'priv' description in 'iio_dev'
> 
> Introduced by commit
> 
>   9a5a2483bc60 ("iio: Mark iio_dev::priv member with __private")
> 

I guess we need to teach the kernel-doc script about __private.
May be just a case of doing the same as done for __aligned, __packed etc.

Also curious why I've not seen warnings in the past about the masklength field
in the same structure.  I guess the test coverage has improved (or I missed
the reports!).

 So a 
   $members =~ s/\s*__private\s*\([^;]*\)/ /gos;

about here:
https://elixir.free-electrons.com/linux/v6.11.6/source/scripts/kernel-doc#L1148

Jon, does that make sense to you?  

Completely untested as I'm on wrong computer at the moment and my approach
to these scripts is cut and paste a similar smelling line until it works ;)

Jonathan





