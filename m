Return-Path: <linux-next+bounces-7418-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E51AFDE2C
	for <lists+linux-next@lfdr.de>; Wed,  9 Jul 2025 05:34:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 35E677B5AA2
	for <lists+linux-next@lfdr.de>; Wed,  9 Jul 2025 03:33:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59C521F4E57;
	Wed,  9 Jul 2025 03:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="bkGrg0CD"
X-Original-To: linux-next@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE5E1DE2C2;
	Wed,  9 Jul 2025 03:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752032076; cv=none; b=c7yfX7/30se7Zc+FwgEo/acH7WQRlhD+6KomS8oHfe8WTkUecirR2jP/eNSUHqdKf2j+cFz/hH1d81Fd7omiBmh1bst9sWnLf7qs0qMqdb/Ikd+rCAw0oWetvGRN2ZToJheQB954AOHSguT2JxpkMTGVywM0suBwxSRihmZMp3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752032076; c=relaxed/simple;
	bh=I6/We2z667A27eGP1fJ6o7Y4Uu4ZgATsGjw+0Ya9zig=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C9f8mQ6oMMOAOjzsYUuGer/5DRMVqGegAPrQxuyFEZeP0M/qI1b4Kf0DMrqFmgOy0/y5QFxVmjIiG+VVHvxzCKzUXTchP0IKRNUC05W/VTV6myMx303hHOjXEhiddOkNxg4Ib/vIsAbgiP9DN6dqvrzYgpaY6P+IUTQ+kk94TGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=bkGrg0CD; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=dYA2Qk0cM4XB2ctDDC4DjnXUudvvJf6f5ybueqVaFek=; b=bkGrg0CDoCTfpX8QY4W9f4z1S/
	xJJe/0YLaeI4mj2Mv4vX+CkInSHOqVY9z1dSRKLMyrCm9FgL9vyY8ZiaV1FX5g1J12ZKlNA3JrL70
	irV0KjpvnskyS1QvwDAAZ1MuMg4Z5q1DedA0jeTCf0WezxnTrodoYGd440hQaXFjn96Jt6PNj63tj
	ej/lJTsVWczBzEclcl0dMI4g5xNJayKxkqVQQBBAGnIWz4/MKWL64XNaKrbg6YzWnKSo7FPY5w1D1
	CnJxTZa+63OYkN5IEizG/2eBjhs4nncU0WpNp5QQLqzA6JVkkOkUUdYrGsth0F9YbLi2glEsKDWl1
	FSCurX6Q==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZLZm-00000002GpA-2oYJ;
	Wed, 09 Jul 2025 03:34:30 +0000
Message-ID: <b08f2b33-299a-4808-8e3f-d6d34cf4fc9c@infradead.org>
Date: Tue, 8 Jul 2025 20:34:27 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Jul 8
 [drivers/platform/x86/lenovo/lenovo-wmi-gamezone.ko]
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:AMD HETERO CORE HARDWARE FEEDBACK DRIVER"
 <platform-driver-x86@vger.kernel.org>,
 "Derek J. Clark" <derekjohn.clark@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20250708201124.25e87f2a@canb.auug.org.au>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250708201124.25e87f2a@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/8/25 3:11 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20250704:
> 


on i386 or x86_64:

ERROR: modpost: "devm_lwmi_om_register_notifier" [drivers/platform/x86/lenovo/lenovo-wmi-gamezone.ko] undefined!

CONFIG_LENOVO_WMI_EVENTS=m
CONFIG_LENOVO_WMI_HELPERS=m
CONFIG_LENOVO_WMI_GAMEZONE=m
# CONFIG_LENOVO_WMI_TUNING is not set

or
CONFIG_LENOVO_WMI_EVENTS=y
CONFIG_LENOVO_WMI_HELPERS=y
CONFIG_LENOVO_WMI_GAMEZONE=y
# CONFIG_LENOVO_WMI_TUNING is not set


-- 
~Randy


