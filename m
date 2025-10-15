Return-Path: <linux-next+bounces-8597-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B296BE0C24
	for <lists+linux-next@lfdr.de>; Wed, 15 Oct 2025 23:06:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DB4C63520B3
	for <lists+linux-next@lfdr.de>; Wed, 15 Oct 2025 21:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7102F29B204;
	Wed, 15 Oct 2025 21:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="W8hB9ZNN"
X-Original-To: linux-next@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2602C187;
	Wed, 15 Oct 2025 21:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760562413; cv=none; b=km+7U3iatCT5h6om1iYitG5IiRM53sUATl4zMpFTF2lhpv88c3FMt+iwVxZDa956kBrQeaQCIpeYT2dgZ6l4EaArETq76RmsCshFcJlpE24+6NDlexins8Q1wop+QxtJpu/JFe+lDU4SmNoxt+agmQ084hhX+9WZcJsX9NbAD1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760562413; c=relaxed/simple;
	bh=Eon6w887ri1B9TH1EU4fDCe/cFj+x6ogH/TkOuRCn2I=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=NZwE0of2MREBah2JUPf6wHaqhYh1g7FqhMn9C3RDjD8ZEDfIXIMFiKH3mBxap+1KrYj3T3Gpm4qdG/q9/vbgP/4W1Nj3fwueDjS1qtutMuo0yonJ+UuFsCRTYK83KuiIL3y4tO8eR4AsOGpaXoaLqP0VUqzwnHomhcu+DMClzdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=W8hB9ZNN; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:Subject:From:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=PnWB1WDQy91o12SncRAdcptT5bKZ/Te6Wxkn7OCp5yY=; b=W8hB9ZNNabz6qVJhazfY3FIAaV
	1QzSlnKEVLmmr4mOSDdsKlZatFuk3W0DOdjya35dHVy8WcX+Ve/z/Neydk5sEw9g2/Z8No8H8fDll
	jU80sgMee6SxJuxyToDPXj8P4UGLXicimHCGN0HwTk9YgdGfleYwXhN/I2FRUtzQOFF/ZWUvf9dKL
	lxOl3G/G/KKfCSJ5vUzUN7y8VgeqYa//C3zx1cdy/Pmptbr5V5gzuRFJkOc11TV66yqD/xfGDNEDm
	9IzFqBD1WqhW4MwyCHxNlvoDeN44Yy0cvgEnWuuXuEpi31avQievODSWs+ev8nChfxIXvMR22PGGY
	Zwi53Rdw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v98hv-00000002uqv-0c9r;
	Wed, 15 Oct 2025 21:06:51 +0000
Message-ID: <c9e9134c-97a2-405a-918d-41aafdd92fa1@infradead.org>
Date: Wed, 15 Oct 2025 14:06:50 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linux Documentation <linux-doc@vger.kernel.org>,
 linux-next@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, broonie@kernel.org
From: Randy Dunlap <rdunlap@infradead.org>
Subject: docs build problems
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

I am back to having one former error and one former pair of warnings
on today's linux-next (20251015):

../Documentation/Makefile:71: warning: overriding recipe for target 'pdfdocs'
../Documentation/Makefile:62: warning: ignoring old recipe for target 'pdfdocs'
  File "/usr/bin/sphinx-build", line 1
    ELF
SyntaxError: source code cannot contain null bytes


Did something happen to the docs/docs-next tree or was there some kind
of mis-merge problem?

thanks.
-- 
~Randy


