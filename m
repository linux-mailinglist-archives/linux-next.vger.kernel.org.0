Return-Path: <linux-next+bounces-6713-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AEBAB47D3
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 01:18:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B17FE8C3876
	for <lists+linux-next@lfdr.de>; Mon, 12 May 2025 23:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3284258CFC;
	Mon, 12 May 2025 23:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="U1cLe2Bm"
X-Original-To: linux-next@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A84512DD95;
	Mon, 12 May 2025 23:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747091915; cv=none; b=eKneUhFcsoBPuEGZvDssBxRfAd4iEv300R3QqmyhfMFvu5G7vVy5qJAJgrVDrAZWfA3gD9PoAygG5xGceiX85eaRT9dGYrq1XgO+/WbojiCZqQnqd8BqlUhGnMQBoZ4Mn8Cykrx4ruWLiJ80uHuETP9A6YZ4ZMR557doec9kmF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747091915; c=relaxed/simple;
	bh=55ZQCHRX9RURja9PPKvXr1sLLsEHoGU9L+Rqvc9U65c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cVU2nHWA+wcmAKRltQaVVjc8ElRRMq99+IxpEO7gMfxrAjConcvD0Lmt3tbuxHIY6HdcS0edaF759i0ETSZr2zxwXIiWFUUhLr2BoIRYyc4MYAJ6q6m9VoKMMclp/qxk2iczI//C6LIvxg58ible9FQj/zyD0J8LYJLADmnOjrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=U1cLe2Bm; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=SuA1oqc9N0BseUbUo7E4Thlp5QMwEC6vzTX2bMf7DYI=; b=U1cLe2Bm79TO9um+XmZZLn5GSt
	6THAQESVkIpMcgysPTdZjllxB/FZl3hubKPkVjhnosOOZzepymjDiL4zoEa+jbATBP2vDMcdDwy7Q
	szuaVbOwiaPQ2d80RnsxeKVyC5A3cjWfEYPTRLVEJkeGHm9DELV5gmzfmwz96DbC+wvCw5dzhRjAb
	RjYqZ+80tLHRq6p4OPbDHUK5O39XX5K7ZNPlWMGwGWMYcuOLMGoNGNR4O9XzNIVoP4vlVicz3xsQn
	zds6zygqXpw7PLBMQGjPW7/8XcKHU3x8ZsnNylkgEr2tTZLptJquQQlu/qu1rI0jFrxkUuHhKE8YL
	zUkPHHtQ==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEcPj-0000000AKsd-0sSh;
	Mon, 12 May 2025 23:18:28 +0000
Message-ID: <c79d60b3-3029-41ed-bde3-55acd2341da1@infradead.org>
Date: Mon, 12 May 2025 16:18:23 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86/tuxedo: Prevent invalid Kconfig state
To: Werner Sembach <wse@tuxedocomputers.com>, sfr@canb.auug.org.au,
 linux-next@vger.kernel.org, W_Armin@gmx.de,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250512125450.31072-1-wse@tuxedocomputers.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250512125450.31072-1-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/12/25 5:54 AM, Werner Sembach wrote:
> It was possible to create a uncompileable config, because of missing
> "Depends on" statements in the new Kconfig of the TUXEDO platform driver.
> 
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Closes: https://lore.kernel.org/all/a1d9134f-0567-4a53-a1e7-a55cd6b189a9@infradead.org/

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.


> ---
>  drivers/platform/x86/tuxedo/nb04/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/platform/x86/tuxedo/nb04/Kconfig b/drivers/platform/x86/tuxedo/nb04/Kconfig
> index 411c46c9a1cf0..9e7a9f9230d1c 100644
> --- a/drivers/platform/x86/tuxedo/nb04/Kconfig
> +++ b/drivers/platform/x86/tuxedo/nb04/Kconfig
> @@ -7,6 +7,8 @@
>  
>  config TUXEDO_NB04_WMI_AB
>  	tristate "TUXEDO NB04 WMI AB Platform Driver"
> +	depends on ACPI_WMI
> +	depends on HID
>  	help
>  	  This driver implements the WMI AB device found on TUXEDO notebooks
>  	  with board vendor NB04. This enables keyboard backlight control via a

-- 
~Randy

