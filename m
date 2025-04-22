Return-Path: <linux-next+bounces-6338-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC84A97A7B
	for <lists+linux-next@lfdr.de>; Wed, 23 Apr 2025 00:28:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4BF5C189C700
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 22:28:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DC4B2C178E;
	Tue, 22 Apr 2025 22:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="O65t0fIJ"
X-Original-To: linux-next@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2B4156C6F;
	Tue, 22 Apr 2025 22:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745360921; cv=none; b=ASnnF78/Hr51i7JKQOSUYKHqjle8n4+y7K/8Lk+ydKHtaoCsWaZtpQv+2qLkpWHK1lgCAh9QdphUoCE64V+vinvndbKvCKCXzTawy0jyoUWTaXDwmMJDBXl8YKjvmWOnBeIwLe80MpAvgGfSFNi2ulGDYmvcFe/u+j/db1JlQHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745360921; c=relaxed/simple;
	bh=der7JpKJJmaUpxRSwhvx1Wmk0k4u10ch2sii9sVeMiA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DxkuvoxU0w+Nw1F7lQzI4/nMnBialYLnUjfZhbugFYO5fSJ+lUxofbf4AGdGIQTx87PGEb1qFUlGQ1vw3mQY8/n/tklsTw9JRxX7IGAjHS1XAr1EkVrFETcZ/S7ENfcphFA8VSUA/RQet3SYlTxsaBkV12D+G2aRFCc2ktaYHCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=O65t0fIJ; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=rG5awnvhV87WptheJdP0wXFl7KoJWhnrsJJsOy/MVCw=; b=O65t0fIJHg/1VTwzy6Iw+FNfpM
	OG+zIysnk8qbNfcVEwfIp/Bp7xkzai72iqr7Bv47OMGmJ46tM8DhuGEE0hHm5nKagFE4jKxPs3NDV
	kAEGsCxtFYWtaZehpsyTIkl60JoWURlZGEhvwFAWM/dAdwKzkR+Tkp6AkMij68i9dSHCTFejx020r
	6XO56NFxn/fM1Lh8muJhG7d8ruvOD8CcC2d/JpVB5HXxwnG4WcS0Cy0t7l2XlIBjfBuhGbHD3GMAS
	yrzm4Jg/xiBqaAOHBTW9hXprhKAhZlMczS99d40D5KBIvYZxoA5bl9SeJr8Frohtx7rKbo6JQ4jg1
	GYOEnjwA==;
Received: from [50.39.124.201] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7M6R-000000065o3-2aCK;
	Tue, 22 Apr 2025 22:28:31 +0000
Message-ID: <4a8ba1d0-d2d9-41f8-abf1-d45ec8996d10@infradead.org>
Date: Tue, 22 Apr 2025 15:28:27 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Apr 22 (drivers/eisa/)
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>
References: <20250422210315.067239d3@canb.auug.org.au>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250422210315.067239d3@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/22/25 4:03 AM, Stephen Rothwell wrote:
> Hi all,
> 
> News: there will be no linux-next release this coming Friday.
> 
> Changes since 20250417:
> 

on i386:

ld: vmlinux.a: member drivers/eisa/devlist.h in archive is not an object

on any .config file with CONFIG_EISA=y

-- 
~Randy


