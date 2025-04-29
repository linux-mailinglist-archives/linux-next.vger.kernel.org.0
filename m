Return-Path: <linux-next+bounces-6444-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F16ADAA3BEE
	for <lists+linux-next@lfdr.de>; Wed, 30 Apr 2025 01:09:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA9AC3A6EC0
	for <lists+linux-next@lfdr.de>; Tue, 29 Apr 2025 23:08:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35DD729E04F;
	Tue, 29 Apr 2025 23:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="icC5TCMl"
X-Original-To: linux-next@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9880913A3F7;
	Tue, 29 Apr 2025 23:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745968151; cv=none; b=mrUDfzQZg4hh9PHeWs4Hge9fCyVI/Ii5JsOInVR9uTnqqpZx5vCk+3XHYTqtFStmbPcDk8+vHzhccHXD8nFx6ovjZMe4sHVj5GUN5J0qcXewgVvY+0puS4TRErA2SxiTSlX/FLfT1aY1p1RaxQY4CZevVFjdEj7YUgeRFS7wYvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745968151; c=relaxed/simple;
	bh=dIRkIdP8Z44tW6zZHd8j3NQ9ye0+DYRrqgdRaCl21sc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dfkB5npuRmk6leLDqdxJcU6KWZKDI5mZsq3frvoqgDbHqybAtChMv7EBh3hfzyH5nZA11MRGZDI2CeQRJnfuSIS+i4APDID53fcMWMlWnZx4EFtGH/JEee2SNPLZBlFZs0Gtz/i2EfeeAyrLdDP/I8vku5pbSCyueh3I+JyDWH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=icC5TCMl; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=Zdw5sEyqpxaObOxyn99wwjf95ztYB6hERorXY44QetY=; b=icC5TCMlM1zR4wBE/pqMPoTOKR
	nOxfidUdlKfWIlO3AuZhvdFjXs/uuK5Z7GNnzR5AEqmUsT4xTwTlr5uk5Z5+gqqfyS5Bs4x8UboZs
	9H0qf9qjjTTLxAwfEKRzQjBpQG1a9vbuWftLWMfEWTq8Ospwsd7coOvRg2K77ozamK5W5LSQL94Vz
	mcAXV9Ce7KXtGKFSwdo+WH80UlsEVFi6jwQVT7WR0ab22BNigIDKiiikaJ3Q/6K9+CYR++M/9kbC6
	Jvn8tvVZI8y+1z0FcxFQZ+YxcwZLUlanruIW9+K/8vrZPviZRaM5MN/fcVIpxs8nTtXcUxWrcgZ5Z
	WwDc2qtw==;
Received: from [50.39.124.201] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9u4X-00000007qMN-2tia;
	Tue, 29 Apr 2025 23:09:06 +0000
Message-ID: <da98aa13-fc14-4bb5-9292-d784ad832a6e@infradead.org>
Date: Tue, 29 Apr 2025 16:09:02 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Apr 29 (drivers/gpu/drm/xe/xe_devcoredump.c)
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250429190259.1cc2d649@canb.auug.org.au>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250429190259.1cc2d649@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/29/25 2:02 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20250428:
> 

on i386:

ERROR: modpost: "__moddi3" [drivers/gpu/drm/xe/xe.ko] undefined!

due to
+       memcpy(buffer, ss->read.buffer +
+              (offset % XE_DEVCOREDUMP_CHUNK_MAX), byte_copied);

in commit c4a2e5f865b7 ("drm/xe: Add devcoredump chunking").

-- 
~Randy


