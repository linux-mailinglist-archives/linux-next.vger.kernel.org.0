Return-Path: <linux-next+bounces-7496-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 50312B026D4
	for <lists+linux-next@lfdr.de>; Sat, 12 Jul 2025 00:13:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 609C01CA7CBE
	for <lists+linux-next@lfdr.de>; Fri, 11 Jul 2025 22:13:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF9AC220698;
	Fri, 11 Jul 2025 22:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="eY7Nc23L"
X-Original-To: linux-next@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F181621E0BA;
	Fri, 11 Jul 2025 22:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752271979; cv=none; b=eD/XhogcIsgAAZhl+hHa/2SWsQSklWlXbD6THMEUiqdd/j2HoPKoC0+fdqR+i8jzAfepYO18DbJrRNwppkUGxRFae8RccqchJqRzaHOfzSoCIbzyXn8XLnH8NfpRgGk5UTrq4bViNaORkz23MP6hayhnH7JWW0Ny1jqdX3etx08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752271979; c=relaxed/simple;
	bh=SH1hT2BdZTLCljhfAoe4DjRGA0IxsqRiFeQ0moHmdR0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QQ1pdSKZl0AOgaHKxLBSKJI0MGVt9FMjx2OeKux5L8MHbX1teKHhhuffwsbVovr4CxBmi9a7jC6CqzyRWtJ7d1Y5iFSipN9lVKyhPjV0SglG3hdAvAm5/nouqECo81Y7CWhiGt+bGOB4KTs69tqzHSNgTfmGwqDeCyQOnBXGRyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=eY7Nc23L; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=cA89VBNrB6GjbQ3qCWib8lcT9Z2OuEVMWLg33JleEDs=; b=eY7Nc23Lx+NRDgMT3dbj3D32VN
	5iVDtQUrp/O6ivrRYhcsY3Za9kU7CssN3SD1N7s9BXCWKRRMp6bvyHZJOIy/OSDbpVeyLgbKwVZf0
	s1T7Y6W67WFZyXkF8OeAd3981/tjKUjiUhB4KzoESNitcJgEKkXn6yPQjpL8uGg+uZHuPp4+G4Jh5
	acWNsfuwSQQtuUgf1djdnhEbIwSsKxqGZp/OWkcrNb24YyVuTGqLt7nRpOI3n3dYzqQpggCyimJTz
	zgJHMZ1WwkTQchytYlPNzMr5+PKYdnjH2BkSt8Z8eJIYVXAtoLZhZO+Mpl2Ad08p5O4nQcYSbQZFL
	i0NXfVnQ==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaLzB-0000000EbTa-3QPV;
	Fri, 11 Jul 2025 22:12:54 +0000
Message-ID: <a1745a9b-d0a6-4c72-9096-6f9d15274b9a@infradead.org>
Date: Fri, 11 Jul 2025 15:12:46 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Jul 11
 (drivers/platform/x86/lenovo/wmi-gamezone.o)
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 platform-driver-x86@vger.kernel.org,
 "Derek J. Clark" <derekjohn.clark@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20250711191014.12a64210@canb.auug.org.au>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250711191014.12a64210@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/11/25 2:10 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20250710:
> 

on i386, when
CONFIG_LENOVO_WMI_EVENTS=y
CONFIG_LENOVO_WMI_HELPERS=y
CONFIG_LENOVO_WMI_GAMEZONE=y
# CONFIG_LENOVO_WMI_TUNING is not set

ld: drivers/platform/x86/lenovo/wmi-gamezone.o: in function `lwmi_gz_probe':
wmi-gamezone.c:(.text+0x63c): undefined reference to `devm_lwmi_om_register_notifier'

Adding
+	select LENOVO_WMI_TUNING
for config LENOVO_WMI_GAMEZONE fixes the build error.
Is that the right fix?
If so, please go ahead with it.


-- 
~Randy


