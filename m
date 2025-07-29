Return-Path: <linux-next+bounces-7746-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74208B14A9B
	for <lists+linux-next@lfdr.de>; Tue, 29 Jul 2025 11:01:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 50BDD7A718E
	for <lists+linux-next@lfdr.de>; Tue, 29 Jul 2025 08:59:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AACF276048;
	Tue, 29 Jul 2025 09:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="axCxWgFD"
X-Original-To: linux-next@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC6219D09C;
	Tue, 29 Jul 2025 09:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753779670; cv=none; b=Gk4J3KzK3J7T1hs48nrYxbCJyCErefmtKMJALv+Pn3DtcbFowUOGf2ptuy4PjlgLafuklfMXk+jHsyxAsGcYP7UyPmhIYkAA28Ztc/cV5js5NrFqh5vWzBRB4OiNsjXV86VnQtqQ8FrHDiRJ5gGANJUdmquprHrAdYYsGx/V7d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753779670; c=relaxed/simple;
	bh=qni/ZnR7XIlS4tqi3xGXSpWHbZp8tY1gJyr+tfkkTKA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dvuVJiR6xaUkel0yDz0gDVe99g2UFq8BvgIfLcEYYBPsQG9p9TL1ZC2mYEbvIWm2aHpwcKXOvwhdOi4JbJY5tU45EmeBunIA3klbGNLKSgTfpDDdU/p5LedO6Rjd/uUdYYH+Hh809iByY1IwphbmEcDjLQYXWYPLhSO/ZRVlYtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=axCxWgFD; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=GSFEdYDSaeocRu5Q+FBQyOPHNC5XnpY4dofzN8So4Us=; b=axCxWgFDOtIirJDx5yhiI9/JPt
	uPXz/6qBVwWd21W0yxn93EIUkimHgopOCBYoZ5ykSBOjkx+O2Ux/JSLbkOB13BA1n/4+1p+nZ57mE
	gCJodxgI0EQQQIxk4LHqjjIyS952vBjDZcrX4Mi2z1m0RId4YSlM98yVKBiJ3sEldrKaBTRAhRA0X
	04MgmGXcVF38gES1D1zVPXymLG9OTHz43E+97xowbcrWeKYFwhhnH3GKbb/SuK8HZnG8tJnelrs6i
	t6zZDkGLSm8NEvzBWGjfX2FGM0qeRfewTJzkFayJiopsgN5/RpTmICTcC18nqAi3LymDioJYucyFq
	76kxP4WQ==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uggCp-0000000GJzK-3YxP;
	Tue, 29 Jul 2025 09:01:07 +0000
Message-ID: <3fb97b53-2bbd-41fb-b0fe-96c0dd514f17@infradead.org>
Date: Tue, 29 Jul 2025 02:01:06 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Jul 29 (drivers/bluetooth/btintel_pcie.c)
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-bluetooth@vger.kernel.org,
 Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>,
 Kiran K <kiran.k@intel.com>,
 Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
 Arnd Bergmann <arnd@arndb.de>
References: <20250729153510.3781ac91@canb.auug.org.au>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250729153510.3781ac91@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 7/28/25 10:35 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20250728:
> 

on x86_64, when
# CONFIG_PM is not set

In file included from ../include/linux/kernel.h:36,
                 from ../drivers/bluetooth/btintel_pcie.c:9:
../drivers/bluetooth/btintel_pcie.c:2677:36: error: ‘btintel_pcie_pm_ops’ undeclared here (not in a function); did you mean ‘btintel_pcie_in_op’?
 2677 |         .driver.pm = pm_sleep_ptr(&btintel_pcie_pm_ops),
      |                                    ^~~~~~~~~~~~~~~~~~~
../include/linux/util_macros.h:136:44: note: in definition of macro ‘PTR_IF’
  136 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
      |                                            ^~~
../drivers/bluetooth/btintel_pcie.c:2677:22: note: in expansion of macro ‘pm_sleep_ptr’
 2677 |         .driver.pm = pm_sleep_ptr(&btintel_pcie_pm_ops),
      |                      ^~~~~~~~~~~~



-- 
~Randy


