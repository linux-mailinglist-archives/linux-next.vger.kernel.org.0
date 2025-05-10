Return-Path: <linux-next+bounces-6656-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 589D0AB20CB
	for <lists+linux-next@lfdr.de>; Sat, 10 May 2025 03:36:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B96C04A807C
	for <lists+linux-next@lfdr.de>; Sat, 10 May 2025 01:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 828AE23A9BE;
	Sat, 10 May 2025 01:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="L+npKzXq"
X-Original-To: linux-next@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FCAF1EB5E3;
	Sat, 10 May 2025 01:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746840960; cv=none; b=LYvodlLnt0fMXBGrOBVwDEQ9492SwnIYUmkVy2iWSg8RvaCN8k1/MjW65Cp1G95pr5JKGSsGOYQ8Q6CZjM/NQ8GPMpix20AJObRjejNq2s1u/a4S7YdoVBpVcCLPmYL6ergjypxNgrQDZLpgUZn/3fsj4dT2+IQ5MIu1+EWQ4Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746840960; c=relaxed/simple;
	bh=XqMD8wNZrmoCiV2gzLvREdKhFywTyDuGBIYB3XlhsBU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=erJgXj5tuuL3F2QDJqgjyQr5VJSwqYeguoUJeKADFA5zZ6/2ArRcbuWy4ZsFJENyRqphkOhYVjibUihL1JkKHeHj334i+OOwhzgXtlFNumGuOqYDF+DtCk5QADGXNy1rQUGatFcwiB9wdzUvHPoiBhTkcwwj476AGzrmcCZAaoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=L+npKzXq; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=8/WILxu11hrOlxr88vOwZbwA0FfG3mAKSy1H5uSBCnM=; b=L+npKzXqIRQEg1MUKnO3kslVK7
	Q0CfjlpQO1Dmestmcm5OPbglFlMlaFHkgxAwANl4qE/OqRDAh7NJu6BU2nm4/4FVZ0jaHEk2ec8rT
	qpS4CVyRWTEAorXmC3sCTPE+7Y59LbUrJ0wPn0BiyKsSX+pF2qe7ROtCvmO/sleNpkvPacdZGRKJt
	nnDp0yB2mLxVVAs85MYuqLGBZlORrVseR8dDyprhVhTJpvNaNYlbaB/VDBJgPkFi0kMrLcbrew5Qa
	8LgOyRxZj2DUNyxLJ2p686xTUXHl7o0H5QcfyC5QsYFPxdcvYlHTinKsT44o3a01FtpMT9Yr62125
	UxaPOfkw==;
Received: from [50.39.124.201] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uDZ7w-0000000GOZf-2NXu;
	Sat, 10 May 2025 01:35:46 +0000
Message-ID: <a1d9134f-0567-4a53-a1e7-a55cd6b189a9@infradead.org>
Date: Fri, 9 May 2025 18:35:29 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for May 9
 (drivers/platform/x86/tuxedo/nb04/wmi_ab.o)
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Werner Sembach <wse@tuxedocomputers.com>,
 platform-driver-x86@vger.kernel.org,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20250509195816.7f0a67a3@canb.auug.org.au>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250509195816.7f0a67a3@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/9/25 2:58 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20250508:
> 

When CONFIG_HID is not set:

ld: drivers/platform/x86/tuxedo/nb04/wmi_ab.o: in function `tux_remove':
wmi_ab.c:(.text+0x29): undefined reference to `hid_destroy_device'
ld: drivers/platform/x86/tuxedo/nb04/wmi_ab.o: in function `tux_probe':
wmi_ab.c:(.text+0x6a): undefined reference to `hid_allocate_device'
ld: wmi_ab.c:(.text+0xbc): undefined reference to `hid_add_device'
ld: wmi_ab.c:(.text+0xf3): undefined reference to `hid_destroy_device'
ld: drivers/platform/x86/tuxedo/nb04/wmi_ab.o: in function `tux_ll_parse':
wmi_ab.c:(.text+0x46e): undefined reference to `hid_parse_report'

When CONFIG_ACPI or CONFIG_ACPI_WMI is not set:

ld: drivers/platform/x86/tuxedo/nb04/wmi_ab.o: in function `tuxedo_nb04_wmi_tux_init':
wmi_ab.c:(.init.text+0x20): undefined reference to `__wmi_driver_register'
ld: drivers/platform/x86/tuxedo/nb04/wmi_ab.o: in function `tuxedo_nb04_wmi_tux_exit':
wmi_ab.c:(.exit.text+0x9): undefined reference to `wmi_driver_unregister'
ld: drivers/platform/x86/tuxedo/nb04/wmi_util.o: in function `__wmi_method_buffer_out.constprop.0':
wmi_util.c:(.text+0x3a): undefined reference to `wmidev_evaluate_method'



-- 
~Randy


