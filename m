Return-Path: <linux-next+bounces-8398-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B854B8D2A7
	for <lists+linux-next@lfdr.de>; Sun, 21 Sep 2025 02:18:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6093B480608
	for <lists+linux-next@lfdr.de>; Sun, 21 Sep 2025 00:18:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B856533D6;
	Sun, 21 Sep 2025 00:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="hnNfO0SU"
X-Original-To: linux-next@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E722F4A;
	Sun, 21 Sep 2025 00:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758413880; cv=none; b=BM1LNmJcgK49s6s4E3KokLJQKkkm+MINrZS6rSIuYBU4JgpMOcRe2f16gyWfUKJ1oJOe7q5jagftrKXzZN7NCjaxhsXXKAwpei6Drxolvv4M+aHxOWXqZ1Yc0HjDESK8Hepbp2TENWwhWCXdCFXGmGr/kyhGPTrYy/oYhQNO1wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758413880; c=relaxed/simple;
	bh=LJu7bWI7bi776pLKP2h3f6v2o/uN8gKM7T4wCk9yYd0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SaXkkOZ6ymYW5e5C4iQLIbpwjkhybP1PieaaZq2xKtuC2EjLDeQzYYG0zCiqPW5YKJIDvgKTLxOfUaLrCstW1losTyUAT1Jb0niMy961P5Z1P7XWKG//VuIHpUl/H3nWNZ9KFl+0zi8ekmw8KQ88CBm3fNzkIg9me03GDiqv/YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=hnNfO0SU; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=SoG7Bheeo1ZuenR2+gEAL/c/uKVjDyCX5DenDPBYO+k=; b=hnNfO0SUdAZth2+TmeIU2DaDvH
	bX9C8l0jv5e61N/tsNeVYL6T7LVBqCOiZcnGX7Gzj4X8k5K+YRyfBtXjh9gFHpOX39seIn9lTSfPi
	DcbRIB3ZdatkufI1AD7QHtoMVsjYeiCrG1woEDAcaBgeQCCYO+rVhjx/PV142VMR3pM70kVDrOojP
	MlbghUQIlPVnYIP0DIAVSFJ7XohbKKGxJcjWkbqbuPK4Hwa2DwVQQENLFSRj+SakBenb3vYA6OXz1
	IacRjxncJl3DsseyjHDHqJm8SA6faoxDtlhttDYmfMuDr+0CIAMeI8/IuEMNzjGDxm4R5M9AWxp+x
	ZpTskQkA==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v07m8-000000067PF-2Us6;
	Sun, 21 Sep 2025 00:17:56 +0000
Message-ID: <883df949-0281-4a39-8745-bcdcce3a5594@infradead.org>
Date: Sat, 20 Sep 2025 17:17:56 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Sep 19 (make htmldocs problem)
To: Mark Brown <broonie@kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
References: <aM1xVa_SX3_QFU_q@sirena.org.uk>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <aM1xVa_SX3_QFU_q@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9/19/25 8:05 AM, Mark Brown wrote:

With today's linux-next, when I do 'make O=DOC1 htmldocs', I get:

make[1]: Entering directory '/home/rdunlap/lnx/repo/linux-next/DOC1'
../Documentation/Makefile:71: warning: overriding recipe for target 'pdfdocs'
../Documentation/Makefile:62: warning: ignoring old recipe for target 'pdfdocs'
  File "/usr/bin/sphinx-build", line 1
    ELF
SyntaxError: source code cannot contain null bytes
make[1]: Leaving directory '/home/rdunlap/lnx/repo/linux-next/DOC1'

where the "ELF" line contains some binary bytes that are not shown
via copy/paste. Here they are in hex in case that might help:

7f 45 4c 46 02 01 01 0a              .ELF....


I don't see what is causing this, so I am using the previous day's
linux-next for Documentation testing etc...

Any ideas/suggestions appreciated.

-- 
~Randy


