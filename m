Return-Path: <linux-next+bounces-7562-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E2CB06B3F
	for <lists+linux-next@lfdr.de>; Wed, 16 Jul 2025 03:43:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 82E847B0F92
	for <lists+linux-next@lfdr.de>; Wed, 16 Jul 2025 01:41:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FF87267387;
	Wed, 16 Jul 2025 01:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="L3iS0V2y"
X-Original-To: linux-next@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B67D265629;
	Wed, 16 Jul 2025 01:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752630175; cv=none; b=ctpJVuIOENl39oO2ywQUanjo7Sucp9oAgTJUQYFg7Qi/CMIZHzAts0JeQdo572Dpn4pfMPPriuxZLB5NBUdG2+noMvpt8wO7/WuwI3Zc5p/o34NfES03noyFapxW8+27LuftXQ+ou9rQjpbj8eQO1/RZk3AVC548irfa6gr9SDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752630175; c=relaxed/simple;
	bh=8jrHdDLCectCc7kxbgsKtZpe5CPY6lgHKHvUPyjcm5I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LNxLLqI6zV84wuxzGbJwzaxmIsbZ504b9YCyDaL7pfzyuDNN1Pg3fQlOkw1K6f+UFdnpNEYBIyJs7d4z8Zu5Vp/0VcOpaXBvvg83G6XaJJtbL6gh7h2lV66Ac4KQKlJ8Q1wqQJ1r8VE6I6vQz51LCquiPm+k5z98uqaMDxuQlHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=L3iS0V2y; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=cI3lXGmPd9uRkmTEC2w5W2FpAay+HKfJYaInML9LnuY=; b=L3iS0V2y/9FTcesSq4n0t0CB5O
	zffU6qOcpz45pUuTy7Be+ozN0lEHAGvswR7AL+zrObVoZFsGiMpdCQ6biplpsDnObiNNJg+uTsVOw
	yJ7Cjwllae17ngFt4HMwbnnnfvjYBzbDJgmJJzDWkNR6YQGiA81PR6NDPTbWIv28cYaeSGxuhQ0j5
	mDwbozx0dxBgzcvBueP79qPSnr/k0JQtn9BH3rpW3AeIYNbFkh2auOP3v2Wvv6xRmfDr9tccW60nR
	fPydgonhorUPxdfP32N+HJQnqDCT+3clTjXWPdzRmYzVIEa4qw0nPnb9s6zNEWYMNQteTUStH/MpO
	U6cbeZzw==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubrAa-00000006Yoc-3mfY;
	Wed, 16 Jul 2025 01:42:52 +0000
Message-ID: <cdf4ee46-7bf8-4379-9245-fed9db72e7e8@infradead.org>
Date: Tue, 15 Jul 2025 18:42:52 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Jul 15
 (drivers/tty/serial/8250/8250_ce4100.c)
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-serial@vger.kernel.org,
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>
References: <20250715204504.36f41a8e@canb.auug.org.au>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250715204504.36f41a8e@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/15/25 3:45 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20250714:
> 

on i386, when
CONFIG_X86_INTEL_CE=y
# CONFIG_SERIAL_8250 is not set


../drivers/tty/serial/8250/8250_ce4100.c:90:13: error: redefinition of 'sdv_serial_fixup'
   90 | void __init sdv_serial_fixup(void)
      |             ^~~~~~~~~~~~~~~~
In file included from ../drivers/tty/serial/8250/8250_ce4100.c:12:
../arch/x86/include/asm/ce4100.h:10:20: note: previous definition of 'sdv_serial_fixup' with type 'void(void)'
   10 | static inline void sdv_serial_fixup(void) {};
      |                    ^~~~~~~~~~~~~~~~


-- 
~Randy


