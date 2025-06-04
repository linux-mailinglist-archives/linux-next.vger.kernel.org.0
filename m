Return-Path: <linux-next+bounces-7053-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 882DDACD7FC
	for <lists+linux-next@lfdr.de>; Wed,  4 Jun 2025 08:45:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 551C216D757
	for <lists+linux-next@lfdr.de>; Wed,  4 Jun 2025 06:45:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 770D61E7C08;
	Wed,  4 Jun 2025 06:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="eh/a/ukK"
X-Original-To: linux-next@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C282B9A9;
	Wed,  4 Jun 2025 06:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749019523; cv=none; b=IjNIvq+NmCRcl416H9byz41wZqH1T/rLDMJEvDOz1JnB5zdZ9hut3mXY81zu81pHDyPklqi4MFbs3Yw6vJtq/f0MEVgeQkd03x/Bjt0YI0aeFXemJujpWee9BxTG7pLXwtXiDGOO+WTWMRloAkUsqTbeUEsKLKza0lVps7R0u3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749019523; c=relaxed/simple;
	bh=U0qSZcX1eMnzSURPmjzrUaCB0idOWAKgNjSiFCilZYQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qwUpNicOWIaYW2zwjcSBEI50rqklbnQOzxASJI/m6x4O53pP1uwEHOrgUFyyD70kD0bljHiAz++VgTfbNlAWRSZ+M1DEW+XjtBRhNboRfNjl/v37o6w5ulLdNvbjn28tY+h2H/+2DRXOBctQt3jNmEoKKOa1XuHWRdfhmIZjUQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=eh/a/ukK; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=ruGokqO2UBHjwJNIqqtEBXmDU7VQB8+HzDDuFNiwg8w=; b=eh/a/ukK6jQSx8HH/Hh/ayNuve
	gA3UbB2Gej7KlpBwHW4ib3+gJcLAnwZ3+Ul11/ylQ/o9eRsui6lWA+LfUzYvSve2cRgb7os19keR2
	mJO1tiqO1ZX29RJJ7kmQ8y/cdqZam2TjH/Owl6+jdBqI6ie/eFz5kVd9rEXErATuknNWyG/7k0m48
	3aR+Mac564KavIfSWAiYzcFzvtXxWdE6Yx9J94pc4/SJkQPcBLWpJwu7qoSfwoKmSr1UkhdpmoLU5
	pIecMpqOvV78Br5CpAScXJLQjJ/E0atF6tkqNyvN0Bhjkd4qB6kai9ROslvm8gsc+nT9Mjt9FYExi
	e4i8V6lQ==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMhsC-00000002ppD-3h1e;
	Wed, 04 Jun 2025 06:45:17 +0000
Message-ID: <c15ba8f1-4bf4-4b14-ba79-440a3b17a021@infradead.org>
Date: Tue, 3 Jun 2025 23:45:14 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Jun 4 (fs/bcachefs/dirent.o)
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Kent Overstreet <kent.overstreet@linux.dev>, linux-bcachefs@vger.kernel.org
References: <20250604140235.2f14220f@canb.auug.org.au>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250604140235.2f14220f@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/3/25 9:02 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Please do not add any material destined for v6.17 to you rlinux-next
> included branches until after v6.16-rc1 has been released.
> 
> Changes since 20250603:
> 
> The bacahefs tree lost its build failure.
> 

I am seeing on x86_64 when
# CONFIG_UNICODE is not set:

ld: fs/bcachefs/dirent.o: in function `bch2_dirent_init_name':
dirent.c:(.text+0x13bb): undefined reference to `utf8_casefold'



-- 
~Randy


